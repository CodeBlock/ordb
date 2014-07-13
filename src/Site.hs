{-# LANGUAGE OverloadedStrings #-}

------------------------------------------------------------------------------
-- | This module is where all the routes and handlers are defined for your
-- site. The 'app' function is the initializer that combines everything
-- together and is exported by this module.
module Site
  ( app
  ) where

------------------------------------------------------------------------------
import           Control.Applicative
import           Data.ByteString (ByteString)
import           Data.Maybe (fromMaybe)
import           Data.Monoid
import qualified Data.Text as T
import           Data.Text.Encoding (encodeUtf8)
import           Snap.Core
import           Snap.Snaplet
import           Snap.Snaplet.Auth
import           Snap.Snaplet.Auth.Backends.JsonFile
import           Snap.Snaplet.Heist
import           Snap.Snaplet.Session.Backends.CookieSession
import           Snap.Util.FileServe
import           Text.Digestive
import           Text.Digestive.Heist
import           Text.Digestive.Snap
import           Heist
import qualified Heist.Interpreted as I
import           Heist.Splices.Html
------------------------------------------------------------------------------
import           Application


------------------------------------------------------------------------------
-- | Render login form
handleLogin :: Maybe T.Text -> Handler App (AuthManager App) ()
handleLogin authError = heistLocal (I.bindSplices errs) $ render "login"
  where
    errs = maybe noSplices splice authError
    splice err = "loginError" ## I.textSplice err


------------------------------------------------------------------------------
-- | Handle login submit
handleLoginSubmit :: Handler App (AuthManager App) ()
handleLoginSubmit =
    loginUser "login" "password" Nothing
              (\_ -> handleLogin err) (redirect "/")
  where
    err = Just "Unknown user or password"


------------------------------------------------------------------------------
-- | Logs out and redirects the user to the site index.
handleLogout :: Handler App (AuthManager App) ()
handleLogout = logout >> redirect "/"

type UsernameF = T.Text
type PasswordF = T.Text
type EmailF    = T.Text
data UserForm = UserForm UsernameF PasswordF EmailF

userForm :: Monad m => Form T.Text m UserForm
userForm = UserForm
           <$> "login" .: check "Username is required" (not . T.null) (text Nothing)
           <*> "password" .: check "Password is required" (not . T.null) (text Nothing)
           <*> "email" .: check "Email address is required" (not . T.null) (text Nothing)

------------------------------------------------------------------------------
-- | Handle new user form submit
handleNewUser :: Handler App (AuthManager App) ()
handleNewUser = do
  r <- runForm "new_user" userForm
  case r of
    (v, Nothing) -> render' v Nothing
    (v, Just (UserForm u p e)) -> do
      res <- createUser u (encodeUtf8 p)
      case res of
        -- TODO: Render a failure here if it occurs?
        Left _ -> render' v (Just (T.pack "Oops! Something went wrong!"))
        Right user   ->
          case userId user of
            Nothing     -> render' v (Just "Oops! Could not create account.")
            Just _      -> do
              saveUser $ user { userEmail = Just e }
              redirect "/"
  where
    render' form flash =
      renderWithSplices "new_user"
                        (digestiveSplices form <>
                         ("flash" ## I.textSplice (fromMaybe "" flash)))

------------------------------------------------------------------------------
-- | Handle showing new users our CLA.
handleNewUserLicense :: Handler App (AuthManager App) ()
handleNewUserLicense = render "cla"

------------------------------------------------------------------------------
-- | A demo of the repeater listing UI
handleShowRepeater :: Handler App (AuthManager App) ()
handleShowRepeater = render "repeater"

------------------------------------------------------------------------------
-- | The application's routes.
routes :: [(ByteString, Handler App App ())]
routes = [ ("/login",    with auth handleLoginSubmit)
         , ("/logout",   with auth handleLogout)
         , ("/new_user", with auth handleNewUser)
         , ("/new_user/license", with auth handleNewUserLicense)
         , ("/repeater/1", with auth handleShowRepeater)
         , ("",          serveDirectory "static")
         ]


------------------------------------------------------------------------------
-- | The application initializer.
app :: SnapletInit App App
app = makeSnaplet "app" "An snaplet example application." Nothing $ do
    h <- nestSnaplet "" heist $ heistInit "templates"
    s <- nestSnaplet "sess" sess $
           initCookieSessionManager "site_key.txt" "sess" (Just 3600)

    -- NOTE: We're using initJsonFileAuthManager here because it's easy and
    -- doesn't require any kind of database server to run.  In practice,
    -- you'll probably want to change this to a more robust auth backend.
    a <- nestSnaplet "auth" auth $
           initJsonFileAuthManager defAuthSettings sess "users.json"
    addRoutes routes
    addAuthSplices h auth
    addConfig h $ mempty { hcInterpretedSplices =
                              "html" ## htmlImpl -- <head> tag merging goodness!
                         }
    return $ App h s a


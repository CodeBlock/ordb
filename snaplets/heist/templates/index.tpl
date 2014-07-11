<apply template="base">
  <div id="index">
    <div class="jumbotron ordb-intro">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <h1 class="light">OpenRDB</h1>
            <p>
              Helping amateur radio operators communicate.
            </p>
          </div>
          <div class="col-md-6">
            <h2>
              Modern, open source, free.
            </h2>
            <a href="/signup" class="btn btn-primary btn-lg">Sign up</a>
            <a href="/tour" class="btn btn-default btn-lg">Learn more</a>
          </div>
        </div>
      </div>
    </div>

    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <div id="loginform">
            <ifLoggedIn>
              <p>
                This is a simple demo page served using
                <a href="http://snapframework.com/docs/tutorials/heist">Heist</a>
                and the <a href="http://snapframework.com/">Snap</a> web framework.
              </p>

              <p>Congrats!  You're logged in as '<loggedInUser/>'</p>

              <p><a href="/logout">Logout</a></p>
            </ifLoggedIn>

            <ifLoggedOut>
              <h1 class="notopmargin">Log in to your account</h1>
              <apply template="_login"/>
            </ifLoggedOut>
          </div>
        </div>
      </div>

      <hr />

      <div class="row">
        <div class="col-md-4">
          <h2>Modern.</h2>
          <p class="text-justify">
            The core of Open Repeater Database is an API which allows developers
            to create useful applications to allow amateur radio operators to
            find local repeaters to suit their needs in almost every case.
          </p>
        </div>
        <div class="col-md-4">
          <h2>Open source.</h2>
          <p class="text-justify">
            Being open source less work for us and better information for you.
            Not only is our entire platform open source, the information found
            within the database is freely available under the
            <a href="http://opendatacommons.org/licenses/odbl/1.0/">
              Open Database License
            </a>, giving you the freedom to do pretty much whatever you want
            with the data.
          </p>
        </div>
        <div class="col-md-4">
          <h2>Free.</h2>
          <p class="text-justify">
            Everything we offer over the platform is completely free in every
            sense of the word. (We do accept donations though!)
          </p>
        </div>
      </div>
    </div>
  </div>
</apply>

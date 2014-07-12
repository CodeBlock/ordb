<form method="post" action="${postAction}" role="form">
  <div class="form-group">
    <label for="login">Username</label>
    <input type="text" name="login" class="form-control" />
  </div>
  <div class="form-group">
    <label for="email">E-mail Address</label>
    <input type="email" name="email" class="form-control" />
    <span class="help-block">
      Your email address is private. You will only be contacted in
      extenuating circumstances.
    </span>
  </div>
  <div class="form-group">
    <label for="password">Password</label>
    <input type="password" name="password" class="form-control" />
  </div>
  <div class="form-group">
    <input type="submit" value="${submitText}" class="form-control btn btn-primary" />
  </div>
</form>

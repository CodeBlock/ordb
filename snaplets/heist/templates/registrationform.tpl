<dfForm method="post" action="${postAction}" role="form">
  <dfChildErrorList />
  <div class="form-group">
    <label for="login">Username</label>
    <dfInputText ref="login" class="form-control" />
  </div>
  <div class="form-group">
    <label for="email">E-mail Address</label>
    <dfInputText type="email" ref="email" class="form-control" />
    <span class="help-block">
      Your email address is private. You will only be contacted in
      extenuating circumstances.
    </span>
  </div>
  <div class="form-group">
    <label for="password">Password</label>
    <dfInputPassword ref="password" class="form-control" />
  </div>
  <div class="form-group">
    <dfInputSubmit value="${submitText}" class="form-control btn btn-primary" />
  </div>
</dfForm>

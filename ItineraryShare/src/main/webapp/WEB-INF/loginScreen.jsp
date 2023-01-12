<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<%@include file="bootstraphead.jsp"%>
</head>
<body>
<%@include file="navbarGuest.jsp"%>
<h1 align="center">Login</h1>
<br>
<div class="centerMe">
<form class="create-account-form" action="login.do" method="POST">
  <div class="mb-3 " align="center">
  <div class="create-account-input">
    <label for="InputUsername" class="form-label">Username</label>
    <input type="text" class="form-control" id="InputUsername" name="username" REQUIRED>
	<br>
    <label for="InputPassword" class="form-label">Password</label>
    <input type="password" class="form-control" id="InputPassword" name="password" REQUIRED>
  </div>
  </div>
  <button type="submit" class="btn btn-primary">Login</button>
</form>
<br/>
<form class="create-account-form" action="createAccountForm.do" method="GET">
<div class="mb-3 " align="center">
  <div class="create-account-input">
  <button type="submit" class="btn btn-secondary">Create Account</button>
  </div>
  </div>
</form>
</div>



</body>
</html>
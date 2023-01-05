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
<h1>Login</h1>
<br>
<form action="login.do" method="POST">
  <div class="mb-3" align="center">
    <label for="InputUsername" class="form-label">Username</label>
    <input type="username" required= "required" class="form-control" id="InputUsername" name="username">
	<br>
    <label for="InputPassword" class="form-label">Password</label>
    <input type="password" required="required" class="form-control" id="InputPassword" name="password">
  </div>
  
  <button type="submit" class="btn btn-primary">Login</button>
</form>



</body>
</html>
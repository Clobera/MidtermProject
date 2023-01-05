<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account</title>
<%@include file="bootstraphead.jsp"%>

</head>
<body>

	<%@include file="navbarGuest.jsp"%>

	<form action="createAccount.do" method="POST" >
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">First Name</span> <input
				type="text" class="form-control" placeholder="First Name"
				aria-label="Username" aria-describedby="basic-addon1">
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Last Name</span> <input
				type="text" class="form-control" placeholder="Last Name"
				aria-label="Username" aria-describedby="basic-addon1">
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Username</span> <input
				type="text" class="form-control" placeholder="Username"
				aria-label="Username" aria-describedby="basic-addon1" REQUIRED>
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Password</span> <input
				type="password" class="form-control" placeholder="Password"
				aria-label="Username" aria-describedby="basic-addon1" REQUIRED>
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Profile
				Picture</span> <input type="password" class="form-control"
				placeholder="ENTER URL" aria-label="Username"
				aria-describedby="basic-addon1">
		</div>

		<button type="submit" class="btn btn-primary">Create User</button>
	</form>



</body>
</html>
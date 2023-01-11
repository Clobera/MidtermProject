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
	<div class="create-account-form">
	<form action="createAccount.do" method="POST" >
	<input type= "hidden" name="enabled" value="true">
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">First Name</span> <input
				type="text" class="form-control" placeholder="First Name"
				aria-label="Username" aria-describedby="basic-addon1" name="firstName">
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Last Name</span> <input
				type="text" class="form-control" placeholder="Last Name"
				aria-label="Username" aria-describedby="basic-addon1" name="lastName">
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Username</span> <input
				type="text" class="form-control" placeholder="Username"
				aria-label="Username" aria-describedby="basic-addon1" name="username" REQUIRED>
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Password</span> <input
				type="password" class="form-control" placeholder="Password"
				aria-label="Username" aria-describedby="basic-addon1" name="password" REQUIRED>
		</div>
		
		<div class="input-group mb-3 bio">
			<span class="input-group-text" id="basic-addon1">Biography</span> <input
				type="textarea" class="form-control" placeholder="Write something about yourself!"
				aria-label="Username" aria-describedby="basic-addon1" name="biography">
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Profile
				Picture</span> <input type="text" class="form-control"
				placeholder="ENTER URL" aria-label="Username"
				aria-describedby="basic-addon1">
		</div>

		<button type="submit" class="btn btn-primary">Create User</button>
	</form>
</div>


</body>
</html>
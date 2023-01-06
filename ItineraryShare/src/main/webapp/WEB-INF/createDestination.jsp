<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Destination</title>
<%@include file="bootstraphead.jsp"%>

</head>
<body>

	<%@include file="navbarGuest.jsp"%>

	<form action="createDestination.do" method="POST" >
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Name</span> <input
				type="text" class="form-control" placeholder="Name"
				aria-label="Name" aria-describedby="basic-addon1" name="name">
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Country</span> <input
				type="text" class="form-control" placeholder="Country"
				aria-label="Country" aria-describedby="basic-addon1" name="country">
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">City</span> <input
				type="text" class="form-control" placeholder="City"
				aria-label="City" aria-describedby="basic-addon1" name="city" REQUIRED>
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Description</span> <input
				type="text" class="form-control" placeholder="Write something about this destination!"
				aria-label="Description" aria-describedby="basic-addon1" name="description">
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Image URL</span> <input
				type="text" class="form-control" placeholder="ENTER URL"
				aria-label="Image" aria-describedby="basic-addon1">
		</div>

		<button type="submit" class="btn btn-primary">Create Destination</button>
	</form>



</body>
</html>
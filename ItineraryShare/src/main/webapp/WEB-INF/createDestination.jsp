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
<br/>
	<form class= "create-account-form centerMe" action="createDestination.do" method="POST" style="padding-left: 205px;">
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Name</span> <input
				type="text" class="form-control" placeholder="Ex. Grand Canyon National Park"
				aria-label="Name" aria-describedby="basic-addon1" name="name" REQUIRED>
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Country</span> <input
				type="text" class="form-control" placeholder="Ex. United States of America"
				aria-label="Country" aria-describedby="basic-addon1" name="country" REQUIRED>
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">City</span> <input
				type="text" class="form-control" placeholder="Ex. Grand Canyon Village"
				aria-label="City" aria-describedby="basic-addon1" name="city" REQUIRED>
		</div>

		<div class="input-group mb-3 bio">
			<span class="input-group-text" id="basic-addon1">Description</span> <input
				type="text" class="form-control" placeholder="Ex. National park that covers a large portion of the south-western states."
				aria-label="Description" aria-describedby="basic-addon1" name="description">
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Image URL</span> <input
				type="text" class="form-control" placeholder="ENTER URL OF IMAGE"
				aria-label="Image" aria-describedby="basic-addon1" name="image">
		</div>

		<button type="submit" class="btn btn-primary">Create Destination</button>
	</form>


<%@include file="bootstrapFooter.jsp"%>
</body>
</html>
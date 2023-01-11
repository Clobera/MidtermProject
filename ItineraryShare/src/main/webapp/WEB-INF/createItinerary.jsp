<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Itinerary</title>
<%@include file="bootstraphead.jsp"%>

</head>
<body>

	<%@include file="navbarGuest.jsp"%>

	<form class="create-account-form" action="createItinerary.do" method="POST">
		<input type="hidden" value="true" name="active">
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Name</span> <input
				type="text" class="form-control" placeholder="Ex. My 2020 Summer Trip"
				aria-label="Username" aria-describedby="basic-addon1" name="name">
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Budget</span> <input
				type="number" class="form-control" placeholder="Ex. 0" value="0"
				aria-label="Budget" aria-describedby="basic-addon1" name="budget" REQUIRED>
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Start Date</span> <input
				type="date" class="form-control" aria-label="Start"
				aria-describedby="basic-addon1" name="startDate" REQUIRED>
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">End Date</span> <input
				type="date" class="form-control" aria-label="End"
				aria-describedby="basic-addon1" name="endDate" REQUIRED>
		</div>

		<div class="input-group mb-3 bio">
			<span class="input-group-text" id="basic-addon1">Description</span> <input
				type="text" class="form-control"
				placeholder="Ex. Lots of hand-washing and mask-wearing..."
				aria-label="Description" aria-describedby="basic-addon1"
				name="description">
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Image URL</span> <input
				type="text" class="form-control" placeholder="ENTER URL OF IMAGE"
				aria-label="Image" aria-describedby="basic-addon1">
		</div>

		<button type="submit" class="btn btn-primary">Create
			Itinerary</button>
	</form>
	<%@include file="bootstrapFooter.jsp"%>
</body>
</html>
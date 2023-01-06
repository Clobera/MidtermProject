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

	<form action="createItinerary.do" method="POST">
		<input type="hidden" value="${itinerary.id}" name="itineraryId">
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Name</span> <input
				type="text" class="form-control" placeholder="Name"
				aria-label="Username" aria-describedby="basic-addon1" name="name">
		</div>

		<div class="input-group mb-3">
			<c:forEach var="destination" items="${destinations}">
				<select name="destinationId">
					<option value="${destination.id}">${destination.name}</option>
				</select>
			</c:forEach>
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Day</span> <input
				type="number" class="form-control" aria-label="Trip day"
				aria-describedby="basic-addon1" name="trip_day" REQUIRED>
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Description</span> <input
				type="text" class="form-control"
				placeholder="Write something about your trip!"
				aria-label="Description" aria-describedby="basic-addon1"
				name="description">
		</div>


		<button type="submit" class="btn btn-primary">Create
			Itinerary Item</button>
	</form>
	<%@include file="bootstrapFooter.jsp"%>
</body>
</html>
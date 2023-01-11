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

	<form action="createItineraryItem.do" method="POST">
		<input type="hidden" value="${itinerary}" name="itineraryId">
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Name</span> <input
				type="text" class="form-control" placeholder="Name"
				aria-label="Username" aria-describedby="basic-addon1" name="name">
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Description</span> <input
				type="text" class="form-control"
				placeholder="Write something about your trip!"
				aria-label="Description" aria-describedby="basic-addon1"
				name="description">
		</div>
		<div class="inline-text">
			Day of Trip: <select name="tripDay">
				<c:forEach var="day" items="${days}">
					<option value="${day}">${day}</option>
				</c:forEach>
			</select>
		</div>
		<br/>
		<div class="inline-text">
			Destination: <select name="destinationId">
				<c:forEach var="destination" items="${destinations}">
					<option value="${destination.id}">${destination.name}</option>
				</c:forEach>
			</select> OR
			<button class="btn btn-light" type="submit"
				form="goCreateDestination">Create a New Destination</button>
		</div>
		<br />
		<br />
		<button type="submit" class="btn btn-primary">Create
			Itinerary Item</button>
	</form>
	<form action="goCreateDestination.do" method="post"
		id="goCreateDestination"></form>
	<%@include file="bootstrapFooter.jsp"%>
</body>
</html>
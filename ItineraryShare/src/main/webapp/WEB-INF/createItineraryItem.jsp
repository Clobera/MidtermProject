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
<div class="centerMe">
<br/>
	<form action="createItineraryItem.do" method="POST" class="create-account-form">
		<input type="hidden" value="${itinerary.id}" name="itineraryId">
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Name</span> <input
				type="text" class="form-control" placeholder="Ex. Sightseeing at the Grand Canyon"
				aria-label="Username" aria-describedby="basic-addon1" name="name" REQUIRED>
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Description</span> <input
				type="text" class="form-control"
				placeholder="Ex. Man that is a lot of red rock..."
				aria-label="Description" aria-describedby="basic-addon1"
				name="description">
		</div>
		<div class="input-group">
			<span class="input-group-text" id="basic-addon1">Day of Trip:</span> <select name="tripDay" style="min-width:106px;" REQUIRED>
				<c:forEach var="day" items="${days}">
					<option value="${day}">${day}</option>
				</c:forEach>
			</select>
			<span class="input-group-text" id="basic-addon1">Destination:</span> <select name="destinationId"  REQUIRED>
				<c:forEach var="destination" items="${destinations}">
					<option value="${destination.id}">${destination.name} - ${destination.city }, ${ destination.country }</option>
				</c:forEach>
			</select></div> OR <div>
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
</div>
	<%@include file="bootstrapFooter.jsp"%>
</body>
</html>
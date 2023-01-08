<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${sessionScope.loggedInUser.username}</title>
<%@include file="bootstraphead.jsp"%>
</head>
<body>
	<%@include file="navbarGuest.jsp"%>

	<div class="row">
		<!-- Itinerary Info START -->
		<div class="col-3">
			<div class="affix" style="position: fixed;">
				<div class="container-fluid">
					<div class="container">
						<!--   fixed position -->
						<img class="img-fluid" src="${itinerary.image}">
					</div>
					<div class="container">
						<h5>Itinerary Info</h5>
						<br>Name: ${itinerary.name} <br>Budget:
						${itinerary.budget} <br>Start Date: ${itinerary.startDate} <br>End
						Date: ${itinerary.endDate}
					</div>

					<div class="container">
						<h5>Description</h5>
						<strong>${itinerary.description}</strong>
					</div>
					<c:if
						test="${(sessionScope.loggedInUser.id == itinerary.userId.id) or sessionScope.loggedInUser.username == 'admin' }">
						<form action="deleteItinerary.do" method="post">
							<button type="submit" value="${itinerary.id}" name="deleteId">Delete</button>
						</form>
					</c:if>
				</div>
			</div>
		</div>

		<!-- Itinerary Info END -->
		<div class="col-1"></div>
		<!-- Itineraries START -->
		<div class="col-7" style="background: white;">
			<div class="container">
				<form action="updateItinerary.do" method="POST">
		<input type="hidden" value="true" name="active">
		<input type="hidden" value="${itinerary.id }" name="itineraryId">
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Name</span> <input
				type="text" value="${itinerary.name }" class="form-control" placeholder="Name"
				aria-label="Username" aria-describedby="basic-addon1" name="name">
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Budget</span> <input
				type="number" class="form-control" value="${itinerary.budget }" placeholder="Budget"
				aria-label="Budget" aria-describedby="basic-addon1" name="budget">
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Start Date</span> <input
				type="date" class="form-control" aria-label="Start"
				aria-describedby="basic-addon1" value="${itinerary.startDate }" name="startDate" REQUIRED>
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">End Date</span> <input
				type="date" class="form-control" aria-label="End"
				aria-describedby="basic-addon1" value="${itinerary.endDate }" name="endDate" REQUIRED>
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Description</span> <input
				type="text" class="form-control" value="${itinerary.description }"
				placeholder="Write something about your trip!"
				aria-label="Description" aria-describedby="basic-addon1"
				name="description">
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Image URL</span> <input
				type="text" class="form-control" value="${itinerary.image }" placeholder="ENTER URL"
				aria-label="Image" aria-describedby="basic-addon1" name="image">
		</div>

		<button type="submit" class="btn btn-primary">Update
			Itinerary</button>
	</form>
			</div>
		</div>
		<!-- ItineraryItems END -->
	</div>
	<%@include file="bootstrapFooter.jsp"%>

</body>
</html>
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
				<h4>Itinerary Days</h4>
				<a href="goCreateItineraryItem.do?id=${itinerary.id }">Create Itinerary Item</a>
				<c:forEach var="days" items="${itineraryDays}">
					<div class="container">
						${days.day} <br />
						<c:forEach var="item" items="${day}">
					${item.name} ${item.description}
					</c:forEach>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- ItineraryItems END -->
	</div>
	<%@include file="bootstrapFooter.jsp"%>

</body>
</html>
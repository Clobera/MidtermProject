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
		<!-- User Profile START -->
		<div class="col-3">
			<div class="affix" style="position: fixed;">
				<div class="container">
					<!--   fixed position -->
					<img class="img-fluid"
						src="${sessionScope.loggedInUser.profilePicture}">
				</div>
				<div class="container">
					<h5>User Info</h5>
					Name: ${sessionScope.loggedInUser.firstName}
					${sessionScope.loggedInUser.lastName} <br> Active:
					${sessionScope.loggedInUser.enabled}
				</div>

				<div class="container">
					<h5>Biography</h5>
					<strong>${sessionScope.loggedInUser.biography}</strong>
				</div>
			</div>
		</div>
		<!-- User Profile END -->
		<div class="col-1"></div>
		<!-- Itineraries START -->
		<div class="col-7">
			<div class="container">
				<h4>Your Itineraries</h4>

				<div class="cards">

					<div class="card">
						<a href="goCreateItinerary.do"> <img alt="Couple on Beach"
							src="https://media.istockphoto.com/photos/couple-relax-on-the-beach-enjoy-beautiful-sea-on-the-tropical-island-picture-id1160947136?b=1&k=20&m=1160947136&s=612x612&w=0&h=AsFmKSBYTtacl0DvI-RanCnAXFU0cmuW8NAo0g-tGzA="
							class="card__image">
						</a>
						<div class="card__content">
							<a href="goCreateItinerary.do" class="card__link"> Create An
								Itinerary! </a>
						</div>
					</div>
					<!-- User Itineraries START -->
					<c:choose>
						<c:when test="${ ! empty itineraries }">
							<div class="cards">
								<c:forEach var="itinerary" items="${ itineraries }">
									<div class="card">
										<a href="[FIX ME]"> <img alt="" src="${ itinerary.image}"
											onerror="this.onerror=null; this.src='https://media.istockphoto.com/photos/couple-relax-on-the-beach-enjoy-beautiful-sea-on-the-tropical-island-picture-id1160947136?b=1&k=20&m=1160947136&s=612x612&w=0&h=AsFmKSBYTtacl0DvI-RanCnAXFU0cmuW8NAo0g-tGzA="
											class="card__image">
										</a>
										<div class="card__content">
											<a href="[FIX ME]" class="card__link"> ${itinerary.name }
											</a>
										</div>
									</div>

								</c:forEach>
							</div>
						</c:when>
					</c:choose>
					<!-- User Itineraries END -->
				</div>
			</div>
		</div>
		<!-- Itineraries END -->
	</div>
</body>
</html>
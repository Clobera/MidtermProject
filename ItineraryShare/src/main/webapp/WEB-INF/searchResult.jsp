<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Results</title>
<%@include file="bootstraphead.jsp"%>
</head>
<body>
	<%@include file="navbarGuest.jsp"%>
	
	<div>
	<h3 class="text-center" >SEARCH RESULTS FOR " ${ search } "</h3>
	
	</div>
	<br>
	<br>
	<br>
	
	<c:choose>
		<c:when test="${ ! empty destinations or ! empty itineraries or ! empty users }">
		
		
		<c:if test="${ ! empty itineraries }">
		<h4>Itineraries that include " ${ search } "</h4>
			<div class="cards">
				<c:forEach var="itinerary" items="${ itineraries }">
					<div class="card">
						<a href="viewItinerary.do?itineraryId=${ itinerary.id }"> <img alt="" src="${ itinerary.image}"
							onerror="this.onerror=null; this.src='https://media.istockphoto.com/photos/couple-relax-on-the-beach-enjoy-beautiful-sea-on-the-tropical-island-picture-id1160947136?b=1&k=20&m=1160947136&s=612x612&w=0&h=AsFmKSBYTtacl0DvI-RanCnAXFU0cmuW8NAo0g-tGzA="
							class="card__image">
						</a>
						<div class="card__content">
							<a href="viewItinerary.do?itineraryId=${ itinerary.id }" class="card__link"> ${itinerary.name } </a>
						</div>
					</div>

				</c:forEach>
			</div>
			</c:if>



		<c:if test="${ ! empty destination }">
		<h4>Itineraries that have an Destination that includes " ${ search } "</h4>
		<div class="cards">
				<c:forEach var="destination" items="${ destinations }">
					<div class="card">
						<a href="viewDestination.do?destinationId=${ destination.id }"> <img alt="" src="${ destination.image}"
							onerror="this.onerror=null; this.src='https://media.istockphoto.com/photos/couple-relax-on-the-beach-enjoy-beautiful-sea-on-the-tropical-island-picture-id1160947136?b=1&k=20&m=1160947136&s=612x612&w=0&h=AsFmKSBYTtacl0DvI-RanCnAXFU0cmuW8NAo0g-tGzA="
							class="card__image">
						</a>
						<div class="card__content">
							<a href="viewDestination.do?destinationId=${ destination.id }" class="card__link"> ${destination.name } </a>
						</div>
					</div>

				</c:forEach>
			</div>
			</c:if>


			<c:if test="${ ! empty users }">
				<h4>Users that include " ${ search } "</h4>
				<div class="cards">
					<c:forEach var="user" items="${ users }">
						<div class="card">
							<a href="viewAccount.do?userId=${ user.id }"> <img
								alt="user profile picture" src="${ user.profilePicture}"
								onerror="this.onerror=null; this.src='https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg'" class="card__image">
							</a>
							<div class="card__content">
								<a href="viewAccount.do?userId=${ user.id }"
									class="card__link"> ${user.userName } </a>
							</div>
						</div>

					</c:forEach>
				</div>
			</c:if>




		</c:when>
		<c:otherwise>
		Nothing found by that search!
		</c:otherwise>

	</c:choose>

<%@include file="bootstrapFooter.jsp"%>
</body>
</html>
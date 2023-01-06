<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Itinerary Share</title>
<%@include file="bootstraphead.jsp"%>
</head>
<body>
	<%@include file="navbarGuest.jsp"%>
	<h1>Itinerary Share</h1>
	<a href="goCreateDestination.do">create destination</a>
	<c:choose>
		<c:when test="${ ! empty itineraries }">
			<div class="cards">
				<c:forEach var="itinerary" items="${ itineraries }">
					<div class="card">
						<a href="viewItinerary.do?id=${ itinerary.id }"> <img alt="" src="${ itinerary.image}"
							onerror="this.onerror=null; this.src='https://media.istockphoto.com/photos/couple-relax-on-the-beach-enjoy-beautiful-sea-on-the-tropical-island-picture-id1160947136?b=1&k=20&m=1160947136&s=612x612&w=0&h=AsFmKSBYTtacl0DvI-RanCnAXFU0cmuW8NAo0g-tGzA="
							class="card__image">
						</a>
						<div class="card__content">
							<a href="viewItinerary.do?id=${ itinerary.id }" class="card__link"> ${itinerary.name } </a>
						</div>
					</div>

				</c:forEach>
			</div>

		</c:when>
		<c:otherwise>
		No Itineraries Found
		</c:otherwise>

	</c:choose>

<%@include file="bootstrapFooter.jsp"%>
</body>
</html>
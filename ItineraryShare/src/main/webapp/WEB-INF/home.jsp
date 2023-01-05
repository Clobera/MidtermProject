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
	<c:choose>
		<c:when test="${ ! empty itineraries }">
			<div class="cards">
				<c:forEach var="itinerary" items="${ itineraries }">
					<div class="card">
						<img alt="" src="${ itinerary.image}" class="card__image">
						<div class="card__content">
							<a href="[FIX ME]" class="card__link">${itinerary.name }</a>
						</div>
					</div>

				</c:forEach>
			</div>

		</c:when>

	</c:choose>






</body>
</html>
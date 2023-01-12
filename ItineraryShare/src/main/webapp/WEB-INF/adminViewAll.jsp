<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Itineraries</title>
<%@include file="bootstraphead.jsp"%>
</head>
<body>
	<%@include file="navbarGuest.jsp"%>
	<br/>
	<c:choose>
		<c:when test="${ ! empty active }">
		<div class="centerMe">
			<h4>Active Itineraries</h4>
			</div>
			<div class="cards">
				<c:forEach var="itinerary" items="${ active }">
					<div class="card">
						<a href="viewItinerary.do?itineraryId=${ itinerary.id }"> <img
							alt="" src="${ itinerary.image}"
							onerror="this.onerror=null; this.src='https://media.istockphoto.com/photos/couple-relax-on-the-beach-enjoy-beautiful-sea-on-the-tropical-island-picture-id1160947136?b=1&k=20&m=1160947136&s=612x612&w=0&h=AsFmKSBYTtacl0DvI-RanCnAXFU0cmuW8NAo0g-tGzA="
							class="card__image">
						</a>
						<div class="card__content centerMe">
							<a href="viewItinerary.do?itineraryId=${ itinerary.id }"
								class="card__link"> ${itinerary.name } </a>
						</div>
					</div>

				</c:forEach>
			</div>
			
				<c:if test="${ ! empty disabled }">
				<div class="centerMe">
					<h4>Disabled Itineraries</h4>
					</div>
					<div class="cards">
						<c:forEach var="itinerary" items="${ disabled }">
							<div class="card">
								<a href="viewItinerary.do?itineraryId=${ itinerary.id }"> <img
									alt="" src="${ itinerary.image}"
									onerror="this.onerror=null; this.src='https://media.istockphoto.com/photos/couple-relax-on-the-beach-enjoy-beautiful-sea-on-the-tropical-island-picture-id1160947136?b=1&k=20&m=1160947136&s=612x612&w=0&h=AsFmKSBYTtacl0DvI-RanCnAXFU0cmuW8NAo0g-tGzA="
									class="card__image">
								</a>
								<div class="card__content centerMe">
									<a href="viewItinerary.do?itineraryId=${ itinerary.id }"
										class="card__link"> ${itinerary.name } </a>
								</div>
							</div>

						</c:forEach>
					</div>
				</c:if>


		</c:when>
		<c:otherwise>
		<div class="centerMe">
		No Itineraries Found
		</div>
		</c:otherwise>

	</c:choose>

	<%@include file="bootstrapFooter.jsp"%>
</body>
</html>
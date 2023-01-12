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
	<div class="p-2 ">
		<h3 class="text-center">Trip Pictures</h3>
	</div>
	<c:choose>
		<c:when test="${ ! empty pictures }">
			<div class="cards">
				<c:forEach var="tripPicture" items="${ pictures }">
					<div class="card">
						<img alt="" src="${ destinationPicture.imageUrl}"
							onerror="this.onerror=null; this.src='https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg'"
							class="card__image">
					</div>
				</c:forEach>
			</div>
		</c:when>
		<c:otherwise>No Pictures Found</c:otherwise>
	</c:choose>
	<%@include file="bootstrapFooter.jsp"%>
</body>
</html>
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
		<h3 class="text-center">Destination Pictures</h3>
	</div>
	<c:choose>
		<c:when test="${ ! empty pictures }">
			<div class="cards">
				<c:forEach var="destinationPicture" items="${ pictures }">
					<div class="card">
						<img alt="" src="${ destinationPicture.imageUrl}"
							onerror="this.onerror=null; this.src='https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg'"
							class="card__image">
						<c:if test="${sessionScope.loggedInUser.username == 'admin' }">
							<div class="card__content">
								<form action="deleteDestinationPicture.do" method="post">
									<input type="hidden" value="${destinationPicture.id}"
										name="pictureId">
									<button type="submit" class="btn btn-primary deleteButto centerMe">Delete</button>
								</form>
							</div>
						</c:if>
					</div>
				</c:forEach>
			</div>
		</c:when>
		<c:otherwise>No Pictures Found</c:otherwise>
	</c:choose>
	<%@include file="bootstrapFooter.jsp"%>
</body>
</html>
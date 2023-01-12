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
			<h4>Active Users</h4>
			</div>
			<div class="cards">
				<c:forEach var="user" items="${ active }">
					<div class="card">
						<a href="viewAccount.do?userId=${ user.id }"> <img alt=""
							src="${ user.profilePicture}"
							onerror="this.onerror=null; this.src='https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg'"
							class="card__image">
						</a>
						<div class="card__content centerMe">
							<a href="viewAccount.do?userId=${ user.id }" class="card__link">
								${user.username } </a>
						</div>
					</div>
				</c:forEach>
			</div>
			<c:if test="${ ! empty disabled }">
			<div class="centerMe">
				<h4>Disabled Users</h4>
				</div>
				<div class="cards">
					<c:forEach var="user" items="${ disabled }">
						<div class="card">
							<a href="viewAccount.do?userId=${ user.id }"> <img
								alt="user profile picture" src="${ user.profilePicture}"
								onerror="this.onerror=null; this.src='https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg'" class="card__image">
							</a>
							<div class="card__content centerMe">
								<a href="viewAccount.do?userId=${ user.id }"
									class="card__link"> ${user.username } </a>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:if>
		</c:when>
		<c:otherwise><br/>
		<div class="centerMe">
		<h4>
		No Users Found
		</h4>
		</div>
		</c:otherwise>
	</c:choose>
	<%@include file="bootstrapFooter.jsp"%>
</body>
</html>
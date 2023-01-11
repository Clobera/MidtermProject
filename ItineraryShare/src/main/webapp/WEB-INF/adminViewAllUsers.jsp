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
		<h3 class="text-center">All Users</h3>
	</div>
	<c:choose>
		<c:when test="${ ! empty active }">
			<h4>Active Users</h4>
			<div class="cards">
				<c:forEach var="user" items="${ active }">
					<div class="card">
						<a href="viewAccount.do?userId=${ user.id }"> <img alt=""
							src="${ user.image}"
							onerror="this.onerror=null; this.src='https://images.unsplash.com/photo-1497514440240-3b870f7341f0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=652&q=80"
							class="card__image">
						</a>
						<div class="card__content">
							<a href="viewAccount.do?userId=${ user.id }" class="card__link">
								${user.name } </a>
						</div>
					</div>
				</c:forEach>
			</div>
			<c:if test="${ ! empty disabled }">
				<h4>Disabled Itineraries</h4>
				<div class="cards">
					<c:forEach var="user" items="${ disabled }">
						<div class="card">
							<a href="viewAccount.do?userId=${ user.id }"> <img
								alt="user profile picture" src="${ user.image}"
								onerror="this.onerror=null; this.src='https://images.unsplash.com/photo-1497514440240-3b870f7341f0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=652&q=80"
								class="card__image">
							</a>
							<div class="card__content">
								<a href="viewItinerary.do?userId=${ itinerary.id }"
									class="card__link"> ${user.name } </a>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:if>
		</c:when>
		<c:otherwise>
		No Users Found
		</c:otherwise>
	</c:choose>
	<%@include file="bootstrapFooter.jsp"%>
</body>
</html>
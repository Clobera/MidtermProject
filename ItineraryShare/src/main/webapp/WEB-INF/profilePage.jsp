<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${userId.username}</title>
<%@include file="bootstraphead.jsp"%>
<link rel="stylesheet" href="css/main.css">
</head>

<body>
	<%@include file="navbarGuest.jsp"%>
	<c:choose>
		<c:when test="${empty userId}">
			<div class="row profile__content">
				<!-- User Profile START -->
				<div class="col-lg-3 userInfo">
					<div class="affix">
						<div class="container">
							<!--   fixed position -->
							<img class="img-fluid img-circle"
								onerror="this.onerror=null; this.src='https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg'"
								src="${sessionScope.loggedInUser.profilePicture}">
						</div>
						<div class="container">
							<div class="row centerMe">
								<h5 >User Info</h5>

									<strong>Name:</strong> ${sessionScope.loggedInUser.firstName}
									${sessionScope.loggedInUser.lastName} <br> <strong>Active:</strong>
									${sessionScope.loggedInUser.enabled}<br/>
								<h5>Biography</h5>
									${sessionScope.loggedInUser.biography}
									<br/>
							</div>
						</div>
						<div class="container">
							<div class="profile__buttons">
								<div class="update__button">
									<form action="goUpdateAccount.do" method="post">
										<button type="submit" value="${sessionScope.loggedInUser.id}"
											name="updateId" class="btn btn-primary">Update</button>
									</form>
								</div>

								<div class="delete__button ">
									<form action="goDeleteAccount.do" method="post">
										<button class="btn btn-primary deleteButton" type="submit"
											value="${sessionScope.loggedInUser.id}" name="deleteId">Delete
											Profile</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- User Profile END -->

				<!-- Itineraries START -->
				<div class="col-lg-9">
				<div class="centerMe">
					<h4>Your Itineraries</h4>
					</div>

					<div class="cards">

						<div class="card">
							<a href="goCreateItinerary.do"> <img alt="Couple on Beach"
								src="https://media.istockphoto.com/photos/couple-relax-on-the-beach-enjoy-beautiful-sea-on-the-tropical-island-picture-id1160947136?b=1&k=20&m=1160947136&s=612x612&w=0&h=AsFmKSBYTtacl0DvI-RanCnAXFU0cmuW8NAo0g-tGzA="
								class="card__image">
							</a>
							<div class="card__content centerMe">
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
											<a href="viewItinerary.do?itineraryId=${ itinerary.id }">
												<img alt="" src="${ itinerary.image}"
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
							</c:when>
						</c:choose>
						<!-- User Itineraries END -->
					</div>
				</div>
				<!-- Itineraries END -->
			</div>
		</c:when>
		
		
		<c:when test="${sessionScope.loggedInUser.username == 'admin'}">
		<div class="row profile__content">
				<!-- User Profile START -->
				<div class="col-lg-3 userInfo">
					<div class="affix">
						<div class="container">
							<!--   fixed position -->
							<img class="img-fluid img-circle"
								onerror="this.onerror=null; this.src='https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg'"
								src="${userId.profilePicture}">
						</div>
						<div class="container">
							<div class="row centerMe">
								<h5>User Info</h5>

									<strong>Name:</strong> ${userId.firstName} ${userId.lastName} <br> <strong>Active: </strong>
									${userId.enabled}<br/>
								<h5>Biography</h5>
								${userId.biography}
								<br/>
							</div>
						</div>
						<c:if test="${userId.enabled == true}">
						<div class="container">
							<div class="profile__buttons">
								<div class="update__button">
									<form action="goUpdateAccount.do" method="post">
										<button type="submit" value="${userId.id}"
											name="updateId" class="btn btn-primary">Update</button>
									</form>
								</div>

								<div class="delete__button ">
									<form action="goDeleteAccount.do" method="post">
										<button class="btn btn-primary deleteButton" type="submit"
											value="${userId.id}" name="deleteId">Delete
											Profile</button>
									</form>
								</div>
							</div>
						</div>
						</c:if>
					</div>
				</div>
				<!-- User Profile END -->

				<!-- Itineraries START -->
				<div class="col-lg-9">
				<div class="centerMe">
				<br/>
				<div class="centerMe">
					<h4>${userId.username}'s Itineraries</h4>
					</div>
				</div>

					<div class="cards">
						<!-- User Itineraries START -->
						<c:choose>
							<c:when test="${ ! empty itineraries }">
								<div class="cards">
									<c:forEach var="itinerary" items="${ itineraries }">
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
							</c:when>
						</c:choose>
						<!-- User Itineraries END -->
					</div>
				</div>
				<!-- Itineraries END -->
			</div>
</c:when>



		<c:otherwise>
			<div class="row profile__content">
				<!-- User Profile START -->
				<div class="col-lg-3 userInfo">
					<div class="affix">
						<div class="container">
							<!--   fixed position -->
							<img class="img-fluid img-circle"
								onerror="this.onerror=null; this.src='https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg'"
								src="${userId.profilePicture}">
						</div>
						<div class="container">
							<div class="row centerMe">
								<h5>User Info</h5>
									<strong>Name:</strong> ${userId.firstName} ${userId.lastName} <br> <strong>Active:</strong>
									${userId.enabled}<br/>
								<h5>Biography</h5>
								${userId.biography}
							</div>
						</div>
					</div>
				</div>
				<!-- User Profile END -->

				<!-- Itineraries START -->
				<div class="col-lg-9">
				<div class="centerMe">
					<h4>${userId.username}'s Itineraries</h4>
					</div>

					<div class="cards">
						<!-- User Itineraries START -->
						<c:choose>
							<c:when test="${ ! empty itineraries }">
								<div class="cards">
									<c:forEach var="itinerary" items="${ itineraries }">
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
							</c:when>
						</c:choose>
						<!-- User Itineraries END -->
					</div>
				</div>
				<!-- Itineraries END -->
			</div>
		</c:otherwise>
	</c:choose>
	<%@include file="bootstrapFooter.jsp"%>

</body>
</html>
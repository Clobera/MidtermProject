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
	<div class="itinerary__content">
		<div class="row">
			<!-- Itinerary Info START -->
			<div class="col-lg-4 addBorder sepLine itinerary__info"
				data-spy="affix">

				<!--   fixed position -->
				<img class="itineraryPicture" src="${itinerary.image}">

				<div class="container">
					<h5>Itinerary Info</h5>
					<br /> <br>Name: ${itinerary.name} <br>Budget:
					${itinerary.budget} <br>Start Date: ${itinerary.startDate} <br>End
					Date: ${itinerary.endDate}
				</div>

				<div class="container">
					<h5>Description</h5>
					<br /> <strong>${itinerary.description}</strong>
				</div>
				<c:if
					test="${(sessionScope.loggedInUser.id == itinerary.userId.id) or sessionScope.loggedInUser.username == 'admin' }">
					<form action="deleteItinerary.do" method="post">
						<button type="submit" class="btn btn-primary"
							value="${itinerary.id}" name="deleteId">Delete</button>
					</form>
					<br>
					<form action="goUpdateItinerary.do" method="post">
						<button type="submit" class="btn btn-primary"
							value="${itinerary.id}" name="updateId">Update</button>
					</form>

				</c:if>
				<!-- Comments Section Start -->
				<c:if test="${sessionScope.loggedInUser.id != 0}">
					<div class="panel">
						<div class="panel-body">
						<form action="createItineraryComment.do" method="post">
						<input type="hidden" value="${itinerary.id}" name="itineraryId">
							<textarea class="form-control" rows="2"
								placeholder="What are you thinking?" name="itineraryComment"></textarea>
							<div class="mar-top clearfix">
								<button class="btn btn-sm btn-primary pull-right" type="submit"
									>
									<i class="fa fa-pencil fa-fw"></i> Comment
								</button>
							</div>
							</form>
						</div>
					</div>
				</c:if>
				<div class="panel">
					<div class="panel-body">
						<c:forEach var="comment" items="${comments}">
							<!-- Newsfeed Content -->
							<!--===================================================-->
							<div class="media-block">
								<a class="media-left" href="viewAccount.do?userId=${comment.user.id}"><img
									class="img-circle img-sm" alt="Profile Picture"
									src="${comment.user.profilePicture}"></a>
								<div class="media-body">
									<div class="mar-btm">
										<a href="viewAccount.do?userId=${comment.user.id}"
											class="btn-link text-semibold media-heading box-inline">${comment.user.username}</a>
									</div>
									<p>${comment.post }</p>
									<c:if test="${sessionScope.loggedInUser.id != 0}">
									<div class="pad-ver">
										<form action="goCreateItineraryCommentReply.do" method="post">
										<input type="hidden" value="${itinerary.id}" name="itineraryId">
										<input type="hidden" value="${comment.id}" name="itineraryCommentId">
										<button class="btn btn-sm btn-primary pull-right" type="submit"><i class="fa fa-pencil fa-fw"></i> Reply</button>
										</form>
									</div>
									</c:if>
									<hr>
								</div>
								<c:forEach var="reply" items="${replies}">
									<div class="media-block pad-all">
										<a class="media-left" href="viewAccount.do?userId=${reply.user.id}"><img
											class="img-circle img-sm" alt="Profile Picture"
											src="${reply.user.profilePicture}"></a>
										<div class="media-body">
											<div class="mar-btm">
												<a href="viewAccount.do?userId=${reply.user.id}"
													class="btn-link text-semibold media-heading box-inline">${reply.user.username}</a>
											</div>
											<p>${reply.post }</p>
										</div>
									</div>
								</c:forEach>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Itinerary Info END -->
	<!-- Itineraries START -->
	<div class="col-lg-8 addBorder" style="background: white;">
		<div class="container">
			<h4>Itinerary Days</h4>
			<c:if
				test="${(sessionScope.loggedInUser.id == itinerary.userId.id) or sessionScope.loggedInUser.username == 'admin' }">
				<br>
				<a href="goCreateItineraryItem.do?id=${itinerary.id }">Create
					Itinerary Item</a>
			</c:if>
			<br>

			<table>
				<thead>
					<tr>
						<th>Day</th>
						<th>Description</th>
						<c:if
							test="${(sessionScope.loggedInUser.id == itinerary.userId.id) or sessionScope.loggedInUser.username == 'admin' }">
							<th>Delete</th>
						</c:if>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="days" items="${itineraryDays}">
						<tr>
							<td>${days.tripDay}</td>
							<td>${days.description }</td>
							<c:if
								test="${(sessionScope.loggedInUser.id == itinerary.userId.id) or sessionScope.loggedInUser.username == 'admin' }">
								<td>
									<form action="deleteItineraryItem.do" method="post">
										<input type="hidden" value="${itinerary.id }"
											name="itineraryId"> <input type="hidden"
											value="${days.id}" name="itineraryItemId">
										<button type="submit" class="btn btn-primary">Delete</button>
									</form>
								</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- ItineraryItems END -->
	<%@include file="bootstrapFooter.jsp"%>
</body>
</html>
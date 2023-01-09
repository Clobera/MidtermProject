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

					
			</div>
		</div>
	</div>

	<!-- Itinerary Info END -->
	<!-- Itineraries START -->
	<div class="col-lg-8 addBorder" style="background: white;">
		<div class="container">
			<!-- Comments Section Start -->
				<c:if test="${sessionScope.loggedInUser.id != 0}">
					<div class="panel">
						<div class="panel-body">
						<form action="createItineraryCommentReply.do" method="post">
						<input type="hidden" value="${itineraryId}" name="itineraryId">
						<input type="hidden" value="${commentId}" name="itineraryCommentId">
							<textarea class="form-control" rows="2"
								placeholder="What are you thinking?"></textarea>
							<div class="mar-top clearfix">
								<button class="btn btn-sm btn-primary pull-right" type="submit"
									name="itineraryComment">
									<i class="fa fa-pencil fa-fw"></i>Reply
								</button>
							</div>
							</form>
						</div>
					</div>
				</c:if>
				<div class="panel">
					<div class="panel-body">
							<!-- Newsfeed Content -->
							<!--===================================================-->
							<div class="media-block">
								<a class="media-left" href="iewAccount.do?userId=${comment.user.id}"><img
									class="img-circle img-sm" alt="Profile Picture"
									src="${comment.user.profilePicture}"></a>
								<div class="media-body">
									<div class="mar-btm">
										<a href="viewAccount.do?userId=${comment.user.id}"
											class="btn-link text-semibold media-heading box-inline">${comment.user.username}</a>
									</div>
									<p>${comment.post }</p>
									<hr>
								</div>
								<c:forEach var="reply" items="${replies}">
									<div class="media-block pad-all">
										<a class="media-left" href="iewAccount.do?userId=${reply.user.id}"><img
											class="img-circle img-sm" alt="Profile Picture"
											src="${reply.user.profilePicture}"></a>
										<div class="media-body">
											<div class="mar-btm">
												<a href="iewAccount.do?userId=${reply.user.id}"
													class="btn-link text-semibold media-heading box-inline">${reply.user.username}</a>
											</div>
											<p>${reply.post }</p>
										</div>
									</div>
								</c:forEach>
							</div>
					</div>
				</div>
		</div>
	</div>
	<!-- ItineraryItems END -->
	<%@include file="bootstrapFooter.jsp"%>
</body>
</html>
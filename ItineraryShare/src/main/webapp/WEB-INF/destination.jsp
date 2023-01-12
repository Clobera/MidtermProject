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
				<img class="destinationPicture" src="${destination.image}"
					onerror="this.onerror=null; this.src='https://media.istockphoto.com/photos/couple-relax-on-the-beach-enjoy-beautiful-sea-on-the-tropical-island-picture-id1160947136?b=1&k=20&m=1160947136&s=612x612&w=0&h=AsFmKSBYTtacl0DvI-RanCnAXFU0cmuW8NAo0g-tGzA='">
				<form action="viewDestinationPictures.do" method="post">
					<button value="${destination.id }" type="submit"
						class="btn btn-primary deleteButton" name="destinationId">View Destination Pictures</button>
				</form>
				<c:if test="${sessionScope.loggedInUser.id != 0 }}">
											<form action="createDestinationPicture.do" method="post">
												<input type="text"
													placeholder="Enter a URL to add a picture" name="imageUrl">
												<input type="hidden" value="${destination.id }" name="destinationId">
												<button type="submit" class="btn btn-primary deleteButton">Submit</button>
											</form>
										</c:if>
				<br>
				<h4>Destination Info</h4>
				<br />

				<div class="flex">
					<h4>Name</h4>
					<p>${destination.name}</p>
					<br />
					<h4>Location</h4>
					<p>${destination.city},${destination.country}</p>
					<br />
					<h4>Rating</h4>
					<p>${rating}/ 5</p>
					<br />
					<h4>Description</h4>
					<p>${destination.description}</p>
					<br />

				</div>
				<c:if test="${sessionScope.loggedInUser.username == 'admin'}">
					<form action="goUpdateDestination.do" method="post">
						<button type="submit" class="btn btn-primary"
							value="${destination.id}" name="destinationId">Update</button>
					</form>
					<br>
				</c:if>
			</div>
			<div class="col-8">
					<div class="panel">
						<div class="panel-body">
							<h4>Rating</h4>
				<c:if test="${sessionScope.loggedInUser.id != 0}">
							<form action="createDestinationReview.do" method="post">
								<input type="hidden" value="${destination.id}"
									name="destinationId"> <input type="radio" value="1"
									id="rate1" name="ratingValue" checked="checked"> <label
									for="rate1">1</label> <input type="radio" value="2" id="rate2"
									name="ratingValue"> <label for="rate2">2</label> <input
									type="radio" value="3" id="rate3" name="ratingValue"> <label
									for="rate3">3</label> <input type="radio" value="4" id="rate4"
									name="ratingValue"> <label for="rate4">4</label> <input
									type="radio" value="5" id="rate5" name="ratingValue"> <label
									for="rate5">5</label> <br />
								<textarea class="container" rows="3"
									placeholder="Comment on this destination!"
									name="destinationReviewComment">${userReview.ratingComment}</textarea>
								<div class="mar-top clearfix">
									<button class="btn btn-sm btn-primary pull-right" type="submit">
										<i class="fa fa-pencil fa-fw"></i>Review
									</button>
								</div>
							</form>
							</c:if>
							<c:forEach var="review" items="${reviews}">
								<!-- Reviews -->
								<div class="media-block">
									<a class="media-left"
										href="viewAccount.do?userId=${review.user.id}"><img
										class="mx-auto rounded-circle img-fluid img-sm"
										alt="Profile Picture" src="${review.user.profilePicture}"
										onerror="this.onerror=null; this.src='https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg'"></a>
									<div class="media-body">
										<div class="mar-btm">
											<a href="viewAccount.do?userId=${review.user.id}"
												class="btn-link text-semibold media-heading box-inline">${review.user.username}</a>
											<p>${review.rating}/ 5</p>
										</div>
										<p>${review.ratingComment }</p>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 comments">
				<!-- Comments Section Start -->
				<c:if test="${sessionScope.loggedInUser.id != 0}">
					<div class="panel">
						<div class="panel-body">
							<form action="createDestinationComment.do" method="post">
								<input type="hidden" value="${destination.id}"
									name="destinationId">
								<textarea class="container" rows="3"
									placeholder="Comment on this destination!"
									name="destinationComment"></textarea>
								<div class="mar-top clearfix">
									<button class="btn btn-sm btn-primary pull-right" type="submit">
										<i class="fa fa-pencil fa-fw"></i>Comment
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
								<a class="media-left"
									href="viewAccount.do?userId=${comment.user.id}"><img
									class="mx-auto rounded-circle img-fluid img-sm"
									alt="Profile Picture" src="${comment.user.profilePicture}"
									onerror="this.onerror=null; this.src='https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg'"></a>
								<div class="media-body">
									<div class="mar-btm">
										<a href="viewAccount.do?userId=${comment.user.id}"
											class="btn-link text-semibold media-heading box-inline">${comment.user.username}</a>
									</div>
									<p>${comment.post }</p>
									<c:if test="${sessionScope.loggedInUser.id != 0}">
										<div class="pad-ver">
											<form action="goCreateDestinationCommentReply.do"
												method="post">
												<input type="hidden" value="${destination.id}"
													name="destinationId"> <input type="hidden"
													value="${comment.id}" name="destinationCommentId">
												<button class="btn btn-sm btn-primary pull-right"
													type="submit">
													<i class="fa fa-pencil fa-fw"></i> Reply
												</button>
											</form>
										</div>
									</c:if>
									<hr>
								</div>
								<!--  Replies Start -->
								<div
									class="comment-reply col-md-11 offset-md-1 col-sm-10 offset-sm-2">
									<c:forEach var="reply" items="${replies}">
										<c:if test="${reply.reply.id == comment.id}">
											<div class="row">
												<div
													class="comment-avatar col-md-1 col-sm-2 text-center pr-1">
													<a href="viewAccount.do?userId=${reply.user.id}"><img
														class="mx-auto rounded-circle img-fluid img-sm"
														alt="Profile Picture"
														onerror="this.onerror=null; this.src='https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg'"
														src="${reply.user.profilePicture}"></a>
												</div>
												<div class="comment-content col-md-11 col-sm-10 col-12">
													<div class="small comment-meta">
														<a href="viewAccount.do?userId=${reply.user.id}"
															class="btn-link text-semibold media-heading box-inline">${reply.user.username}</a>
													</div>
													<div class="comment-body">
														<p>${reply.post }</p>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach>
								</div>
								<!-- REPLIES END -->
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<!-- Itinerary Info END -->
	</div>
	<!-- ItineraryItems END -->
	<%@include file="bootstrapFooter.jsp"%>
</body>
</html>
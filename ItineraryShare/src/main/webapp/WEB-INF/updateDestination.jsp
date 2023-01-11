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
					onerror="this.onerror=null; this.src='https://media.istockphoto.com/photos/couple-relax-on-the-beach-enjoy-beautiful-sea-on-the-tropical-island-picture-id1160947136?b=1&k=20&m=1160947136&s=612x612&w=0&h=AsFmKSBYTtacl0DvI-RanCnAXFU0cmuW8NAo0g-tGzA=">
				<h4>Destination Info</h4>
				<br />

				<div class="flex">
					<h4>Name</h4>
					<p>${destination.name}</p>
					<br />
					<h4>Location</h4>
					<p>${destination.city}, ${destination.country}</p>
					<br />
					<h4>Rating</h4>
					<p>${rating} / 5</p>
					<br />
					<h4>Description</h4>
					<p>${destination.description}</p>
					<br />

				</div>
			</div>
			<div class="col-lg-8">
				<form class="create-account-form" action="updateDestination.do"
					method="POST">
					<input type="hidden" value="${destination.id }" name="destinationId">
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">Name</span> <input
							type="text" class="form-control" value="${destination.name}" placeholder="${destination.name}"
							aria-label="Name" aria-describedby="basic-addon1" name="name" REQUIRED>
					</div>

					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">Country</span> <input
							type="text" class="form-control" value="${destination.country }" placeholder="${destination.country }"
							 aria-label="Country"
							aria-describedby="basic-addon1" name="country" REQUIRED>
					</div>

					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">City</span> <input
							type="text" class="form-control" value="${destination.city }" placeholder="${destination.city }"
							aria-label="City" aria-describedby="basic-addon1" name="city"
							REQUIRED>
					</div>

					<div class="input-group mb-3 bio">
						<span class="input-group-text" id="basic-addon1">Description</span>
						<input type="text" class="form-control" placeholder="${destination.description }"
							value="${destination.description }" aria-label="Description"
							aria-describedby="basic-addon1" name="description">
					</div>

					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">Image URL</span>
						<input type="text" class="form-control" placeholder="${destination.image}"
							value="${destination.image}" aria-label="Image"
							aria-describedby="basic-addon1">
					</div>

					<button type="submit" class="btn btn-primary">Update
						Destination</button>
				</form>
			</div>
		</div>

	</div>
	<%@include file="bootstrapFooter.jsp"%>
</body>
</html>
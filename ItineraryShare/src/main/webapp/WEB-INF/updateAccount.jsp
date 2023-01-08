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

	<div class="row">
		<!-- Itinerary Info START -->
		<div class="col-3">
			<div class="affix" style="position: fixed;">
				<div class="container">
					<!--   fixed position -->
					<img class="img-fluid"
						src="${sessionScope.loggedInUser.profilePicture}">
				</div>
				<div class="container">
					<h5>User Info</h5>
					Name: ${sessionScope.loggedInUser.firstName}
					${sessionScope.loggedInUser.lastName} <br> Active:
					${sessionScope.loggedInUser.enabled}
				</div>

				<div class="container">
					<h5>Biography</h5>
					<strong>${sessionScope.loggedInUser.biography}</strong>
				</div>
			</div>
		</div>

		<!-- Itinerary Info END -->
		<div class="col-1"></div>
		<!-- Itineraries START -->
		<div class="col-7" style="background: white;">
			<div class="container">
				<form action="updateAccount.do" method="POST">
					<input type="hidden" value="${sessionScope.loggedInUser.id}"
						name="accountId"> <input type="hidden"
						value="${sessionScope.loggedInUser.username}" name="username">
					<input type="hidden" value="${sessionScope.loggedInUser.enabled}"
						name="enabled">
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">First Name</span>
						<input type="text" class="form-control" placeholder="First Name"
							value="${sessionScope.loggedInUser.firstName}"
							aria-label="Username" aria-describedby="basic-addon1"
							name="firstName">
					</div>

					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">Last Name</span>
						<input type="text" class="form-control" placeholder="Last Name"
							value="${sessionScope.loggedInUser.lastName}"
							aria-label="Username" aria-describedby="basic-addon1"
							name="lastName">
					</div>

					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">Password</span> <input
							type="password" class="form-control" placeholder="Password"
							value="${sessionScope.loggedInUser.password}"
							aria-label="Username" aria-describedby="basic-addon1"
							name="password" REQUIRED>
					</div>

					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">Biography</span>
						<input type="text" class="form-control"
							placeholder="Write something about yourself!"
							value="${sessionScope.loggedInUser.biography}"
							aria-label="Username" aria-describedby="basic-addon1"
							name="biography">
					</div>

					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">Profile
							Picture</span> <input type="text" class="form-control"
							placeholder="ENTER URL" aria-label="Username"
							value="${sessionScope.loggedInUser.profilePicture}"
							name="profilePicture" aria-describedby="basic-addon1">
					</div>

					<button type="submit" class="btn btn-primary">Update User</button>
				</form>
			</div>
		</div>
		<!-- ItineraryItems END -->
	</div>
	<%@include file="bootstrapFooter.jsp"%>

</body>
</html>
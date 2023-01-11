<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${sessionScope.loggedInUser.username}</title>
<%@include file="bootstraphead.jsp"%>
<link rel="stylesheet" href="css/main.css">

</head>
<body>
	<%@include file="navbarGuest.jsp"%>
<c:choose>
<c:when test="${empty updateId }">
	<div class="row profile__content">
		<!-- User Profile START -->
		<div class="col-lg-3 userInfo">
			<div class="affix">
				<div class="container">
					<!--   fixed position -->
					<img class="img-fluid"
						src="${sessionScope.loggedInUser.profilePicture}">
				</div>
				<div class="container">
					<div class="row">
						<h5 class="col profile__heading">User Info</h5>

						<div class="col profile__info">
							Name: ${sessionScope.loggedInUser.firstName}
							${sessionScope.loggedInUser.lastName} <br> Active:
							${sessionScope.loggedInUser.enabled}
						</div>
					</div>
				</div>

				<div class="container">
					<div class="row">
						<h5 class="col profile__heading">Biography</h5>
						<div class="col profile__info">
							${sessionScope.loggedInUser.biography}</div>
					</div>
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
	</c:when>
	<c:otherwise>
	<div class="row profile__content">
		<!-- User Profile START -->
		<div class="col-lg-3 userInfo">
			<div class="affix">
				<div class="container">
					<!--   fixed position -->
					<img class="img-fluid"
						src="${updateId.profilePicture}">
				</div>
				<div class="container">
					<div class="row">
						<h5 class="col profile__heading">User Info</h5>

						<div class="col profile__info">
							Name: ${updateId.firstName}
							${updateId.lastName} <br> Active:
							${updateId.enabled}
						</div>
					</div>
				</div>

				<div class="container">
					<div class="row">
						<h5 class="col profile__heading">Biography</h5>
						<div class="col profile__info">
							${updateId.biography}</div>
					</div>
				</div>
				</div>
				</div>

		<!-- Itinerary Info END -->
		<div class="col-1"></div>
		<!-- Itineraries START -->
		<div class="col-7" style="background: white;">
			<div class="container">
				<form action="updateAccount.do" method="POST">
					<input type="hidden" value="${updateId.id}"
						name="accountId"> <input type="hidden"
						value="${updateId.username}" name="username">
					<input type="hidden" value="${updateId.enabled}"
						name="enabled">
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">First Name</span>
						<input type="text" class="form-control" placeholder="First Name"
							value="${updateId.firstName}"
							aria-label="Username" aria-describedby="basic-addon1"
							name="firstName">
					</div>

					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">Last Name</span>
						<input type="text" class="form-control" placeholder="Last Name"
							value="${updateId.lastName}"
							aria-label="Username" aria-describedby="basic-addon1"
							name="lastName">
					</div>

					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">Password</span> <input
							type="password" class="form-control" placeholder="Password"
							value="${updateId.password}"
							aria-label="Username" aria-describedby="basic-addon1"
							name="password" REQUIRED>
					</div>

					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">Biography</span>
						<input type="text" class="form-control"
							placeholder="Write something about yourself!"
							value="${updateId.biography}"
							aria-label="Username" aria-describedby="basic-addon1"
							name="biography">
					</div>

					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">Profile
							Picture</span> <input type="text" class="form-control"
							placeholder="ENTER URL" aria-label="Username"
							value="${updateId.profilePicture}"
							name="profilePicture" aria-describedby="basic-addon1">
					</div>

					<button type="submit" class="btn btn-primary">Update User</button>
				</form>
			</div>
		</div>
		<!-- ItineraryItems END -->
	</div>
	
	</c:otherwise>
	</c:choose>
	<%@include file="bootstrapFooter.jsp"%>

</body>
</html>
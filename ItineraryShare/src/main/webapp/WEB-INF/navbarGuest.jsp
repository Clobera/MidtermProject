<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>

	<c:when
		test="${sessionScope.loggedInUser.username == null or loginSuccess == false}">

		<nav class="navbar navbar-expand-lg bg-body-tertiary sticky-top"
			style="background: transparent;">
			<div class="container-fluid">
				<a class="navbar-brand" href="home.do">iS</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse d-flex justify-content-start"
					id="navbarSupportedContent">
					<form class="d-flex" role="search" action="searchItinerary.do"
						method="get">
						<input class="form-control me-2" name="search" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link" href="loginForm.do">Log
								In</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</c:when>
	<c:when test="${ sessionScope.loggedInUser.username == 'admin' }">
		<!-- FOR ADMIN USER -->
		<nav class="navbar navbar-expand-lg bg-body-tertiary sticky-top"
			style="background: transparent;">
			<div class="container-fluid">
				<a class="navbar-brand" href="home.do">iS</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<form class="d-flex" action="goCreateDestination.do" method="post">
						<button class="btn btn-link navBarButton" id="navBarButton" type="submit" style="text-decoration: none; color: black;">Add
							Destination</button>
					</form>
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="goCreateItinerary.do">Add Itinerary</a></li>
						<li class="nav-item">
							<form class="d-flex" role="search" action="adminViewAll.do"
								method="get">
								<button class="btn btn-link navBarButton" type="submit" style="text-decoration: none; color: black;">View
									All Itineraries</button>
							</form>
						</li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">View All Users</a></li>
					</ul>

				</div>
				<div class="collapse d-flex justify-content-start"
					id="navbarSupportedContent">

					<form class="d-flex" role="search" action="searchItinerary.do"
						method="get">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search" name="search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">
								${sessionScope.loggedInUser.username} </a>
							<ul class="dropdown-menu dropdown-menu-end">
								<li><a class="dropdown-item" href="profilePage.do">PROFILE
										INFO</a></li>
								<li><a class="dropdown-item" href="viewBookmarks.do">VIEW
										BOOKMARKS</a></li>
								<li><hr class="dropdown-divider"></li>
								<li>
									<form class="d-flex dropdown-item" role="search"
										action="logout.do" method="POST">
										<button class="btn btn-outline-success dropdown-item"
											type="submit">LogOut</button>
									</form>
								</li>
							</ul></li>
					</ul>


				</div>
			</div>
		</nav>

	</c:when>
	<c:otherwise>
		<nav class="navbar navbar-expand-lg bg-body-tertiary sticky-top"
			style="background: transparent;">
			<div class="container-fluid">
				<a class="navbar-brand" href="home.do">iS</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<form class="d-flex" action="goCreateDestination.do" method="post">
						<button class="btn btn-link navBarButton" id="destinationButton" type="submit" style="text-decoration: none; color: black;">Add
							Destination</button>
					</form>
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="goCreateItinerary.do">Add Itinerary</a></li>
					</ul>

				</div>
				<div class="collapse d-flex justify-content-start"
					id="navbarSupportedContent">
					<form class="d-flex" role="search" action="searchItinerary.do"
						method="get">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search" name="search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>

					<ul class="navbar-nav me-auto mb-2 mb-lg-0">

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">
								${sessionScope.loggedInUser.username} </a>
							<ul class="dropdown-menu dropdown-menu-end">
								<li><a class="dropdown-item" href="profilePage.do">PROFILE
										INFO</a></li>
								<li><a class="dropdown-item" href="viewBookmarks.do">VIEW
										BOOKMARKS</a></li>
								<li><hr class="dropdown-divider"></li>
								<li>
									<form class="d-flex dropdown-item" role="search"
										action="logout.do" method="POST">
										<button class="btn btn-outline-success dropdown-item"
											type="submit">LogOut</button>
									</form>
								</li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>

	</c:otherwise>
</c:choose>

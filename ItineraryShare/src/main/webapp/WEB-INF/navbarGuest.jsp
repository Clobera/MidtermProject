<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>

	<c:when
		test="${sessionScope.loggedInUser.username == null or loginSuccess == false}">

		<nav class="navbar navbar-expand-lg bg-body-tertiary sticky-top"
			style="background: #72b9e7;">
			<div class="container-fluid">
				<a class="navbar-brand" href="home.do"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-airplane-engines" viewBox="0 0 16 16">
  <path d="M8 0c-.787 0-1.292.592-1.572 1.151A4.347 4.347 0 0 0 6 3v3.691l-2 1V7.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.191l-1.17.585A1.5 1.5 0 0 0 0 10.618V12a.5.5 0 0 0 .582.493l1.631-.272.313.937a.5.5 0 0 0 .948 0l.405-1.214 2.21-.369.375 2.253-1.318 1.318A.5.5 0 0 0 5.5 16h5a.5.5 0 0 0 .354-.854l-1.318-1.318.375-2.253 2.21.369.405 1.214a.5.5 0 0 0 .948 0l.313-.937 1.63.272A.5.5 0 0 0 16 12v-1.382a1.5 1.5 0 0 0-.83-1.342L14 8.691V7.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v.191l-2-1V3c0-.568-.14-1.271-.428-1.849C9.292.591 8.787 0 8 0ZM7 3c0-.432.11-.979.322-1.401C7.542 1.159 7.787 1 8 1c.213 0 .458.158.678.599C8.889 2.02 9 2.569 9 3v4a.5.5 0 0 0 .276.447l5.448 2.724a.5.5 0 0 1 .276.447v.792l-5.418-.903a.5.5 0 0 0-.575.41l-.5 3a.5.5 0 0 0 .14.437l.646.646H6.707l.647-.646a.5.5 0 0 0 .14-.436l-.5-3a.5.5 0 0 0-.576-.411L1 11.41v-.792a.5.5 0 0 1 .276-.447l5.448-2.724A.5.5 0 0 0 7 7V3Z"/>
</svg> iS</a>
				<div class="collapse d-flex justify-content-start"
					id="navbarSupportedContent">
					<form class="d-flex" role="search" action="searchItinerary.do"
						method="get">
						<input class="form-control me-2" name="search" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success search__button" type="submit">Search</button>
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
			style="background: #72b9e7;">
			<div class="container-fluid">
				<a class="navbar-brand" href="home.do"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-airplane-engines" viewBox="0 0 16 16">
  <path d="M8 0c-.787 0-1.292.592-1.572 1.151A4.347 4.347 0 0 0 6 3v3.691l-2 1V7.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.191l-1.17.585A1.5 1.5 0 0 0 0 10.618V12a.5.5 0 0 0 .582.493l1.631-.272.313.937a.5.5 0 0 0 .948 0l.405-1.214 2.21-.369.375 2.253-1.318 1.318A.5.5 0 0 0 5.5 16h5a.5.5 0 0 0 .354-.854l-1.318-1.318.375-2.253 2.21.369.405 1.214a.5.5 0 0 0 .948 0l.313-.937 1.63.272A.5.5 0 0 0 16 12v-1.382a1.5 1.5 0 0 0-.83-1.342L14 8.691V7.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v.191l-2-1V3c0-.568-.14-1.271-.428-1.849C9.292.591 8.787 0 8 0ZM7 3c0-.432.11-.979.322-1.401C7.542 1.159 7.787 1 8 1c.213 0 .458.158.678.599C8.889 2.02 9 2.569 9 3v4a.5.5 0 0 0 .276.447l5.448 2.724a.5.5 0 0 1 .276.447v.792l-5.418-.903a.5.5 0 0 0-.575.41l-.5 3a.5.5 0 0 0 .14.437l.646.646H6.707l.647-.646a.5.5 0 0 0 .14-.436l-.5-3a.5.5 0 0 0-.576-.411L1 11.41v-.792a.5.5 0 0 1 .276-.447l5.448-2.724A.5.5 0 0 0 7 7V3Z"/>
</svg> iS</a>
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
							aria-current="page" href="adminViewAllUsers.do">View All Users</a></li>
					</ul>

				</div>
				<div class="collapse d-flex justify-content-start"
					id="navbarSupportedContent">

					<form class="d-flex" role="search" action="searchItinerary.do"
						method="get">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search" name="search">
						<button class="btn btn-outline-success search__button" type="submit">Search</button>
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
			style="background: #72b9e7;">
			<div class="container-fluid">
				<a class="navbar-brand" href="home.do"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-airplane-engines" viewBox="0 0 16 16">
  <path d="M8 0c-.787 0-1.292.592-1.572 1.151A4.347 4.347 0 0 0 6 3v3.691l-2 1V7.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.191l-1.17.585A1.5 1.5 0 0 0 0 10.618V12a.5.5 0 0 0 .582.493l1.631-.272.313.937a.5.5 0 0 0 .948 0l.405-1.214 2.21-.369.375 2.253-1.318 1.318A.5.5 0 0 0 5.5 16h5a.5.5 0 0 0 .354-.854l-1.318-1.318.375-2.253 2.21.369.405 1.214a.5.5 0 0 0 .948 0l.313-.937 1.63.272A.5.5 0 0 0 16 12v-1.382a1.5 1.5 0 0 0-.83-1.342L14 8.691V7.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v.191l-2-1V3c0-.568-.14-1.271-.428-1.849C9.292.591 8.787 0 8 0ZM7 3c0-.432.11-.979.322-1.401C7.542 1.159 7.787 1 8 1c.213 0 .458.158.678.599C8.889 2.02 9 2.569 9 3v4a.5.5 0 0 0 .276.447l5.448 2.724a.5.5 0 0 1 .276.447v.792l-5.418-.903a.5.5 0 0 0-.575.41l-.5 3a.5.5 0 0 0 .14.437l.646.646H6.707l.647-.646a.5.5 0 0 0 .14-.436l-.5-3a.5.5 0 0 0-.576-.411L1 11.41v-.792a.5.5 0 0 1 .276-.447l5.448-2.724A.5.5 0 0 0 7 7V3Z"/>
</svg> iS</a>
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
						<button class="btn btn-outline-success search__button" type="submit">Search</button>
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

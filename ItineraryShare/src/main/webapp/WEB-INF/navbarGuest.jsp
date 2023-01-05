<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>

	<c:when test="${sessionScope.loggedInUser.username != 'admin' and (success == false or empty success)}">

		<nav class="navbar navbar-expand-lg bg-body-tertiary">
			<div class="container-fluid">
				<a class="navbar-brand" href="home.do">iS</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<form class="d-flex" role="search">
						<input class="form-control me-2" type="search"
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
		<nav class="navbar navbar-expand-lg bg-body-tertiary">
			<div class="container-fluid">
				<a class="navbar-brand" href="home.do">iS</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">Add Itinerary</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">View All Itineraries</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">View All Users</a></li>
					</ul>
					<form class="d-flex" role="search">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">

						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">[CHANGE ME TO USERNAME]</a></li>

						<!-- FIX ME AS A STRECH GOAL!!! -->

						<!-- <li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="true"> [CHANGE ME TO
								USERNAME] </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">PROFILE INFO</a></li>
								<li><a class="dropdown-item" href="#">VIEW BOOKMARKS</a></li>
								<li><a class="dropdown-item" href="#">VIEW MY
										ITINERARIES</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="#"> LOGOUT</a></li>
							</ul></li> -->


					</ul>
				</div>
			</div>
		</nav>











	</c:when>
	<c:otherwise>
		<nav class="navbar navbar-expand-lg bg-body-tertiary">
			<div class="container-fluid">
				<a class="navbar-brand" href="home.do">iS</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">Add Itinerary</a></li>
					</ul>
					<form class="d-flex" role="search">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">[CHANGE ME TO USERNAME]</a></li>


						<!-- FIX ME AS A STRECH GOAL!!! -->
						<!-- <li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> [CHANGE ME
								TO USERNAME] </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">PROFILE INFO</a></li>
								<li><a class="dropdown-item" href="#">VIEW BOOKMARKS</a></li>
								<li><a class="dropdown-item" href="#">VIEW MY
										ITINERARIES</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="#"> LOGOUT</a></li>
							</ul></li> -->
					</ul>
				</div>
			</div>
		</nav>

	</c:otherwise>
</c:choose>

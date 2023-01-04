<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@include file="bootstraphead.jsp"%>
</head>
<body>
	<nav class="navbar navbar-expand">
		<div class="container-fluid">
			<form action="home.do" class="container-fluid justify-content-start">
				<button class="btn me-2" type="submit">
					<strong>iS</strong>
				</button>
			</form>
			
			<div class="collapse navbar-collapse" id="navbarSupportedContent">

				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>


				<ul>
					<li class="nav-item">
						<form class="d-flex" action="[FIX ME]">
							<button class="btn glow" type="submit">Log In</button>

						</form>
					</li>
				</ul>
				
			</div>
		</div>
	</nav>
</body>
</html>
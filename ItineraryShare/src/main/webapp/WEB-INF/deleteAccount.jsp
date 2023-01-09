<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirmation</title>
<%@include file="bootstraphead.jsp"%>
</head>
<body>
<%@include file="navbarGuest.jsp"%>

<img alt="" src="images/youSure.png">

<form action="deleteAccount.do">
<button type="submit" value="deleteMe.id" name="deleteId" class="btn btn-primary">Yes, I'm sure. DELETE ME
</button>
</form>

<form action="home.do">
<button type="submit" class="btn btn-primary" >No, spare my life :(
</button>
</form>






<%@include file="bootstrapFooter.jsp"%>
</body>
</html>
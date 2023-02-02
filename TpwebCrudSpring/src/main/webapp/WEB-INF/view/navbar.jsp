<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<style>
.image-clignote {
	animation-duration: 1.5s;
	animation-name: clignoter;
	animation-iteration-count: infinite;
	transition: none;
}

@
keyframes clignoter { 0% {	opacity: 1;}40%{opacity:0;}100%{opacity:1;}}
</style>
</head>
<nav class="navbar navbar-light shadow-lg p-3 mx-5 fixed-top rounded"
	style="background: hsla(0, 0%, 57%, 0.404)">
	<div class="container-fluid ">
		<div class="fw-bold">
			<h6>${user.firstName} ${user.lastName}</h6>
			<h6>${user.roleName}</h6>
		</div>
		<!-- rubrique contact -->
		<a class="nav-link text-white" href="/TPweb/contact">contact
		</a>

		<c:choose>
			<c:when test="${user.roleName == null}">

				<a class="nav-link text-white" href="/TPweb/login"> <span
					class="d-grid gap-2 d-lg-inline-block"></span> <i
					class="bi bi-box-arrow-in-right image-clignote"
					style="font-size: 1.5rem"></i>
				</a>
			</c:when>
			<c:otherwise>
				<a class="nav-link text-white" href="/TPweb/logout"> <span
					class="d-grid gap-2 d-lg-inline-block"></span> <i
					class="bi bi-box-arrow-left" style="font-size: 1.5rem"></i></a>
			</c:otherwise>
		</c:choose>
	</div>
</nav>

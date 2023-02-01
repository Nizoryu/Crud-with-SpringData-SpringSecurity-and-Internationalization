<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>  
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"  %>
<head>
<link href="<c:url value="/Style/bootstrap.css" />" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>
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
			<h6>${pageContext.request.userPrincipal.name}</h6>
		</div>
		
		<ul>
		<li><a class="nav-link text-white" href="${pageContext.request.contextPath}?lang=en_US">Anglais</a></li>
		<li><a class="nav-link text-white" href="${pageContext.request.contextPath}?lang=fr_FR">Francais</a></li>
	    </ul>  
	    

       <a class="nav-link text-white" href="${pageContext.request.contextPath}/welcome"><s:message code="label.welcome"></s:message></a>

	 	<sec:authorize access="!isAuthenticated()">

				<a class="nav-link text-white" href="login"> <span
					class="d-grid gap-2 d-lg-inline-block"></span> <i
					class="bi bi-box-arrow-in-right image-clignote"
					style="font-size: 1.5rem"></i>
				</a>
     	</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<sec:authorize access="hasRole('ROLE_SUPERADMIN')">
			 <a class="nav-link text-white" href="${pageContext.request.contextPath}/userInfo"><s:message code="label.userInfo"></s:message></a>
			 </sec:authorize>
			 <sec:authorize access="hasAnyRole('ROLE_SUPERADMIN','ROLE_ADMIN')">
             <a class="nav-link text-white" href="${pageContext.request.contextPath}/admin">Admin</a>
             </sec:authorize>
             <a class="nav-link text-white" href="${pageContext.request.contextPath}/listemployee">Menu Employee</a>
				<a class="nav-link text-white" href="${pageContext.request.contextPath}/logout"> <span
					class="d-grid gap-2 d-lg-inline-block"></span> 
			<i class="bi bi-box-arrow-left" style="font-size: 1.5rem"></i></a>
		 </sec:authorize>
	</div>
</nav>

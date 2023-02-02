<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>  
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"  %>
<head>
<link href="<c:url value="/Style/bootstrap.css" />" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
.image-clignote {
	animation-duration: 1.5s;
	animation-name: clignoter;
	animation-iteration-count: infinite;
	transition: none;
}

@keyframes clignoter { 0% {	opacity: 1;}40%{opacity:0;}100%{opacity:1;}}


ul {
  text-align:center;
  position:relative;
  display:inline-block;
}
li {
  list-style:none;
  display:inline-block;
  margin-right:35px;
}
a {
  text-decoration:none;
  cursor:pointer;
}
.bottom__line {
  position:absolute;
  top:20px;
  left:37px;
  width:48px;
  height:2px;
  background-color:#d94f5c;
}
button.selected{
  color:red !important;
}

</style>
<script type="text/javascript">
$('button').on('click', function(){
    $('button').removeClass('selected');
    $(this).addClass('selected');
});
</script>
</head>
<nav class="navbar navbar-light shadow-lg p-3 mx-5 fixed-top rounded"
	style="background: hsla(0, 0%, 57%, 0.404)">
	<div class="container-fluid ">
		<div class="fw-bold">
		<ul class="nav">		
		<li class="nav-item"><h6>${pageContext.request.userPrincipal.name}</h6></li>
		<li class="nav-item"><a class="nav-link" aria-current="step" href="?lang=en_US">Anglais</a></li>
		<li class="nav-item"><a class="nav-link"aria-current="step link"  href="?lang=fr_FR">Francais</a></li>
	    </ul>  
		</div>
		
       <a class="nav-link target"  href="${pageContext.request.contextPath}/welcome"><s:message code="label.welcome"></s:message></a>
<button>Item</button><button>Item</button><button>Item</button>
	 	<sec:authorize access="!isAuthenticated()">

				<a class="nav-link text-white" href="login"> <span
					class="d-grid gap-2 d-lg-inline-block"></span> <i
					class="bi bi-box-arrow-in-right image-clignote"
					style="font-size: 1.5rem"></i>
				</a>
     	</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<sec:authorize access="hasRole('ROLE_SUPERADMIN')">
			 <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/userInfo"><s:message code="label.userInfo"></s:message></a>
			 </sec:authorize>
			 <sec:authorize access="hasAnyRole('ROLE_SUPERADMIN','ROLE_ADMIN')">
             <a class="nav-link " aria-current="page" href="${pageContext.request.contextPath}/admin">Admin</a>
             </sec:authorize>
             <a class="nav-link text-white" aria-current="page" href="${pageContext.request.contextPath}/listemployee">Menu Employee</a>
				<a class="nav-link text-white" aria-current="page" href="${pageContext.request.contextPath}/logout"> <span
					class="d-grid gap-2 d-lg-inline-block"></span> 
			<i class="bi bi-box-arrow-left" style="font-size: 1.5rem"></i></a>
		 </sec:authorize>
	</div>
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link " aria-current="page" href="#${pageContext.request.contextPath}/welcome">welcome</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#${pageContext.request.contextPath}/admin">Admin</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Link</a>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled">Disabled</a>
  </li>
</ul>


</nav>


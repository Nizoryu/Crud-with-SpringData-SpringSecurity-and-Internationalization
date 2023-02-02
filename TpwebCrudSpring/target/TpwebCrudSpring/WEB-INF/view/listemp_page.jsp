<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"  %>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><s:message code="page.list"></s:message></title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
<script
	src="https://unpkg.com/bootstrap-table@1.21.2/dist/bootstrap-table.min.js"></script>

<link rel="stylesheet"
	href="https://unpkg.com/bootstrap-table@1.21.2/dist/bootstrap-table.min.css">

</head>
<jsp:include page="_navbar.jsp" />
<body class="">
	<!-- Background image -->
	<div class="p-5 bg-image"
		style="background-image: url('https://mdbootstrap.com/img/new/textures/full/171.jpg'); height: 300px;"></div>
	<div class="container">
		<div class="card mx-4 mx-md-5 shadow-5-strong mb-5"
			style="margin-top: -100px; background: hsla(0, 0%, 100%, 0.8); backdrop-filter: blur(30px);">
			<div class="card-body py-5 px-md-5">

				<div class="row d-flex justify-content-center">
					<div class="col">
						<h2 class="fw-bold mb-2" align="center">Management de la
							liste: Employee</h2>
						<div align="center">
	                      <sec:authorize access="hasRole('ROLE_ADMIN')">
							<a class="btn btn-primary bg-gradient mt-4" href="saveEmp"
								role="button">Ajouter un employé</a>
									</sec:authorize>
						</div>
						<table class="table table-striped table-hover"
							data-page-list="[10, 25, 50, 100, all]" data-pagination="true"
							data-toggle="table" data-search="true">
							<thead>
								<tr style="text-align: center">
									<th>ID</th>
									<th><s:message code="emp.firstName"></s:message></th>
									<th><s:message code="emp.lastName"></s:message></th>
									<th><s:message code="emp.title"></s:message></th>
									<th><s:message code="emp.startDate"></s:message></th>
									<sec:authorize access="hasRole('ROLE_ADMIN')">
										<th>Modification</th>
									</sec:authorize>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listemp}" var="emp">
									<tr style="text-align: center">
										<td >${emp.empId }</td>
										<td >${emp.firstName }</td>
										<td>${emp.lastName }</td>
										<td style="text-align: start">${emp.title }</td>
										<td>${emp.startDate}</td>
										<sec:authorize access="hasRole('ROLE_ADMIN')">
										<td>
												<a
													href="updateEmp?empId=<c:out value="${emp.empId}"></c:out>"
													id="id" class="edit" onclick="return confirm('are you sure?');" data-toggle="modal"><i
													class="bi bi-pencil-square" style="font-size: 1.1rem;"></i></a>
												<a href="deleteEmp?id=<c:out value="${emp.empId}"></c:out>"
													class="delete" data-toggle="modal"><i
													class="bi bi-x-square-fill"
													style="color: red; font-size: 1.1rem;"></i></a>
												<input type="hidden" name="id" id="id">
											</td>
											</sec:authorize>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
function confirm_delete() {
  return confirm('are you sure?');
}
</script>

</html>
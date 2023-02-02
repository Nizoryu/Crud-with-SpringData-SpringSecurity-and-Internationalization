<%@page session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
<script
	src="https://unpkg.com/bootstrap-table@1.21.2/dist/bootstrap-table.min.js"></script>

<link rel="stylesheet"
	href="https://unpkg.com/bootstrap-table@1.21.2/dist/bootstrap-table.min.css">
<title><s:message code="page.userinfo"></s:message></title>
</head>
<body>
	<jsp:include page="_navbar.jsp" />



	<!-- Section: Design Block -->
	<section class="text-center">
		<!-- Background image -->
		<div class="p-5 bg-image"
			style="background-image: url('https://mdbootstrap.com/img/new/textures/full/171.jpg'); height: 300px;"></div>

		<div class="container">
			<div class="card mx-4 mx-md-5 me-auto shadow-5-strong"
				style="margin-top: -100px; background: hsla(0, 0%, 100%, 0.8); backdrop-filter: blur(30px);">
				<div class="card-body py-5 px-md-5 ">

					<div class="row d-flex justify-content-center ">
						<div class="col">
							<h2 class="fw-bold mb-2">
								<s:message code="page.userinfo"></s:message>
							</h2>

							
							<table class="table table-striped table-hover"
							data-page-list="[10, 25, 50, 100, all]" data-pagination="true"
							data-toggle="table" data-search="true">
								<thead>
									<tr style="text-align: center">
										<th>ID</th>
										<th>firstName</th>
										<th>lastName</th>
										<th>roleName</th>
										<th>datecreation</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach items="${listemp}" var="l">
										<tr style="text-align: center" >
											<td>${l.idUser }</td>
											<td>${l.firstName }</td>
											<td>${l.lastName }</td>
											<td style="text-align: start">${l.roleName }</td>
											<td>${l.dateCreation}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
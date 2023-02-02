<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><ss:message code="page.addemp"></ss:message></title>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>


</head>
</head>
<body>
<jsp:include page="_navbar.jsp" />
	<s:form action="saveEmp" method="post" modelAttribute="employee">


		<!-- Section: Design Block -->
		<section class="text-center mb-auto " style="min-height: 94vh;">
			<!-- Background image -->
			<div class="p-5 bg-image"
				style="background-image: url('https://mdbootstrap.com/img/new/textures/full/171.jpg'); height: 300px;"></div>
			<!-- Background image -->
			<div class="container ">

				<div class="card mx-4 mx-md-5 shadow-5-strong"
					style="margin-top: -100px; background: hsla(0, 0%, 100%, 0.8); backdrop-filter: blur(30px);">
					<div class="card-body py-5 px-md-5">

						<div class="row d-flex justify-content-center">
							<div class="col-lg-8">
								<h2 class="fw-bold mb-5">Enregistrement d'un Employee</h2>

								<!-- 2 column grid layout with text inputs for the first and last names -->
								<div class="row">
									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<s:input type="text" name="firstName" path="firstName" class="form-control" placeholder="FirstName" /> 
												<s:errors path="firstName" cssClass="error" />
												<label class="form-label" ></label>
										</div>
									</div>
									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<s:input type="text" name="lastName" path="lastName"
												class="form-control" placeholder="LastName" /> 
												<s:errors path="lastName" cssClass="error" />
												<label class="form-label" ></label>
										</div>
									</div>
								</div>
								<!-- title input -->
								<div class="form-outline mb-4">
									<s:input type="text" name="title" path="title"
										class="form-control" placeholder="title"  /> 
										<s:errors path="title" cssClass="error" />
										<label class="form-label" for="form3Example3"></label>
								</div>
								<!-- startdate input -->


								<div class="form-outline mb-4">
									<s:input type="date" name="startDate" path="startDate"
										class="form-control" placeholder="starttdate" min="2023-01-01" />
										<s:errors path="startDate" cssClass="error" />
									<label class="form-label" for="form3Example3"> </label>
								</div>


								<!-- Submit button -->
								<button type="submit" class="btn btn-primary btn-block mb-4">
									Ajouter</button>


							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

	</s:form>


</body>


</html>
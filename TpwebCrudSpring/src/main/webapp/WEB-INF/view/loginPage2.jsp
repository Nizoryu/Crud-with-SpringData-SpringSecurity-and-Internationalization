<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>
<jsp:include page="_navbar.jsp" />
<body class="bg-light">

	
		<!-- Section: Design Block -->
		<section class="text-center">
			<!-- Background image -->
			<div class="p-5 bg-image"
				style="background-image: url('https://mdbootstrap.com/img/new/textures/full/171.jpg'); height: 300px;"></div>

			<div class="container">
				<div class="card mx-4 mx-md-5  shadow-5-strong"
					style="margin-top: -100px; background: hsla(0, 0%, 100%, 0.8); backdrop-filter: blur(30px);">
					<div class="card-body py-5 px-md-5">

						<div class="row d-flex justify-content-center ">
							<div class="col">
								<h2 class="fw-bold mb-2">Bienvenue</h2>
								<h5 class="fw-bold mb-5">Veuillez vous connecter</h5>

								<form name='f' action="${pageContext.request.contextPath}/yahya" method='POST'>
									<!-- /login?error=true -->
									<c:if test="${param.error == 'true'}">
										<div style="color: red; margin: 10px 0px;">

											Login Failed!!!<br /> Reason :
											${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}

										</div>
									</c:if>
									<!-- Email input -->
									<div class="form-outline mb-4">
										<input type="email" name="email" class="form-control"
											placeholder="Email" required /> <label class="form-label">
										</label>
									</div>

									<!-- Password input -->
									<div class="form-outline mb-4">
										<input type="password" name="password" class="form-control"
											placeholder="Password" required /> <label class="form-label"></label>
									</div>

									<!-- Submit button -->
									<button type="submit" class="btn btn-primary btn-block mb-4">
										Connection</button>
								</form>



							<!-- 	<a class="m-4" href="/TPweb/registre" role="button">Ajouter
									un utilisateur</a> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

	
</body>
</html>
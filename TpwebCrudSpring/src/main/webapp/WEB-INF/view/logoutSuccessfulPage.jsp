 <%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>   
<html>
<head>
<title><s:message code="page.logout"></s:message></title>
</head>
<body>
<jsp:include page="_navbar.jsp" />

    
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
								<h2 class="fw-bold mb-2">Logout Successful!</h2>
								

							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
</body>
</html>
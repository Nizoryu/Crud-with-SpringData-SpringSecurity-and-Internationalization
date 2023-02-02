<%@page session="false"%>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>   
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title><s:message code="label.welcome"></s:message></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

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
								<h2 class="fw-bold mb-2"><s:message code="label.welcome"></s:message> ${pageContext.request.userPrincipal.name}</h2>

								     <strong><s:message code="label.content"></s:message></strong>
								     <br>
                               		<img alt="CDC" src="<s:url value="/img/tp.PNG"/>" >

							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

</body>
</html>
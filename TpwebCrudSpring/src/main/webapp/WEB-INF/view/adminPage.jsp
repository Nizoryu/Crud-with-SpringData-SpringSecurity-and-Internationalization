<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>   
<html>
<head>
<title><s:message code="page.admin"></s:message></title>
</head>
<body>
	<jsp:include page="_menu.jsp" />

	<h2>Admin Page</h2>

	<h3>Welcome : ${pageContext.request.userPrincipal.name}</h3>
	
	

	<b>This is protected page!</b>
</body>
</html>
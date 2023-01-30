<%@page session="false"%>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>   
<html>
<head>
<title><s:message code="label.welcome"></s:message></title>
</head>
<body>
<jsp:include page="_menu.jsp"/>
   <h1><s:message code="label.content"></s:message></h1>

</body>
</html>
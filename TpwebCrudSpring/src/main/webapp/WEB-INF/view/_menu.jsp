<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>   
<div style="border: 1px solid #ccc;padding:5px;margin-bottom:20px;">
<ul>

		<li><a href="${pageContext.request.contextPath}?lang=en_US">Anglais</a></li>
		<li><a href="${pageContext.request.contextPath}?lang=fr_FR">Francais</a></li>

	</ul>
  <a href="${pageContext.request.contextPath}/welcome"><s:message code="label.welcome"></s:message></a>

  | &nbsp;
 
   <a href="${pageContext.request.contextPath}/userInfo"><s:message code="label.userInfo"></s:message></a>
 
  | &nbsp;
 
  <a href="${pageContext.request.contextPath}/admin">Admin</a>
 
  <c:if test="${pageContext.request.userPrincipal.name != null}">
 
     | &nbsp;
     <a href="${pageContext.request.contextPath}/logout">Logout</a>
  | &nbsp;
 
    
  </c:if>
  <a href="${pageContext.request.contextPath}/listemployee">Menu Employee</a>
 			<h6>${pageContext.request.userPrincipal.name}</h6>
 			<h6></h6>
			
</div>

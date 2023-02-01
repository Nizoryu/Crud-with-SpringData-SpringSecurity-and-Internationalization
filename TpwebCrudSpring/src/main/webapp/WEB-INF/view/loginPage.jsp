<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>   

<html>
<head><title>Login</title></head>
<body>
   <jsp:include page="_navbar.jsp" />
   
   
   <h1><s:message code="page.login"></s:message></h1>
    
     <!-- /login?error=true -->
     <c:if test="${param.error == 'true'}">
         <div style="color:red;margin:10px 0px;">
         
                Login Failed!!!<br />
                Reason :  ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
                
         </div>
    </c:if>
      
   <h3>Enter user name and password:</h3>  
    
   <form name='f' action="${pageContext.request.contextPath}/yahya" method='POST'>
      <table>
         <tr>
            <td>User:</td>
            <td><input type='text' name='email' value=''></td>
         </tr>
         <tr>
            <td>Password:</td>
            <td><input type='password' name='password' /></td>
         </tr>
         <tr>
            <td><input name="submit" type="submit" value="submit" /></td>
         </tr>
      </table>
  </form>
</body>
</html>
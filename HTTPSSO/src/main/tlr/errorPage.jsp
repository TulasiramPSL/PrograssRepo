<%@ page language="java" 
         contentType="text/plain;charset=UTF-8" 
         pageEncoding="UTF-8" 
         session="false"
         isErrorPage="true" 
         trimDirectiveWhitespaces="true"
 %>
<html>
<head>
<title>Redirect to Login</title>
</head>
<body>
    <%
        response.setStatus(302);
        response.setHeader("Location", "/nginx/static/SSOlogin.html");
    %>
</body>
</html>
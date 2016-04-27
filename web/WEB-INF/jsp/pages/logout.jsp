<%-- 
    Document   : logout
    Created on : 27-apr-2016, 12.09.15
    Author     : chnedev
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>XXI Museum | Log out</title>
</head>
<body>
    <% session.removeAttribute("username");%>
    <c:redirect url="../index"/>
</body>
</html>


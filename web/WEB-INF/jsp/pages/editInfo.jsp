<%-- 
    Document   : register
    Created on : 28-apr-2016, 10.26.38
    Author     : chnedev
--%>

<%@page import="CRUD.DAO"%>
<%@page import="PO.Utente"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>XXI Museum | Edit profile</title>
</head>
<body>
    <%
        String username = session.getAttribute("username").toString();
        Utente user= DAO.getUtente(username);
        if(request.getParameter("password") != ""){
            DAO.updateUtente(username, request.getParameter("email"), request.getParameter("password"));
        }
        else DAO.updateUtente(username, request.getParameter("email"), user.getPassword());
        if(request.getParameter("password") != "") session.setAttribute("password", request.getParameter("password"));
        session.setAttribute("email", request.getParameter("email"));
    %>
    <c:redirect url="./profile"/>
</body>
</html>

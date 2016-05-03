<%-- 
    Document   : register
    Created on : 28-apr-2016, 10.26.38
    Author     : chnedev
--%>

<%@page import="CRUD.DAO"%>
<%@page import="PO.Utente"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <%
        String username = request.getParameter("username");
        session.setAttribute("username", username);
        Utente user = DAO.getUtente(username);
        session.setAttribute("email", user.getEmail());
        session.setAttribute("password", user.getPassword());
        session.setAttribute("nome", user.getNome());
        session.setAttribute("cognome", user.getCognome());
        session.setAttribute("email", user.getEmail());
        session.setAttribute("dataDiNascita", user.getDataDiNascita());
    %>
    <c:redirect url="./index"/>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>XXI Museum | Log out</title>
</head>
<body>
</body>
</html>

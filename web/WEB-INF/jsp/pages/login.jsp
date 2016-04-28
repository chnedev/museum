<%-- 
    Document   : login
    Created on : 27-apr-2016, 4.22.26
    Author     : chnedev
--%>

<%@page import="CRUD.DAO"%>
<%@page import="PO.Utente"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:if test="${presente eq 'true'}">
    <%
        String username = request.getParameter("username");
        session.setAttribute("username", username);
        Utente user= DAO.getUtente(username);
        session.setAttribute("username", username);
        session.setAttribute("email", user.getEmail());
        session.setAttribute("password", user.getPassword());
        session.setAttribute("nome", user.getNome());
        session.setAttribute("cognome", user.getCognome());
        session.setAttribute("email", user.getEmail());
        session.setAttribute("dataDiNascita", user.getDataDiNascita());
    %>
    <c:redirect url="../index"/>
</c:if>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--fonts-->
        <link href='https://fonts.googleapis.com/css?family=Lekton' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Rock+Salt' rel='stylesheet' type='text/css'>
        <!--icons-->
        <link href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet">
        <!--css-->
        <link href="https://cdn.muicss.com/mui-latest/css/mui.min.css" rel="stylesheet" type="text/css" >
        <link href="../resources/floating/style.css" rel="stylesheet" type="text/css">
        <link href="../resources/floating/mfb.css" rel="stylesheet" type="text/css">
        <link href="../resources/static/style.css" rel="stylesheet" type="text/css" >
        <link href="../resources/css/style.css" rel="stylesheet" type="text/css" >
        <!--script-->
        <script src="https://cdn.muicss.com/mui-latest/js/mui.min.js"></script>
        <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script src="../resources/floating/mt.js"></script>
        <script src="../resources/static/script.js"></script>
    </head>

    <body>
        <div id="sidedrawer" class="mui--no-user-select">
            <div id="sidedrawer-brand" class="mui--appbar-line-height"><a href="../index">XXI museum</a></div>
            <div class="mui-divider"></div>
            <ul>
                <li>
                    <strong>ll XXI museum</strong>
                    <ul>
                        <li><a href="./storia">La storia</a></li>
                        <li><a href="./collezioni">Le collezioni</a></li>
                        <li><a href="./progetti">Progetti</a></li>
                        <li><a href="./mission">Mission</a></li>
                    </ul>
                </li>
                <li>
                    <strong>Visitare il museo</strong>
                    <ul>
                        <li><a href="./orari">Orari e biglietti</a></li>
                        <li><a href="./esposizioni">Mostre ed eventi</a></li>
                    </ul>
                </li>
                <li>
                    <a href="./acquista"><strong>Acquista biglietto</strong></a>
                </li>
                <li>
                    <a href="./contatti"><strong>Contatti</strong></a>
                </li>
            </ul>
        </div>
        <header id="header">
            <div class="mui-appbar mui--appbar-line-height darkcolor">
                <div class="mui-container-fluid">
                    <table width="100%">
                        <tr style="vertical-align:middle;">
                            <td class="mui--appbar-height">
                                <a class="sidedrawer-toggle mui--visible-xs-inline-block mui--visible-sm-inline-block js-show-sidedrawer">☰</a>
                                <a class="sidedrawer-toggle mui--hidden-xs mui--hidden-sm js-hide-sidedrawer">☰</a>
                                <!--<span class="mui--text-title mui--visible-xs-inline-block mui--visible-sm-inline-block">XXI museum</span>-->
                            </td>
                            <td class="mui--appbar-height" align="right">
                                <button class="mui-btn mui-btn--small mui-btn--flat"><a href="./sign">SIGN IN</a></button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </header>

        <div id="content-wrapper">
            <div class="mui--appbar-height"> 
            </div>
            <div class="mui-container-fluid">
                <br/><br/><br/><br/><br/><br/><br/><br/><br/>
                <div class="mui--text-subhead mui--text-center mui--align-middle"><span class="icon ion-sad-outline iconbig"></span><br/><br/>ERRORE DI AUTENTICAZIONE</div>

            </div>
        </div>
    </body>

</html>

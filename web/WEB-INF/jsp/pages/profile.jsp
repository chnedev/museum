<%-- 
    Document   : contatti
    Created on : 27-apr-2016, 1.01.07
    Author     : chnedev
--%>

<%@page import="java.util.Date"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (null == session.getAttribute("username")) {
%>
<c:redirect url="./sign"/>
<%
    }
%>
<!doctype html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="../resources/img/favicon.ico"/>
        <!--fonts-->
        <link href='https://fonts.googleapis.com/css?family=Lekton' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Rock+Salt' rel='stylesheet' type='text/css'>
        <!--icons-->
        <link href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
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
        <!-- -->
        <title>XXI Museum | Profilo</title>
    </head>

    <body>
        <div id="sidedrawer" class="mui--no-user-select"> 
            <div id="sidedrawer-brand" class="mui--appbar-line-height sidedrawer-brand--active">
                <a id="sidedrawer-brand__title" href="./">XXI museum</a>
                <div class="sidedrawer-brand__profile__gradient"></div>
                <div id="sidedrawer-brand__profile" class="mui-row">
                    <div class="mui-col-xs-4 mui-col-md-3">
                        <img class="sidedrawer-brand__profile__propic" src="https://d13yacurqjgara.cloudfront.net/users/3460/screenshots/1913240/avatar-creator-2.0-process.gif"/>
                    </div>
                    <div class="mui-col-xs-7 mui-col-xs-offset-1 mui-col-md-8">
                        <h5> <% out.print(session.getAttribute("nome").toString() + " " + session.getAttribute("cognome").toString()); %> </h5>
                        <p><% if (session.getAttribute("email") != null) {
                                out.print(session.getAttribute("email"));
                            } %></p>
                    </div>
                </div>
            </div>
            <div class="mui-divider"></div>
            <ul>
                <li><a href="./profile"><strong><i class="icon ion-person" aria-hidden="true"></i><span class="sidenav-icon-text">Profilo</span></strong></a></li>
                <li><a href="./my_tickets"><strong><i class="icon ion-pricetags" aria-hidden="true"></i><span class="sidenav-icon-text">I miei biglietti</span></strong></a></li>
                <li><a href="./editProfile"><strong><i class="icon ion-edit" aria-hidden="true"></i><span class="sidenav-icon-text">Personalizza profilo</span></strong></a></li>
                <li><strong class="sidenav-disabled"><span class="sidenav-icon-text">Biglietteria</span></strong></li>
                <li><a href="./biglietto_normale"><strong><i class="icon ion-pricetag" aria-hidden="true"></i><span class="sidenav-icon-text">Biglietto normale</span></strong></a></li>
                <li><a href="./eventi"><strong><i class="icon ion-android-calendar" aria-hidden="true"></i><span class="sidenav-icon-text">Esposizioni ed Eventi</span></strong></a></li>
                <li><strong class="sidenav-disabled"><span class="sidenav-icon-text">Il museo</span></strong></li>
                <li><a href="./storia"><strong><i class="icon ion-ios-pulse-strong" aria-hidden="true"></i><span class="sidenav-icon-text">La storia</span></strong></a></li>
                <li><a href="./orari"><strong><i class="icon ion-clock" aria-hidden="true"></i><span class="sidenav-icon-text">Orari e info</span></strong></a></li>
                <li><a href="./team"><strong><i class="fa fa-users" aria-hidden="true"></i><span class="sidenav-icon-text">Il team</span></strong></a></li>
                <li><a href="./contatti"><strong><i class="icon ion-android-chat" aria-hidden="true"></i><span class="sidenav-icon-text">Contatti</span></strong></a></li>
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
                                <%
                                    if (null == session.getAttribute("username")) {
                                %>
                                <button class="mui-btn mui-btn--primary" onclick="activateModal()">SIGN IN</button>
                                <%
                                } else {
                                %>                              
                                <button class="mui-btn mui-btn--primary"><a style="color: white;" href="./logout">LOG OUT</a></button>
                                <% } %>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </header>

        <div id="content-wrapper">
            <div class="mui--appbar-height"></div>

            <div class="padding-container">
                <div class="propic-wrapper">
                    <img class="propic" src="https://d13yacurqjgara.cloudfront.net/users/3460/screenshots/1987038/portrait_study_01.png"/>
                    <a href="./editProfile" class="mui-btn mui-btn--fab edit-profile-fab"><i class="icon ion-edit" aria-hidden="true"></i></a>
                </div>
                <div class="mui-panel profile-wrapper">
                    <h2>
                        <%
                            Object nometmp = session.getAttribute("nome");
                            String nome = (String) nometmp;
                            Object cognometmp = session.getAttribute("cognome");
                            String cognome = (String) cognometmp;
                            out.print(nome + " " + cognome);
                        %>
                    </h2>
                    <p>
                        <%
                            Object emailtmp = session.getAttribute("email");
                            String email = (String) emailtmp;
                            out.print(email);
                        %>
                    </p>
                    <p>
                        <%
                            Object datatmp = session.getAttribute("dataDiNascita");
                            Date data = (Date) datatmp;
                            out.print(data);
                        %>
                    </p>
                </div>
            </div>
            <div id="home">
                <a href="../index"><button class="mui-btn mui-btn--fab mui-btn--small mui-btn--danger"><i class="icon ion-ios-home iconlarger1"></i></button></a>
            </div>
        </div>

        <script>
            var modalEl = document.createElement('div');
            modalEl.style.width = '400px';
            modalEl.style.margin = '100px auto';
            modalEl.style.backgroundColor = '#fff';
            modalEl.className = 'mui-panel padding'

            var loginpanel = '<ul class="mui-tabs__bar mui-tabs__bar--justified"><li class="mui--is-active mui--text-center"><a data-mui-toggle="tab" data-mui-controls="pane-justified-1">Login</a></li><li class="mui--text-center"><a data-mui-toggle="tab" data-mui-controls="pane-justified-2">Registrati</a></li></ul><br/><div class="mui-tabs__pane mui--is-active" id="pane-justified-1"><form method="get" action="./login"><div class="mui-textfield" required><input type="text" name="username"required><label>Username</label></div><div class="mui-textfield" required><input type="password" name="password" required><label>Password</label></div><button type="submit" class="mui-btn mui-btn--raised">ENTRA</button></form></div><div class="mui-tabs__pane" id="pane-justified-2"><form><div class="mui-textfield" required><input type="text" name="username"><label>Username</label></div><div class="mui-textfield" required><input type="text" name="nome" required><label>Nome</label></div><div class="mui-textfield" required><input type="text" name="cognome" required><label>Cognome</label></div><div class="mui-textfield" required><input type="email" name="email" required><label>Email</label></div><div class="mui-textfield" required><input type="date" name="dataDiNascita" required><label>Data di nascita</label></div><div class="mui-textfield" required><input type="password" name="password" required><label>Password</label></div><div class="mui-textfield" required><input type="password" name="password2" required><label>Conferma la password</label></div><button type="submit" class="mui-btn mui-btn--raised">REGISTRATI</button></form></div>'
            modalEl.innerHTML = loginpanel;
            console.log(loginpanel);
            console.log(modalEl);
            function activateModal() {
                mui.overlay('on', modalEl);
            }
        </script>
    </body>
</html>


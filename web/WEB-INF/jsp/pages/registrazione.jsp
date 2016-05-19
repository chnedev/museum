<%-- 
    Document   : register
    Created on : 28-apr-2016, 10.26.38
    Author     : chnedev
--%>

<%@page import="CRUD.DAO"%>
<%@page import="PO.Utente"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
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
        <title>XXI Museum | Registrazione</title>
    </head>
    <body>
        <div id="sidedrawer" class="mui--no-user-select">
            <div id="sidedrawer-brand" class="mui--appbar-line-height">
                <a id="sidedrawer-brand__title" href="../index">XXI museum</a>
            </div>
            <div class="mui-divider"></div>
            <ul>
                <li><strong class="sidenav-disabled"><span class="sidenav-icon-text">Biglietteria</span></strong></li>
                <li><a href="./biglietto_normale"><strong><i class="icon ion-pricetag" aria-hidden="true"></i><span class="sidenav-icon-text">Biglietto normale</span></strong></a></li>
                <li><a href="./eventi"><strong><i class="icon ion-android-calendar" aria-hidden="true"></i><span class="sidenav-icon-text">Esposizioni ed Eventi</span></strong></a></li>
                <li><strong class="sidenav-disabled"><span class="sidenav-icon-text">Il museo</span></strong></li>
                <li><a href="./storia"><strong><i class="icon ion-ios-pulse-strong" aria-hidden="true"></i><span class="sidenav-icon-text">La storia</span></strong></a></li>
                <li><a href="./orari"><strong><i class="icon ion-clock" aria-hidden="true"></i><span class="sidenav-icon-text">Orari e info</span></strong></a></li>
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

                                <button class="mui-btn mui-btn--primary" onclick="activateModal()">SIGN IN</button>                         
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
                <c:if test="${tmp=='si'}">
                    <div class="mui--text-subhead mui--text-center mui--align-middle">
                        <span class="icon ion-happy-outline iconbig"></span><br/><br/>REGISTRAZIONE AVVENUTA CON SUCCESSO<br/><br/><button class="mui-btn mui-btn--raised" onclick="window.location='./sign'">FAI IL LOGIN</button>
                    </div>
                </c:if>
                <c:if test="${tmp=='no'}">
                    <div class="mui--text-subhead mui--text-center mui--align-middle">
                        <span class="icon ion-sad-outline iconbig"></span><br/><br/>ERRORE DI REGISTRAZIONE</div>
                </div>
            </c:if>
        </div>

    <script>
        var modalEl = document.createElement('div');
        modalEl.style.width = '400px';
        modalEl.style.margin = '100px auto';
        modalEl.style.backgroundColor = '#fff';
        modalEl.className = 'mui-panel padding';
        var loginpanel = '<ul class="mui-tabs__bar mui-tabs__bar--justified"><li class="mui--is-active mui--text-center"><a data-mui-toggle="tab" data-mui-controls="pane-justified-1">Login</a></li><li class="mui--text-center"><a data-mui-toggle="tab" data-mui-controls="pane-justified-2">Registrati</a></li></ul><br/><div class="mui-tabs__pane mui--is-active" id="pane-justified-1"><form method="get" action="./login"><div class="mui-textfield" required><input type="text" name="username" maxlength="5" required><label>Username</label></div><div class="mui-textfield" required><input type="password" name="password" required><label>Password</label></div><button type="submit" class="mui-btn mui-btn--raised">ENTRA</button></form></div><div class="mui-tabs__pane" id="pane-justified-2"><form><div class="mui-textfield" required><input type="text" name="username" maxlength="5"><label>Username</label></div><div class="mui-textfield" required><input type="text" name="nome" required><label>Nome</label></div><div class="mui-textfield" required><input type="text" name="cognome" required><label>Cognome</label></div><div class="mui-textfield" required><input type="email" name="email" required><label>Email</label></div><div class="mui-textfield" required><input type="date" name="dataDiNascita" required><label>Data di nascita</label></div><div class="mui-textfield" required><input type="password" name="password" required><label>Password</label></div><div class="mui-textfield" required><input type="password" name="password2" required><label>Conferma la password</label></div><button type="submit" class="mui-btn mui-btn--raised">REGISTRATI</button></form></div>';
        modalEl.innerHTML = loginpanel;
        console.log(loginpanel);
        console.log(modalEl);
        function activateModal() {
            mui.overlay('on', modalEl);
        }
    </script>
</body>
</html>

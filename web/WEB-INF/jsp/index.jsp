<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
        <!--css-->
        <link href="https://cdn.muicss.com/mui-latest/css/mui.min.css" rel="stylesheet" type="text/css" >
        <link href="resources/floating/style.css" rel="stylesheet" type="text/css">
        <link href="resources/floating/mfb.css" rel="stylesheet" type="text/css">
        <link href="resources/static/style.css" rel="stylesheet" type="text/css" >
        <link href="resources/css/style.css" rel="stylesheet" type="text/css" >
        <!--script-->
        <script src="https://cdn.muicss.com/mui-latest/js/mui.min.js"></script>
        <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script src="resources/floating/mt.js"></script>
        <script src="resources/static/script.js"></script>
    </head>

    <body>
        <div id="sidedrawer" class="mui--no-user-select">
            <%
                if (null == session.getAttribute("username")) {
            %>
            <div id="sidedrawer-brand" class="mui--appbar-line-height">
                <a id="sidedrawer-brand__title" href="./">XXI museum</a>
            </div>
            <%
                } else {
            %>   
            <div id="sidedrawer-brand" class="mui--appbar-line-height sidedrawer-brand--active">
                <a id="sidedrawer-brand__title" href="./">XXI museum</a>
                <div class="sidedrawer-brand__profile__gradient"></div>
                <div id="sidedrawer-brand__profile" class="mui-row">
                    <div class="mui-col-xs-4 mui-col-md-3">
                        <a href="profile"><img class="sidedrawer-brand__profile__propic" src="https://d13yacurqjgara.cloudfront.net/users/3460/screenshots/1913240/avatar-creator-2.0-process.gif"/></a>
                    </div>
                    <div class="mui-col-xs-7 mui-col-xs-offset-1 mui-col-md-8">
                        <h5> <% out.print(session.getAttribute("nome").toString() + " " + session.getAttribute("cognome").toString()); %> </h5>
                        <p><% if(session.getAttribute("email") != null) out.print(session.getAttribute("email")); %></p>
                    </div>
                </div>
            </div>
            <% } %>
            <div class="mui-divider"></div>
            <ul>
                <li><a href="./pages/profilo"><strong><i class="fa fa-user" aria-hidden="true"></i><span class="sidenav-icon-text">Profilo</span></strong></a></li>
                <li><a href="./pages/my_tickets"><strong><i class="fa fa-ticket" aria-hidden="true"></i><span class="sidenav-icon-text">I miei biglietti</span></strong></a></li>
                <li><a href="./pages/edit_profile"><strong><i class="fa fa-edit" aria-hidden="true"></i><span class="sidenav-icon-text">Personalizza profilo</span></strong></a></li>
                <li><strong class="sidenav-disabled"><span class="sidenav-icon-text">Biglietteria</span></strong></li>
                <li><a href="./pages/biglietto_normale"><strong><i class="fa fa-ticket" aria-hidden="true"></i><span class="sidenav-icon-text">Biglietto normale</span></strong></a></li>
                <li><a href="./pages/eventi"><strong><i class="fa fa-calendar-o" aria-hidden="true"></i><span class="sidenav-icon-text">Esposizioni ed Eventi</span></strong></a></li>
                <li><strong class="sidenav-disabled"><span class="sidenav-icon-text">Il museo</span></strong></li>
                <li><a href="./pages/storia"><strong><i class="fa fa-book" aria-hidden="true"></i><span class="sidenav-icon-text">La storia</span></strong></a></li>
                <li><a href="./pages/orari"><strong><i class="fa fa-clock-o" aria-hidden="true"></i><span class="sidenav-icon-text">Gli orari</span></strong></a></li>
                <li><a href="./pages/team"><strong><i class="fa fa-users" aria-hidden="true"></i><span class="sidenav-icon-text">Il team</span></strong></a></li>
                <li><a href="./pages/contatti"><strong><i class="fa fa-envelope" aria-hidden="true"></i><span class="sidenav-icon-text">Contatti</span></strong></a></li>
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
                                <button class="mui-btn mui-btn--primary"><a style="color: white;" href="./pages/logout">LOG OUT</a></button>
                                <% } %>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </header>

        <div id="content-wrapper">
            <div class="mui--appbar-height">
            </div>

            <div class="mui-container-fluid cover">
            </div>

            <div class="mui-conteiner-fluid margin">
                <br/><br/>
                <div class="mui-row">
                    <div class="mui-col-md-4 mui--text-center">
                        <i class="icon ion-load-c iconlarger"></i>
                        <br/><br/>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                    </div>
                    <div class="mui-col-md-4 mui--text-center">
                        <i class="icon ion-easel iconlarger"></i>
                        <br/><br/>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                    </div>
                    <div class="mui-col-md-4 mui--text-center">
                        <i class="icon ion-gear-a iconlarger"></i>
                        <br/><br/>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                    </div>
                </div>
                <br/><br/>
            </div>
            <div class="mui-container-fluid black ">
                <br/><br/>
                <div class="mui--text-headline mui--text-center ">ESPOSIZIONI IN CORSO O FUTURE</div>
                <br/>
                <br/>
                <div class="mui-containet-fluid margin">
                    <div class="mui-row">
                        <c:forEach items="${esposizioni}" var="esposizione">
                            <c:if test="${col == 3}">
                                <div class="mui-col-md-4">
                                </c:if>
                                <c:if test="${col == 2}">
                                    <div class="mui-col-md-6">
                                    </c:if>
                                    <div class="cover-card mui--z1"></div> <br/>
                                    <div class="mui-panel white mui--z2">
                                        <div class="mui-container-fluid">
                                            <div class="mui--text-title mui--text-center uppercase">${esposizione.titolo}</div><br/>
                                            <div class="mui-divider"></div><br/>
                                            <div class="card-date mui--text-center">dal ${esposizione.dataDiInizio} al ${esposizione.dataDiFine}</div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <br/><br/>
                    </div>
                </div>
                <div class="mui-container-fluid">
                    <br/><br/>
                </div>
            </div>
            <%
                if (null != session.getAttribute("username")) {
            %>
            <ul id="menu" class="mfb-component--br mfb-zoomin" data-mfb-toggle="hover">
                <li class="mfb-component__wrap">
                    <a href="#" class="mfb-component__button--main">
                        <i class="mfb-component__main-icon--resting ion-ios-pricetags"></i>
                        <i class="mfb-component__main-icon--active ion-close-round"></i>
                    </a>
                    <ul class="mfb-component__list">
                        <li>
                            <a href="#" data-mfb-label="Biglietteria" class="mfb-component__button--child">
                                <i class="mfb-component__child-icon ion-ios-pricetag"></i>
                            </a>
                        </li>
                        <li>
                            <a href="#" data-mfb-label="Carello" class="mfb-component__button--child">
                                <i class="mfb-component__child-icon ion-ios-cart"></i>
                            </a>
                        </li>

                        <li>
                            <a href="#" data-mfb-label="Profilo" class="mfb-component__button--child">
                                <i class="mfb-component__child-icon ion-android-person"></i>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
            <% }%>
        </div>
    </body>
    
    <script>
        var modalEl = document.createElement('div');
    modalEl.style.width = '400px';
    modalEl.style.margin = '100px auto';
    modalEl.style.backgroundColor = '#fff';
    modalEl.className = 'mui-panel padding'
        
        var loginpanel='<ul class="mui-tabs__bar mui-tabs__bar--justified"><li class="mui--is-active mui--text-center"><a data-mui-toggle="tab" data-mui-controls="pane-justified-1">Login</a></li><li class="mui--text-center"><a data-mui-toggle="tab" data-mui-controls="pane-justified-2">Registrati</a></li></ul><br/><div class="mui-tabs__pane mui--is-active" id="pane-justified-1"><form method="get" action="./pages/login"><div class="mui-textfield" required><input type="text" name="username"required><label>Username</label></div><div class="mui-textfield" required><input type="password" name="password" required><label>Password</label></div><button type="submit" class="mui-btn mui-btn--raised">ENTRA</button></form></div><div class="mui-tabs__pane" id="pane-justified-2"><form><div class="mui-textfield" required><input type="text" name="username"><label>Username</label></div><div class="mui-textfield" required><input type="text" name="nome" required><label>Nome</label></div><div class="mui-textfield" required><input type="text" name="cognome" required><label>Cognome</label></div><div class="mui-textfield" required><input type="email" name="email" required><label>Email</label></div><div class="mui-textfield" required><input type="date" name="dataDiNascita" required><label>Data di nascita</label></div><div class="mui-textfield" required><input type="password" name="password" required><label>Password</label></div><div class="mui-textfield" required><input type="password" name="password2" required><label>Conferma la password</label></div><button type="submit" class="mui-btn mui-btn--raised">REGISTRATI</button></form></div>'
    modalEl.innerHTML = loginpanel;    
    console.log(loginpanel);
        console.log(modalEl);
        function activateModal() {
            mui.overlay('on', modalEl);
        }
    </script>
</html>


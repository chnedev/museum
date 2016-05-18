<%-- 
    Document   : acquista
    Created on : 27-apr-2016, 14.35.54
    Author     : chnedev
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (null == session.getAttribute("username")) {
%>
<c:redirect url="./sign"/>
<%
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title></title>
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
        <script type="text/javascript">
            $(document).ready(function () {
                var counter = 0;
                
                $('#empty-card').click(function(){
                    var card = '<div id="ticket-"' + counter + ' class="mui-col-xs-12 mui-col-md-6 card-container"><div id="index" class="mui-col-xs-10 mui-col-xs-offset-1 mui-panel ticket"><h3>Biglietto</h3><div class="mui-select"><select name="categoria"><c:forEach items="${categorie}" var="categoria"><option>${categoria.descrizione}</option></c:forEach></select></div><c:forEach items="${servizi}" var="servizio"><c:if test = "${servizio.descrizione != 'Guida specializzata'}"><div name="${servizio.descrizione}" class="mui-checkbox"><label><input type="checkbox" value="">${servizio.descrizione}</label></div></c:if></c:forEach></div></div>'
                    counter++;
                    $(card).insertBefore( "#ticket-target" );
                });
            });
        </script>
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
                        <p><% if (session.getAttribute("email") != null) {
                                out.print(session.getAttribute("email"));
                            } %></p>
                    </div>
                </div>
            </div>
            <% }%>
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
                                <button class="mui-btn mui-btn--primary"><a style="color: white;" href="./logout">LOG OUT</a></button>
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
                <div id="tickets" class="mui-row"> 
                    <div id="ticket-target" class="mui-col-xs-12 mui-col-md-6 card-container">
                        <div id="empty-card" class="mui-col-xs-10 mui-col-xs-offset-1 empty-ticket">
                            <h1><i class="icon ion-plus-round"></i></h1>
                            <h3>Aggiungi Biglietto</h3>
                        </div>
                    </div>
                </div>
            </div>
            
            
            
            <div class="mui-container-fluid">
                <div class="mui-panel">
                    <div class="mui-container-fluid margin">
                        <table class="mui-table mui-table--bordered">
                            <thead>
                                <tr>
                                    <th width="30%">Biglietto<button type="button" class="mui-btn mui-btn--flat info"><i class="icon ion-help-circled"></i></button></th>
                                    <th>Quantit&agrave;</th>
                                    <th class="mui--text-right">Rimuovi</th>
                                    <th class="mui--text-right">Aggiungi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${categorie}" var="categoria">
                                    <tr>
                                        <td>Biglietto ${categoria.descrizione}</td>
                                        <td><span id="qnt_${categoria.descrizione}"></span></td>
                                        <td class="mui--text-right"><button class="mui-btn mui-btn--small mui-btn--primary rimuovi_${categoria.descrizione}" data-titolo="Normale" ><i class="icon ion-minus-round"></i></button></td>
                                        <td class="mui--text-right"><button class="mui-btn mui-btn--small mui-btn--primary aggiungi_${categoria.descrizione}" data-titolo="Normale" ><i class="icon ion-plus-round"></i></button></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <div class="mui-container-fluid">
                    <br/><br/>
                    <div class="mui--text-headline ">SERVIZI AGGIUNTIVI</div>
                    <br/>
                    <br/>
                </div>
                
                <div class="mui-panel">
                    <div class="mui-container-fluid margin">    
                        <table class="mui-table mui-table--bordered">
                            <thead>
                                <tr>
                                    <th width="30%">Servizio aggiuntivo</th>
                                    <th>Quantit&agrave;</th>
                                    <th class="mui--text-right">Rimuovi</th>
                                    <th class="mui--text-right">Aggiungi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${servizi}" var="servizio">
                                    <tr>
                                        <td>${servizio.descrizione}</td>
                                        <td><span id="qnt_servizio_${servizio.codice}"></span></td>
                                        <td class="mui--text-right"><button class="mui-btn mui-btn--small mui-btn--primary rimuovi_servizio_${servizio.codice}" data-titolo="Normale" ><i class="icon ion-minus-round"></i></button></td>
                                        <td class="mui--text-right"><button class="mui-btn mui-btn--small mui-btn--primary aggiungi_servizio_${servizio.codice}" data-titolo="Normale" ><i class="icon ion-plus-round"></i></button></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <div class="mui-container-fluid margin">    
                    <h3 class="mui--text-right"><span>Totale: </span><span id="totale"></span><span> €    </span><button class="mui-btn mui-btn--small mui-btn--primary" data-titolo="Normale" >PAGA ORA</button></h3>
                </div>
            </div>
        </div>
    </body>
</html>

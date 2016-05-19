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
        <link rel="icon" href="../resources/img/favicon.ico"/>
        <!-- -->
        <title>XXI Museum | Biglietteria</title>
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

            var counter = 0;
            var eventi = [];
            var eventoTemp;
            var categoriaTemp;
            var serviziTemp = [];
            function aggiungiTotale(s) {
                var tot = $("#totale").html();
                var totale = parseFloat(tot);
                $("#totale").html(totale + s);

            }

            function sottraiTotale(s) {
                var tot = $("#totale").html();
                var totale = parseFloat(tot);
                $("#totale").html(totale - s);
            }
            $(document).ready(function () {

                $(".acquista").click(function () {
                    $.post("./compra", {"biglietti": JSON.stringify(eventi)}, function (data) {
                        alert(data);
                    });
                });

                $('#empty-card').click(function () {

                    eventoTemp = "";
                    categoriaTemp = "";
                    serviziTemp = [];
                    var card = '<div id="ticket-"' + counter + ' class="mui-col-xs-12 mui-col-md-6 card-container"><div id="index" class="mui-col-xs-10 mui-col-xs-offset-1 mui-panel ticket"><h3>Biglietto</h3>\n\
            <div class="mui-select"><select name="evento"><option data-codice="0">Visita normale</option><c:forEach items="${eventi}" var="evento"><option data-codice="${evento.titolo}">${evento.titolo}</option></c:forEach></select></div>\n\
            <div class="mui-select"><select name="categoria"><c:forEach items="${categorie}" var="categoria"><option data-codice="${categoria.codice}" data-sconto="${categoria.sconto}">${categoria.descrizione}</option></c:forEach></select></div>\n\
            <c:forEach items="${servizi}" var="servizio"><c:if test = "${servizio.descrizione != 'Guida specializzata'}"><div  class="mui-checkbox"><label><input data-codice="${servizio.codice}"  data-prezzo="${servizio.prezzo}" data-name="${servizio.descrizione}" type="checkbox" value="">${servizio.descrizione}</label></div></c:if></c:forEach><button class="salva mui-btn mui-btn--primary">Salva</button></div></div>';
                    counter++;

                    $(card).insertBefore("#ticket-target");
                    $("select[name='evento']").change(function () {
                        eventoTemp = $(this).find(":selected").data("codice");

                    });
                    $("select[name='categoria']").change(function () {
                        categoriaTemp = $(this).find(":selected").data("codice");
                        aggiungiTotale

                    });

                    $("input[type='checkbox']").change(function () {
                        serviziTemp.push($(this).data("codice"));

                    });



                    $(".salva").click(function () {

                        var evento = new Object;
                        evento.codice = eventoTemp;
                        evento.categoria = categoriaTemp;
                        evento.servizi = serviziTemp;
                        eventi.push(evento);
                        //alert(JSON.stringify(eventi));
                        alert("Biglietto aggiunto.");
                    });

                });

                $("#acquista").click(function(){
                    alert("Acquisto effettuato. "+JSON.stringify(eventi));
                    window.setTimeout(window.location.href = "./my_tickets",5000);
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
                <br/><br/>
                <div class="mui--text-headline mui--text-center ">BIGLIETTERIA</div>
                <br/>
                <br/>
                <div id="tickets" class="mui-row"> 
                    <div id="ticket-target" class="mui-col-xs-12 mui-col-md-6 card-container">
                        <div id="empty-card" class="mui-col-xs-10 mui-col-xs-offset-1 empty-ticket">
                            <h1><i class="icon ion-plus-round"></i></h1>
                            <h3>Aggiungi biglietto</h3>
                        </div>
                    </div>
                </div>
            </div>



            <div class="mui-container-fluid">
                <div class="mui-container-fluid margin">    
                    <h3 class="mui--text-right"><!--<span>Totale: </span><span id="totale">0.00</span><span> €</span><br/>--><br/>
                        <button class="acquista mui-btn mui-btn--small mui-btn--raised" data-titolo="Normale" id="acquista" >ACQUISTA</button></h3>
                </div>
            </div>
        </div>
    </body>
</html>

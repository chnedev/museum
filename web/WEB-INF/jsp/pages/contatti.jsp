<%-- 
    Document   : contatti
    Created on : 27-apr-2016, 1.01.07
    Author     : chnedev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                <%
                                    if (!session.isNew()) {
                                %>
                                <button class="mui-btn mui-btn--small mui-btn--flat"><a href="./sign">SIGN IN</a></button>
                                <%
                                } else {
                                %>                              
                                <button class="mui-btn mui-btn--small mui-btn--flat"><a href="./logout">LOG OUT</a></button>
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

            <div class="mui-container-fluid">
                <br/><br/>
                <div class="mui--text-headline mui--text-center ">CONTATTI</div>
                <br/>
                <br/>
            </div>
            <div class="cover-map"></div>
            <div class="mui-container-fluid black">
                <br/><br/>
                <div class="mui-row">
                    <div class="mui-col-md-4 mui--text-center">
                        <i class="icon ion-android-call iconlarger"></i><br/><br/>
                        <p>+39 000 000 0000</p>
                        <br/><br/>

                    </div>
                    <div class="mui-col-md-4 mui--text-center">
                        <i class="icon ion-map iconlarger"></i><br/><br/>
                        <p>Via Milano 67<br/>Milano</p>
                        <br/><br/>

                    </div>
                    <div class="mui-col-md-4 mui--text-center">
                        <i class="icon ion-email iconlarger"></i><br/><br/>
                        <p>info@xxvimuseum.com</p>
                        <br/><br/>

                    </div>
                </div>
            </div>
            <div class="mui-container-fluid white">
                <br/><br/>
                <div class="mui-row">
                    <div class="mui-col-md-6 mui-col-md-offset-3">
                        <form>
                            <legend><i class="icon ion-ios-information-outline iconlarger mui--align-middle"></i>&emsp;RICHIEDI INFORMAZIONI</legend>
                            <div class="mui-textfield mui-textfield--float-label" required>
                                <input type="text">
                                <label>Nome e cognome</label>
                            </div>
                            <div class="mui-textfield mui-textfield--float-label" required>
                                <input type="email">
                                <label>Email</label>
                            </div>
                            <div class="mui-textfield mui-textfield--float-label" required>
                                <textarea></textarea>
                                <label>Testo</label>
                            </div>
                            <button type="submit" class="mui-btn mui-btn--raised ">INVIA</button>
                        </form>
                    </div>
                </div>
                <br/><br/><br/>
            </div>
            <%
                if (!session.isNew()) {
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
</html>


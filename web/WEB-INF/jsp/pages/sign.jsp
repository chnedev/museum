<%-- 
    Document   : sign
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
                                    if (null == session.getAttribute("username")) {
                                %>
                                <button class="mui-btn mui-btn--small mui-btn--flat"><a href="./pages/sign">SIGN IN</a></button>
                                <%
                                } else {
                                %>                              
                                <button class="mui-btn mui-btn--small mui-btn--flat"><a href="./pages/logout">LOG OUT</a></button>
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

            <br/><br/>

            <div class="mui-container-fluid">
                <div class="mui-row">
                    <div class="mui-col-md-8 mui-col-md-offset-2">
                        <div class="mui-panel padding">
                            <ul class="mui-tabs__bar mui-tabs__bar--justified">
                                <li class="mui--is-active mui--text-center"><a data-mui-toggle="tab" data-mui-controls="pane-justified-1">Login</a></li>
                                <li class="mui--text-center"><a data-mui-toggle="tab" data-mui-controls="pane-justified-2">Registrati</a></li>
                            </ul>
                            <br/>
                            <div class="mui-tabs__pane mui--is-active" id="pane-justified-1">
                                <form method="get" action="./login">
                                    <div class="mui-textfield" required>
                                        <input type="text" name="username"required>
                                        <label>Username</label>
                                    </div>
                                    <div class="mui-textfield" required>
                                        <input type="password" name="password" required>
                                        <label>Password</label>
                                    </div>
                                    <button type="submit" class="mui-btn mui-btn--raised">ENTRA</button>
                                </form>
                            </div>

                            <div class="mui-tabs__pane" id="pane-justified-2">
                                <form>
                                    <div class="mui-textfield" required>
                                        <input type="text" name="username">
                                        <label>Username</label>
                                    </div>
                                    <div class="mui-textfield" required>
                                        <input type="text" name="nome" required>
                                        <label>Nome</label>
                                    </div>
                                    <div class="mui-textfield" required>
                                        <input type="text" name="cognome" required>
                                        <label>Cognome</label>
                                    </div>
                                    <div class="mui-textfield" required>
                                        <input type="email" name="email" required>
                                        <label>Email</label>
                                    </div>
                                    <div class="mui-textfield" required>
                                        <input type="date" name="dataDiNascita" required>
                                        <label>Data di nascita</label>
                                    </div>
                                    <div class="mui-textfield" required>
                                        <input type="password" name="password" required>
                                        <label>Password</label>
                                    </div>
                                    <div class="mui-textfield" required>
                                        <input type="password" name="password2" required>
                                        <label>Conferma la password</label>
                                    </div>
                                    <button type="submit" class="mui-btn mui-btn--raised">REGISTRATI</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <br/><br/><br/>
            </div>
            <br/><br/>
        </div>
    </body>
</html>


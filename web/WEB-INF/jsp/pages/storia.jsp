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
        <link rel="icon" href="../resources/img/favicon.ico"/>
        <!--fonts-->
        <link href='https://fonts.googleapis.com/css?family=Lekton' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Rock+Salt' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Chewy' rel='stylesheet' type='text/css'>
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
        <title>XXI Museum | Storia</title>
    </head>

    <body>
        <div id="sidedrawer" class="mui--no-user-select">
            <%
                if (null == session.getAttribute("username")) {
            %>
            <div id="sidedrawer-brand" class="mui--appbar-line-height">
                <a id="sidedrawer-brand__title" href="../index">XXI museum</a>
            </div>
            <%
            } else {
            %>   
            <div id="sidedrawer-brand" class="mui--appbar-line-height sidedrawer-brand--active">
                <a id="sidedrawer-brand__title" href="../index">XXI museum</a>
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
            <% } %>
            <div class="mui-divider"></div>
            <ul>
                <%
                    if (null != session.getAttribute("username")) {
                %>
                <li><a href="./profile"><strong><i class="icon ion-person" aria-hidden="true"></i><span class="sidenav-icon-text">Profilo</span></strong></a></li>
                <li><a href="./my_tickets"><strong><i class="icon ion-pricetags" aria-hidden="true"></i><span class="sidenav-icon-text">I miei biglietti</span></strong></a></li>
                <li><a href="./editProfile"><strong><i class="icon ion-edit" aria-hidden="true"></i><span class="sidenav-icon-text">Personalizza profilo</span></strong></a></li>
                                <% } %>
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
                                <%
                                    if (null == session.getAttribute("username")) {
                                %>
                                <button class="mui-btn mui-btn--primary" onclick="activateModal()">SIGN IN</button>
                                <%
                                } else {
                                %>                              
                                <button class="mui-btn mui-btn--primary"><a style="color: white;" href="./logout">LOG OUT</a></button>
                                <% }%>
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
                <div class="mui--text-headline mui--text-center ">STORIA</div>
                <br/>
                <br/>
            </div>
            <div class="cover-history"></div>
            <div class="mui-container-fluid darker">
                <br/><br/>
                <div class="padding">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce lacus libero, condimentum a efficitur vitae, finibus a quam. Mauris quis dolor nibh. Morbi ultrices tincidunt tellus, convallis tristique velit porttitor eu. Vivamus euismod venenatis velit ac laoreet. Sed rutrum luctus sem id ultrices. Sed volutpat interdum ipsum, vitae congue tellus tristique id. Nulla in risus vel lacus rutrum blandit. Mauris turpis mauris, hendrerit sed dignissim at, ultricies at nunc. Donec nec accumsan nisl. Aenean a ante ullamcorper, finibus leo vitae, molestie risus.
                        <br/>Praesent id facilisis ligula, sed pulvinar justo. In rhoncus, dolor non tempor fringilla, felis velit fermentum est, nec luctus nisl lorem quis ligula. Proin at nulla lacinia, porttitor nibh vitae, dapibus ipsum. Suspendisse bibendum felis a leo mattis rutrum. Ut vitae tempor quam. Cras quis pulvinar est. Pellentesque sem lorem, porta vulputate sollicitudin id, dictum elementum quam. Proin nisl diam, rhoncus at tincidunt sed, porta id nunc. Fusce at ipsum id metus commodo venenatis sed et velit. Mauris ut nisl nisi. Nunc dolor lacus, sollicitudin sed pellentesque ut, elementum ac nisi. Donec dictum eu diam in molestie. Praesent ut leo et est gravida rhoncus.
                        Nullam nec laoreet nibh, id lobortis sem. Mauris sit amet suscipit nibh. Cras luctus tempus mi, sit amet interdum mi hendrerit in. In in enim aliquet, pellentesque orci sit amet, molestie nibh. Etiam consectetur et justo ut scelerisque. Maecenas porttitor aliquet sapien dictum ultricies. Vestibulum nunc lectus, cursus nec posuere mattis, tincidunt a mauris. Sed tincidunt blandit turpis, sed egestas dui dictum fermentum.
                        <br/>Maecenas malesuada lobortis magna, vel lobortis arcu rutrum id. Nullam auctor gravida justo sit amet sagittis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam non ex tortor. Sed ultrices purus id congue ornare. Fusce quis commodo orci. Vivamus quis luctus sapien. Curabitur convallis aliquet sapien, et posuere sem hendrerit vitae. Cras pretium orci vel sem sagittis finibus. Sed faucibus, nulla id scelerisque efficitur, mauris lectus fermentum risus, cursus rutrum magna lacus in ligula. Ut non mattis turpis. Praesent ut urna ac nisi condimentum imperdiet.</p>
                    <br/>
                    <div class="mui--text-center">
                        <button class="mui-btn"><a href="./orari"><i class="icon ion-ios-arrow-forward" aria-hidden="true"></i>&emsp;ORARI DEL MUSEO</a></button>
                    </div>
                </div>
                <br/><br/>
                <div class="mui-divider"></div>
                <br/><br/>
                <div class="padding">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce lacus libero, condimentum a efficitur vitae, finibus a quam. Mauris quis dolor nibh. Morbi ultrices tincidunt tellus, convallis tristique velit porttitor eu. Vivamus euismod venenatis velit ac laoreet. Sed rutrum luctus sem id ultrices. Sed volutpat interdum ipsum, vitae congue tellus tristique id. Nulla in risus vel lacus rutrum blandit. Mauris turpis mauris, hendrerit sed dignissim at, ultricies at nunc. Donec nec accumsan nisl. Aenean a ante ullamcorper, finibus leo vitae, molestie risus.</p>
                    <br/>
                    <div class="mui--text-center">
                        <button class="mui-btn"><a href="./contatti"><i class="icon ion-ios-arrow-forward" aria-hidden="true"></i>&emsp;CONTATTA IL MUSEO</a></button>
                    </div>
                </div>
                <br/><br/>
            </div>
            <div class="padding" id="footer">
                <div class="mui-container-fluid mui--text-center">
                    <br/>
                    <span class="social-icons">#XXIMuseumSocial</span>
                    <br/><br/>
                    <a href="#"><i class="icon ion-social-twitter iconlarger whitefont twitter"></i></a>
                    &emsp;&emsp;&emsp;
                    <a href="#"><i class="icon ion-social-facebook iconlarger whitefont facebook"></i></a>
                    &emsp;&emsp;&emsp;
                    <a href="#"><i class="icon ion-social-googleplus iconlarger whitefont googleplus"></i></a>
                    <br/><hr/>
                    XXI Museum &emsp; | &emsp; Copyright &copy;
                    <br/><br/>
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
            modalEl.className = 'mui-panel padding';
            var loginpanel = '<ul class="mui-tabs__bar mui-tabs__bar--justified"><li class="mui--is-active mui--text-center"><a data-mui-toggle="tab" data-mui-controls="pane-justified-1">Login</a></li><li class="mui--text-center"><a data-mui-toggle="tab" data-mui-controls="pane-justified-2">Registrati</a></li></ul><br/><div class="mui-tabs__pane mui--is-active" id="pane-justified-1"><form method="get" action="./login"><div class="mui-textfield" required><input type="text" name="username" maxlength="5"required><label>Username</label></div><div class="mui-textfield" required><input type="password" name="password" required><label>Password</label></div><button type="submit" class="mui-btn mui-btn--raised">ENTRA</button></form></div><div class="mui-tabs__pane" id="pane-justified-2"><form><div class="mui-textfield" required><input type="text" name="username" maxlength="5"><label>Username</label></div><div class="mui-textfield" required><input type="text" name="nome" required><label>Nome</label></div><div class="mui-textfield" required><input type="text" name="cognome" required><label>Cognome</label></div><div class="mui-textfield" required><input type="email" name="email" required><label>Email</label></div><div class="mui-textfield" required><input type="date" name="dataDiNascita" required><label>Data di nascita</label></div><div class="mui-textfield" required><input type="password" name="password" required><label>Password</label></div><div class="mui-textfield" required><input type="password" name="password2" required><label>Conferma la password</label></div><button type="submit" class="mui-btn mui-btn--raised">REGISTRATI</button></form></div>';
            modalEl.innerHTML = loginpanel;
            console.log(loginpanel);
            console.log(modalEl);
            function activateModal() {
                mui.overlay('on', modalEl);
            }
        </script>
    </body>
</html>


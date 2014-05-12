<!-- #include file="includes/cashierpagesetup.asp" -->
<!-- #include file="handlers/handlecashierlogin.asp" -->
<%

	'##################################################
	'##### if there is already a user session then redirect to the account page #####
	'##################################################
	if GetSessionKey()<>"" then

		response.redirect "/cashier?session=" & request.querystring("session")

	end if

%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Home Page - My ASP.NET MVC Application</title>
        <link href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />
        <meta name="viewport" content="width=device-width" />
        <link href="/Content/site.css" rel="stylesheet"/>

        <script src="/Scripts/modernizr-2.6.2.js"></script>

    </head>
    <body>
        <header>
            <div class="content-wrapper">
                <div class="float-left">
                    <p class="site-title"><a href="/"><img src="/images/logo.png" /></a></p>
                </div>
                <div class="float-right">
                    <section id="login">
                    	<ul>
                    		<li><% displaysecurelink() %></li>
                    	</ul>
                    </section>
                    <nav>
                        <ul id="menu">
                            <li><a href="/">Home</a></li>
                            <li><a href="/About">About</a></li>
                            <li><a href="/Contact">Contact</a></li>
                            <li><% displayaccountlink() %></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </header>
        <div id="body">

    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Faux Bank Administraion/Cashier Login.</h1><br />
                <h2>Log into your account below.</h2>
                <h3>Warning: You have accessed a computer managed by Faux Bank Plc. Unauthorised access or use of this site (and any connected systems data) is prohibited and constitutes an offence under the Computer Misuse Act 1990. By accessing this site, you signify your acceptance of the terms and conditiions set out in Faux Bank Acceptable Use Policy.</h3>
            </hgroup><br />
			<form action="/cashierlogin" method="post" id="loginform">
			<input type="hidden" name="submitted" value="1" />
			<table>
			<tr>
			<td>Username:</td><td><input type="text" name="username" value="" /></td>
			</tr>
			<tr>
			<td>Password:</td><td><input type="password" name="password" value="" />
			</tr>
			<tr>
			<td></td><td><input style="float: right;" type="submit" name="submit" value="Login" /></td>
			</tr>
			</table>
			</form>

			<% if GetMode()="secure" then

				'##################################################
				'##### if we're in secure mode, then use the sub - otherwise, just display the message in the query string #####
				'##################################################
				DisplayCashierLoginError()

			   else %>

			<p><strong><%= request.querystring("error") %></strong></p>

			<% end if %>

        </div>
    </section>

            <section class="content-wrapper main-content clear-fix">

<h3>We suggest the following:</h3>
<ol class="round">
    <li class="one">
        <h5>We just keep getting better!</h5>
        Faux Bank has just been voted the world's most insecure online bank. Seriously, if you put money in your account,
        dont count on it being there in the morning! You could store your money in a plastic bag, and put it in the middle of Somalia, and it would be more safe than with us!
        <a href="/about">Learn more..</a>
    </li>

    <li class="two">
        <h5>Open source banking software</h5>
        The source to this project has been published on GitHub, why not contribute, and port this project to other languages.
        <a href="http://www.github.com/thatcoderguy/faux-bank">Learn more...</a>
    </li>

</ol>

            </section>
        </div>
        <footer>
            <div class="content-wrapper">
                <div class="float-left">
                    <p>&copy; 2014 - That Coder Guy <a href="http://www.thatcoderguy.co.uk">www.thatcoderguy.co.uk</a></p>
                </div>
            </div>
        </footer>

        <script src="/Scripts/jquery-1.8.2.js"></script>

</body>
</html>
<!-- #include file="includes/pageend.asp" -->

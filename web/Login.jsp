<%-- 
    Document   : Login
    Created on : Oct 20, 2021, 3:43:27 PM
    Author     : KawaiiScorpy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="css/login.css" />
    </head>
    <body>
        <form action="MainController" method="POST">
            <div class="container">

<div class="row" style="margin-top:20px">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form role="form">
			<fieldset>
				<h2>Sign In</h2>
				<hr class="colorgraph">
				<div class="form-group">
                    <input type="text" name="userID" class="form-control input-lg" placeholder="Username">
				</div>
				<div class="form-group">
                    <input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password">
				</div>
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6">
                        <input type="submit" class="btn btn-lg btn-success btn-block" name="action" value="Login">
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6">
						<a href="createUser2.jsp" class="btn btn-lg btn-primary btn-block">Register</a>
					</div>
				</div>
			</fieldset>
		</form>
	</div>
</div>
</div>
        </form>
        <h1 style="color:#ed143d;text-align:center;font-size: 20px;">${requestScope.ERROR_MESSAGE}</h1>
    </body>
</html>

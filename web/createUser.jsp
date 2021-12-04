<%-- 
    Document   : createUser
    Created on : Oct 21, 2021, 12:46:04 PM
    Author     : KawaiiScorpy
--%>
<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Page</title>
    </head>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="css/createUser.css" />
    <body>
        <c:if test="${sessionScope.LOGIN_USER eq null || sessionScope.LOGIN_USER.roleID ne 'AD'}"> 
            <c:redirect url="Login.jsp"></c:redirect>
        </c:if>
<form action="MainController" method="POST">
            <div class="row">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
    	<form role="form">
			<h2>Please Sign Up</h2>
			<hr class="colorgraph">
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
                        		<input type="text" name="userID" class="form-control input-lg" placeholder="UserID" tabindex="1">
					${requestScope.USER_ERROR.userID}		
				</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						Select Role <select name="roleID" readonly="">
                					<option value="US">US</option>
                					<option value="AD">AD</option>
           					 </select>
					</div>
				</div>
			</div>
			<div class="form-group">
				<input type="text" name="fullName" id="display_name" class="form-control input-lg" placeholder="Fullname" tabindex="3">
				${requestScope.USER_ERROR.fullName}
			</div>
			<div class="form-group">
				<input type="text" name="address" id="address" class="form-control input-lg" placeholder="Address" tabindex="4">
				${requestScope.USER_ERROR.address}
			</div>
			<div class="form-group">
				<input type="text" name="phone" id="phone" class="form-control input-lg" placeholder="Your Phone" tabindex="3">
				${requestScope.USER_ERROR.phone}
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password" tabindex="5">
						${requestScope.USER_ERROR.password}
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="password" name="confirm" id="password_confirmation" class="form-control input-lg" placeholder="Confirm Password" tabindex="6">
						${requestScope.USER_ERROR.confirm}
					</div>
				</div>
			</div>
			<hr class="colorgraph">
			<div class="row">
				<div class="col-xs-12 col-md-6"><input type="submit" name="action" value="Create" class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
				<div class="col-xs-12 col-md-6"><a href="admin.jsp" class="btn btn-success btn-block btn-lg">Cancel</a></div>
			</div>
		</form>
	</div>
</div>

        </form>
    </body>
</html>

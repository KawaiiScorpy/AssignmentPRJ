<%-- 
    Document   : admin
    Created on : Oct 20, 2021, 4:09:38 PM
    Author     : KawaiiScorpy
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
    </head>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="css/admin.css" />
    <body>
<div class="container">
    <div class="row">
    <table class="table table-striped custab">
    <thead>
	<c:if test="${sessionScope.LOGIN_USER eq null || sessionScope.LOGIN_USER.roleID ne 'AD'}"> 
            <c:redirect url="Login.jsp"></c:redirect>
        </c:if>
        <h1> Hello Admin : ${sessionScope.LOGIN_USER.fullName} </h1>
        <c:url var ="logoutLink" value="MainController">
            <c:param name="action" value="Logout"></c:param>
        </c:url>
        <a href="${logoutLink}">Logout</a> </br>
        <form action="MainController" method="POST">
            <input type="text" name="search" value="${param.search}"/> 
            <input type="submit" name="action" value="Search"/>
        </form>
    <a href="createUser.jsp" class="btn btn-primary btn-xs pull-right"><b>+</b>Add new member</a>
	<c:if test="${requestScope.LIST_USER!= null}"> 
        <c:if test="${not empty requestScope.LIST_USER}">
        <tr>
            <th>No</th>
            <th>User ID</th>
            <th>Name</th>
            <th>Password</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Role ID</th>
        </tr>
    	</thead>
	<tbody>
                <c:forEach var="user" varStatus="counter" items="${requestScope.LIST_USER}"> 
                    <form action="MainController" method="POST">
            <tr>
                <td>${counter.count}</td>
                <td>
			<input name="userID" value="${user.userID}" readonly=""/>
		</td>
                <td>
			<input type="text" name="fullName" value="${user.fullName}"/>
		</td>
		<td>${user.password}</td>
		<td>
                	<input type="text" name="address" value="${user.address}"/>
                </td>
		<td>
                	<input type="text" name="phone" value="${user.phone}"/>
                </td>
		<td>
                        <input type="text" name="roleID" value="${user.roleID}" required=""/>
                </td>
                <td class="text-center">
                                    <input type="submit" name="action" value="Update" class="btn btn-info btn-xs"/>
                                    <input type="hidden" name="search" value="${param.search}"/>
		<c:url var="deleteLink" value="MainController">
                                        <c:param name="action" value="Delete"></c:param>
                                        <c:param name="search" value="${param.search}"></c:param>
                                        <c:param name="userID" value="${user.userID}"> </c:param>
                                    </c:url> 
		<a href="${deleteLink}" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span>Delete</a>
		</td>
            </tr>
	    </form> 
            </c:forEach>
            </tbody>
    	</table>
	</c:if> 
    	</c:if>
    	${requestScope.ERROR}
    	</div>
</div>
</body>
</html>

<%-- 
    Document   : history
    Created on : Oct 29, 2021, 12:35:18 AM
    Author     : KawaiiScorpy
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History Page</title>
         <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/history.css" />
    </head>
    <c:if test="${sessionScope.LOGIN_USER eq null || sessionScope.LOGIN_USER.roleID ne 'US'}"> 
            <c:redirect url="Login.jsp"></c:redirect>
        </c:if>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>History Order</h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="MainController?action=Getall" class="btn btn-success" data-toggle="modal"><span>Back to Home</span></a>
                        </div>
                    </div>
                </div>
            <table class="table table-striped table-hover">
            <table id="history">
                <thead>
                <tr>
                    <th>No</th>
                    <th>Date</th>
                    <th>Total</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${sessionScope.HISTORY}" varStatus="counter" var="h">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${h.getDate()}</td>
                                <td>${h.getTotal()}$</td>
                                <td>
                                    
                                    <a href="MainController?action=Detail&OrderID=${h.getOrderID()}"  class="btn btn-success" data-toggle="modal"><span>More</span></a>	
                                </td>
                            </tr>
                        </c:forEach>
                </tbody>
        </table>
        </table>
            </div>
        </div>
    </body>
</html>

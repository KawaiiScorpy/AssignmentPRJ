<%-- 
    Document   : detail
    Created on : Oct 29, 2021, 1:47:34 PM
    Author     : KawaiiScorpy
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Page</title>
        <link rel="stylesheet" href="css/history_details.css" />
        <c:if test="${sessionScope.LOGIN_USER eq null || sessionScope.LOGIN_USER.roleID ne 'US'}"> 
            <c:redirect url="Login.jsp"></c:redirect>
        </c:if>
    </head>
    <body>
        <table id="detail">
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Image</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.DETAIL}" var="d">
                            <tr>
                                <td>${d.getProduct().getProductName()}</td>
                                <td><img class="product_image"src="${d.getProduct().getProductImg()}"></td>
                                <td>${d.getProduct().getProductPrice()}$</td>
                                <td>${d.getQuantity()}</td> 
                            </tr>
                        </c:forEach>
            </tbody>
        </table>

    </body>
</html>

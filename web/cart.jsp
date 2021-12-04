<%-- 
    Document   : cart
    Created on : Oct 23, 2021, 10:49:29 PM
    Author     : KawaiiScorpy
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.product.ProductDTO"%>
<%@page import="sample.product.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
        <link rel="stylesheet" href="css/cart.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
	<link rel="stylesheet" href="assets/css/style.css">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER eq null || sessionScope.LOGIN_USER.roleID ne 'US'}"> 
            <c:redirect url="Login.jsp"></c:redirect>
        </c:if>
        <%
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null && cart.getItems().size()>0) {
        %>
       
        <div class="col-md-5">
        <table id="products">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Product Image</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th colspan="2" style="text-align: center;">Product Modification</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    double total = 0;
                    for (ProductDTO product : cart.getItems().values()) {
                        total += product.getProductPrice() * product.getProductQuantity();
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%=count++%></td>
                    <input type="hidden" name="id" value="<%=product.getProductID()%>">
                    <td>
                    <img class="image_product" src="<%=product.getProductImg()%>" alt="<%=product.getProductName()%>">
                    </td>
                    <td><%= product.getProductName()%></td>
                    <td><%= product.getProductPrice()%>$</td>
                    <td>
                        <input type="number" name="quantity" value="<%= product.getProductQuantity()%>"min="1" required/>
                    </td>
                    <td><%= product.getProductPrice() * product.getProductQuantity()%>$</td>
                    <td>
                        <input class="delete_button" type="submit" name="action" value="Delete Product"/>
                    </td>
                    <td>
                        <input class="edit_button" type="submit" name="action" value="Edit" min="1"/>
                    </td>
                </tr>
                
            </form>
        
            <%
               }
            %>
        </tbody>
    </table>
        </div>
        <form action="MainController" method="POST">
            <div class="row justify-content-end">
        <div class="col-md-12 col-lg-4">
		<div class="summary">
                    <h3>Summary</h3>
                    <div class="summary-item"><span class="text">Subtotal</span><span class="price"><%=total%>$</span></div>
                    <div class="summary-item"><span class="text">Shipping</span><span class="price">Free Ship</span></div>
                    <div class="summary-item"><span class="text">Total</span><span class="price"><%=total%>$</span></div>
                    <input type="hidden" name="userID" value="${sessionScope.USER.getUserID()}">
                    <input type="hidden" name="total" value="${total}">
                    <input type="submit" name="action" value="Checkout" class="btn btn-primary btn-lg btn-block"/>
                    <a href="MainController?action=Getall"  class="btn btn-primary btn-lg btn-block"><span>Add more</span></a>
		</div>
	</div>
            </div>
        
        </form>
        
    <%
    } else {
    %><div class="empty">
    <h1>Your cart is empty !</h1>
    <a href="MainController?action=Getall"  class="btn btn-success"><span>Add more</span></a>
    </div><%
    }%>
    <h2>${requestScope.CART_ERROR}</h2>
</body>
</html>

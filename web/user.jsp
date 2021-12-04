<%-- 
    Document   : user.jsp
    Created on : Oct 20, 2021, 4:10:00 PM
    Author     : KawaiiScorpy
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.product.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="css/user.css" />
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER eq null || sessionScope.LOGIN_USER.roleID ne 'US'}"> 
            <c:redirect url="Login.jsp"></c:redirect>
        </c:if>
        <nav class="navbar navbar-expand-md bg-light">
     <div class="container">
        <a class="navbar-brand text-uppercase"> Welcome ${sessionScope.LOGIN_USER.fullName} </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <form action="MainController" method="post" class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input value="${param.search}" name="search" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="submit" name="action" value="Search Product" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                <a class="btn btn-success btn-sm ml-3" href="cart.jsp">
                    <i class="fa fa-shopping-cart"></i> Cart
                    <c:if test="${ not empty sessionScope.CART}">
                    <span class="badge badge-light">${sessionScope.CART.getItems().size()}</span>
                     </c:if>
                </a>
            </form>
            <ul class="navbar-nav badge-light">
                <c:if test="${sessionScope.LOGIN_USER != null}">
                    <li class="nav-item">
                        <a class="nav-link text-uppercase" href="MainController?action=View+history">History Order</a>
                    </li>
                    <li  class="nav-item">
                        <a class="nav-link text-uppercase" href="MainController?action=Getall">Home</a>
                    </li>
                    <li class="nav-item">
                            <a class="nav-link text-uppercase" href="MainController?action=Logout"> Logout</a>
                    </li> 
                </c:if>
            </ul>
            
        </div>
    </div>
</nav>
<div class="user-filter-category mt-2 p-4 border">
                <div class="heading d-flex justify-content-between align-items-center mt-2">
                    <h5 class="text-uppercase user-radio-title">Category</h5>
                </div>
                <hr>
                <form action="MainController">    
                    <div class="d-flex justify-content-between mt-2">
                        <div class="form-check user-radio-check">
                            <input class="form-check-input" type="radio" value="All" name="category" ${requestScope.CATEGORY == null || requestScope.CATEGORY == '' ? 'checked' : ''} /> 
                            <label class="form-check-label" for="flexRadioDefault2"> All </label> 
                        </div> 
                    </div>
                    <div class="d-flex justify-content-between mt-2">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" value="rau" name="category" ${requestScope.CATEGORY == 'rau' ? 'checked' : ''}/> 
                            <label class="form-check-label" for="flexRadioDefault2"> Rau </label> 
                        </div> 
                    </div>
                    <div class="d-flex justify-content-between mt-2">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" value="cu" name="category" ${requestScope.CATEGORY == 'cu' ? 'checked' : ''}/> 
                            <label class="form-check-label" for="flexRadioDefault2"> Củ </label> 
                        </div> 
                    </div>
                    <button name="action" value="Filter" class="btn btn-outline-primary mt-3 ps-4 pe-4">Filter</button>
                </form>
</div>
        <h3>${param.message}</h3>
        <c:if test="${not empty OK}">
            <script>
                swal("SUCCESS !","${requestScope.OK}");
            </script>
        </c:if>
            <c:if test="${requestScope.ALL_LIST_PRODUCT!=null}">
            <div class="row">
                <c:forEach var="product" items="${requestScope.ALL_LIST_PRODUCT}"> 
                    <div class="product_body col-lg-4 col-md-6 col-sm-12 ">
                    <form action="MainController" method="POST">
                            <img src="${product.productImg}" alt="${product.productName}">
                                <div class="product_details">
                                <h2>${product.productName}</h2>
                                <p>Quantity : ${product.productQuantity}</p>
                                <p>Price : ${product.productPrice}</p>
                                 <c:if test="${product.productQuantity > 0}">
                                <input  type="hidden" name="product_name" value="${product.productName}"/>
                                <input class="search_button" type="submit" name="action" value="Add to cart"/>
                                <input type="hidden" name="lastsearchValue" value="${param.search}"/>
                                </c:if>
                                <c:if test="${product.productQuantity <= 0}">
                                    <h1>Out of stock !</h1>
                                </c:if>
                                </div>
                    </form>
                    </div>
                </c:forEach>
                </div>
        </c:if>
        <c:if test="${requestScope.LIST_PRODUCT!= null}"> 
            <c:if test="${not empty requestScope.LIST_PRODUCT}">
                <div class="row">
                <c:forEach var="product" items="${requestScope.LIST_PRODUCT}"> 
                    <div class="product_body col-lg-4 col-md-6 col-sm-12 ">
                    <form action="MainController" method="POST">
                            <img src="${product.productImg}" alt="${product.productName}">
                                <div class="product_details">
                                <h2>${product.productName}</h2>
                                <p>Quantity : ${product.productQuantity}</p>
                                <p>Price : ${product.productPrice}</p>
                                <input  type="hidden" name="product_name" value="${product.productName}"/>
                                <input class="search_button" type="submit" name="action" value="Add to cart"/>
                                <input type="hidden" name="lastsearchValue" value="${param.search}"/>
                                </div>
                    </form>
                    </div>
                </c:forEach>
                </div>
            </c:if>
        </c:if>
        ${requestScope.SEARCH_ERROR}
        
    </body>
</html>

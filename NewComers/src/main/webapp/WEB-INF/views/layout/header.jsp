<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<header class="header_area">
    <div class="main_menu">
      <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
          <a class="navbar-brand logo_h" href="main.do"><img src="img/logo.png" alt=""></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
            <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
              <li class="nav-item">
              <a class="nav-link" href="main.do">Home</a>
              </li>
              <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">Shop</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="category.do">Shop Category</a></li>
                  <li class="nav-item"><a class="nav-link" href="single-product.html">Blog Details</a></li>
                  <li class="nav-item"><a class="nav-link" href="checkout.html">Product Checkout</a></li>
                  <li class="nav-item"><a class="nav-link" href="confirmation.html">Confirmation</a></li>
                  <li class="nav-item"><a class="nav-link" href="cart.do">Shopping Cart</a></li>
                </ul>
							</li>
              <li class="nav-item active submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">Blog</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="blog.do">Blog</a></li>
 
                </ul>
							</li>
							<li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">Pages</a>
                <ul class="dropdown-menu">
                <c:if test="${not empty id }">
				  <li class="nav-item"><a class="nav-link" href="memberLoginForm.do">Logout</a></li>
				</c:if>
                <c:if test="${empty id }">
				  <li class="nav-item"><a class="nav-link" href="memberLoginForm.do">Login</a></li>
				</c:if> 
                  <li class="nav-item"><a class="nav-link" href="memberSignUp.do">Register</a></li>				  
                  <li class="nav-item"><a class="nav-link" href="tracking-order.html">Tracking</a></li>
                  <!-- <li class="nav-item"><a class="nav-link" href="single-blog.html">Blog Details</a></li> -->
                </ul>
              </li>
              <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
              <c:if test="${not empty id }">
              <li class="nav-item"><a class="nav-link" href="myPageForm.do">mypage</a></li>
              </c:if>
            </ul>

            <ul class="nav-shop">
              <li class="nav-item">  <div class="search-box">
                <button class="btn-search"><i class="fa-solid fa-magnifying-glass"></i></button>
                <input type="text" class="input-search" placeholder="Type to Search...">
              </div></li>
              <li class="nav-item"><button><i class="fa-solid fa-cart-shopping"></i>
              <c:if test="${not empty id }">
              <span class="nav-shop__circle">${cartcount }</span>
              </c:if>
              </button> </li>
            </ul>
          </div>
        </div>
      </nav>
    </div>
  </header>
  <script src="https://kit.fontawesome.com/6094ba072a.js" crossorigin="anonymous"></script>
</body>
</html>
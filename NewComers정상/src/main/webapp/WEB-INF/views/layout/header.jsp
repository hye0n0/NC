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
					<a class="navbar-brand logo_h" href="main.do"><img
						src="img/logo.png" alt=""></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<div class="collapse navbar-collapse offset"
						id="navbarSupportedContent">
						<ul class="nav navbar-nav menu_nav ml-auto mr-auto">
							<li class="nav-item"><a class="nav-link" href="main.do">Home</a>
							</li>
							<li class="nav-item submenu dropdown"><a href="#"
								class="nav-link dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">Shop</a>
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link"
										href="category.do">Shop Category</a></li>
									<c:if test="${not empty password  }">
										<li class="nav-item"><a class="nav-link" href="cart.do">Shopping
												Cart</a></li>
										<c:if test="${grade eq 'seller'}">
											<li class="nav-item"><a class="nav-link"
												href="itemRsForm.do">Item Registration</a></li>
										</c:if>
									</c:if>

								</ul></li>
							<li class="nav-item active submenu dropdown"><a href="#"
								class="nav-link dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">Blog</a>
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link"
										href="mainblog.do">Blog</a></li>
									<li class="nav-item"><a class="nav-link"
										href="single-blog.html">Blog Details</a></li>
								</ul></li>

							<c:choose>
								<c:when test="${empty password }">
									<li class="nav-item submenu dropdown"><a href="#"
										class="nav-link dropdown-toggle" data-toggle="dropdown"
										role="button" aria-haspopup="true" aria-expanded="false">Pages</a>
										<ul class="dropdown-menu">
								</c:when>
								<c:otherwise>
									<li class="nav-item submenu dropdown"><a href="#"
										class="nav-link dropdown-toggle" data-toggle="dropdown"
										role="button" aria-haspopup="true" aria-expanded="false">${nickname }</a>
										<ul class="dropdown-menu">
								</c:otherwise>
							</c:choose>
							<c:if test="${not empty password }">
								<li class="nav-item"><a class="nav-link" href="#"
									onclick="logoutAll()">Logout</a></li>
								<li class="nav-item"><a class="nav-link"
									href="myPageForm.do">mypage</a></li>
							</c:if>

							<c:if test="${empty password }">
								<li class="nav-item"><a class="nav-link"
									href="memberLoginForm.do">Login</a></li>
							</c:if>
							<c:if test="${empty password }">
								<li class="nav-item"><a class="nav-link"
									href="memberSignUpForm.do">Register</a></li>
							</c:if>
							<!-- <li class="nav-item"><a class="nav-link" href="single-blog.html">Blog Details</a></li> -->
						</ul>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="contactForm.do">Contact</a></li>
						<c:if test="${not empty id }">


						</c:if>
						</ul>

						<ul class="nav-shop">
							<li class="nav-item">
								<div class="search-box">
									<button class="btn-search" type="button" onclick="categorySearch()">
										<i class="fa-solid fa-magnifying-glass"></i>
									</button>
									<input type="text" class="input-search"  id="cSearch" name="cSearch"
										placeholder="Type to Search...">
								</div>
							</li>
							<li class="nav-item"><button>
									<i class="fa-solid fa-cart-shopping"></i>
									<c:if test="${not empty id }">
										<span class="nav-shop__circle">${cartcount }</span>
									</c:if>
								</button></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</header>
	<script>
	
	
	function message(){
		let popupX = (window.screen.width / 2) - (400 / 2);
		let popupY= (window.screen.height / 2) - (200 / 2);
		
		window.open("messageForm.do", "message", "width=600, height=200, left='+popupX+', top='+popupY'");
		
	}
	 function searchItem() {
			let search = document.getElementById("search").value;
			console.log(search);
			
		  	let url ="category.do?search=" + search;
		 	location.href = url;
			}

</script>

	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">
	 function searchItem() {
			let search = document.getElementById("search").value;
			console.log(search);
			
		  	let url ="category.do?search=" + search;
		 	location.href = url;
			}

function logoutAll() {
	fetch("logout.do")
	kakaoLogout();
	location.href="main.do";
}

Kakao.init('e9786fac7663d9ccaeb89ec24478acae');
console.log(Kakao.isInitialized());

function kakaoLogout(){
	if (Kakao.Auth.getAccessToken()){
		Kakao.API.request({
			url: '/v1/user/unlink',
			success: function (response){
				console.log(response)
				location.href = "main.do";
			},
			fail: function (error) {
				console.log(error)
				location.href = "main.do";
			},
		})
		Kakao.Auth.setAccessToken(undefiend)
	}
}
function categorySearch() {
	let cSearch = document.getElementById("cSearch").value;
	console.log(cSearch);
	let url = "category.do?search=" + cSearch;
	location.href = url;
}
</script>
	<script src="https://kit.fontawesome.com/6094ba072a.js"
		crossorigin="anonymous"></script>

</body>
</html>
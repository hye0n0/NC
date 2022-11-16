<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Aroma Shop - Category</title>
<link rel="icon" href="img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="vendors/linericon/style.css">
<link rel="stylesheet"
	href="vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="vendors/nouislider/nouislider.min.css">
<link rel="stylesheet" href="css/style.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
 
<script type="text/javascript">
</script>
</head>
<style>
.common-filter{
	color: #6667AB;
	font-size: medium;
	font-weight: normal;
}
.filter-list:hover{
	color: #2C2E77;
}
.filter-list{
	display: flex;
	text-align: center;	
}
#minPrice{
  	width: 65px;
	border-top: none;
    border-left:none;
    border-right: none;
	border-bottom: 3px solid #6668AB;
    background-color:transparent; 
    text-align: center;
    color: #6668AB;
	font-weight:100;
}
#maxPrice{
    width: 70px;
	border-top: none;
    border-left:none;
    border-right: none;
	border-bottom: 3px solid #6668AB;
    background-color:transparent; 
    text-align: center;
    color: #6668AB;
	font-weight: 100;
}
.tii-search{
	position: relative;
	left: 95px;
  	bottom: 50%;
	color: #9293C9;
}

@font-face {
    font-family: 'IBMPlexSansKR-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body{
	font-family: 'IBMPlexSansKR-Regular';
}
#selectBox{
	webkit-appearance:none; /* for chrome */
	appearance:none;
	text-align-last: center;
}
#choiceNum{
	width: 70px;
	webkit-appearance:none; /* for chrome */
	appearance:none;
	text-align-last: center;
}
@font-face {
    font-family: 'NanumSquareNeo-Variable';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
.filter-bar{
	font-family: 'NanumSquareNeo-Variable';
}
@media (min-width: 992px)
.col-lg-4 {
    -ms-flex: 0 0 33.333333%;
    flex: 0 0 33.333333%;
    max-width: 32.333333%;
}

.card-img {
    width: 100%;
    border-radius: calc(0.25rem - 1px);
    padding-left: 9px;
    padding-right: 9px;
}
</style>
<body>

	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Shop Category</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Shop Category</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->


	<!-- ================ category section start ================= -->
	
	<section class="section-margin--small mb-5">
		<div class="container">
			<div class="row">
				<div class="col-xl-3 col-lg-4 col-md-5">
					<div class="sidebar-categories" style="margin-left: -10px;margin-right: 10px;">
						<div class="head" style="background-color: #6668AB">Browse Categories</div>
						<ul class="main-categories">
							<li class="common-filter">
								<form action="#">
									<ul>
										<li class="filter-list"><input class="pixel-radio"
											type="radio" id="fish" name="brand" onclick="getImage(this)"><label for="fish">
											<i class="fa-solid fa-fish"></i>생선</label></li>
											
										<li class="filter-list"><input class="pixel-radio"
											type="radio" id="bakery" name="brand"onclick="getImage(this)"><label for="bakery">
											<i class="fa-solid fa-cake-candles"></i>베이커리</label></li>
											
										<li class="filter-list"><input class="pixel-radio"
											type="radio" id="sideDish" name="brand"
											onclick="getImage(this)"><label for="sideDish">
											<i class="fa-solid fa-utensils"></i>반찬</label></li>
											
										<li class="filter-list"><input class="pixel-radio"
											type="radio" id="jelly" name="brand" onclick="getImage(this)"><label for="jelly">
											<i class="fa-solid fa-candy-cane"></i>젤리</label></li>
											
										<li class="filter-list"><input class="pixel-radio"
											type="radio" id="animal" name="brand" onclick="getImage(this)"><label for="animal">
											<i class="fa-solid fa-dog"></i>반려동물용품</label></li>
									</ul>
								</form>
							</li>
						</ul>
					</div>
					<div class="sidebar-filter" style="margin-left: -10px;margin-right: 10px;">
						<div class="top-filter-head" style="background-color: #6668AB">Product Filters</div>


						<div class="common-filter">

							<div class="price-range-area">
								<div id="price-range"></div>
								<div class="value-wrapper d-flex">
									<div class="price">Price:</div>
									
									<form action="getItem()">
										<input type="number" id="minPrice" name="minPrice" value="2000" >-
										<input type="number" id="maxPrice" name="maxPrice" value="30000" >
										<div  span class="ti-search tii-search" value="submit" onclick="getItem()"></div></span>
										
										
										

									</form>


								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-9 col-lg-8 col-md-7">
					<!-- Start Filter Bar -->
					<div class="filter-bar d-flex flex-wrap align-items-center">
						<div class="sorting">
							<select id="selectBox" name="selectBox" onchange="showItem(this.value)" style="border: 1px solid #eee;font-size: 14px;color: #999999;height: 38px;">
								<option value="01">최신순</option>
								<option value="02">등록순</option>
								<option value="03">낮은 가격순</option>
								<option value="04">높은 가격순</option>
							</select>
						</div>
						<div class="sorting mr-auto">
							<select id="choiceNum" onchange="showChoice(this.value)"  style="border: 1px solid #eee;font-size: 14px;color: #999999;height: 38px;">
								<option value="5">Show 5</option>
								<option value="10">Show 10</option>
								<option value="15">Show 15</option>
							</select>
						</div>
						<div>
							<div class="input-group filter-bar-search">
								<input type="text" id="cSearch" name="cSearch" placeholder="Search">
								<div class="input-group-append">
									<button type="button" onclick="categorySearch()" cursor="pointer">
										<i class="ti-search"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					<!-- End Filter Bar -->
					<!-- Start Best Seller -->
					<section class="lattest-product-area pb-40 category-list">
						<div class="row">
							<c:forEach items="${items }" var="item">
								<c:choose>
									<c:when test="${empty category}">
										<div class="col-md-6 col-lg-4">
											<div class="card text-center card-product">
												<div class="card-product__img">
													<img class="card-img" src="/NC/img/${item.itemImage }"
														alt="" width="180px" height="200px" >
													<ul class="card-product__imgOverlay">
														<li><button>
																<i class="fa-solid fa-magnifying-glass"></i>
															</button></li>
														<li><button>
																<i class="fa-solid fa-cart-shopping"></i>
															</button></li>
														<li><button>
																<i class="ti-heart"></i>
															</button></li>
													</ul>
												</div>
												<div class="card-body">
													<p>Product</p>
													<h4 class="card-product__title">
														<a href="#">${item.itemTitle }</a>
													</h4>
													<p class="card-product__price">${item.itemPrice }원</p>
													
												</div>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<c:if test="${item.itemCategory eq category }">
											<div class="col-md-6 col-lg-4" float="left">
												<div class="card text-center card-product">
													<div class="card-product__img">
														<img class="card-img" src="/NC/img/${item.itemImage }"
															alt="" width="200px" height="200px">
														<ul class="card-product__imgOverlay">
															<li><button>
																	<i class="fa-solid fa-magnifying-glass"></i>
																</button></li>
															<li><button>
																	<i class="fa-solid fa-cart-shopping"></i>
																</button></li>
															<li><button>
																	<i class="ti-heart"></i>
																</button></li>
														</ul>
													</div>
													<div class="card-body">
														
														<h4 class="card-product__title">
															<a href="#">${item.itemTitle }</a>
														</h4>
														<p class="card-product__price">${item.itemPrice }원</p>
														
													</div>
												</div>
											</div>
										</c:if>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
					</section>
					<!-- End Best Seller -->
				</div>
			</div>
		</div>
	</section>
	<!-- ================ category section end ================= -->

	<script>
		//자바스크립트 이벤트 핸들러 들어가는 곳

		function getImage(e) {
			let category = e.parentElement.textContent;
			let url = "category.do?category=" + category;
			location.href = url;
		}

		function getItem(e) {		
			console.log("확인");
			let minPrice = document.getElementById("minPrice").value;
			let maxPrice = document.getElementById("maxPrice").value;
			let url = "category.do?minPrice=" + minPrice + "&maxPrice="
					+ maxPrice;
			location.href = url;
		}

		function searchItem() {
			console.log("확인");
		}
		
		function categorySearch(){
			let cSearch = document.getElementById("cSearch").value;
			console.log(cSearch);
		  	let url ="category.do?search=" + cSearch;
		 	location.href = url;
		}
		
		function showItem(value){
			let order = value;
			let num = document.getElementById("choiceNum").value
			let url ="categoryNum.do?order=" + order + "&num=" + num;
		 	location.href = url;
		}
		
		function showChoice(value){
			let order = document.getElementById("selectBox").value
			let num = value;		
			let url ="categoryNum.do?order=" + order + "&num=" + num;
		 	location.href = url;
		}
		
		 function searchItem() {
				let search = document.getElementById("search").value;
				console.log(search);
				
			  	let url ="category.do?search=" + search;
			 	location.href = url;
				}
	
	</script>
	<script src="https://kit.fontawesome.com/6094ba072a.js" crossorigin="anonymous"></script>
	<script src="vendors/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="vendors/skrollr.min.js"></script>
	<script src="vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="vendors/nice-select/jquery.nice-select.min.js"></script>
	<script src="vendors/nouislider/nouislider.min.js"></script>
	<script src="vendors/jquery.ajaxchimp.min.js"></script>
	<script src="vendors/mail-script.js"></script>
	<script src="js/main.js"></script>
	<script src="https://kit.fontawesome.com/edec266dff.js" crossorigin="anonymous"></script>
	
</body>
</html>
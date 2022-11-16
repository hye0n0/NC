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

</head>
<body>

	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="category"></section>
	<!-- ================ end banner area ================= -->


	<!-- ================ category section start ================= -->
	<section class="section-margin--small mb-5">
		<div class="container">
			<div class="row">
				<div class="col-xl-3 col-lg-4 col-md-5">
					<div class="sidebar-categories">
						<div class="head">Browse Categories</div>
						<ul class="main-categories">
							<li class="common-filter">
								<form action="#">
									<ul>
										<li class="filter-list"><input class="pixel-radio"
											type="radio" id="fish" name="brand" onclick="getImage(this)"><label
											for="fish">생선</label></li>
										<li class="filter-list"><input class="pixel-radio"
											type="radio" id="bakery" name="brand"
											onclick="getImage(this)"><label for="bakery">베이커리</label></li>
										<li class="filter-list"><input class="pixel-radio"
											type="radio" id="sideDish" name="brand"
											onclick="getImage(this)"><label for="sideDish">반찬</label></li>
										<li class="filter-list"><input class="pixel-radio"
											type="radio" id="jelly" name="brand" onclick="getImage(this)"><label
											for="jelly">젤리</label></li>
										<li class="filter-list"><input class="pixel-radio"
											type="radio" id="animal" name="brand"
											onclick="getImage(this)"><label for="animal">반려동물용품</label></li>
									</ul>
								</form>
							</li>
						</ul>
					</div>
					<div class="sidebar-filter">
						<div class="top-filter-head">Product Filters</div>


						<div class="common-filter">

							<div class="price-range-area">
								<div id="price-range"></div>
								<div class="value-wrapper d-flex">
									<div class="price">Price:</div>
									<form action="getItem()">
										<input type="number" id="minPrice" name="minPrice" value="0">
										~<input type="number" id="maxPrice" name="maxPrice" value="0">
										<button type="button" value="submit" onclick="getItem()">
											<i class="ti-search"></i>
										</button>
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
							<select id="selectBox" name="selectBox"
								onchange="showItem(this.value)">
								<option value="01">최신순</option>
								<option value="02">등록순</option>
								<option value="03">낮은 가격순</option>
								<option value="04">높은 가격순</option>
							</select>
						</div>
						<div class="sorting mr-auto">
							<select id="choiceNum" onchange="showChoice(this.value)">
								<option value="5">Show 5</option>
								<option value="10">Show 10</option>
								<option value="15">Show 15</option>
							</select>
						</div>
						<div>
							<div class="input-group filter-bar-search">
								<input type="text" id="cSearch" name="cSearch"
									placeholder="Search">
								<div class="input-group-append">
									<button type="button" onclick="categorySearch()"
										cursor="pointer">
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
									<c:when test="${category eq null}">
										<div class="col-md-6 col-lg-4">
											<div class="card text-center card-product">
												<div class="card-product__img">
													<img class="card-img" src="upload/item/${item.itemImage }"
														alt="" width="200px" height="200px">
													<ul class="card-product__imgOverlay">
														<li><button onclick="clickk(this)">
																<i class="ti-search"></i>
															</button></li>
														<li><button onclick="upcart(this)">
																<i class="ti-shopping-cart"></i>
															</button></li>
														<li><button>
																<i class="ti-heart"></i>
															</button></li>
													</ul>
												</div>
												<div class="card-body">
													<a href="#" onclick="showblog(this)">${item.nickName }</a>
													<h4 class="card-product__title">
														<a href="#" onclick="clickkk(this)">${item.itemTitle }</a>
													</h4>
													<p class="card-product__price">${item.itemPrice }원</p>
												</div>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<c:if test="${item.itemCategory eq category }">
											<div class="col-md-6 col-lg-4">
												<div class="card text-center card-product">
													<div class="card-product__img">
														<img class="card-img" src="upload/item/${item.itemImage }"
															alt="" width="200px" height="200px">
														<ul class="card-product__imgOverlay">
															<li><button>
																	<i class="ti-search"></i>
																</button></li>
															<li><button>
																	<i class="ti-shopping-cart"></i>
																</button></li>
															<li><button>
																	<i class="ti-heart"></i>
																</button></li>
														</ul>
													</div>
													<div class="card-body">
														<p>${item.nickName }</p>
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

	<!-- ================ top product area start ================= -->
	<section class="related-product-area">
		<div class="container">
			<div class="section-intro pb-60px">
				<p>Popular Item in the market</p>
				<h2>
					Top <span class="section-intro__style">Product</span>
				</h2>
			</div>
			<div class="row mt-30">
				<div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
					<div class="single-search-product-wrapper">
						<div class="single-search-product d-flex">
							<a href="#"><img src="img/product/product-sm-1.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
						<div class="single-search-product d-flex">
							<a href="#"><img src="img/product/product-sm-2.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
						<div class="single-search-product d-flex">
							<a href="#"><img src="img/product/product-sm-3.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
					<div class="single-search-product-wrapper">
						<div class="single-search-product d-flex">
							<a href="#"><img src="img/product/product-sm-4.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
						<div class="single-search-product d-flex">
							<a href="#"><img src="img/product/product-sm-5.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
						<div class="single-search-product d-flex">
							<a href="#"><img src="img/product/product-sm-6.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
					<div class="single-search-product-wrapper">
						<div class="single-search-product d-flex">
							<a href="#"><img src="img/product/product-sm-7.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
						<div class="single-search-product d-flex">
							<a href="#"><img src="img/product/product-sm-8.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
						<div class="single-search-product d-flex">
							<a href="#"><img src="img/product/product-sm-9.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
					<div class="single-search-product-wrapper">
						<div class="single-search-product d-flex">
							<a href="#"><img src="img/product/product-sm-1.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
						<div class="single-search-product d-flex">
							<a href="#"><img src="img/product/product-sm-2.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
						<div class="single-search-product d-flex">
							<a href="#"><img src="img/product/product-sm-3.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ top product area end ================= -->

	<!-- ================ Subscribe section start ================= -->
	<section class="subscribe-position">
		<div class="container">
			<div class="subscribe text-center">
				<h3 class="subscribe__title">Get Update From Anywhere</h3>
				<p>Bearing Void gathering light light his eavening unto dont
					afraid</p>
				<div id="mc_embed_signup">
					<form target="_blank"
						action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
						method="get" class="subscribe-form form-inline mt-5 pt-1">
						<div class="form-group ml-sm-auto">
							<input class="form-control mb-1" type="email" name="EMAIL"
								placeholder="Enter your email" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Your Email Address '">
							<div class="info"></div>
						</div>
						<button class="button button-subscribe mr-auto mb-1" type="submit">Subscribe
							Now</button>
						<div style="position: absolute; left: -5000px;">
							<input name="b_36c4fd991d266f23781ded980_aefe40901a"
								tabindex="-1" value="" type="text">
						</div>

					</form>
				</div>

			</div>
		</div>
	</section>
	<!-- ================ Subscribe section end ================= -->

	<script>
		//자바스크립트 이벤트 핸들러 들어가는 곳
		function showblog(e){
			console.log("안녕");
			let name = e.parentElement.childNodes[1].textContent;
			console.log(name);
			let url = "blog.do?nickname="+name;
			location.href = url;
			
		}
		
		function clickk(e) {
			console.log("안녕");
			let name = e.parentElement.parentElement.parentElement.nextElementSibling.childNodes[3].childNodes[1].textContent;
			console.log(name);
			let url = "itemDetail.do?itemtitle=" + name;
			location.href = url;
		}
		function clickkk(e){
			console.log(e.textContent);
			let name = e.textContent;
			let url = "itemDetail.do?itemtitle=" + name;
			location.href = url;
			
		}
		function upcart(e){
			console.log("안녕");
			let name = e.parentElement.parentElement.parentElement.nextElementSibling.childNodes[3].childNodes[1].textContent;
			console.log(name);
			  let url = "addCart.do?itemtitle=" + name+"&qty=1&job=main";
			  fetch(url)
			  	.then(response => response.text())
			  	.then(data => {
			  		if(data ==1){
			  			alert("카트에 추가되었습니다");
			  			location.replace(location.href);
			  		} else {
			  			alert("오류.")
			  		}
			 })
		}
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

		function categorySearch() {
			let cSearch = document.getElementById("cSearch").value;
			console.log(cSearch);
			let url = "category.do?search=" + cSearch;
			location.href = url;
		}
		function showItem(value) {
			let order = value;
			let url = "category.do?order=" + order;
			location.href = url;
		}
		function showChoice(value){
			let order = document.getElementById("selectBox").value
			let num = value;		
			let url ="categoryNum.do?order=" + order + "&num=" + num;
		 	location.href = url;
		}
	</script>
	<script src="vendors/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="vendors/skrollr.min.js"></script>
	<script src="vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="vendors/nice-select/jquery.nice-select.min.js"></script>
	<script src="vendors/nouislider/nouislider.min.js"></script>
	<script src="vendors/jquery.ajaxchimp.min.js"></script>
	<script src="vendors/mail-script.js"></script>
	<script src="js/main.js"></script>
</body>
</html>
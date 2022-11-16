<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Aroma Shop - Home</title>
<link rel="icon" href="img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="vendors/nice-select/nice-select.css">
<link rel="stylesheet"
	href="vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">

<link rel="stylesheet" href="css/BannerStyle.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<main class="site-main">
		<!--================ Hero banner start =================-->

		<div class="galleryContainer">
			<div class="slideShowContainer">
				<div onclick="plusSlides(-1)" class="nextPrevBtn leftArrow">
					<span class="arrow arrowLeft"><img src="" /></span>
				</div>
				<div onclick="plusSlides(1)" class="nextPrevBtn rightArrow">
					<span class="arrow arrowRight"></span>
				</div>
				<div class="captionTextHolder">
					<p class="captionText slideTextFromTop"></p>
				</div>
				<div class="imageHolder">
					<img src="img/Banner1.png" />
					<p class="captionText"></p>
				</div>
				<div class="imageHolder">
					<img src="img/Banner3.png" />
					<p class="captionText"></p>
				</div>
				<div class="imageHolder">
					<img src="img/Banner2.png" />
					<p class="captionText"></p>
				</div>
				<div class="imageHolder">
					<img src="img/Banner4.png" />
					<p class="captionText"></p>
				</div>
			</div>
			<div id="dotsContainer">
				<div class="banner">
					<div data-index="1"></div>
					<div data-index="2"></div>
					<div data-index="3"></div>
					<div data-index="4"></div>
				</div>
			</div>
			<div class="list-button">
				<span class="list-button-item active"></span> <span
					class="list-button-item"></span> <span class="list-button-item"></span>
				<span class="list-button-item"></span>
			</div>
		</div>

		<!--================ Hero Carousel start =================-->
		<section class="section-margin mt-0">
			<div class="owl-carousel owl-theme hero-carousel">
				<div class="hero-carousel__slide">
					<img src="img/home/hero-slide1.png" alt="" class="img-fluid">
					<a href="#" class="hero-carousel__slideOverlay">
						<h3>Wireless Headphone</h3>
						<p>Accessories Item</p>
					</a>
				</div>
				<div class="hero-carousel__slide">
					<img src="img/home/hero-slide2.png" alt="" class="img-fluid">
					<a href="#" class="hero-carousel__slideOverlay">
						<h3>Wireless Headphone</h3>
						<p>Accessories Item</p>
					</a>
				</div>
				<div class="hero-carousel__slide">
					<img src="img/home/hero-slide3.png" alt="" class="img-fluid">
					<a href="#" class="hero-carousel__slideOverlay">
						<h3>Wireless Headphone</h3>
						<p>Accessories Item</p>
					</a>
				</div>
			</div>
		</section>
		<!--================ Hero Carousel end =================-->

		<!-- ================ trending product section start ================= -->
		<section class="section-margin calc-60px">
			<div class="container">
				<div class="section-intro pb-60px">
					<p>Popular Item in the market</p>
					<h2>
						Trending <span class="section-intro__style">Product</span>
					</h2>
				</div>
				<div class="row">
					<c:forEach items="${mainitems }" var="item" begin="1" end="6"
						step="1">
						<div class="col-md-6 col-lg-4">
							<div class="card text-center card-product">
								<div class="card-product__img">
									<img class="card-img" src="upload/item/${item.itemImage }"
										alt="" width="200px" height="200px">
								</div>
								<div class="card-body">
									<a href="#" onclick="showblog(this)" style="color: #C2C3E4">${item.nickName }</a>
									<h4 class="card-product__title">
										<a href="#" onclick="clickkk(this)">${item.itemTitle }</a>
									</h4>
									<p class="card-product__price">${item.itemPrice }원</p>
								</div>
							</div>
						</div>

					</c:forEach>
				</div>
			</div>
		</section>
		<!-- ================ trending product section end ================= -->


		<!-- ================ offer section start ================= -->
		<section class="offer" id="parallax-1"
			data-anchor-target="#parallax-1"
			data-300-top="background-position: 20px 30px"
			data-top-bottom="background-position: 0 20px">
			<div class="container">
				<div class="row">
					<div class="col-xl-5">
						<div class="offer__content text-center">
							<h3>Up To 50% Off</h3>
							<h4>Winter Sale</h4>
							<p>Him she'd let them sixth saw light</p>
							<a class="button button--active mt-3 mt-xl-4" href="#">Shop
								Now</a>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- ================ offer section end ================= -->

		<!-- ================ Best Selling item  carousel ================= -->


		<!-- ================ Subscribe section start ================= -->

		<!-- ================ Subscribe section end ================= -->



	</main>

	<script>
		function clickkk(e) {
			console.log(e.textContent);
			let name = e.textContent;
			let url = "itemDetail.do?itemtitle=" + name;
			location.href = url;

		}
	</script>
	<!--================ Start footer Area  =================-->

	<!--================ End footer Area  =================-->
	<script>
		function showblog(e) {
			console.log("안녕");
			let name = e.parentElement.childNodes[1].textContent;
			console.log(name);
			let url = "blog.do?nickname=" + name;
			location.href = url;

		}
	</script>
	<script src="js/BannerScript.js"></script>


	<script src="vendors/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="vendors/skrollr.min.js"></script>
	<script src="vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="vendors/nice-select/jquery.nice-select.min.js"></script>
	<script src="vendors/jquery.ajaxchimp.min.js"></script>
	<script src="vendors/mail-script.js"></script>
	<script src="js/main.js"></script>
</body>
</html>
</html>
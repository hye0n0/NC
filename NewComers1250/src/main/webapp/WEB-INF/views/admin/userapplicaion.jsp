<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html> 
<html lang="en">
<head> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Aroma Shop - Blog Details</title>
<link rel="icon" href="img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="vendors/linericon/style.css">
<link rel="stylesheet"
	href="vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">

<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<!--================ Start Header Menu Area =================-->
	<!--================ End Header Menu Area =================-->
	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="blog">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Blog Details</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Blog
								Details</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->



	<!--================Blog Area =================-->
	<section
		class="blog_area single-post-area py-80px section-margin--small">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="blog_right_sidebar">

						<aside class="single_sidebar_widget author_widget">
							<img class="author_img rounded-circle" src="img/blog/author.png"
								alt="">
							<h4>${name }???</h4>
							<p>${grade }</p>
							<div class="social_icon">
								<a href="#"> <i class="fab fa-facebook-f"></i>
								</a> <a href="#"> <i class="fab fa-twitter"></i>
								</a> <a href="#"> <i class="fab fa-github"></i>
								</a> <a href="#"> <i class="fab fa-behance"></i>
								</a>
							</div>
							<p>?????????</p>
							<div class="br"></div>
						</aside>
						<c:choose>
							<c:when test="${grade eq 'admin'}">
								<aside class="single_sidebar_widget post_category_widget">
									<h4 class="widget_title">My ??????</h4>
									<ul class="list cat-list">
										<li><a class="d-flex justify-content-between">
												<p>
												<h2>?????????</h2>
												</p>
										</a><br> <a href="showUpdateList.do"
											class="d-flex justify-content-between">
												<p>????????????</p>
										</a><br></li>
										<li><a class="d-flex justify-content-between">
												<p>
												<h2>My ??????</h2>
												</p>
										</a><br> <a href="#" class="d-flex justify-content-between">
												<p>???????????? ??????</p>
										</a> <br> <a href="javascript:change()"
											class="d-flex justify-content-between">
												<p>??????????????? ?????????</p>
										</a> <br></li>
									</ul>
									<div class="br"></div>
								</aside>


							</c:when>
							<c:otherwise>

								<aside class="single_sidebar_widget post_category_widget">
									<h4 class="widget_title">My ??????</h4>
									<ul class="list cat-list">
										<li><a class="d-flex justify-content-between">
												<p>
												<h2>My ??????</h2>
												</p>
										</a><br> <a href="mydetailorderlist.do"
											class="d-flex justify-content-between">
												<p>????????????/????????????</p>
										</a><br></li>
										<li><a class="d-flex justify-content-between">
												<p>
												<h2>My ??????</h2>
												</p>
										</a><br> <a href="#" class="d-flex justify-content-between">
												<p>???????????? ??????</p>
										</a><br></li>
									</ul>
									<div class="br"></div>
								</aside>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="col-lg-6">
					<table border="1">
						<tr>
							<th>?????????</th>
							<th>????????????</th>
							<th>?????????</th>
							<th>??????</th>
							<th>??????</th>
						</tr>
						<c:forEach items="${list }" var="list">
							<tr>
								<td id="${list.id }">${list.id }</td>
								<td>${list.applicationDate }</td>
								<td>${list.email }</td>
								<td>${list.address }</td>
								<td><button onclick="approve(this)">??????</button></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</section>
	<!--================Blog Area =================-->


	<!--================Instagram Area =================-->
	<section class="instagram_area">
		<div class="container box_1620">
			<div class="insta_btn">
				<a class="btn theme_btn" href="#">Follow us on instagram</a>
			</div>
			<div class="instagram_image row m0">
				<a href="#"><img src="img/instagram/ins-1.jpg" alt=""></a> <a
					href="#"><img src="img/instagram/ins-2.jpg" alt=""></a> <a
					href="#"><img src="img/instagram/ins-3.jpg" alt=""></a> <a
					href="#"><img src="img/instagram/ins-4.jpg" alt=""></a> <a
					href="#"><img src="img/instagram/ins-5.jpg" alt=""></a> <a
					href="#"><img src="img/instagram/ins-6.jpg" alt=""></a>
			</div>
		</div>
	</section>
	<!--================End Instagram Area =================-->


	<!--================ Start footer Area  =================-->

	<!--================ End footer Area  =================-->

	<script>
		function approve(e) {
			let id = e.parentElement.parentElement.childNodes[1].textContent;
			let url="ajaxapprove.do?id="+id;
			fetch(url)
			.then(response=>response.text())
			.then(data=>{
				if(data=='1'){
					e.parentElement.parentElement.remove();
				}
			});
		}
	</script>

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
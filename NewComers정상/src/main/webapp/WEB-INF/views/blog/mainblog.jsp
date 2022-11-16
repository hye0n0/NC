<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head> 

  	<script src="vendors/jquery/jquery-3.2.1.min.js"></script>
  	
	<script>
		$(document).ready(function(){
		
		  var currentPosition = parseInt($(".quick_menu").css("top"));
		  $(window).scroll(function() {
		    var position = $(window).scrollTop();
		    if(position> 1000){
		   $(".quick_menu").stop().animate({"top":position+"px"},10000);
		   }
		   $(window).scroll(function(){
		    if($(window).scrollTop() == ($(document).height() - $(window).height() )){
		        $(".quick_menu").stop()
		    }
		    }) 
		  });
		});
	  </script>
	  
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Aroma Shop - Blog</title>
<link rel="icon" href="img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">

<link rel="stylesheet" href="css/style.css">

<style>
	.blog_post img{
		width: 500px;
		height: 400px;
	}
	
	.quick_menu{position:absolute;top:5%;margin-top: -43%;}
	
</style>
</head>
<body>
	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="blog">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Our Blog</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Blog</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->

	<!--================Blog Categorie Area =================-->
	<section class="blog_categorie_area"></section>
	<!--================Blog Categorie Area =================-->

	<!--================Blog Area =================-->
	<section class="blog_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="blog_left_sidebar">
					<c:set var="writer" value=" "></c:set>
						<c:forEach items="${blogs}" var="blog">
							<article class="row blog_item">
								<div class="col-md-3">
									<div class="blog_info text-right">
										<ul class="blog_meta list">		
											<li><a href="#">${blog.blogDate}<i class="fa-solid fa-calendar-days"></i>
											</a></li>
											<li id="${blog.blogCode}"><a href="#" id="likeCount${blog.blogCode}" onclick="return false;">${blog.blogLike}</a>
											<c:set var="check" value="false"></c:set>
											<c:forEach items="${likes}" var="like">
											<c:if test="${like.blogCode == blog.blogCode}">
											<c:set var="check" value="true"></c:set>
											</c:if>
											</c:forEach>
											<c:choose>
											<c:when test="${check eq 'true'}">
												<a href="#" onclick="likeChange(this);return false;" value="YES" ><i class="fa-solid fa-heart" style="color: rgb(236, 90, 90);"></i></a>
											</c:when>
											<c:otherwise>
												<a href="#" onclick="likeChange(this);return false;" value="NO" ><i class="fa-solid fa-heart" style="color: rgb(156, 156, 156);"></i></a>
											</c:otherwise>
											</c:choose>
											</li>
										</ul>
									</div>
								</div>
								<div class="col-md-9">
									<div class="blog_post">
										<c:if test="${not empty blog.blogImage }">
										<img src="upload/blog/${blog.blogImage}" alt="">
										</c:if>
										<div class="blog_details">
											<p>${blog.blogContent}</p>
											<c:if test="${id == blog.blogWriter }">
											<a class="button button-blog" href="#" onclick="blogUpdate(this,'${blog.blogCode}');return false;" value="NO">수정</a>
											<a class="button button-blog" href="#" onclick="blogDelete(this,'${blog.blogCode}');return false;">삭제</a>
											</c:if>
											<c:set var="writer" value="${blog.blogWriter}"></c:set>
										</div>
									</div>
								</div>
							</article>
						</c:forEach>
						<nav class="blog-pagination justify-content-center d-flex">
							<ul class="pagination">
								<li class="page-item"><a href="#" class="page-link"
									aria-label="Previous"> <span aria-hidden="true"> <span
											class="lnr lnr-chevron-left"></span>
									</span>
								</a></li>
								<li class="page-item"><a href="#" class="page-link">01</a>
								</li>
								<li class="page-item active"><a href="#" class="page-link">02</a>
								</li>
								<li class="page-item"><a href="#" class="page-link">03</a>
								</li>
								<li class="page-item"><a href="#" class="page-link">04</a>
								</li>
								<li class="page-item"><a href="#" class="page-link">09</a>
								</li>
								<li class="page-item"><a href="#" class="page-link"
									aria-label="Next"> <span aria-hidden="true"> <span
											class="lnr lnr-chevron-right"></span>
									</span>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="quick_menu">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget search_widget">
							<!-- /input-group -->
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget author_widget">
							<img class="author_img rounded-circle" src="img/blog/author.png"
								alt="">
							<h4>헨젤과 그랬대</h4>
							<div class="br"></div>
						</aside>
						<c:if test="${id == writer }">
						<aside>
						<form action="./blogInsert.do" method="post" enctype="multipart/form-data">
						<label for="blog_content">블로그 내용</label><br>
						<textarea name="blog_content" rows="10" cols="30"></textarea><br><br>
						<label for="blog_content">사진</label>
						<input type="file" name="blog_image"/><br>
						<input type="submit" value="글 등록"><br><br>
						</form>
						</aside>
						</c:if>
						<aside class="single_sidebar_widget popular_post_widget">
							<h3 class="widget_title">Popular Posts</h3>
							<div class="media post_item">
								<img src="img/blog/popular-post/post1.jpg" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>Space The Final Frontier</h3>
									</a>
									<p>02 Hours ago</p>
								</div>
							</div>
							<div class="media post_item">
								<img src="img/blog/popular-post/post2.jpg" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>The Amazing Hubble</h3>
									</a>
									<p>02 Hours ago</p>
								</div>
							</div>
							<div class="media post_item">
								<img src="img/blog/popular-post/post3.jpg" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>Astronomy Or Astrology</h3>
									</a>
									<p>03 Hours ago</p>
								</div>
							</div>
						</aside>
					</div>
				</div>
				</div>
			</div>
		</div>
	</section>
	<!--================Blog Area =================-->
<script>
	function likeChange(e){
		let like = e.getAttribute('value');
		let blogCode = e.parentElement.getAttribute('id');
		let likeCount = document.getElementById("likeCount"+blogCode).textContent;
		console.log(like);

		if(like == 'YES'){
			let newCount =  Number(likeCount) - 1;
			let url = "likeChange.do?likeCount=" + newCount + "&blogCode=" + blogCode + "&val=del";
			fetch(url);
			e.setAttribute('value','NO');
			e.firstChild.style.color = "rgb(156, 156, 156)";
			document.getElementById("likeCount"+blogCode).textContent = newCount;
		}else if(like == 'NO'){
			let newCount = Number(likeCount) + 1;
			let url = "likeChange.do?likeCount=" + newCount + "&blogCode=" + blogCode + "&val=add";
			fetch(url);
			e.setAttribute('value', 'YES');
			e.firstChild.style.color = "rgb(236, 90, 90)";
			document.getElementById("likeCount"+blogCode).textContent = newCount;
		}
	}
	
	function blogDelete(e, n) {
		let blogCode = n;
		let url = "blogDelete.do?blogCode=" + blogCode;
		fetch(url);
		e.parentElement.parentElement.parentElement.parentElement.remove();
	}
	
	function blogUpdate(e, n) {
		let check = e.getAttribute('value');
		let blogCode = n;
		if(check == 'NO'){
			console.log("p입니다");
			let content = e.previousSibling.previousSibling.textContent;
			let cheId = document.getElementById('newBlogContent');
			if(cheId != null){
				console.log('확인');
				content = document.getElementById('newBlogContent').textContent;
				document.getElementById('newBlogContent').remove();
			}
			console.log(content);
			if(cheId == null){
				e.previousSibling.previousSibling.remove();
			}
			let textarea = document.createElement("textarea");
			textarea.textContent = content;
			textarea.setAttribute('id','newBlogContent');
			textarea.setAttribute('rows','15');
			textarea.setAttribute('cols','60');
			e.parentElement.prepend(textarea);
			e.setAttribute('value','YES');
		}else if(check == 'YES') {
			console.log("textarea입니다");
			let content = document.getElementById('newBlogContent').value;
			console.log(content);
			let url = "blogUpdate.do?blogContent=" + content + "&blogCode=" + blogCode;
			fetch(url);
			document.getElementById('newBlogContent').remove();
			let p = document.createElement("p");
			p.textContent = content;
			p.setAttribute('id','newBlogContent');
			e.parentElement.prepend(p);
			e.setAttribute('value','NO');
		}
	}
	
</script>

<script src="https://kit.fontawesome.com/6094ba072a.js" crossorigin="anonymous"></script>

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
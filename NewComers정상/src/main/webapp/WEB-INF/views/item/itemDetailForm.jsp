<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en"> 
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Aroma Shop - Login</title>
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
	<!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<div class="itemDetailImg">
					<img src="upload/item/${item.itemImage1 }" width="250" height="300">
					<img src="upload/item/${item.itemImage2 }" width="250" height="300"><br>
					<img src="upload/item/${item.itemImage3 }" width="250" height="300">
					<img src="upload/item/${item.itemImage4 }" width="250" height="300">
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h2 style="color: black">${item.itemTitle}</h2>
						<h2 style="color: black">${item.itemPrice}원</h2>
						<p style="font-size: 15px">${item.itemContent}</p>
						<div class="product_count">
							<label for="qty">Quantity:</label>
							<button
								onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
								class="increase items-count" type="button">
								<i class="ti-angle-left"></i>
							</button>
							<input type="text" id="qty" name="qty" id="sst" size="2"
								maxlength="12" value="1" title="Quantity:"
								class="input-text qty">
							<button
								onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
								class="reduced items-count" type="button">
								<i class="ti-angle-right"></i>
							</button>
							<a class="button primary-btn" onclick="addtocart()">Add to
								Cart</a>
						</div>
						<div class="card_area d-flex align-items-center">
							<a class="icon_btn" href="#"><i class="lnr lnr lnr-diamond"></i></a>
							<a class="icon_btn" href="#"><i class="lnr lnr lnr-heart"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->

	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item"><a class="nav-link active" id="review-tab"
					data-toggle="tab" href="#review" role="tab" aria-controls="review"
					aria-selected="false">Reviews</a></li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="review" role="tabpanel"
					aria-labelledby="review-tab">
					<div class="row">
						<div class="col-lg-6">	
						<h3>Review</h3>							
							<c:forEach items="${reviews }" var="review">
									<div class="media">
										<div class="media-body" style="margin-bottom: 5px">
											<ul style="border: 1px solid silver; border-radius: 4px; padding: 10px">
											<li style="color: black; font-size: 15px; padding:20">${review.reviewDate }&nbsp;&nbsp;&nbsp;${review.reviewWriter  }&nbsp;&nbsp;${review.reviewStar }점</li>
											<hr>
											<li style="color: black">${review.reviewContent }</li>
											
											</ul>
										</div>
									</div>
									
							</c:forEach>
						</div>
							<c:if test="${not empty id }">
								<div class="col-lg-6" >
									<div class="review_box">
										<h3>Add a Review</h3>									
										<form action="reviewRs.do?itemCode=${item.itemCode}"
											class="form-contact form-review mt-3">
											<div class="form-group">
												<textarea class="form-control different-control w-100"
													name="reviewContent" id="reviewContent" cols="50" rows="10"
													placeholder="Enter Message"
													style="outline: 1px solid silver"></textarea>
											</div>
											<div class="form-group" style="outline: 1px solid silver">
												<hr>
												<h5>만족도</h5>
												<br> <label>1점<input type="checkbox"
													name="reviewStar" value="1" style="width: 40px"
													onclick="clickCheck(this)" /></label> <label>2점<input
													type="checkbox" name="reviewStar" value="2"
													style="width: 40px" onclick="clickCheck(this)" /></label> <label>3점<input
													type="checkbox" name="reviewStar" value="3"
													style="width: 40px" onclick="clickCheck(this)" /></label> <label>4점<input
													type="checkbox" name="reviewStar" value="4"
													style="width: 40px" onclick="clickCheck(this)" /></label> <label>5점<input
													type="checkbox" name="reviewStar" value="5"
													style="width: 40px" onclick="click Check(this)" /></label>
												<hr>
											</div>
											<div class="form-group text-center text-md-right mt-3">
												<button type="submit" class="button button--active button-review">Submit Now </button>
											</div>
										</form>
									</div>
								</div>
							</c:if>
							<c:if test="${empty id }">
								<div class="col-lg-6" >
									<div class="review_box">
										<h3>Add a Review</h3>									
										<form action="reviewRs.do?itemCode=${item.itemCode}"
											class="form-contact form-review mt-3">
											<div class="form-group">
												<textarea class="form-control different-control w-100" name="reviewContent" id="reviewContent" cols="50" rows="10"
													placeholder="로그인시 리뷰 작성이 가능합니다." style="outline: 1px solid silver" readonly></textarea>
											</div>
											<div class="form-group" style="outline: 1px solid silver">
												<hr>
												<h5>만족도</h5>
												<br> <label>1점<input type="checkbox" name="reviewStar" value="1"
													style="width: 40px" onclick="return false" />
													</label>
													<label>2점<input	type="checkbox" name="reviewStar" value="2"
													style="width: 40px" onclick="return false" />
													</label>
													<label>3점<input	type="checkbox" name="reviewStar" value="3"
													style="width: 40px" onclick="return false" />
													</label>
													<label>4점<input	type="checkbox" name="reviewStar" value="4"
													style="width: 40px" onclick="return false" />
													</label>
													<label>5점<input	type="checkbox" name="reviewStar" value="5"
													style="width: 40px" onclick="return false" />
													</label>
												<hr>
											</div>
										</form>
									</div>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
	</section>

	<!--================End Product Description Area =================-->

	<script type="text/javascript">
	function addtocart(){
		let name = document.getElementById('itemtitle').textContent;
		let qty = document.getElementById('qty').value;
		  let url = "addCart.do?itemtitle=" +name+"&qty="+qty+"&job=detail";
		  fetch(url)
		  	.then(response => response.text())
		  	.then(data => {
		  		if(data ==1){
		  			alert("카트에 추가되었습니다");
		  		} else {
		  			alert("오류.")
		  		}
		 })
	}
</script>
	<!--================ Start footer Area  =================-->

	<!--================ End footer Area  =================-->


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
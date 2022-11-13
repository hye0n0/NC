<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Aroma Shop - Cart</title>
	<link rel="icon" href="img/Fevicon.png" type="image/png">
	<link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="vendors/linericon/style.css">
	<link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
	<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
	<link rel="stylesheet" href="vendors/nice-select/nice-select.css">
	<link rel="stylesheet" href="vendors/nouislider/nouislider.min.css">

	<link rel="stylesheet" href="css/style.css">
	<style>
		.delCartBtn {
			background-color: transparent;
			;
			border: none;
		}
	</style>
</head>

<body>

	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Shopping Cart</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Shopping
								Cart</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->



	<!--================Cart Area =================-->
	<section class="cart_area">
		<div class="container">
			<div class="cart_inner">
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Product</th>
								<th scope="col">Price</th>
								<th scope="col">Quantity</th>
								<th scope="col">Total</th>
							</tr>
						</thead>
						<tbody>
						<c:set var="Subtotal" value="0"></c:set>
							<c:forEach items="${carts}" var="cart">
								<tr class="carts">
									<td>
										<div class="media">
											<div class="d-flex">
												<img src="upload/item/${cart.itemImage }" alt="" width="150px"
													height="150px">
											</div>
											<div class="media-body">
												<p>${cart.itemTitle}</p>
											</div>
										</div>
									</td>
									<td>
										<h5>${cart.itemPrice}</h5>
									</td>
									<td>
										<div class="product_count">
											<input type="text" name="qty" id="sst${cart.cartCode}" maxlength="12"
												value="${cart.itemCount}" title="Quantity:" class="input-text qty">
											<button
												onclick="var result = document.getElementById('sst${cart.cartCode}'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
												class="increase items-count" type="button">
												<i class="lnr lnr-chevron-up"></i>
											</button>
											<button
												onclick="var result = document.getElementById('sst${cart.cartCode}'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
												class="reduced items-count" type="button">
												<i class="lnr lnr-chevron-down"></i>
											</button>
										</div>
									</td>
									<td>
										<h5 id="total">${cart.itemPrice*cart.itemCount}</h5>
									</td>
									<td>
										<h5><button class="delCartBtn" type="button"
												id="cart${cart.cartCode }" onclick="deleteCart(this)">✖</button></h5>
									</td>
									<c:set var="Subtotal" value="${Subtotal + (cart.itemPrice*cart.itemCount)}"></c:set>
								</tr>
							</c:forEach>
							<tr class="bottom_button">
								<td>
									<a class="button" href="javascript:;" onclick="updateCart()">Update Cart</a>
								</td>
								<td>

								</td>
								<td>

								</td>
								<td>
									<a class="button" href="javascript:;" id="delAllBtn" onclick="deleteAllCart()">Delete All</a>
								</td>
							</tr>
							<tr>
								<td>

								</td>
								<td>

								</td>
								<td>
									<h5>Subtotal</h5>
								</td>
								<td>
									<h5>${Subtotal }</h5>
								</td>
							</tr>
							<tr class="out_button_area">
								<td class="d-none-l">

								</td>
								<td class="">

								</td>
								<td>

								</td>
								<td>
									<div class="checkout_btn_inner d-flex align-items-center">
										<a class="gray_btn" href="main.do">Continue Shopping</a>
										<a class="primary-btn ml-2" href="checkout.do">Proceed to checkout</a>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
	<!--================End Cart Area =================-->


	<script>
		function updateCart() {
			document.querySelectorAll('input[type="text"]').forEach(count => {
				let url = "updateCart.do?cartCode="+ count.id.substring(3) + "&itemCount=" + count.value;
				fetch(url);
			})
			location.href ="cart.do";
		}
		function deleteCart(btn) {
			let cartCode = btn.getAttribute('id').substring(4);
			let url = "deleteCart.do?cartCode="+ cartCode;
			fetch(url);
			btn.parentElement.parentElement.parentElement.remove();
		}
		function deleteAllCart() {
			let memberId = "${id}";
			let url = "deleteAllCart.do?memberId="+ memberId;
			fetch(url);
			document.querySelectorAll(".carts").forEach(t => {
				t.remove();
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
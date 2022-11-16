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

<style>
@font-face {
    font-family: 'LINESeedKR-Bd';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}

.orderlist{
font-family: 'LINESeedKR-Bd';
font-size: 20px;
color: black;
margin:100px auto;
}

</style>
</head>
<body>
	<section class="order_details section-margin--small">
		<div class="container">
			<h1>상품 조회</h1>
			<div class="row mb-5">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Product</th>
							<th scope="col">Price</th>
							<th scope="col">Quantity</th>
							<th scope="col">Total</th>
							<th scope="col">주문/배송현황</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${myshipping }" var="s" varStatus="status">
							<tr>
								<td>
									<div class="media">
										<div class="d-flex">
											<img src="upload/item/${s.itemImage }" alt="" width="200px"
												height="200px">
										</div>
										<div class="ship-media-body">
											<p class="orderlist">${s.itemTitle }</p>
										</div>
									</div>
								</td>
								<td>
									<p class="orderlist">${s.itemPrice }</p>
								</td>
								<td>
									<p class="orderlist">${s.itemCount }</p>
								</td>
								<td>
									<p class="orderlist">${s.itemCount * s.itemPrice}</p>
								</td>

								<td>
									<p class="orderlist">${s.orderState}</p> <!-- onclick="location.href='orderconfirm'" -->
								</td>
								<td>
									<button class="button orderlist button-confirm mr-auto mb-1"
										type="submit" width="30px" height="30px"
										onclick="shipConfirm(this)" margin="100px auto" style="color: ">구매확정</button>

								</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="row mb-5">	
			<h1>배송완료 물품</h1>
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
						<c:forEach items="${myendship }" var="s" varStatus="status">
							<tr>
								<td>
									<div class="media">
										<div class="d-flex">
											<img src="upload/item/${s.itemImage }" alt="" width="200px"
												height="200px">
										</div>
										<div class="media-body">
											<p class="orderlist">${s.itemName }</p>
										</div>
									</div>
								</td>
								<td>
									<p class="orderlist">${s.itemPrice }</h5>
								</td>
								<td>
									<p class="orderlist">${s.itemCount }</h5>
								</td>
								<td>
									<p class="orderlist">${s.itemCount * s.itemPrice}</h5>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
	</section>
	<script type="text/javascript">
		//  let a = document.querySelector('button.button-confirm').parentElement.parentElement.childNodes[1].childNodes[1].childNodes[3].childNodes[1].textContent
		function shipConfirm(e) {
			let itemname = e.parentElement.parentElement.childNodes[1].childNodes[1].childNodes[3].childNodes[1].textContent;
			let url = "shipconfirm.do?itemname=" + itemname;
			location.href = url;
		}
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Aroma Shop - Checkout</title>
<link rel="icon" href="img/Fevicon.png" type="image/png" />

<link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="vendors/fontawesome/css/all.min.css" />
<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css" />
<link rel="stylesheet" href="vendors/linericon/style.css" />
<link rel="stylesheet"
	href="vendors/owl-carousel/owl.theme.default.min.css" />
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css" />
<link rel="stylesheet" href="vendors/nice-select/nice-select.css" />
<link rel="stylesheet" href="vendors/nouislider/nouislider.min.css" />

<link rel="stylesheet" href="css/style.css" />

</head>
<body>
	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Product Checkout</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">
								Checkout</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->

	<!--================Checkout Area =================-->
	<section class="checkout_area section-margin--small">
		<div class="container">
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
											<img src="upload/item/${cart.itemImage }" alt=""
												width="150px" height="150px">
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
									<h5>${cart.itemCount}</h5>
								</td>
								<td>
									<h5 id="total">${cart.itemPrice*cart.itemCount}</h5>
								</td>
								<c:set var="Subtotal"
									value="${Subtotal + (cart.itemPrice*cart.itemCount)}"></c:set>
							</tr>
						</c:forEach>
						<tr>
							<td></td>
							<td></td>
							<td>
								<h5>Subtotal</h5>
							</td>
							<td>
								<h5>${Subtotal }</h5>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="billing_details">
				<div class="row">
					<div class="col-lg-8">
						<h3>Billing Details</h3>
						<form class="row contact_form" action="#" method="post"
							novalidate="novalidate">
							<div class="col-md-6 form-group p_star">
								<label for="name">이름</label> <input type="text" id="name"
									name="name" value="${name }" /> <span class="placeholder"
									data-placeholder="First name"></span>
							</div>
							<div class="col-md-6 form-group p_star">
								<label for="phone">전화번호</label> <input type="text" id="phone"
									name="phone" />
							</div>
							<div class="col-md-6 form-group p_star">
								<label for="postal_code">우편번호</label> <input type="text"
									id="postal_code" name="postal_code" />
									<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
							</div>
							<div class="col-md-12 form-group p_star">
								<label for="address">주소</label> <input type="text"
									class="form-control" id="address" name="address"
									value="${address }" />
							</div>
							<div class="col-md-12 form-group p_star">
								<label for="detail_address">상세주소</label> <input type="text"
									class="form-control" id="detail_address" name="detail_address" />
							</div>
							<div class="col-md-12 form-group mb-0">
								<div class="creat_account">
									<h3>Shipping Details</h3>
								</div>
								<textarea class="form-control" name="message" id="message"
									rows="1" placeholder="Order Notes"></textarea>
							</div>
						</form>
					</div>
					<div class="col-lg-4">
						<div class="order_box">
							<h2>Your Order</h2>
							<ul class="list">
								<li><a href="#"><h4>
											Product <span>Total</span>
										</h4></a></li>
								<c:forEach var="cart" items="${carts }">
									<li><a href="#">${cart.itemName }<span class="middle">x
												${cart.itemCount }</span> <span class="last">${cart.itemPrice*cart.itemCount}</span>
									</a></li>
								</c:forEach>
							</ul>
							<ul class="list list_2">
								<li><a href="#">Subtotal <span>${Subtotal }</span></a></li>
								<c:set var="delivery" value="3000"></c:set>
								<li><a href="#">delivery <span>3000</span></a>
								</li>
								<li><a href="#">Total <span id="total">${Subtotal + delivery }</span></a></li>
							</ul>
							<div class="payment_item">
								<div class="radion_btn">
									<input type="radio" id="f-option5" name="selector" /> <label
										for="f-option5">Check payments</label>
									<div class="check"></div>
								</div>
								<p>Please send a check to Store Name, Store Street, Store
									Town, Store State / County, Store Postcode.</p>
							</div>
							<div class="payment_item active">
								<div class="radion_btn">
									<input type="radio" id="f-option6" name="selector" /> <label
										for="f-option6">Paypal </label> <img
										src="img/product/card.jpg" alt="" />
									<div class="check"></div>
								</div>
								<p>Pay via PayPal; you can pay with your credit card if you
									don’t have a PayPal account.</p>
							</div>
							<div class="creat_account">
								<input type="checkbox" id="f-option4" name="selector" /> <label
									for="f-option4">I’ve read and accept the </label> <a href="#">terms
									& conditions*</a>
							</div>
							<div class="text-center">
								<a class="button button-paypal" href="#" onclick="requestPay();return false;">Proceed to Paypal</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Checkout Area =================-->

<script>
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                //document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postal_code').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detail_address").focus();
        }
    }).open();
}   
	function requestPay() {
		console.log('확인');
		let email = "${email}";
		console.log(email);
		let total = document.getElementById("total").innerText;
		console.log(total);
		let name = "${name}";
		console.log(name);
		let tel = document.getElementById("phone").value;
		console.log(tel);
		let addr1 = document.getElementById("address").value;
		let addr2 = document.getElementById("detail_address").value;
		let addr = addr1 + " " + addr2;
		console.log(addr);
		let postcode = document.getElementById("postal_code").value;
		console.log(postcode);
		
	    IMP.init('imp54500213') // 예: imp00000000
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "kakaopay.TC0ONETIME",
          pay_method: "card",
          merchant_uid: 'NP_' + new Date().getTime(),
          name: "뉴커머스",
          amount: total,
          buyer_email: email,
          buyer_name: name,
          buyer_tel: tel,
          buyer_addr: addr,
          buyer_postcode: postcode
      }, function (rsp) { // callback
          if (rsp.success) {
			if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
				let msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
		console.log('성공')
		let url = "confirmation.do?merchant_uid=" + rsp.merchant_uid + "&total=" + total;
		location.href = url;
          } else {
			let msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
		console.log('msg')
          }
		}
      });
    }

</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

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

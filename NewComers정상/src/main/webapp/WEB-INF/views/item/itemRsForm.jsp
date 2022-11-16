<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<!--================ Item register Area =================-->
	<section class="Item_register_area section-margin">
		<div class="container">
			<div class="row">
				</div>
						<h3>Register a item</h3>
						<br>
						<form class="row Item_register" action="./ItemRs.do" method="post" enctype="multipart/form-data" style="width: 700px">
							<div class="form-group" style="width: 700px">
								<hr>
								<h5>Category</h5>
								<br>
									<label>베이커리<input type="checkbox" id="itemCategory" name="itemCategory" value="베이커리" style="width: 40px" onclick="clickCheck(this)" /></label>
									<label>젤리<input type="checkbox" id="itemCategory" name="itemCategory" value="젤리" style="width: 40px" onclick="clickCheck(this)" /></label>
									<label>반려동물용품<input type="checkbox" id="itemCategory" name="itemCategory" value="반려동물용품" style="width: 40px" onclick="clickCheck(this)" /></label>
									<label>반찬<input type="checkbox" id="itemCategory" name="itemCategory" value="반찬" style="width: 40px" onclick="clickCheck(this)" /></label>
									<label>생선<input type="checkbox" id="itemCategory" name="itemCategory" value="생선" style="width: 40px" onclick="clickCheck(this)" /></label>
								<hr>
							</div>
							<br>
							<br>
							<br>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="itemName" name="itemName" placeholder="Item Name"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Item Name'" required >
							</div>
							<br>
							<br>
							<br>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="itemTitle" required
									name="itemTitle" placeholder="item Title"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'item Titel'">
							</div>
							<br>
							<br>
							<br>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="itemPrice" required
									name="itemPrice" placeholder="Item Price"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Item Price'">
							</div>
							<br>
							<br>
							<br>
							<textarea class="col-md-12 form-group" required name="itemContent" id="itemContent" cols="90" rows="10"
								placeholder="Enter Content" style="width: 600"></textarea>
							<br>
							<br>
							<br>
							<!-- <div class="insert">
									<input id="itemImage1" name="itemImage1" type="file" onchange="addFile(this);" />
									<div class="file-list"></div>
							</div> -->
							
							<div class="col-md-12 form-group">
								<input type="file" class="form-control" id="itemImage1" name="itemImage1">
								<input type="file" class="form-control" id="itemImage2" name="itemImage2">
								<input type="file" class="form-control" id="itemImage3" name="itemImage3">
								<input type="file" class="form-control" id="itemImage4" name="itemImage4">
              				</div>
              				
							<!-- <div class="col-md-12 form-group">
								<input multiple="multiple" type="file" class="form-control" id="itemImage" name="itemImage" placeholder="item Image" onfocus="this.placeholder = ''" onblur="this.placeholder = 'item Image'">
              				</div><br><br><br>
   				
               				<select id='fruits' name='fruits' style="width:450px;" onchange='fruits_selected()'>
								<option value='' selected>-- 선택 --</option>
								<option value='a'>카테</option>
								<option value='b'>고리</option>
								<option value='c'>가져</option>
								<option value='d'>오기</option>
							</select>
							<script>
							function fruits_selected() {
								var obj = document.getElementById('fruits');
								var index = obj.selectedIndex;
								var value = obj.options[index].value;
								var text = obj.options[index].text;
								console.log( 'index=', index, 'value=', value, 'text=', text );
							}
							</script>
<!-- 							<div class="col-md-12 form-group">
								<input type="file" class="form-control" id="itemImage" name="itemImage" placeholder="Item Id" onfocus="this.placeholder = ''" onblur="this.placeholder = 'item Image'">
              				</div> -->
							<div class="col-md-12 form-group">
								<button type="submit" value="submit"
									class="button button-register w-100">Register</button>
							</div>
						</form>
					</div>
	</section>
	<!--================End Item register Area =================-->

	<script type="text/javascript">
	
	function clickCheck(target) {
	    document.querySelectorAll(`input[type=checkbox]`)
	        .forEach(el => el.checked = false);

	    target.checked = true;
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
	<style>
		body {
			margin: 0;
		}

		* {
			box-sizing: border-box;
		}

		p,
		span {
			margin: 0;
		}

		a {
			color: black;
		}

		img {
			display: block;
			width: 80%;
			height: 80px;
			margin: auto;
		}

		.cart {
			width: 80%;
			margin: auto;
			padding: 30px;
		}

		.cart ul {
			background-color: whitesmoke;
			padding: 30px;
			margin-bottom: 50px;
			border: whitesmoke solid 1px;
			border-radius: 5px;
			font-size: 13px;
			font-weight: 300;
		}



		table {
			border-top: solid 1.5px black;
			border-collapse: collapse;
			width: 100%;
			font-size: 14px;
		}

		thead {
			text-align: center;
			font-weight: bold;
		}

		tbody {
			font-size: 12px;
		}

		td {
			padding: 15px 0px;
			border-bottom: 1px solid lightgrey;
		}

		.cart__list__detail :nth-child(3) {
			vertical-align: top;
		}

		.cart__list__detail :nth-child(3) a {
			font-size: 12px;
		}

		.cart__list__detail :nth-child(3) p {
			margin-top: 6px;
			font-weight: bold;
		}

		.cart__list__smartstore {
			font-size: 12px;
			color: gray;
		}

		.cart__list__option {
			vertical-align: top;
			padding: 20px;
		}

		.cart__list__option p {
			margin-bottom: 25px;
			position: relative;
			color: black;
		}

		.cart__list__option p::after {
			content: "";
			width: 90%;
			height: 1px;
			background-color: lightgrey;
			left: 0px;
			top: 25px;
			position: absolute;
		}

		.cart__list__optionbtn {
			background-color: white;
			font-size: 10px;
			border: lightgrey solid 1px;
			padding: 7px;
		}

		.cart__list__detail :nth-child(5),
		.cart__list__detail :nth-child(6),
		.cart__list__detail :nth-child(7) {
			border-left: 2px solid whitesmoke;
		}

		.cart__list__detail :nth-child(6),
		.cart__list__detail :nth-child(7) {
			text-align: center;
		}

		.cart__list__detail :nth-child(6) button {
			background-color: pink;
			color: white;
			border: none;
			border-radius: 5px;
			padding: 4px 8px;
			font-size: 12px;
			margin-top: 5px;
		}

		.price {
			font-weight: bold;
		}

		.cart__mainbtns {
			width: 420px;
			height: 200px;
			padding-top: 40px;
			display: block;
			margin: auto;
		}

		.cart__bigorderbtn {
			width: 200px;
			height: 50px;
			font-size: 16px;
			margin: auto;
			border-radius: 5px;
		}

		.cart__bigorderbtn.left {
			background-color: white;
			border: 1px lightgray solid;
		}

		.cart__bigorderbtn.right {
			background-color: pink;
			color: white;
			border: none;
		}

		#img {
			width: 300px;
			height: 219px;
			margin: auto;
			text-align: center;
			border: none;
		}
	</style>

</head>

<body>
	<section class="cart">
		<div class="cart__information">
			<ul>
				<li>장바구니 상품은 최대 30일간 저장됩니다.</li>
				<li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
				<li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기 바랍니다.</li>
			</ul>
		</div>
		<table class="cart__list">
			<c:choose>
				<c:when test="${empty list }">
					<tr class="cart__list__detail">
						<td></td>
						<td><img id="img" src="productImage/cart_img.gif" alt=""></td>
					</tr>
				</c:when>
				<c:otherwise>
						<thead>
							<tr>
								<td><input type="checkbox" id="allCheck"></td>
								<td colspan="3">상품정보</td>
								<td>옵션</td>
								<td>상품금액</td>
								<td>배송비<p>3만원 이상 무료배송</p>
								</td>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${list }" var="vo">
								<tr class="cart__list__detail">
									<td><input type="checkbox" class="chk" name="product"
											value=${vo.productPrice*vo.selCnt } onclick="checkfunction()"></td>
									<td><input type="checkbox" id="pno" name="pno" value=${vo.productNo }
											style="display:none"></td>
									<td><a href="detailProduct.do?pno=${vo.productNo }"><img
												src="productImage/dog/${vo.productName }.png" alt=""></a></td>
									<td><a href="detailProduct.do?pno=${vo.productNo }">${vo.productName }</a><span
											class="cart__list__smartstore"> 스마트스토어</span>
										<br>
										<span class="price">${vo.productPrice }원</span>
									</td>
									<td class="cart__list__option">
										<p>모델명 : ${vo.productName }</p>
										<p>수량 : ${vo.selCnt }</p>
										<input type="button" value="▲" class="cart__list__optionbtn" onclick="upfunction(${vo.productNo})">
										<input class="cart__list__optionbtn" value="▼" type="button" onclick="downfunction(${vo.productNo},${vo.selCnt })">
										<input type="button" class="cart__list__optionbtn" value = "상품 삭제" onclick="delfunction(${vo.productNo})">
									</td>
									<td><span class="price">${vo.productPrice*vo.selCnt }원</span><br></td>
									<td>
										<c:choose>
											<c:when test="${vo.productPrice*vo.selCnt >= 30000}">
												무료
											</c:when>
											<c:otherwise>
												2500원
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</tbody>

						<tfoot>
							<tr>
								<td colspan="3"></td>
								<td>상품금액 : <h4 id="total">0</h4>
								</td>
								<td> 배송비 : <h4 id="price">0</h4>
								</td>
								<td>총 금액 : <h3 id="totalPrice">0</h3>
								</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tfoot>
				</c:otherwise>
			</c:choose>
		</table>

		<div class="cart__mainbtns">
			<button class="cart__bigorderbtn left" type="button" onclick="location.href='main.do'">쇼핑 계속하기</button>
			<button id="tess" class="cart__bigorderbtn right" type="button" onclick="paymentfunction()">주문하기</button>
		</div>
	</section>
</body>
<script>
	//체크박스 클릭
	$("#allCheck").click(function () {
		if ($("#allCheck").is(":checked")) {
			$(".chk").prop("checked", true);
			$(".chk").click(checkfunction());

		} else {
			$(".chk").prop("checked", false);
			$(".chk").click(checkfunction());
		}
	});
	var result = "";
	$(".chk").click(function () {
		if ($(".chk:checked").length == $(".chk").length) {
			$("#allCheck").prop("checked", true);
		} else {
			$("#allCheck").prop("checked", false);
		}
	});

	let sumPrice = 0;
	let addrPee = 2500;
	let price = 0;
	let total = 0;
	let str = 'paymentForm.do?uno=${uno}';
	let a = '';

	function checkfunction() {
		var checkBox = document.getElementsByName('product');
		var pno = document.getElementsByName('pno');
		for (var i = 0; i < checkBox.length; i++) {
			if (checkBox[i].checked) {
				sumPrice += parseInt(checkBox[i].value);
				str += ('&pno=' + pno[i].value);
			} else if (!checkBox[i].checked) {
				sumPrice = sumPrice;
			}
		}
		a = str;
		console.log(str)
		price = sumPrice;
		if (sumPrice == 0) {
			addrPee = 0;
		} else if (sumPrice < 30000) {
			addrPee = 2500;
		} else {
			addrPee = 0;
		}

		sumPrice = 0;
		str = 'paymentForm.do?uno=${uno}';

		document.getElementById('price').innerHTML = addrPee;
		document.getElementById('total').innerHTML = price;
		document.getElementById('totalPrice').innerHTML = addrPee + price;

	}

	function paymentfunction() {
		if ($(".chk:checked").length == 0) {
			alert('선택된 상품이 없습니다')
		} else {
			window.location.href = a;
		}
	}
	
	function delfunction(pno){
		fetch('deleteCart.do?pno='+pno+'&uno='+${uno})
		.then(resolve => resolve.json())
		.then(result => {
			if (result.retCode == 'OK') {
				window.location.href = "myCart.do?uno="+${uno};
			} else {
				alert("삭제 실패");
			}
		})
	}

	function upfunction(pno) {
		console.log(pno);
		fetch('updateCart.do?pno='+pno+'&uno='+${uno}+'&cnt=1')
			.then(resolve => resolve.json())
			.then(result => {
				console.log(result)
				if (result.retCode == 'OK') {
					window.location.href = "myCart.do?uno=" + ${uno};
				} else {
					alert("추가 실패");
					window.location.href = "myCart.do?uno=" + ${uno};
				}
			})
			.catch(error=>console.log(error))
	}
	
	function downfunction(pno,cnt){
		fetch('updateCart.do?pno='+pno+'&uno='+${uno}+'&cnt=-1')
		.then(resolve => resolve.json())
		.then(result => {
			if(cnt==1){
				alert('상품이 삭제되었습니다');
				delfunction(pno);
			}else{
				if (result.retCode == 'OK') {
					window.location.href = "myCart.do?uno=" + ${uno};
				} else {
					console.log(result)
					alert("실패");
					window.location.href = "myCart.do?uno=" + ${uno};
				}
			}
		})
		.catch(error=>console.log(error))
	}
</script>
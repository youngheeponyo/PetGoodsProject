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
		
		.cart__list__detail :nth-child(4),
		.cart__list__detail :nth-child(5),
		.cart__list__detail :nth-child(6) {
		  border-left: 2px solid whitesmoke;
		}
		
		.cart__list__detail :nth-child(5),
		.cart__list__detail :nth-child(6) {
		  text-align: center;
		}
		
		.cart__list__detail :nth-child(5) button {
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
            <form>
                <thead>
                    <tr>
                        <td><input type="checkbox" id="allCheck"></td>
                        <td colspan="2">상품정보</td>
                        <td>옵션</td>
                        <td>상품금액</td>
                        <td>배송비</td>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="vo">
                    <tr class="cart__list__detail" id="a11">
                        <td><input type="checkbox" class="chk" name value="check"></td>
                        <td><img src="productImage/dog/${vo.productName }.png" alt=""></td>
                        <td><a href="#">${vo.productName }</a><span class="cart__list__smartstore"> 스마트스토어</span>
                            <br><sapn class="price">${vo.productPrice }</sapn>
                        </td>
                        <td class="cart__list__option">
                            <p>모델명 : ${vo.productName } / ${vo.selCnt }개</p>
                            <button class="cart__list__optionbtn">주문조건 추가/변경</button>
                        </td>
                        <td><span class="price">${vo.productPrice*vo.selCnt }원</span><br>
                            <button class="cart__list__orderbtn" type = "button" onclick="location.href='paymentForm.do?${uno}'">주문하기</button>
                        </td>
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
                        <td colspan="3"><button class="cart__list__optionbtn">선택상품 삭제</button></td>
                        <td><h3>총 상품금액</h3></td><td><h3>총 배송비</h3></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tfoot>
            </form>
        </table>
        <div class="cart__mainbtns">
            <button class="cart__bigorderbtn left" type = "button" onclick="location.href='main.do'">쇼핑 계속하기</button>
            <button class="cart__bigorderbtn right" type = "button" onclick="location.href='paymentForm.do?${uno}'">주문하기</button>
        </div>
    </section>
</body>
<script>
//체크박스 클릭
$("#allCheck").click(function(){
	  if($("#allCheck").is(":checked")){
	 	 $(".chk").prop("checked", true);
	  }else{
	  	$(".chk").prop("checked", false);
	  }
	});
	var result = "";
$(".chk").click(function(){
	  if($(".chk:checked").length == $(".chk").length){
	  	$("#allCheck").prop("checked", true);
	   }else{
	  	$("#allCheck").prop("checked", false);
	  }
	});

	let sumPrice = 0;
	let addrPee = 2500;


	// 이벤트 일어나면
	// 해당 input이 가지고있는 productPrice +
	// if(sumPrice > 30000)
    // addrPee = 0;
	// 체크를 해제 할때도. sumPrice < 30000
	// addrPee = 2500;
	
</script>
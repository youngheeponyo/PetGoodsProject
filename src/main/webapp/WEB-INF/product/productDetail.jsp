<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:choose>
	<c:when test="${curShowPetType eq 0}">
		<c:set var="petType" value="dog" />
	</c:when>
	<c:otherwise>
		<c:set var="petType" value="cat" />
	</c:otherwise>
</c:choose>

<section class="py-5" id="top">

	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="col-md-6">
				<img class="card-img-top mb-5 mb-md-0"
					src="productImage/${petType }/${pno.productImage }" alt="..." />
			</div>
			<div class="col-md-6">
				<h1 class="display-5 fw-bolder">${pno.productName }</h1>
				<div class="fs-5 mb-5">
					<span style="font-size: 30px">₩ ${pno.productPrice }</span>
				</div>
				<p class="lead">${pno.productDesc }</p>
				<div class="d-flex">
					<input id="inputQuantity" type="number" pattern="[0-9]*"
						style="margin: 5px; padding: 5px; border-radius: 5px;"
						data-hook="number-input-spinner-input" aria-label="Quantity"
						max="99" min="1" value="1" name="cnt">
					<c:choose>
						<c:when test="${empty uno }">
							<button class="btn btn-outline-dark flex-shrink-0" type="button" onclick="location.href='loginForm.do'">
							<i class="bi-cart-fill me-1"></i> Add to cart</button>
						</c:when>
						<c:otherwise>
							<button class="btn btn-outline-dark flex-shrink-0" onclick="functionCart()">
							<i class="bi-cart-fill me-1"></i> Add to cart</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>

		<div class="container px-4 px-lg-5 my-5" style="text-align: center">
			<a
				style="border: none; padding: 10px 50px; color: black; font-size: 18px"
				href="#detail">상품 정보</a> <a
				style="border: none; padding: 10px 50px; color: black; font-size: 18px"
				href="#review">구매 후기</a> <a
				style="border: none; padding: 10px 50px; color: black; font-size: 18px"
				href="#qna">문의 게시판</a> <a
				style="border: none; padding: 10px 50px; color: black; font-size: 18px"
				href="#order">취소/교환/반품 안내</a>
			<hr>
		</div>
			<div class="container px-4 px-lg-5 my-5" style="text-align: center" id="detail">
				<h2 style="font: bolder; font-size: 30px; text-align: left">상품 정보</h2>
				<img style="width: 50%;" src="productDetailImage/${petType }/${pno.productImage }" alt="" />
			</div>
		<hr>
		<div id="review">
			<h2 style="font: bolder; font-size: 30px; text-align: left">구매
				후기</h2>
			<h3>구매후기입니다~~~</h3>
		</div>
		<hr>
		
		<!-- 문의게시판 건드린 부분 -->
		<form action=addUserQnaForm.do name=productDetail method="post">
		<div id="qna">
			<h2 style="font: bolder; font-size: 30px; text-align: left">문의
				게시판</h2>
			<table class="table" style="text-align: center">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자번호</th>
						<th>작성일</th>
						<th>문의상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${qlist }" var="qvo">
						<tr>
							<td>${qvo.qnaNo}</td>
							<td><a href="getUserQnaList.do?vo=${qvo.qnaNo}">${qvo.title }</a></td>
							<td>${qvo.userNo }</td>
							<td><c:choose>
									<c:when test="${!empty qvo.qnaNo }">
										<c:choose>
											<c:when test="${qvo.qnaState==1 }">
                    						답변완료
                    					</c:when>
											<c:otherwise>
                    						문의대기중
                    					</c:otherwise>
										</c:choose>
									</c:when>

								</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			 <p><input type="submit" value="문의글 작성" >
				<input type="hidden" name=pName value="${pno.productName }" >
				<input type="hidden" name=pNo value="${vo.productNo }">
			</p>
		</div>
		<hr>
		</form>
		<!-- 여기까지 -->
		
		
		<div id="order">
			<h2 style="font: bolder; font-size: 30px; text-align: left">취소/교환/반품
				안내</h2>
			<ul id="list">
				<li>주문취소는 '입금대기, 입금완료' 단계에서만 가능합니다.</li>
				<li>주문 내 일부 상품의 부분 취소는 불가능합니다.</li>
				<li>주문취소는 '마이페이지 > 주문 · 배송 > 주문취소 > 주문 상세 보기' 를 통해 직접 취소하실 수 있습니다.</li>
				<li>교환 및 반품은 배송 완료일 기준으로 7일 이내 신청 가능합니다.</li>
				<li>단순변심으로 인한 교환/반품은 고객님께서 배송비를 부담하셔야 합니다.</li>
			</ul>
		</div>

		
		<a href="#top"><button style="float: right; margin: 30px">▲</button></a>
	</div>
</section>
<!-- Related items section-->
<section class="py-5 bg-light">
	<div class="container px-4 px-lg-5 mt-5">
		<h2 class="fw-bolder mb-4">Related products</h2>
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<!-- 상품목록 -->
			<c:forEach items="${list }" var="vo" end="3">
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top"
							src="productImage/${petType }/${vo.productImage }" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">${vo.productName }</h5>
								<!-- Product reviews-->
								<div
									class="d-flex justify-content-center small text-warning mb-2">
								</div>
								<!-- Product price-->
								<span>₩ ${vo.productPrice }</span>
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto"
									href="detailProduct.do?pno=${vo.productNo }">자세히 보기</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>

<script>
function functionCart() {
	let pno = ${pno.productNo};
	let count = document.getElementById('inputQuantity').value;
	fetch('cartCheck.do?pno='+pno+'&uno='+${uno})
	.then(resolve=>resolve.json())
	.then(result=>{
		if(result.retCode=='OK'){
			fetch('updateCart.do?pno='+pno+'&uno='+${uno}+'&cnt='+count)
			.then(resolve=>resolve.json())
			.then(result=>{
				console.log(result)
				if(result.retCode=='OK'){
					alert("장바구니에 추가되었습니다");
						window.location.href = "myCart.do?uno=" + ${uno};
				}else{
					alert("추가 실패");
				}
			})
		}else{
			fetch('addCart.do?pno='+pno+'&uno='+${uno}+'&cnt='+count)
			.then(resolve=>resolve.json())
			.then(result=>{
				console.log(result)
				if(result.retCode=='OK'){
					alert("장바구니에 추가되었습니다");
						window.location.href = "myCart.do?uno=" + ${uno};
				}else{
					alert("추가 실패");
				}
			})
		}
	})

	
}
	
</script>

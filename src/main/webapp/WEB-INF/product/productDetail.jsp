<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
	<c:when test="${curShowPetType eq 0}">
		<c:set var="petType" value="dog" />
	</c:when>
	<c:otherwise>	
		<c:set var="petType" value="cat" />
	</c:otherwise>
</c:choose>

<section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="productImage/${petType }/${pno.productImage }" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">${pno.productRegist }</div>
                        <h1 class="display-5 fw-bolder">${pno.productName }</h1>
                        <div class="fs-5 mb-5">
                            <span>가격  ${pno.productPrice }원</span>
                        </div>
                        <p class="lead">${pno.productDesc }</p>
                        <div class="d-flex">
                            <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />
                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                <i class="bi-cart-fill me-1"></i>
                                Add to cart
                            </button>
                        </div>
                    </div>
                </div>
                
				<div class="container px-4 px-lg-5 my-5" style="text-align:center">
					<a style="border:none;padding:10px 50px;color:black;font-size:18px" href="#detail">상품 정보</a>
					<a style="border:none;padding:10px 50px;color:black;font-size:18px" href="#review">구매 후기</a>
					<a style="border:none;padding:10px 50px;color:black;font-size:18px" href="#qna">문의 게시판</a>
					<a style="border:none;padding:10px 50px;color:black;font-size:18px" href="#order">취소/교환/반품 안내</a>
					<hr>
				</div>
				<div class="container px-4 px-lg-5 my-5" style="text-align:center" id="detail">
				<h2 style="font:bolder;font-size:30px;text-align:left">상품 정보</h2>
				<img style="width:50%;" src="productImage/detail/${pno.productDetailImage }" alt="" />
				</div>
				<hr>
				<div id="review">
				<h2 style="font:bolder;font-size:30px;text-align:left">구매 후기</h2>
					<h3>구매후기입니다~~~</h3>
				</div>
				<hr>
				<div id="qna">
				<h2 style="font:bolder;font-size:30px;text-align:left">문의 게시판</h2>
					<table class = "table" style= text-align:center>
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
                    		<tr>
                    			<td>${qno.qnaNo}</td>
                    			<td><a href ="getUserQnaList.do?vo=${qno.qnaNo}">${qno.title }</a></td>
                    			<td>${qno.userNo }</td>
                    			<td>
                    			<c:choose>
                    			<c:when test="${!empty qno.qnaNo }">
                    				<c:choose>
                    					<c:when test="${qno.qnaState==1 }">
                    						답변완료
                    					</c:when>
                    					
                    					<c:otherwise>
                    						문의대기중
                    					</c:otherwise>
                    				</c:choose>
                    			</c:when>
                    			
                    			</c:choose>
                    			
                    			</td>
                    		</tr>
                    	</tbody>
                    </table>
				</div>
				<hr>
				<div id="order">
				<h2 style="font:bolder;font-size:30px;text-align:left">취소/교환/반품 안내</h2>
					<ul>
						<li>주문취소는 '입금대기, 입금완료' 단계에서만 가능합니다.</li>
						<li>주문 내 일부 상품의 부분 취소는 불가능합니다.</li>
						<li>주문취소는 '마이페이지 > 주문 · 배송 > 주문취소 > 주문 상세 보기' 를 통해 직접 취소하실 수 있습니다.</li>
						<li>교환 및 반품은 배송 완료일 기준으로 7일 이내 신청 가능합니다.</li>
						<li>단순변심으로 인한 교환/반품은 고객님께서 배송비를 부담하셔야 합니다.</li>
					</ul>
				</div>
            </div>
        </section>
        
        
        
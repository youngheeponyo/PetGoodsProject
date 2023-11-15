<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
#list span {
	margin: 8px;
}

.pagination {
	/* 		display: inline-block; */
	
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}
</style>

${userVo } ${productVo }
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div class="container-fluid">
			<form action="modifyUserQnaForm.do" name="userQnaDetailForm" method="post" style=text-align:center>
				<input type="hidden" name="qnaNo" value="${vo.qnaNo }">
				<h3>문의글 작성</h3>
				<br><hr>
				<table class="table" border="1">
					<tr>
						<th colspan="2">글번호</th>
							<td><input type="hidden" name="maxQnaNO" value="${maxQnaNO}">${maxQnaNO}</td>	
						<th colspan="2">작성자</th>
							<td></td>
						<th colspan="2">작성일시</th>
							<td>
								<fmt:formatDate value=""
								pattern="yyyy-MM-dd  hh:mm"></fmt:formatDate>
							</td>
						<th colspan="2">문의상태</th>
							<td><p style="color: red;"><b>문의대기중</b></p></td>
					</tr>


					<tr>
						<th colspan="2">글제목</th>
						<td><input type=text name="title" value=""></td>
						
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${상품상세페이지에서 전해받은 상품이름이 있다면}"> --%>
<!-- 							<th colspan="1">문의종류<th> -->
<!-- 							<td><select name="qnaType" disabled> -->
<!-- 									<option value="상품문의" selected>상품문의</option> -->
<!-- 								</select></td>	 -->
<!-- 							<th colspan="2">상품명</th> -->
<!-- 							<td>해당상품명<td> -->
<%-- 						</c:when> --%>
						
<%-- 						<c:otherwise> --%>
<!-- 							<th colspan="1">문의종류<th> -->
<!-- 							<td> -->
<!-- 								<select name="qnaType"> -->
<!-- 									<option value="상품문의" selected>상품문의</option> -->
<!-- 									<option value="배송문의">배송문의</option> -->
<!-- 									<option value="교환/환불문의">교환/환불문의</option> -->
<!-- 									<option value="기타문의">기타문의</option> -->
<!-- 								</select> -->
<!-- 							</td>	 -->
<%-- 							<c:if test="${상품타입이 상품문의라면}"> --%>
<!-- 								<th colspan="2">상품명</th> -->
<!-- 								<td> -->
<!-- 									<select> -->
<%-- 										<c:forEach items="" var="product"> --%>
<%-- 											<option value="${}">${}</option> --%>
<%-- 										</c:forEach> --%>
<!-- 									</select> -->
<!-- 								<td> -->
<%-- 							</c:if> --%>
<%-- 						</c:otherwise> --%>
						
<%-- 					</c:choose> --%>
						
<!-- 						
<%-- 							<c:choose> --%>
<%-- 								<c:when test="상품페이지에서 넘어왔을때"><!-- 상품이랑 사람 조인 후 구매내역이 있을때 --> --%>
<%-- 											${productVo.productNo } --%>
<%-- 								</c:when> --%>
<%-- 								<c:otherwise> --%>
<!-- 									<select name="product"> -->
<%-- 											<c:forEach items="${상품목록}" var="product"><!-- 상품개수만큼 --> --%>
<%-- 											<option value="">${product.해당상품의 이름 }</option> --%>
<%-- 											</c:forEach> --%>
<!-- 									</select> -->
<%-- 								</c:otherwise> --%>
<%-- 							</c:choose> --%>
						<td>
					</tr>


					<tr><!-- 컨텐츠 -->
						<td colspan="14"><textarea rows="10" cols="40"
								class="form-control" name="contents">여기에 삽입</textarea></td>
					</tr>
					<tr>
						<td colspan="14" align="center" >
						<input type="submit" value="등록하기"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</section>				
			<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<script>
	function test(){
		console.log("ddd");
	}
	
</script>


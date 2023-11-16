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

console.log(${userVo });
console.log(${categoryNoList });
console.log(${productNameList });


<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div class="container-fluid">
			<form action="addUserQna.do" name="addQnaForm" method="post"
				style="text-align: center">
				<h3>문의글 작성</h3>
				<br>
				<hr>
				<table class="table" border="1">
					<tr>
						<th colspan="2">글번호</th>
						<td><input type="hidden" name="maxQnaNO" value="${maxQnaNO}">${maxQnaNO}</td>
						<th colspan="2">작성자</th>
						<td><input type="hidden" name="nickName"
							value="${uservo.nickName}">${uservo.nickName }</td>

						<th colspan="2">작성일시</th>
						<td></td>
						<th colspan="2">문의상태</th>
						<td><p>
								<b>문의대기중</b>
							</p></td>
					</tr>
					<tr>
						<th colspan="2">글제목</th>
						<td><input type=text name="title" value=""></td>



						<c:choose>
							<!-- 상품페이지에서 문의게시판에 접속하면 -->
							<c:when test="${not empty pName}">
								<th colspan="1">문의종류
								<th>
								<td><select name="qnaType" disabled>
										<option value="상품문의" selected>상품문의</option>
								</select></td>
								<th colspan="2">상품명</th>
								<td><input type="hidden" name="pName" value="${pName}">${pName}
								<td>
							</c:when>

							<!-- 바깥에서 문의게시판을 접속하면 -->
							<c:otherwise>
								<th colspan="1">문의종류
								<th>
								<td><select name="qnaType">
										<option value="상품문의" selected>상품문의</option>
										<option value="배송문의">배송문의</option>
										<option value="교환/환불문의">교환/환불문의</option>
										<option value="기타문의">기타문의</option>
								</select></td>
								
								<!-- 상품타입이 상품문의라면 -->
<%-- 								<c:if test="${상품타입이 상품문의라면}"> --%>
									<!-- 상품명 항목 추가 후, -->
									<th colspan="2">상품명</th>
									<!-- 카테고리 이름먼저 나오고 -->
									<td>
									<c:forEach items="${categoryNoList}" var="categoryList">
										<optgroup label="${categoryList.categoryName}">

											<!-- 해당 카테고리의 번호에 맞는 상품이 나열됨 -->
<%-- 											<c:forEach items="${productNameList}" var="productList"> --%>
<%-- 												<c:if test="${{categoryList.categoryNo == productList.categoryNo}"> --%>
<%-- 													<option value="${productList.productName }">${productList.productName }</option> --%>
<%-- 												</c:if> --%>
<%-- 											</c:forEach> --%>

										</optgroup>
									</c:forEach>
									</td>
<%-- 								</c:if> --%>
							</c:otherwise>
						</c:choose>
					</tr>


					<tr>
						<!-- 컨텐츠 -->
						<td colspan="14"><textarea rows="10" cols="40"
								class="form-control" name="contents">여기에 삽입</textarea></td>
					</tr>
					<tr>
						<td colspan="14" align="center"><input type="submit"
							value="등록하기"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</section>
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<script>
	function test() {
		console.log("ddd");
	}
</script>


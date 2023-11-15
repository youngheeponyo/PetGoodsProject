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

<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div class="container-fluid">
			<form action="modifyForm.do" name="myFrm" style=text-align:center;>
				<input type="hidden" name="bno" value="">
				<h3>문의글 작성</h3>
				<br><hr>
				<table class="table" border="1">
					<tr>
						<th colspan="2">글번호</th>
							<td>${vo.qnaNo }</td>	
						<th colspan="2">작성자</th>
							<td>${userVo.nickName }</td>
						<th colspan="2">작성일시</th>
							<td>
								<fmt:formatDate value="${vo.registDate }"
								pattern="yyyy-MM-dd  hh:mm"></fmt:formatDate>
							</td>
						<th colspan="2">문의상태</th>
							<td>
								<c:if test="${not empty vo.qnaNo}">
	                    				<c:choose>
	                    					<c:when test="${vo.qnaState==1 }" >
	                    						<p style="color: blue;"><b>답변완료</b></p>
	                    					</c:when>
	                    					<c:otherwise>
	                    						<p style="color: red;"><b>문의대기중</b></p>
	                    					</c:otherwise>
	                    				</c:choose>
                    				</c:if>
							</td>
					</tr>


					<tr>
						<th colspan="2">글제목</th>
						<td>${vo.title }</td>
						<th colspan="1">문의종류<th>
						<td>${vo.qnaType }<td>
						
						<c:if test="${vo.qnaType =='상품문의'}">
							<th colspan="2">상품명</th>
							<td>${productVo.productName }<td>
						</c:if>
						
						
						
						
						
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


					<tr>
						<td colspan="14"><textarea rows="10" cols="40"
								class="form-control" disabled>${vo.contents }</textarea></td>
					</tr>

					<tr>
						
					</tr>

					<tr>
						<td colspan="14" align="center" >
						<c:choose>
							<c:when test="${not empty uno && uno ==userVo.userNo }">
								<input type="submit" value="수정">
								<input type="button" value="삭제">
							</c:when>
							<c:otherwise>
								<input disabled type="submit" value="수정">
								<input disabled type="button" value="삭제">
							</c:otherwise>
						</c:choose>
						
						
						</td>
					</tr>
				</table>
			</form>
			
			
			<br><br>
			<form style=text-align:center action="qnaReply.do" method="post">
				<input type="hidden" name="qnaNo" value="${vo.qnaNo }">
				<h3>문의답변</h3>
				<br><hr>
				<table class="table">
					
						<c:choose>
							<c:when test="${vo.qnaState ==1 }">
								<tr>
									<td><textarea rows="10" cols="40" class="form-control" disabled>${vo.qnaReply }</textarea></td>
								</tr>
							</c:when>
							
							
							<c:otherwise>
								<c:choose>
								
									<c:when test="${permission =='0'}"> <!-- 관리자일때 -->
									<tr>
										<td><textarea rows="10" cols="40" class="form-control" name="reply"></textarea></td>
									</tr>
									<tr>
										<td><input type="submit" value="등록하기"></td>
									</tr>
									</c:when>
									
									<c:otherwise>
										<td><textarea rows="" cols="40" class="form-control" disabled>*아직 답변이 달리지 않았습니다.*</textarea></td>
									</c:otherwise>
									
								</c:choose>
							</c:otherwise>
						</c:choose>
				</table>
				<p>
					<a href="getUserQnaAllList.do">목록으로</a>
				</p>
			</form>
			
			
		</div>
	</div>
</section>



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
						<th>글번호</th>
							<td>${vo.qnaNo }</td>	
						<th>작성자</th>
							<td>${userVo.nickName }</td>
						<th>작성일시</th>
							<td>
								<fmt:formatDate value="${vo.registDate }"
								pattern="yyyy-MM-dd hh:mm"></fmt:formatDate>
							</td>
						<th>문의상태</th>
							<td>
								<c:if test="${not empty vo.qnaNo}">
	                    				<c:choose>
	                    					<c:when test="${vo.qnaState==49 }">
	                    						답변완료
	                    					</c:when>
	                    					<c:otherwise>
	                    						문의대기중
	                    					</c:otherwise>
	                    				</c:choose>
                    				</c:if>
							</td>
					</tr>


					<tr>
						<th colspan="3">글제목</th>
						<td>${vo.title }</td>
						<th>상품명</th>
						<td>
							
<%-- 							<c:choose> --%>
<%-- 								<c:when test="상품페이지에서 넘어왔을때"><!-- 상품이랑 사람 조인 후 구매내역이 있을때 --> --%>
<%-- 											<option value="">${상품페이지의 상품}</option> --%>
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
						<td colspan="8"><textarea rows="10" cols="40"
								class="form-control" disabled>${vo.contents }</textarea></td>
					</tr>

					<tr>
						
					</tr>

					<tr>
						<td colspan="8" align="center"><input type="submit"
							value="수정"> <input type="button" value="삭제"></td>
					</tr>
				</table>
			</form>
			<p>
				<a href="getUserQnaAllList.do">목록으로</a>
			</p>
			<br><br>
			
			
			<form style=text-align:center style=visibility:hidden;>
				<h3>문의답변</h3>
				<br><hr>
				<table class="table">
					<tr>
						<td><textarea rows="5" cols="40" class="form-control"
								disabled="disabled">${vo.qnaReply }</textarea></td>
					</tr>
				</table>
			</form>
			
			
		</div>
	</div>
</section>



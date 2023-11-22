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
			<form action="modifyUserQna.do" name="modifyUserQna" method="post" style=text-align:center;>
				<input type="hidden" name="qnaNo" value="${userQnaVo.qnaNo }">
<!-- 				<input type="hidden" name="registDate"  -->
<%-- 				value="<fmt:formatDate value="${userQnaVo.registDate }" --%>
<%-- 								pattern="yyyy-MM-dd hh:mm"></fmt:formatDate>"> --%>
				
				<h3>문의글 작성</h3>
				<br><hr>
				<table class="table" border="1">
					<tr>
						<th colspan="2">글번호</th>
							<td>${userQnaVo.qnaNo }</td>	
						<th colspan="2">작성자</th>
							<td>${userVo.nickName }</td>
						<th colspan="2">작성일시</th>
							<td>
								<fmt:formatDate value="${userQnaVo.registDate }"
								pattern="yyyy-MM-dd hh:mm"></fmt:formatDate>
							</td>
						<th colspan="2">문의상태</th>
							<td>
								<c:if test="${not empty userQnaVo.qnaNo}">
	                    				<c:choose>
	                    					<c:when test="${userQnaVo.qnaState==1 }" >
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
						<td><input type="text" name="title" value="${userQnaVo.title }"></td>
						<th colspan="1">문의종류<th>
						<td>${userQnaVo.qnaType }<td>
						
						<c:if test="${userQnaVo.qnaType =='상품문의'}">
							<th colspan="2">상품명</th>
							<td>${productVo.productName }<td>
						</c:if>
						<td>
					</tr>


					<tr>
						<td colspan="14"><textarea rows="10" cols="40" name="contents"
								class="form-control">${userQnaVo.contents }</textarea></td>
					</tr>

					<tr>
						
					</tr>

					<tr>
						<td colspan="14" align="center" >
							<input type="submit" value="수정완료">
							<input type="reset" value="초기화">
						</td>
					</tr>
				</table>
				<p>
					<a href="getUserQnaAllList.do">목록으로</a>
				</p>
			</form>
		</div>
	</div>
</section>



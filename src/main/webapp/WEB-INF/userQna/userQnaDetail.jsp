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
			<form action="modifyForm.do" name="myFrm">
				<input type="hidden" name="bno" value="">
				<table class="table" border="1">
					<tr>
						<th>글번호</th>
						<td>${vo.title }</td>
						<th>작성일시</th>
						<td><fmt:formatDate value ="${vo.registDate }" pattern="yyyy-MM-dd hh:mm"></fmt:formatDate></td>
					</tr>


					<tr>
						<th>글제목</th>
						<td>${vo.title }</td>
						<th>상품명</th>
						<td></td>
					</tr>


					<tr>
						<td colspan="4">
							<textarea rows="5" cols="40" class="form-control" disabled>언제 입고 되나요?</textarea>
						</td>
					</tr>
					
					<tr>
						<th>작성자</th>
						<td>김은별</td>
						<th></th>
						<td></td>
					</tr>

					<tr>
						<td colspan="4" align="center">
							<input type="submit" value="수정">
							<input type="button" value="삭제">
						</td>
					</tr>
				</table>
			</form>

			<h3>문의답변등록</h3>
			<table class="table">
				<tr>
					<td><textarea rows="5" cols="40" class="form-control"></textarea></td>
				</tr>
				<tr>
					<td><button id="addReply">댓글등록</button></td>
				</tr>
			</table>

			<h3>문의답변</h3>
			<table class="table">
				<tr>
					<td><textarea rows="5" cols="40" class="form-control" disabled="disabled">답변입니다. 다음주 중 입고 됩니다.</textarea></td>
				</tr>
			</table>
		</div>
	</div>
</section>

<!-- 댓글 페이지-->
<div class="pagination"></div>

<p>
	<a href="boardList.do">목록으로</a>
</p>

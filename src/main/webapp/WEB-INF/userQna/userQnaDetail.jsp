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
			<form action="modifyUserQnaForm.do" name="userQnaDetailForm" method="post" style=text-align:center;>
				<input type="hidden" name="qnaNo" value="${vo.qnaNo }">
				<h3>문의글</h3>
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
						<th colspan="1">문의상태</th>
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
								<c:choose>
									<c:when test="${vo.qnaState==1 }">
										<input disabled type="submit" value="수정">
										<input type="button" value="삭제">
									</c:when>
									<c:otherwise>
										<input type="submit" value="수정">
										<input type="button" value="삭제">
									</c:otherwise>
								</c:choose>
							
							
								
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
						
			<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
			
				</table>
				<p>
					<a href="myProdQnaDetailForm.do">목록으로</a>
				</p>
			</form>
			
			
		</div>
	</div>
</section>

<script>//삭제버튼 이벤트
	document.querySelector("input[type=button]").addEventListener('click', function(e){
		if(confirm("정말 삭제하시겠습니까?")==true){
			console.log("삭제버튼 눌렸음");
			 
			document.forms.userQnaDetailForm.action="deleteUserQna.do";
			document.forms.userQnaDetailForm.submit();
		}
		
	})
	
	
	//수정버튼 이벤트(목록으로 돌아감)
// 	document.querySelector("input[name=modify]").addEventListener('click', function(e){
// 		alert("수정이 완료 되었습니다")
// 	})

</script>



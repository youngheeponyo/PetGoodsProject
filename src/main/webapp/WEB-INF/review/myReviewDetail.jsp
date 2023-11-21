<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %> 

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
		${reviewVo }
			<form action="modifyReviewForm.do" name="myReviewDetail" method="post" style=text-align:center;>
				<input type="hidden" name="reviewNo" value="${reviewVo.reviewNo }">
				<h3>나의 리뷰</h3>
				${reviewVo.reviewNo }
				<br><hr>
				<table class = "table" style= text-align:center>
<!--                     <table id="datatablesSimple" style=text-align:center> -->
                    	<thead >
                    		<tr style=text-align:center>
                    			<th>상품이름</th>
                    			<th>별점</th>
                    			<th>작성자</th>
                    			<th>등록날짜</th>
                    			<th>좋아요</th>
                    		</tr>
                    	</thead>
                    	<tbody>
							<tr>
                    			<td>${reviewVo.productName }</td>
                    			<td>${reviewVo.starCnt }</td>
                    			<td>${reviewVo.nickName }</td>
                    			<td><fmt:formatDate value ="${reviewVo.reviewDate }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                    			<td>${reviewVo.reviewLikeCnt }</td>
                    			
                    		</tr>
                    		
                    		<tr><th colspan="3">사진첨부</th>
                    		<th colspan="3">내용</th>
                    		</tr>
                    			<tr>
                    				<td colspan="3">
                    				<c:choose>
                    					<c:when test="${reviewVo.reviewImage eq null }"><p style="color:gray;">사진을 첨부하지 않았습니다<p></c:when>
                    					<c:otherwise><img style="width:50%" src="reviewImage/${reviewVo.reviewImage }"></c:otherwise>
                    				</c:choose>
                    				<br><br>
                    				</td>
                    				<td colspan="3"><textarea cols="40" rows="5" name="content" class = "form-control" disabled>${reviewVo.content}</textarea></td>
                    			</tr>
                    			<tr><td colspan="6">
										<input type="submit" value="수정">
										<input type="button" value="삭제">
								</td></tr>
					</tbody>
				</table>
				<p>
					<a href="myReviewDetailForm.do">리뷰목록으로</a>
				</p>
			</form>
			
			
		
						
			<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
			
				
			
			
		</div>
	</div>
</section>

<script>//삭제버튼 이벤트
	document.querySelector("input[type=button]").addEventListener('click', function(e){
		if(confirm("정말 삭제하시겠습니까?")==true){
			console.log("삭제버튼 눌렸음");
			let reviewNo = document.querySelector("input[name=reviewNo]").value
			document.forms.myReviewDetail.action="deleteUserQna.do?reviewNo=" + reviewNo;
			document.forms.myReviewDetail.submit();
		}
		
	})

</script>



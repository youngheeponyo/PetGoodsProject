<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %> 

<body>
 <!-- Page content-->
 <section class="pt-2 pb-4">
		<div class="container px-4 px-lg-5 mt-3">
                <div class="container-fluid">
                    <h3 class="mt-4" style= text-align:center>나의리뷰</h3>
                    <br>
                    <hr>
                    <table class = "table" style= text-align:center>
<!--                     <table id="datatablesSimple" style=text-align:center> -->
                    	<thead >
                    		<tr style=text-align:center>
                    			<th>리뷰번호</th>
                    			<th>상품이름</th>
                    			<th>별점</th>
                    			<th>작성자</th>
                    			<th>등록날짜</th>
                    			<th>좋아요</th>
                    		</tr>
                    	</thead>
                    	<tbody>
                    		<c:choose>
	                    		<c:when test="${not empty list }">
		                    		<c:forEach items="${list }" var="vo">
		                    			<c:set var="i" value="${i+1 }"/>
			                    		<tr>
			                    			<td>${i }</td>
			                    			<td>${vo.productName }</td>
			                    			<td>${vo.starCnt }</td>
			                    			<td>${vo.nickName }</td>
			                    			<td><fmt:formatDate value ="${vo.reviewDate }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
			                    			<td>${vo.reviewLikeCnt }</td>
			                    		</tr>
			                    		<tr><th colspan="3">사진첨부</th>
			                    		<th colspan="3">내용</th>
			                    		</tr>
			                    			<tr>
			                    				<td colspan="3">
			                    				<c:choose>
			                    					<c:when test="${vo.reviewImage eq null }"><p style="color:gray;">사진을 첨부하지 않았습니다<p></c:when>
			                    					<c:otherwise><img style="width:50%" src="reviewImage/${vo.reviewImage }"></c:otherwise>
			                    				</c:choose>
			                    				</td>
			                    				<td colspan="3">${fn:substring(vo.content,0,10)}···</td>
			                    			</tr>
			                    		<hr>
			                    		<br>
		                    		</c:forEach>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<tr><td style=color:gray; colspan="6">아직 작성된 리뷰가 없습니다.</td></tr>
	                    		</c:otherwise>
                    		</c:choose>
                    		
                    		
                    		
                    	</tbody>
                    </table>
                    <div style= text-ailgn:right>
                    <hr>
                    </div>
                </div>
         </div>
</section>
</body>


<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous">
</script>
<script src="adminResource/js/scripts.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
	crossorigin="anonymous">
</script>
<script src="adminResource/js/datatables-simple-demo.js"></script>


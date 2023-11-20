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
                    			<th>리뷰번호<th>
                    			<th>상품이름</th>
                    			<th>별점</th>
                    			<th>내용</th>
                    			<th>작성자</th>
                    			<th>등록날짜</th>
                    			<th>좋아요 수</th>
                    		</tr>
                    	</thead>
                    	<tbody>
                    		<c:forEach items="${list }" var="vo">
                    		<tr>
                    			<td>${vo.reviewNo }</td>
                    			<td>${vo.productName }</td>
                    			<td>${vo.starCnt }</td>
                    			<td>${fn:substring(vo.content,0,10)}···</td>
                    			<td>${vo.nickName }</td>
                    			<td><fmt:formatDate value ="${vo.reviewDate }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                    			<td>${vo.reviewLikeCnt }</td>
                    		</tr>
                    		</c:forEach>
                    		
                    	</tbody>
                    </table>
                    <div style= text-ailgn:right>
                    <hr>
                     	 <p><a href="addReview.do">리뷰 작성</a></p>
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


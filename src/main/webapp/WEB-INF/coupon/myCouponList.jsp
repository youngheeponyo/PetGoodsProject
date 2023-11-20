<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<body>
 <!-- Page content-->
 <section class="pt-2 pb-4">
		<div class="container px-4 px-lg-5 mt-3">
                <div class="container-fluid" style=text-align:center>
                    <h3 class="mt-4" style= text-align:center>나의쿠폰</h3>
                    <br>
                    <hr>
                    <table class = "table" style= text-align:center>
<!--                     <table id="datatablesSimple"> -->
                    	<thead >
                    		<tr style=text-align:center>
                    			<th>쿠폰이름</th>
	                    		<th>할인률</th>
	                    		<th>쿠폰만료일</th>
	                    		<th>쿠폰상태</th>
                    		</tr>
                    	</thead>
                    	<tbody>
                    		<c:if test="${empty list}">
                    			<td colspan="4" style=" color:gray;">아직 발급받은 쿠폰이 없습니다.</td>
                    		</c:if>
                    		<c:forEach items="${list }" var="vo">
                    		<c:choose>
                    			<c:when test="${vo.couponState eq '사용완료'|| vo.couponState eq '기간만료'}">
                    				<tr style="background-color: lightgray;">
		                    			<td style=" color:gray;">${vo.couponName }</td>
		                    			<td style=" color:gray;">${vo.discountPct }%</td>
		                    			<td style=" color:gray;"><fmt:formatDate value="${vo.endDate }" pattern="yyyy년 MM월 dd일까지"></fmt:formatDate></td>
		                    			<td style=" color:gray;">${vo.couponState }</td>
                    				</tr>
                    			</c:when>
                    			<c:otherwise>
	                    			<tr>
		                    			<td>${vo.couponName }</td>
		                    			<td>${vo.discountPct }%</td>
		                    			<td><fmt:formatDate value="${vo.endDate }" pattern="yyyy년 MM월 dd일까지"></fmt:formatDate></td>
		                    			<td style="color:blue">${vo.couponState }</td>
	                    			</tr>
                    			</c:otherwise>
                    		</c:choose>
                    		</c:forEach>
                    	</tbody>
                    </table>
                    </div>
                </div>
</section>
</body>


<script src="adminResource/js/scripts.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
	crossorigin="anonymous">
</script>
<script src="adminResource/js/datatables-simple-demo.js"></script>


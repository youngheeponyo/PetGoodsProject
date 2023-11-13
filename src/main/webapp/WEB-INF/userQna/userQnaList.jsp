<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    

<body>
 <!-- Page content-->
 <section class="py-5" ; >
		<div class="container px-4 px-lg-5 mt-5">
                <div class="container-fluid">
                    <h3 class="mt-4" style= text-align:center>문의사항</h3>
                    <br>
                    <table class = "table" style= text-align:center>
                    	<thead>
                    		<tr>
	                    		<th>글번호</th>
	                    		<th>제목</th>
	                    		<th>작성자번호</th>
	                    		<th>작성일</th>
	                    		<th>문의상태</th>
                    		</tr>
                    	</thead>
                    	<tbody>
                    		<c:forEach items="${list }" var="vo">
                    		<tr>
                    			<td>${vo.qnaNo}</td>
                    			<td><a href ="getUserQnaList.do?vo=${vo.qnaNo}">${vo.title }</a></td>
                    			<td>${vo.userNo }</td>
                    			<td><fmt:formatDate value ="${vo.registDate }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                    			<td>
                    				<c:choose>
                    					<c:when test="${vo.qnaState==1 }">
                    						답변완료
                    					</c:when>
                    					<c:otherwise>
                    						문의대기중
                    					</c:otherwise>
                    				</c:choose>
                    			
                    			</td>
                    		</tr>
                    		</c:forEach>
                    	</tbody>
                    </table>
                    <div style= text-ailgn:right>
                     	 <p><a href="addUserQna.do">문의글 작성</a></p>
                    </div>
                </div>
         </div>
</section>
</body>
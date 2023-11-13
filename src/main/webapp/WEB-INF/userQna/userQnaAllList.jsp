<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    

<body>
 <!-- Page content-->
 <section class="py-5" >
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
                    			<td id="qnaNocheck">${vo.qnaNo}</td>
                    			<td id="passcheck">${vo.title }</td>
                    			<!-- 클릭이벤트 : 제목을 클릭하면 비밀번호를 비교하고 만약 맞다면 getUserQnaList.do?이 주소로 넘겨줌 -->
                    			
                    			
                    			<td>${vo.userNo }</td>
                    			<td><fmt:formatDate value ="${vo.registDate }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                    			<td>
                    				<c:if test="${not empty vo.qnaNo}">
	                    				<c:choose>
	                    					<c:when test="${vo.qnaState==1 }">
	                    						답변완료
	                    					</c:when>
	                    					
	                    					<c:otherwise>
	                    						문의대기중
	                    					</c:otherwise>
	                    				</c:choose>
                    				</c:if>
                    			</td>
                    		</tr>
                    		</c:forEach>
                    	</tbody>
                    </table>
                    <div style= text-ailgn:right>
                     	 <p><a href="addUserQnaFrom.do">문의글 작성</a></p>
                    </div>
                </div>
         </div>
</section>
</body>


<!-- <script> -->

<!-- // 	// 고쳐야 함(list에 담긴 내용을 어떻게 넣어서 비교할지.. 또 비번은 post방식으로 해야 하는데..) -->
<!-- // 	document.querySelector('#passcheck').addEventListener('click', function (e){ -->
<!-- // 		int insertPassword = prompt("비밀번호를 입력해주세요"); -->
<!-- // 		int qnaNo = document.querySelector('#qnaNocheck').value; -->
		
<%-- // 		if(password == ${vo.password} && qnaNo == ${vo.qnaNo}) { --%>
<!-- // 			req.getRequestDispatcher("getUserQnaList.do?vo=${vo.qnaNo}") -->
			
<!-- // 		} else { -->
<!-- // 			document.write("비밀번호가 다릅니다. 다시 선택하시기 바랍니다."); -->
<!-- // 			resp.sendRedirect("getUserQnaAllList.do");//리스트 페이지로 -->
<!-- // 		} -->
<!-- // 	}) -->
	
<!-- </script> -->
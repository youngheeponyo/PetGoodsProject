<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    

<body>
 <!-- Page content-->
${list}
 <section class="py-5" >
		<div class="container px-4 px-lg-5 mt-5">
                <div class="container-fluid">
                    <h3 class="mt-4" style= text-align:center>문의사항</h3>
                    <br>
                    <table class = "table" style= text-align:center>
                    	<thead>
                    		<tr>
                    			<th>공개여부</th>
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
                    			<td> 
                    				<c:choose>
	                    				<c:when test="${vo.password==0 }">
	                    					전체공개
	                    				</c:when>
	                    				<c:otherwise>
	                    					비밀글
	                    				</c:otherwise>
                    				</c:choose>
                    			</td>
                    					
                    			<td class="qnaNocheck">${vo.qnaNo}</td>
                    			<td class="passcheck" onclick="passCheck('${vo.password}', '${vo.qnaNo }')">
                    				<a href=#>${vo.title }</a> pw:${vo.password }
                    			</td>
                    			<!-- 클릭이벤트 : 제목을 클릭하면 비밀번호를 비교하고 만약 맞다면 getUserQnaList.do?이 주소로 넘겨줌 -->
                    			
                    			
                    			<td>${vo.userNo }</td>
                    			<td><fmt:formatDate value ="${vo.registDate }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                    			<td>
                    				<c:if test="${not empty vo.qnaNo}">
	                    				<c:choose>
	                    				
	                    					<c:when test="${vo.qnaState==49 }">
	                    						답변완료 = (${vo.qnaState })
	                    					</c:when>
	                    					<c:otherwise>
	                    						문의대기중 = (${vo.qnaState })
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


<script>

	function passCheck(password, qnaNo){
		console.log("password :", password,"   qnaNo: ", qnaNo)
	    if(password == "0"){
	    	
	    	window.location.href="getUserQnaList.do?qnaNo="+qnaNo;
	    	return;
	    	
	    }else{
	    	let inputPassword = prompt('비밀번호를 입력하세요', '0000');
	    	if(password == inputPassword){
	    		
	    		window.location.href="getUserQnaList.do?qnaNo="+qnaNo+"&password="+password;
	    		return;
	    	}else{
	    		alert("비밀번호가 다릅니다.");
	    	}
	    }
	}
</script>
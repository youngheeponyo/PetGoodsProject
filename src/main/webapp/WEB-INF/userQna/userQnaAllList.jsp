<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    

<body>
 <!-- Page content-->
 <section class="pt-2 pb-4">
		<div class="container px-4 px-lg-5 mt-3">
                <div class="container-fluid">
                    <h3 class="mt-4" style= text-align:center>문의사항</h3>
                    <br>
                    <hr>
                    <table class = "table" style= text-align:center>
<!--                     <table id="datatablesSimple" style=text-align:center> -->
                    	<thead >
                    		<tr style=text-align:center>
                    			<th>공개여부</th>
	                    		<th>글번호</th>
	                    		<th>문의정보</th>
	                    		<th>제목</th>
	                    		<th>작성자</th>
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
                    			<td>${vo.qnaType }</td>
                    			
                    			<td class="passcheck" onclick="passCheck('${vo.password}', '${vo.qnaNo }')">
                    				<a href=#>${vo.title }</a> pw:${vo.password }
                    			</td>
                    			<!-- 클릭이벤트 : 제목을 클릭하면 비밀번호를 비교하고 만약 맞다면 getUserQnaList.do?이 주소로 넘겨줌 -->
                    			
                    			
                    			<td>${vo.nickName }</td>
                    			<td><fmt:formatDate value ="${vo.registDate }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
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
                    		</c:forEach>
                    	</tbody>
                    </table>
                    <div style= text-ailgn:right>
                    <hr>
                     	 <p><a href="addUserQnaForm.do">문의글 작성</a></p>
                    </div>
                </div>
         </div>
</section>
<input type="hidden" value="${uno }" id="userSessionNo">
<input type="hidden" value="${permission }" id="permission">
</body>


<script>

	function passCheck(password, qnaNo){
		let userSessionNo = document.querySelector("#userSessionNo").value;
		let permission = document.querySelector("#permission").value;
		if(userSessionNo == ""){//console.log(typeof userSessionNo); 타입확인
			alert("로그인을 먼저 해주시기 바랍니다.")
			window.location.href="loginForm.do";
			return;
		}		

		console.log("password :", password,"   qnaNo: ", qnaNo)
	    if(password == "0" || permission == "0"){//패스워드가 없거나 관리자일때
	    	
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


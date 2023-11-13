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
                    			<td class="passcheck">
                    			${vo.title }
                    			<input type="hidden" value="${vo.password }" />
                    			</td>
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


<script>


	document.querySelector(".passcheck").addEventListener("click", passCheck);
	
	function passCheck(){
		// 클릭된 요소(this)에서 가장 가까운 부모 <td>를 찾음
	    let tdElement = this.closest('td');

	    // <td> 안에서 이름이 'password'인 <input> 엘리먼트를 찾음
	    let inputElement = tdElement.querySelector('input');

	    // <input> 엘리먼트의 값을 가져와서 출력
	    let passwordValue = inputElement.value;
	    
	    if(passwordValue == null){
	    	return;
	    }else{
	    	let promptObj = prompt('비밀번호를 입력하세요', '0000');
	    }
	    
	    

	}
</script>
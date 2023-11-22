<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <style>
 #pagebtn {
   width: 500px;
   text-align: center;
   margin: 0 auto;
   height: 50px;
   line-height: 60px;
}

#pagebtn a {
   all: initial;
   display: inline-block;
   margin-right: 10px;
   border-radius: 3px;
   border: none;
   font-family: Tahoma;
   background: #f9fafe;
   color: #000;
   text-decoration: none;
   height: 40px;
   width: 40px;
   text-align: center;
   line-height: 40px;
   transition: all .5s;
}

#pagebtn a:hover {
   background-color: #6553C1;
}

#pagebtn a.active {
   background: #6553C1;
   color: #fff;
}
   
 
 
 </style>   

<body>
 <!-- Page content-->
 <section class="pt-2 pb-4">
		<div class="container px-4 px-lg-5 mt-3">
                <div class="container-fluid qnaTable">
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
                    		<tr class="qnaTr">
                    			<td> 
                    				<c:choose>
	                    				<c:when test="${empty vo.password}">
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
	                    					<c:when test="${vo.qnaState == 1 }" >
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
	    if(password == "" || permission == "0"){//패스워드가 없거나 관리자일때
	    	
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
<script>
//페이징----------------------------------------------------------------------------------------------
var pageNumber = 10;   
var pageCount = 5;
var currentPage = 1;
//문의 페이징
var qnaTable = document.querySelector('.qnaTable');
var qnaTr = document.querySelectorAll('.qnaTr')

page(pageNumber, pageCount, currentPage, qnaTr, qnaTable);

function page(pageNumber, pageCount, currentPage, pagingTr, pagingTable) {
 
 var table = pagingTable
 var tr = pagingTr;
 var trTotal = tr.length;   
 if (trTotal == 0)
    return;

 var pageTotal = Math.ceil(trTotal / pageNumber);
 var pageGroup = Math.ceil(currentPage / pageCount);
 var last = pageGroup * pageCount;
 if (last > pageTotal) {
    last = pageTotal;
 }
 var first;
 if (last % pageCount == 0) {
    first = last - (pageCount - 1);
 } else {
    first = last + 1 - last % pageCount
 }

 var next = last + 1;
 var prev = first - 1;

 let prevPagebtn = pagingTable.querySelector('#pagebtn')
 if (prevPagebtn) {
    prevPagebtn.remove();
 }

 var pageBtn = document.createElement("div");

 pageBtn.setAttribute("id", "pagebtn");
 table.append(pageBtn);
 

 if (prev > 0) {
    let aTage = document.createElement("a")
    aTage.setAttribute("href", "#")
    aTage.dataset.value = "prev";
    aTage.innerHTML = "<"
    pageBtn.append(aTage)
 }

 for (let i = first; i <= last; i++) {
    let aTage = document.createElement("a")
    aTage.setAttribute("href", "#")
    aTage.dataset.value = i;
    aTage.innerHTML = i;
    pageBtn.append(aTage)
 }
 if (last < pageTotal) {
    let aTage = document.createElement("a")
    aTage.setAttribute("href", "#")
    aTage.dataset.value = "next"
    aTage.innerHTML = ">"
    pageBtn.append(aTage)
 }
 var paginglink = pageBtn.querySelectorAll('a')
 paginglink.forEach(link => {
  // 각 <a> 태그의 class 리스트에서 'active' 클래스를 제거
     link.classList.remove('active');
 });
 

 var element = pagingTable.querySelector('[data-value="' + currentPage + '"]');
 
 if (element) {
    element.classList.add("active");
 }
 var startval = (currentPage - 1) * pageNumber;
 var endval = startval + pageNumber;




 for (var i = 0; i < tr.length; i++) {
    
    if (i >= startval && i < endval) {
       // opacity와 클래스 설정
       // off-screen 클래스를 제거하고
       tr[i].classList.remove('off-screen');
       tr[i].style.opacity = '1';
    }else{
       tr[i].style.opacity = '0.0';
       tr[i].classList.add('off-screen');
       
    }
 }

 for (let i = 0; i < paginglink.length; i++) {
    paginglink[i].addEventListener('click', function(e) {
       e.preventDefault();
       var thisVal = this;
       var data = thisVal.dataset.value;
       var selectedPage = thisVal.innerText;

       if (data === "next") {
          selectedPage = next;
       }

       if (data === "prev") {
          selectedPage = prev;
       }
       page(pageNumber, pageCount, selectedPage, tr, table)
    });
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


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
			<form action="addUserQna.do" name="addQnaForm" method="post"
				style="text-align: center">
				
				<h3>리뷰 작성</h3>
				<br>
				<hr>
				<table class="table" border="1">
					<tr>
						<th colspan="1">글번호</th>
						<td><input type="hidden" name="maxQnaNO" value="${maxQnaNO}">${maxQnaNO}</td>
						<th colspan="1">작성자</th>
						<td><input type="hidden" name="nickName"
							value="${userVo.nickName}">${userVo.nickName }</td>

						<th colspan="1">문의상태</th>
						<td><p>
								<b>문의대기중</b>
							</p></td>
					</tr>
					<tr>
						


<!-- 상품페이지에서 문의게시판에 접속하면 -->

<!-- 바깥에서 문의게시판을 접속하면 -->
<!-- 상품타입이 상품문의라면 --><!-- 상품명 항목 추가 후, -->
<!-- 카테고리 이름먼저 나오고 --><!-- 해당 카테고리의 번호에 맞는 상품이 나열됨 -->
						<c:choose>
                     <c:when test="${not empty pName}">
                        <th colspan="1">문의종류
                        <th>
                        <td><select name="qnaType" disabled>
                              <option value="상품문의" selected>상품문의</option>
                        </select></td>
                        <th colspan="2">상품명</th>
                        <td><input type="hidden" name="pNo" value="${pNo}">${pName}
                        <td>
                     </c:when>
                     <c:otherwise>
                        <th colspan="1">문의종류
                        <th>
                        <td>
                        <select name="qnaType" onchange="qnaTypeCheck(this.value)">
                              <option value="" selected disabled >선택해주세요</option>
                              <option value="상품문의" >상품문의</option>
                              <option value="배송문의">배송문의</option>
                              <option value="교환/환불문의">교환/환불문의</option>
                              <option value="기타문의">기타문의</option>
                        </select>
                        </td>
                        <th>상품카테고리</th>
                        <td>
                        	 <select class="mainCategory" name="productNo" onchange="getCategory(this.value)">
		                  		<option value="" selected disabled >선택해주세요</option>
		                  		<c:forEach items="${mainCategory }" var="main">
		                  			console.log(${main })
		                  			<optgroup label="${main.categoryName}">
										<c:forEach items="${subCategory }" var="sub">
											<c:if test="${main.categoryNo==sub.categoryPreno }">
											<option value="${sub.categoryNo}">${sub.categoryName}</option>
											</c:if>
										</c:forEach>
									</optgroup>
		                  		</c:forEach>
                  			</select>
                        </td>
						<th>상품명</th>
						<td>
							<select class="productName">
								<option value="" selected disabled >선택해주세요</option>

							</select>

						</td>
                     </c:otherwise>
                  </c:choose>
					</tr>
					<tr>
						<th >글제목</th>
						<td colspan="4"><input style="width: 100%" type=text name="title"
							placeholder="제목을 입력해주세요" onfocus="this.placeholder=''"
							 value=""></td>
						<th>비밀번호</th>
						<td><input type="password" name="password" placeholder="0000" onfocus="this.placeholder=''"></td>
					</tr>

					<tr>
						<!-- 컨텐츠 -->
						<td colspan="14"><textarea rows="10" cols="40"
								class="form-control" name="contents"
								placeholder="글을 입력해주세요" onfocus="this.placeholder=''"></textarea></td>
					</tr>
					<tr>
						<td colspan="14" align="center">
						<input type="submit"value="등록하기"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</section>
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<script>
	
	function qnaTypeCheck(value){//상품문의 아닐때 상품카테고리창 선택 못하게 하는 메소드
		console.log("value:"+ value);
		if(value!="상품문의"){//상품문의가 아니라면
			let test = document.querySelectorAll('.mainCategory')
			test.forEach(item => {
				item.value="";
				item.disabled=true;
			})
			let test2 = document.querySelectorAll('.productName')
			test2.forEach(item => {
				item.value="";
				item.disabled=true;
			})
		}else{
			let test = document.querySelectorAll('.mainCategory')
			test.forEach(item => {
				item.disabled=false;
			})
			let test2 = document.querySelectorAll('.productName')
			test2.forEach(item => {
				item.disabled=false;
			})
		}
	}
		
	function getCategory(categoryNo){//카테고리 정보를 가져오는 메소드
// 		console.log("value:"+ value);
		fetch('getCategoryNoToProductName.do?categoryNo='+categoryNo)
		.then(resolve => resolve.json())
		.then(result =>{
			console.log("result =" , result);
			makeSelectTag(result.productNameList);
		})
	}
	
	function makeSelectTag(productNameList){//가져온 카테고리 정보를 html로 가공하는 메소드
		var productName = document.querySelector('.productName')
		console.log("productName : ", productName)
		productName.innerHTML="<option value='' selected disabled >선택해주세요</option>";//다른 문의항목 누르고 올때마다 상품나열된거 리셋
		
		productNameList.forEach(element => {
			let product = document.createElement('option')
			product.innerHTML=element.productName;
			product.value=element.productNo;
			productName.append(product);
			console.log("element.productName : " , element.productName)
		});

		document.createElement('th').innerHTML='상품명'
		document.createElement('select')

	}
	
	//console.log(document.forms.addQnaForm); 등록버튼이 아니라 form에다가 이벤트를 달아서 등록버튼 눌렀을 시 실행되게 함
	document.forms.addQnaForm.addEventListener('submit', function (e){//name이 addQnaForm인 폼에
		e.preventDefault();//기본(전송)기능을 차단 = 현재페이지에 머물게 함
		console.log("hello")
		let title = document.querySelector('input[name=title]').value
		let contents = document.querySelector('textarea[name=contents]').value
		console.log(contents);
		let qnaType = document.querySelector('select[name=qnaType]').value
		console.log(qnaType);
		if(title.length==0){
			alert("제목을 입력해주세요");
		}else if(contents.length==0){
			alert("내용을 입력해주세요");
		}else if(qnaType==null){
			alert("문의종류를 선택해주세요")
		}else{
			this.submit();
		}
		
		
		
// 		if(title.length!=0 &&contents.length!=0 && qnaType.length!=0)){
// 			this.submit();//전송기능
// 		}

	})


	

</script>


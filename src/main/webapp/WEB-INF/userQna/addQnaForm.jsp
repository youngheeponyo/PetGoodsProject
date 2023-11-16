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
				<input type="hidden" id="categoryNoList" value="${categoryNoList}">
				<input type="hidden" id="productNameList" value="${productNameList}">
				
				<h3>문의글 작성</h3>
				<br>
				<hr>
				<table class="table" border="1">
					<tr>
						<th colspan="2">글번호</th>
						<td><input type="hidden" name="maxQnaNO" value="${maxQnaNO}">${maxQnaNO}</td>
						<th colspan="2">작성자</th>
						<td><input type="hidden" name="nickName"
							value="${uservo.nickName}">${uservo.nickName }</td>

						<th colspan="2">작성일시</th>
						<td></td>
						<th colspan="2">문의상태</th>
						<td><p>
								<b>문의대기중</b>
							</p></td>
					</tr>
					<tr>
						<th colspan="2">글제목</th>
						<td><input type=text name="title" value=""></td>


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
                        <td><input type="hidden" name="pName" value="${pName}">${pName}
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
                           <th colspan="1" class="">상품카테고리</th>
                           <td>
                              <select class="mainCategory" onchange="getSubCategory(this.value)">
                                 <option value="" selected disabled >선택해주세요</option>
                              </select>
                           </td>
                           <th>상품명</th>
                           <td>
                              <select class="subCategory" onchange="">
                                 <option>상품명</option>
                              </select>
                           </td>
                     </c:otherwise>
                  </c:choose>
					</tr>


					<tr>
						<!-- 컨텐츠 -->
						<td colspan="14"><textarea rows="10" cols="40"
								class="form-control" name="contents">여기에 삽입</textarea></td>
					</tr>
					<tr>
						<td colspan="14" align="center">
						<input type="submit" value="등록하기"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</section>
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<script>
	function qnaTypeCheck(value){
		console.log("value:"+ value);
		if(value=="상품문의"){
			getMainCategory();
		}
		
	}


	function getMainCategory(){
		fetch('getMainCategory.do')
		.then(resolve => resolve.json())
		.then(result =>{
			console.log(result);
			console.log(result.mainCategory);
			makeMainOption(result.mainCategory);
		})
		}
	
	function makeMainOption(mainCategoryList){
		console.log("mainCategoryList :" + mainCategoryList)
		
		mainCategoryList.forEach(item =>{
			let option = document.createElement('option');
			option.value=item.categoryNo;
			option.innerHTML=item.categoryName;
			document.querySelector('.mainCategory').append(option);
		})
	}
	
	function getSubCategory(categoryNo){
			fetch('subCategory.do?categoryNo=' + categoryNo)
			.then(resolve => resolve.json())
			.then(result =>{
				console.log("result="+result);
				makeSubOption(result.subCategory)
			})
		}
		
	function makeSubOption(subCategoryList){
		console.log("subCategoryList="+subCategoryList);
		
		subCategoryList.forEach(item =>{
			let option = document.createElement('option');
			option.value=item.categoryNo;
			option.innerHTML=item.categoryName;
			document.querySelector('.subCategory').append(option);
		})
	}
	
	

	// function test(value){
	// 	var qnaType = document.getElementById('qnaType').value;
	// 	const categoryNoList = document.getElementById('categoryNoList').value
	// 	const productNameList = document.getElementById('productNameList').value
	// 	if(qnaType =="상품문의"){
	// 		const th = document.createElement("th").append('상품명');
	// 		const td = document.createElement("td").append(select);
	// 		const select = document.createElement("select");
			
			
	// 		categoryNoList.forEach(element => {
	// 			const optgroup= document.createElement('optgroup')
				
	// 			optgroup.setAttribute('label',)
	// 			if(categoryNoList.categoryNo == productNameList.categoryNo){
	// 				productNameList.forEach(element =>{
	// 					const option = document.createElement('option').innerHTML=productNameList.productName;
	// 					select.append(option);
	// 				})
	// 			}

	// 		});
			
	// 	}
	//}
</script>


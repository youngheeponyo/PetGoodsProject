<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<body>
	<section class="pt-2 pb-4">
		<div class="container px-4 px-lg-5 mt-3">
			<h3>상품 등록화면</h3>
			<form action="addProduct.do" method="post" enctype="multipart/form-data"
				>
				<table class="table">
					<tr>
						<th>펫타입</th>
						<td>
							<select class="form-select" name="petType" onchange="selectBoxChange(this.value)" aria-label="Default select example">
							  <option selected value="0">강아지</option>
							  <option value="1">고양이</option>
							</select>
						</td>
						<th>카테고리</th>
						<td>
							<select class="form-select" name="categoryNo" onchange="selectBoxChange(this.value)" aria-label="Default select example">
							  <c:forEach items="${categoryMap }" var="category">
							  	<optgroup label="${category.value[0].mainCateName }">
							  		<c:forEach items="${category.value }" var="joinvo">
							  			<option value="${joinvo.subCateNo }">${joinvo.subCateName}</option>
							  		</c:forEach>
							  	</optgroup>
							  </c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>상품명</th>
						<td colspan="3"><input type="text" name="productName" class="form-control"></td>
					</tr>
					<tr>
						<th>가격</th>
						<td><input type="text" name="productPrice" class="form-control"></td>
						<th>상품수량</th>
						<td><input type="text" name="productStock" class="form-control"></td>
					</tr>
					<tr>
						<th>상품설명</th>
						<td colspan="3"><textarea cols="100" rows="6" name="productDesc"
								class="form-control"></textarea></td>
					</tr>
					<tr>
						
						<td>메인이미지 :</td>
						<td><input type="file" name="mainfile" class="form-control"></td>
					
						<td>상세이미지 :</td>
						<td><input type="file" name="detailfile" class="form-control"></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="저장" class="btn btn-primary"> 
							<input type="reset" value="초기화" class="btn btn-warning">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>
</body>

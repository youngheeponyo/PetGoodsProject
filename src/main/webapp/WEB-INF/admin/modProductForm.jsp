<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<body>
	<section class="pt-2 pb-4">
		<div class="container px-4 px-lg-5 mt-3">
			<h3>상품 수정화면</h3>
			<form action="modProduct.do" method="post" >
			<input type="hidden" name="productNo" value="${prod.productNo}" class="form-control">
				<table class="table">
					<tr>
						<th>애완동물타입</th>
						<td>
							<c:choose>
								<c:when test="${prod.petType == '0'}">
									강아지							
								</c:when>
								<c:otherwise>
									고양이
								</c:otherwise>
						</c:choose>
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
						<td colspan="3">${prod.productName }</td>
					</tr>
					<tr>
						<th>가격</th>
						<td><input type="text" name="productPrice" class="form-control" value="${prod.productPrice }"></td>
						<th>상품수량</th>
						<td><input type="text" name="productStock" class="form-control" value="${prod.productStock }"></td>
					</tr>
					<tr>
						<th>상품설명</th>
						<td colspan="3"><textarea cols="100" rows="6" name="productDesc"
								class="form-control" >${prod.productDesc }</textarea></td>
					</tr>
					
					<tr>
						<td colspan="2">
							<input type="submit" value="수정" class="btn btn-primary"> 
							<input type="reset" value="초기화" class="btn btn-warning">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>
</body>

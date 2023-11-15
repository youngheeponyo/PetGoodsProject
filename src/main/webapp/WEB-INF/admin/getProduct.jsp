<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<body>
	<section class="pt-2 pb-4">
		<div class="container px-4 px-lg-5 mt-3">
			<form action="modifyProdForm.do" name="myForm">
				<h3>상품정보</h3>
				<input type="hidden" name="prno" value="prno.productNo"
					class="form-control">
				<table class="table">
					<tr>
						<th>상품명</th>
						<td class="productName">${prno.productName }</td>
						<th>애완동물타입</th>
						<td>
						<c:choose>
							<c:when test="${prno.petType == '0'}">
								강아지							
							</c:when>
							<c:otherwise>
								고양이
							</c:otherwise>
						</c:choose>
						</td>
						<th>등록일자</th>
						<td><fmt:formatDate value="${prno.productRegistDate}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
					</tr>
					<tr>
						<th>상세설명</th>
						<td colspan="5">${prno.productDesc }</td>
					</tr>
					<tr>
						<th>이미지</th>
						<td>${prno.productImage }</td>
						<th>재고</th>
						<td>${prno.productStock }</td>
						<th></th>
						<td></td>
					</tr>
					<tr>
						<td colspan="6" align="center">
							<input type="submit" value="수정" class="btn btn-primary">
							<input type="button" value="삭제"
								onclick="location.href='removeProduct.do?prno=${prno.productNo}'"
								class="btn btn-warning">
								
						</td>
					</tr>
				</table>
			</form>
				<p>
					<button type="button" onclick="location.href='productList.do'">상품목록</button>
				</p>
		</div>
	</section>
</body>

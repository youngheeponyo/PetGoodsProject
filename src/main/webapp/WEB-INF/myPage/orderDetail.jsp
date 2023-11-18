<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="px-4 py-1 my-3 text-center">
		<h2 class="fw-bold mb-3">내 주문내역</h2>
</div>

<div class="d-flex justify-content-center">
	<table class="table w-50">
		<thead>
			<tr>
				<th scope="col">주문번호</th>
				<th scope="col">상품명</th>
				<th scope="col">가격</th>
				<th scope="col">수량</th>
				<th scope="col">결제일</th>
				<th scope="col">비고</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${pOrderList }" var="item">
			<fmt:formatDate value="${item.orderDate}" pattern="yyyy-MM-dd HH:mm:ss" var="formattedDate" />	
			<tr>
				<td>${item.merUid }</td>
				<td>${item.productName }</td>
				<td>${item.productPrice }</td>
				<td>${item.buyCnt }</td>
				<td>${formattedDate}</td>
				<c:choose>
					<c:when test="${item.reviewNo <= 0 }">
					<%--<c:if test=""></c:if> 리뷰작성할 떄 mer_uid,product_no넘겨서 작성하도록. --%>
						<td><a href="main.do" style="color:black;">리뷰작성하기</a></td>
					</c:when>
					<c:otherwise>
						<td><a href="main.do?rNo=${item.reviewNo }" style="color:black;">리뷰보기</a></td>
					</c:otherwise>
				</c:choose>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
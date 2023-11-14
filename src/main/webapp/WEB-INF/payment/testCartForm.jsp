<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table border="1">
	<thead>
		<tr>
			<th>카트번호</th>
			<th>상품이름</th>
			<th>상품가격</th>
			<th>선택개수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${cartList }" var="cart">
			<tr>
				<td>${cart.cartNo}</td>
				<td>${cart.productName}</td>
				<td>${cart.productPrice}</td>
				<td>${cart.selCnt}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<button onclick="test()">
	결제하기
</button>
<script>
	function test() {
		window.location.href = "paymentForm.do";
	}
</script>
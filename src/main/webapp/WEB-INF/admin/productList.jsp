<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body>
	<section class="pt-2 pb-4">
		<div class="container px-4 px-lg-5 mt-3">
			<div class="row">
				<div class="col-xl-3 col-md-6">
					<div class="card bg-primary text-white mb-4">
						<div class="card-body">회원목록</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="memberList.do">View
								Details</a>
							<div class="small text-white">
								<i class="fas fa-angle-right"></i>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6">
					<div class="card bg-warning text-white mb-4">
						<div class="card-body">상품관리</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="productList.do">View
								Details</a>
							<div class="small text-white">
								<i class="fas fa-angle-right"></i>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6">
					<div class="card bg-success text-white mb-4">
						<div class="card-body">카테고리관리</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="categoryManage.do">View
								Details</a>
							<div class="small text-white">
								<i class="fas fa-angle-right"></i>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6">
					<div class="card bg-danger text-white mb-4">
						<div class="card-body">쿠폰관리</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="#">View
								Details</a>
							<div class="small text-white">
								<i class="fas fa-angle-right"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 상품목록
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>상품번호</th>
								<th>펫타입</th>
								<th>카테고리번호</th>
								<th>상품명</th>
								<th>재고</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>상품번호</th>
								<th>펫타입</th>
								<th>카테고리번호</th>
								<th>상품명</th>
								<th>재고</th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach items="${prodlist}" var="prod">
								<tr>
									<td>${prod.productNo }</td>
									<td>${prod.petType }</td>
									<td>${prod.categoryNo }</td>
									<td><a href="getProduct.do?prno=${prod.productNo }">${prod.productName }</a></td>
									<td>${prod.productStock }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<p>
				<button type="button" onclick="location.href='productForm.do'">상품추가</button>
			</p>
		</div>
	</section>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="adminResource/js/scripts.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
	crossorigin="anonymous"></script>
<script src="adminResource/js/datatables-simple-demo.js"></script>

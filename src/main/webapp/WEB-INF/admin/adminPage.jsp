<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body>
		<section class="pt-2 pb-4">
			<div class="container px-4 px-lg-5 mt-3">
				<div class="container-fluid px-4">

					<div class="row">
						<div class="col-xl-3 col-md-6">
							<div class="card bg-primary text-white mb-4">
								<div class="card-body">회원관리</div>
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
								<div class="card-body">배송관리</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="productOrderList.do">View
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
							<i class="fas fa-table me-1"></i> 전체리뷰
						</div>
						<div class="card-body">
							<table id="datatablesSimple" >
								<colgroup>
							        <col width="10%"><col width="50%"><col width="30%"><col width="5%"><col width="5%">
							    </colgroup>
								<thead>
									<tr>
										<th >닉네임</th>
										<th >상품명</th>
										<th >리뷰</th>
										<th >좋아요수</th>
										<th >버튼</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th >닉네임</th>
										<th >상품명</th>
										<th >리뷰</th>
										<th >좋아요수</th>
										<th >버튼</th>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach items="${vo }" var="vo">
										<tr>
											<td>${vo.nickName }</td>
											<td>${vo.productName }</td>
											<td>${vo.content }</td>
											<td>${vo.reviewLikeCnt }</td>
											<td><input type="button" value="리뷰삭제" onclick="location.href='adminDeleteReview.do?reviewNo=${vo.reviewNo }'" style="border:none"></td>
										</tr>
									</c:forEach>
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
</body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="adminResource/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="adminResource/assets/demo/chart-area-demo.js"></script>
	<script src="adminResource/assets/demo/chart-bar-demo.js"></script>
	<script src="adminResource/assets/demo/adminSaleBarChart.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="adminResource/js/datatables-simple-demo.js"></script>

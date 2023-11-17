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
					<i class="fas fa-table me-1"></i> 카테고리관리
				</div>
				<div class="card-body">
					<table class="table">
						<thead>
							<tr>
								<th colspan="2">메인카테고리</th>
								<th colspan="2">서브카테고리</th>
							</tr>
							<tr>
								<th>메인카테고리번호</th>
								<th>메인카테고리명</th>
								<th>서브카테고리번호</th>
								<th>서브카테고리명</th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach items="${categoryList }" var="category" >
								<tr>
									<td>${category.mainCateNo }</td>
									<td>${category.mainCateName }</td>
									<td>${category.subCateNo }</td>
									<td>${category.subCateName }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<form action="addMainCategory.do" method="post">
						<table class="table">
							<tr>
								<td>메인카테고리추가</td>
								<td colspan="3"><input type="text" name="mainCategory" class="form-control"></td>
								<td></td>
								<td><input type="submit" value="메인카테고리추가" class="btn btn-primary"></td>
							</tr>
						</table>
					</form>
					
					<form action="addSubCategory.do" method="post">
						<table class="table">		
							<tr>
								<td>서브카테고리추가</td>
								<td colspan="2"><input type="text" name="subCategory" class="form-control"></td>
								<td>
									<select class="form-select" name="categoryName" onchange="selectBoxChange(this.value)" aria-label="Default select example">
									  <option selected>메인카테고리를 선택하세요</option>
									  <c:forEach items="${categoryMap }" var="category">
									  	<option value="${category.value[0].mainCateName }">${category.value[0].mainCateName }</option>
									  </c:forEach>
									</select>
								</td>
								<td><input type="submit" value="서브카테고리추가" class="btn btn-primary" formaction="addSubCategory.do"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</section>

</body>

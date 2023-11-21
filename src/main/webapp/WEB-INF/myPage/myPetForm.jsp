<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<section class="pt-2 pb-4">
	<div class="container px-4 px-lg-5 mt-3">
		<div class="container-fluid px-4">
			<div id="layoutSidenav">
				<!-- menu attribute-->
				<div id="layoutSidenav_nav" style="z-index: 0">
					<nav class="sb-sidenav accordion sb-sidenav-light"
						id="sidenavAccordion">
						<div class="sb-sidenav-menu">
							<div class="nav">
								<div class="sb-sidenav-menu-heading">${nickName }님환영합니다</div>
								<a class="nav-link" href="orderDetailForm.do">
									<div class="sb-nav-link-icon">
										<i class="bi bi-basket3-fill"></i>
									</div> 주문내역
								</a> <a class="nav-link" href="couponDetailForm.do">
									<div class="sb-nav-link-icon">
										<i class="bi bi-upc-scan"></i>
									</div> 내 쿠폰
								</a> <a class="nav-link" href="myProdQnaDetailForm.do">
									<div class="sb-nav-link-icon">
										<i class="bi bi-box-seam"></i>
									</div> 상품문의
								</a> <a class="nav-link" href="myReviewDetailForm.do">
									<div class="sb-nav-link-icon">
										<i class="bi bi-chat-left-text"></i>
									</div> 내 리뷰보기
								</a><a class="nav-link" href="myInfo.do">
									<div class="sb-nav-link-icon">
										<i class="bi bi-person"></i>
									</div> 내정보관리
								</a><a class="nav-link" href="myPetInfo.do">
									<div class="sb-nav-link-icon">
										<i class="bi bi-reddit"></i>
									</div> 내반려동물정보
								</a>
							</div>
						</div>
					</nav>
				</div>
				<div id="layoutSidenav_content">
					<main>
						<div class="container-fluid px-4">
							<div class="px-4 py-1 my-3 text-center">
								<h2 class="fw-bold mb-3">내 반려동물 등록</h2>
							</div>
							<div class="d-flex justify-content-center">
								<form action="addMyPet.do" method="post">
									<table class="table w-85">
										<tr>
											<th>이름</th>
											<th>반려동물종류</th>
											<th>반려동물생일</th>
											<th>성별</th>
										</tr>
										<tr>
											<td><input type="text" name="petName"
												class="form-control"></td>
											<td><select class="form-select" name="petType"
												onchange="selectBoxChange(this.value)"
												aria-label="Default select example">
													<option selected value="0">강아지</option>
													<option value="1">고양이</option>
											</select></td>
											<td><input type="date" name="petBirth"
												class="form-control"></td>
											<td><select class="form-select" name="petGender"
												onchange="selectBoxChange(this.value)"
												aria-label="Default select example">
													<option selected value="0">수컷</option>
													<option value="1">암컷</option>
											</select></td>
										</tr>
										<tr>
											<td colspan="4"><input type="submit" value="저장"
												class="btn btn-primary"> <input type="reset"
												value="초기화" class="btn btn-warning"></td>
										</tr>
									</table>
								</form>
							</div>

						</div>

					</main>
				</div>
			</div>
		</div>
	</div>
</section>

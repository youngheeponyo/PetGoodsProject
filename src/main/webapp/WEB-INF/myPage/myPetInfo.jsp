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
								<div class="sb-sidenav-menu-heading">${nickName }님 환영합니다</div>
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
								<h2 class="fw-bold mb-3">내 반려동물 정보</h2>
							</div>
							<div class="d-flex justify-content-center">
								<c:choose>
									<c:when test="${!empty pet }">
										<c:forEach items="${pet }" var="pet">
											<table class="table w-75">
												<tr>
													<th>이름</th>
													<th>반려동물종류</th>
													<th>반려동물생일</th>
													<th>성별</th>
												</tr>
												<tr>
													<td>${pet.petName }</td>
													<td><c:choose>
														<c:when test="${pet.petType == '0'}">
															강아지							
														</c:when>
														<c:otherwise>
															고양이
														</c:otherwise>
													</c:choose></td>
													<td><fmt:formatDate value="${pet.petBirth}"
															pattern="yyyy-MM-dd"></fmt:formatDate></td>
													<td><c:choose>
														<c:when test="${pet.petGender == '0'}">
															수컷							
														</c:when>
														<c:otherwise>
															암컷
														</c:otherwise>
													</c:choose></td>
												</tr>
												<tr>
													<td colspan="4">
													<button type="button" onclick="location.href='myPetForm.do'">내 반려동물 추가등록하기</button>
													</td>
												</tr>
											</table>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<div class="px-4 py-1 my-3 text-center">
											<h2 class="fw-bold mb-3">아직 등록된 반려동물정보가 없습니다</h2>
											<button type="button" onclick="location.href='myPetForm.do'">내 반려동물 등록하기</button>
										</div>
									</c:otherwise>
								</c:choose>

							</div>

						</div>

					</main>
				</div>
			</div>
		</div>
	</div>
</section>

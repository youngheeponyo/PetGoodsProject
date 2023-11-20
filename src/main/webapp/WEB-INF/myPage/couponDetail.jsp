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
								<a class="nav-link" href="orderDetailForm.do">
									<div class="sb-nav-link-icon">
										<i class="fas fa-tachometer-alt"></i>
									</div> 주문내역
								</a> <a class="nav-link" href="couponDetailForm.do">
									<div class="sb-nav-link-icon">
										<i class="fas fa-chart-area"></i>
									</div> 내 쿠폰
								</a> <a class="nav-link" href="tables.html">
									<div class="sb-nav-link-icon">
										<i class="fas fa-table"></i>
									</div> 상품문의
								</a> </a> <a class="nav-link" href="tables.html">
									<div class="sb-nav-link-icon">
										<i class="fas fa-table"></i>
									</div> 내 리뷰보기
								</a>
							</div>
						</div>
					</nav>
				</div>
				<div id="layoutSidenav_content">
					<main>
						<div class="container-fluid px-4">
							<div class="d-flex justify-content-center">
								<table class="table w-75">
									<tr>
										<th>보유중인 쿠폰</th>
									</tr>
									<tr>
										<th>쿠폰명</th>
										<th>할인률</th>
										<th>만료일</th>
										<th>쿠폰사용여부</th>
									</tr>
									<tr>
										<c:forEach items="${list }" var="list">
											<tr>
												<td>${list.couponName }</td>
												<td>${list.discountPct }</td>
												<td><fmt:formatDate value="${list.endDate}"
														pattern="yyyy-MM-dd"></fmt:formatDate></td>
												<td>${list.couponState }</td>
											</tr>
										</c:forEach>
									</tr>

								</table>
							</div>
							<c:set var="curPage" value="${pagination.currentPage }" />
							<c:set var="start" value="${pagination.startPage }" />
							<c:set var="end" value="${pagination.endPage }" />

							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<c:if test="${pagination.prev }">
										<li class="page-item"><a class="page-link"
											href="couponDetailForm.do?page=${curPage - 1}"
											aria-label="Next"> <span aria-hidden="true">&laquo;</span>
												<span class="sr-only">Previous</span>
										</a></li>
									</c:if>
									<c:forEach var="idx" begin="${start }" end="${end }" step="1">
										<c:choose>
											<c:when test="${idx == curPage}">
												<li class="page-item active"><a class="page-link"
													href="couponDetailForm.do?page=${idx}">${idx}</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
													href="couponDetailForm.do?page=${idx}">${idx}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${pagination.next}">
										<li class="page-item"><a class="page-link"
											href="couponDetailForm.do?page=${curPage + 1}"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
												<span class="sr-only">Next</span>
										</a></li>
									</c:if>
								</ul>
							</nav>

						</div>

					</main>
				</div>
			</div>
		</div>
	</div>
</section>

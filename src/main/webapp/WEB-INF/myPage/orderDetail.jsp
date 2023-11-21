<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
								<h2 class="fw-bold mb-3">내 주문내역</h2>
							</div>
							<div class="d-flex justify-content-center">
								<table class="table w-85">
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
											<fmt:formatDate value="${item.orderDate}"
												pattern="yyyy-MM-dd HH:mm:ss" var="formattedDate" />
											<tr>
												<td>${item.merUid }</td>
												<td><a href="detailProduct.do?pno=${item.productNo }">${item.productName }</a></td>
												<td>${item.productPrice }</td>
												<td>${item.buyCnt }</td>
												<td>${formattedDate}</td>
												<c:choose>
													<c:when test="${item.reviewNo <= 0 }">
														<%--<c:if test=""></c:if> 리뷰작성할 떄 mer_uid,product_no넘겨서 작성하도록. --%>
														<td><a
															href="addReviewForm.do?mUid=${item.merUid }&pNo=${item.productNo}">리뷰작성</a></td>
													</c:when>
													<c:otherwise>
														<td><a href="myReviewList.do?rNo=${item.reviewNo }">리뷰보기</a></td>
													</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

							<c:set var="curPage" value="${pagination.currentPage }" />
							<c:set var="start" value="${pagination.startPage }" />
							<c:set var="end" value="${pagination.endPage }" />

							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<c:if test="${pagination.prev }">
										<li class="page-item"><a class="page-link"
											href="orderDetailForm.do?page=${curPage - 1}"
											aria-label="Next"> <span aria-hidden="true">&laquo;</span>
												<span class="sr-only">Previous</span>
										</a></li>
									</c:if>
									<c:forEach var="idx" begin="${start }" end="${end }" step="1">
										<c:choose>
											<c:when test="${idx == curPage}">
												<li class="page-item active"><a class="page-link"
													href="orderDetailForm.do?page=${idx}">${idx}</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
													href="orderDetailForm.do?page=${idx}">${idx}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${pagination.next}">
										<li class="page-item"><a class="page-link"
											href="orderDetailForm.do?page=${curPage + 1}"
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
</section>
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
								</a> <a class="nav-link" href="myProdQnaDetailForm.do">
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
								<table class="table w-85">
									<tr>
										<th>QNA 내역</th>
									</tr>
									<c:choose>
										<c:when test="${!empty list }">
											<tr>
												<th>문의타입</th>
												<th>상품번호</th>
												<th>제목</th>
												<th>작성일</th>
												<th>답변상태</th>
											</tr>
											<tr>
												<c:forEach items="${list }" var="list">
													<tr>
														<td>${list.qnaType }</td>
														<td>${list.productNo }</td>
														<td>${list.title }</td>
														<td><fmt:formatDate value="${list.registDate}"
																pattern="yyyy-MM-dd"></fmt:formatDate></td>
														<c:choose>
															<c:when test="${list.qnaState == 0 }">
																<td>답변대기</td>
															</c:when>
															<c:otherwise>
																<td>답변완료</td>
															</c:otherwise>
														</c:choose>
													</tr>
												</c:forEach>
											</tr>
										</c:when>
										
										<c:otherwise>
											<td>작성한 문의가 없습니다</td>
										</c:otherwise>
									</c:choose>

								</table>
							</div>
							<c:set var="curPage" value="${pagination.currentPage }" />
							<c:set var="start" value="${pagination.startPage }" />
							<c:set var="end" value="${pagination.endPage }" />

							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<c:if test="${pagination.prev }">
										<li class="page-item"><a class="page-link"
											href="myProdQnaDetailForm.do?page=${curPage - 1}"
											aria-label="Next"> <span aria-hidden="true">&laquo;</span>
												<span class="sr-only">Previous</span>
										</a></li>
									</c:if>
									<c:forEach var="idx" begin="${start }" end="${end }" step="1">
										<c:choose>
											<c:when test="${idx == curPage}">
												<li class="page-item active"><a class="page-link"
													href="myProdQnaDetailForm.do?page=${idx}">${idx}</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
													href="myProdQnaDetailForm.do?page=${idx}">${idx}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${pagination.next}">
										<li class="page-item"><a class="page-link"
											href="myProdQnaDetailForm.do?page=${curPage + 1}"
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

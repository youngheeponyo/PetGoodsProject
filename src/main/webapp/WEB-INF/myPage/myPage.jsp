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
								</a><a class="nav-link" href="idpwCheckForm.do">
									<div class="sb-nav-link-icon">
										<i class="bi bi-person"></i>
									</div> 내정보수정
								</a><a class="nav-link" href="updatePwForm.do">
									<div class="sb-nav-link-icon">
										<i class="bi bi-person"></i>
									</div> 비밀번호 변경
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
						<div class="row">
							<div class="col-xl-6">
								<div class="card mb-4">
									<div class="card-header" style="font-size: 1.5em;">
										<i class="bi bi-basket3-fill"></i> 주문내역
										<button type="button" class="btn btn-outline-secondary"
											style="float: right;">
											<a href="orderDetailForm.do" style="color: black;">더보기</a>
										</button>
									</div>
									<div class="card-body" style="height: 170px;">
										<div class="d-flex justify-content-center">
											<table class="table w-85">
												<c:forEach items="${orderList }" var="order">
													<fmt:formatDate value="${order.orderDate}"
														pattern="yyyy-MM-dd" var="formattedDate" />
													<tr>
														<td>${order.merUid }</td>
														<td><a
															href="detailProduct.do?pno=${order.productNo }">${order.productName }</a></td>
														<td>${order.productPrice }원</td>
														<td>${order.buyCnt }개</td>
														<td>${formattedDate}</td>
													</tr>
												</c:forEach>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-6">
								<div class="card mb-4">
									<div class="card-header" style="font-size: 1.5em;">
										<i class="bi bi-upc-scan"></i> 만료예정쿠폰
										<button type="button" class="btn btn-outline-secondary"
											style="float: right;">
											<a href="couponDetailForm.do" style="color: black;">더보기</a>
										</button>
									</div>
									<div class="card-body" style="height: 170px;">
										<div class="d-flex justify-content-center">
											<table class="table w-85">
												<c:choose>
													<c:when test="${!empty endList}">
														<c:forEach items="${endList }" var="end">
															<tr>
																<td>${end.couponName }</td>
																<td>${end.discountPct }</td>
																<td style="text-align: center;"><fmt:formatDate
																		value="${end.endDate}" pattern="yyyy-MM-dd  "></fmt:formatDate></td>
																<td
																	style="text-align: center; color: red; font-weight: bold;">만료예정</td>
															</tr>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<tr>
															<td>만료예정인 쿠폰이 없습니다.</td>
														</tr>
														<tr>
															<td>더보기를 눌러 보유쿠폰을 확인해주세요</td>
														</tr>
													</c:otherwise>
												</c:choose>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xl-6">
								<div class="card mb-4">
									<div class="card-header" style="font-size: 1.5em;">
										<i class="bi bi-box-seam"></i> 상품문의
										<button type="button" class="btn btn-outline-secondary"
											style="float: right;">
											<a href="myProdQnaDetailForm.do" style="color: black;">더보기</a>
										</button>
									</div>
									<div class="card-body" style="height: 170px;">
										<div class="d-flex justify-content-center">
											<table class="table w-85">
												<c:choose>
													<c:when test="${!empty qnaList}">
														<tr>
															<c:forEach items="${qnaList }" var="qnaList">
																<tr>
																	<td>${qnaList.qnaType }</td>
																	<td>${qnaList.productNo }</td>
																	<td>${qnaList.title }</td>
																	<td><fmt:formatDate value="${qnaList.registDate}"
																			pattern="yyyy-MM-dd"></fmt:formatDate></td>
																	<c:choose>
																		<c:when test="${qnaList.qnaState == 0 }">
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
														<tr>
															<th>작성한 문의글이 없습니다.</th>
														</tr>
													</c:otherwise>
												</c:choose>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-6">
								<div class="card mb-4">
									<div class="card-header" style="font-size: 1.5em;">
										<i class="bi bi-chat-left-text"></i> 최근작성리뷰
										<button type="button" class="btn btn-outline-secondary"
											style="float: right;">
											<a href="myReviewDetailForm.do" style="color: black;">더보기</a>
										</button>
									</div>
									<div class="card-body" style="height: 170px;">
										<div class="d-flex justify-content-center"
											style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
											<table class="table w-85">
												<c:choose>
													<c:when test="${!empty recentReviewList}">
														<tr>
															<c:forEach items="${recentReviewList }" var="rereList">
																<tr>
																	<td>${rereList.productName }</td>
																	<td>${rereList.content }</td>
																	<td><fmt:formatDate value="${rereList.reviewDate}"
																			pattern="yyyy-MM-dd"></fmt:formatDate></td>

																</tr>
															</c:forEach>
														</tr>
													</c:when>
													<c:otherwise>
														<tr>
															<th>작성한 리뷰가 없습니다.</th>
														</tr>
													</c:otherwise>
												</c:choose>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</main>
				</div>

			</div>
		</div>
</section>


<script src="adminResource/assets/demo/chart-area-demo.js"></script>
<script src="adminResource/assets/demo/chart-bar-demo.js"></script>
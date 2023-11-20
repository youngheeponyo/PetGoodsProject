<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
							<table class="table">
								<thead>
									<tr>
										<th>만료예정쿠폰</th>
									</tr>
									<tr>
										<td>일주일이하인쿠폰</td>
									</tr>
									<tr>
										<th>현재 보유중인 쿠폰</th>
									</tr>
									<tr>
										<td>{}장</td>
									</tr>

								</thead>
							</table>
						</div>
					</main>
				</div>
			</div>
		</div>
	</div>
</section>

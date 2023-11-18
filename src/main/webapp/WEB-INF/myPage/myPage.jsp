<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<section class="pt-2 pb-4">
			<div class="container px-4 px-lg-5 mt-3">
				<div class="container-fluid px-4">
				
					<div class="row">
						<div class="col-xl-6">
							<div class="card mb-4">
								<div class="card-header">
									<i class="bi bi-basket3-fill"></i> 주문내역 
									<button type="button" class="btn btn-outline-secondary" style="float:right;"><a href="orderDetailForm.do" style="color:black;">더보기</a></button>
								</div>
								<div class="card-body">
									<h3>주문내역현황</h3>
								</div>
							</div>
						</div>
						<div class="col-xl-6">
							<div class="card mb-4">
								<div class="card-header">
									<i class="bi bi-ticket-perforated"></i> 보유중인쿠폰
									<button type="button" class="btn btn-outline-secondary" style="float:right;">더보기</button>
								</div>
								<div class="card-body">
									<h3>만료일가까운순</h3>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-6">
							<div class="card mb-4">
								<div class="card-header">
									<i class="bi bi-box-seam"></i> 상품문의
									<button type="button" class="btn btn-outline-secondary" style="float:right;">더보기</button>
								</div>
								<div class="card-body">
									<h3>최근상품문의내역</h3>
								</div>
							</div>
						</div>
						<div class="col-xl-6">
							<div class="card mb-4">
								<div class="card-header">
									<i class="bi bi-chat-left-text"></i> 내리뷰보기
									<button type="button" class="btn btn-outline-secondary" style="float:right;">더보기</button>
								</div>
								<div class="card-body">
									<h3>최근리뷰내역</h3>
								</div>
							</div>
						</div>
					</div>
					
					
					
				</div>
			</div>
		</section>

	<script src="adminResource/assets/demo/chart-area-demo.js"></script>
	<script src="adminResource/assets/demo/chart-bar-demo.js"></script>

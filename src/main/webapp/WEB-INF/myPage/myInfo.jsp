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
								<a class="nav-link" href="myInfo.do">
									<div class="sb-nav-link-icon">
										<i class="bi bi-person"></i>
									</div> 내정보관리
								</a><a class="nav-link" href="orderDetailForm.do">
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
								</a><a class="nav-link" href="myPetInfo.do">
									<div class="sb-nav-link-icon">
										<i class="bi bi-reddit"></i>
									</div> 내반려동물정보
								</a><a class="nav-link" href="delUserForm.do">
									<div class="sb-nav-link-icon">
										<i class="bi bi-person"></i>
									</div> 회원 탈퇴
								</a>
							</div>
						</div>
					</nav>
				</div>
				<div id="layoutSidenav_content">
					<main>
						<div class="container-fluid px-4">
						<h3 class="mt-4" style= text-align:center>나의 정보</h3>
		                    <br>
		                    <hr>
						<div class="mb-3">
							<h5>아이디</h5><p class="form-control" id="uid">${vo.userId }</p>
						</div>
						<div class="mb-3">
							<h5>이름</h5><p class="form-control">${vo.nickName }</p>
						</div>
						<div class="mb-3" >
							<h5>이메일</h5><p class="form-control">${vo.userMail }</p>
						</div>
						<div class="mb-3">
						<fmt:formatDate value="${vo.userBirth}" pattern="yyyy년 MM월 dd일" var="formatdDate" />
							<h5>생년월일</h5><p class="form-control" id="ubt">${formatdDate }</p>
						</div>
						<div class="mb-3">
							<h5>전화번호</h5><p class="form-control">${vo.userPhone }</p>
						</div>
						<div class="mb-3">
							<h5>주소</h5><p class="form-control">${vo.userAddr }</p>
						</div>
						</div>
						<div class="mb-4" style="text-align:center;">
							<button type="button" onclick="location.href='idpwCheckForm.do'" style="margin:10px;padding:8px">내 정보 변경</button>
							<c:if test="${uid != '3160394043' }">
								<button type="button" onclick="location.href='updatePwForm.do'" style="margin:10px;padding:8px">비밀번호 변경</button>
							</c:if>
							<button type="button" onclick="location.href='myPage.do'" style="margin:10px;padding:8px">돌아가기</button>
						</div>
				</main>
			</div>
		</div>
	<footer class="my-3 text-center text-small"> </footer>
			</div>
		</div>
</section>







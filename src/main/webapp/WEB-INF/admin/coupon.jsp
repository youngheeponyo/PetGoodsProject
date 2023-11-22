<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<section class="py-5" style="width:500px;margin:auto">
	<div class="container px-4 px-lg-5 mt-5">
		<div class="container-fluid">
			<form action="insertCoupon.do" name="insertCouponForm" method="post" style="text-align: center">

				<h3>관리자 권한 쿠폰</h3>
				<br>
				<table class="table" border="1">
					<tr>
						<th>회원번호</th>
						<td><input type="hidden" name="uno" value="${uno }">${uno }</td>
					</tr>
					<tr>
						<th>쿠폰종류</th>
						<td><select name="cname"
							onchange="qnaTypeCheck(this.value)">
								<option value="" selected disabled>선택해주세요</option>
								<option value="신규유저 가입축하쿠폰">신규유저 가입축하쿠폰</option>
								<option value="반려동물 생일쿠폰">반려동물 생일쿠폰</option>
								<option value="깜짝 쿠폰">깜짝 쿠폰</option>
								<option value="이벤트 쿠폰">이벤트 쿠폰</option>
						</select></td>
					</tr>
					<tr>
						<th>할인율</th>
						<td><select class="mainCategory" name="pct"
							onchange="getCategory(this.value)">
								<option value="" selected disabled>선택해주세요</option>
								<option value="10">10%</option>
								<option value="15">15%</option>
								<option value="30">30%</option>
								<option value="35">35%</option>
								<option value="50">50%</option>
						</select></td>
					</tr>
					<tr>
						<td colspan="14" align="center"><input type="submit" value="발급하기"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</section>
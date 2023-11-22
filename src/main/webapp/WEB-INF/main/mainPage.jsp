<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- warning 보여주기. -->
<c:if test="${!empty petBirthDay }">
	<script>
		alert('소중한 반려동물의 생일을 축하드립니다! \n나의 쿠폰함에서 생일축하쿠폰을 확인하세요')
	</script>
	<!-- session에 넣은 setAttribute를 무효화 하는 방법-->
<!-- 	아래처럼 새로 넣어주거나 아니면 꺽쇠%를 사용해서 자바로 바꿔서 적거나 --> -->
	${petBirthDay = null }
</c:if>
	

<c:choose>
	<c:when test="${curShowPetType eq 0}">
		<c:set var="petType" value="dog" />
	</c:when>
	<c:otherwise>
		<c:set var="petType" value="cat" />
	</c:otherwise>
</c:choose>

<section class="py-2">
	<div class="container px-4 px-lg-5 mt-5">
		<div>
			<h2 class="pl-2 py-2">요 상품 어때요?</h2>
			
		</div>
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

			<c:forEach items="${registDesc }" var="vo">
			<c:choose>
				<c:when test="${vo.productStock==0 }">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<div class="hoverImg">
								<img class="card-img-top"
									src="productImage/${petType }/${vo.productImage }" alt="..."
									style="object-fit: cover; height: 268px; opacity:0.5;" />
								<h3 style="color:red;position:absolute;top:30%;left:50%;transform: translate(-50%, -50%);">품절</h3>
							</div>
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center" style="height:120px;">
									<!-- Product name-->
									<h5 class="fw-bolder">${vo.productName }</h5>
									<!-- Product price-->
									₩ ${vo.productPrice }
								</div>
								<div class="text-center">
									<p style="color:#848BA0;">★${vo.avgStar }(${vo.reviewCnt})</p>
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="detailProduct.do?pno=${vo.productNo }&cno=${vo.categoryNo}&type=${vo.petType}">상세보기</a>
								</div>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<div class="hoverImg">
								<img class="card-img-top"
									src="productImage/${petType }/${vo.productImage }" alt="..."
									style="object-fit: cover; height: 268px;" />
							</div>
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center" style="height:120px;">
									<!-- Product name-->
									<h5 class="fw-bolder">${vo.productName }</h5>
									<!-- Product price-->
									₩ ${vo.productPrice }
								</div>
								<div class="text-center pt-4">
									<p style="color:#848BA0;">★${vo.avgStar }(${vo.reviewCnt})</p>
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="detailProduct.do?pno=${vo.productNo }&cno=${vo.categoryNo}&type=${vo.petType}">상세보기</a>
								</div>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
			</c:forEach>
		</div>
	</div>
</section>
<section class="py-2">
	<div class="container px-4 px-lg-5 mt-5">
		<div>
			<h2 class="pl-2 py-2">리뷰 많은 순</h2>
		</div>
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

			<c:forEach items="${reviewDesc }" var="vo">
			<c:choose>
				<c:when test="${vo.productStock==0 }">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<div class="hoverImg">
								<img class="card-img-top"
									src="productImage/${petType }/${vo.productImage }" alt="..."
									style="object-fit: cover; height: 268px; opacity:0.5;" />
								<h3 style="color:red;position:absolute;top:30%;left:50%;transform: translate(-50%, -50%);">품절</h3>
							</div>
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center" style="height:120px;">
									<!-- Product name-->
									<h5 class="fw-bolder">${vo.productName }</h5>
									<!-- Product price-->
									₩ ${vo.productPrice }
								</div>
								<div class="text-center pt-4">
									<p style="color:#848BA0;">★${vo.avgStar }(${vo.reviewCnt})</p>
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="detailProduct.do?pno=${vo.productNo }&cno=${vo.categoryNo}&type=${vo.petType}">상세보기</a>
								</div>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<div class="hoverImg">
								<img class="card-img-top"
									src="productImage/${petType }/${vo.productImage }" alt="..."
									style="object-fit: cover; height: 268px;" />
							</div>
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center" style="height:120px;">
									<!-- Product name-->
									<h5 class="fw-bolder">${vo.productName }</h5>
									<!-- Product price-->
									₩ ${vo.productPrice }
								</div>
								<div class="text-center pt-4">
									<p style="color:#848BA0;">★${vo.avgStar }(${vo.reviewCnt})</p>
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="detailProduct.do?pno=${vo.productNo }&cno=${vo.categoryNo}&type=${vo.petType}">상세보기</a>
								</div>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
			</c:forEach>
		</div>
	</div>
</section>
<section class="py-2">
	<div class="container px-4 px-lg-5 mt-5">
		<div>
			<h2 class="pl-2 py-2">별점 높은순</h2>
		</div>
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

			<c:forEach items="${starCntDesc }" var="vo">
				<c:choose>
				<c:when test="${vo.productStock==0 }">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<div class="hoverImg">
								<img class="card-img-top"
									src="productImage/${petType }/${vo.productImage }" alt="..."
									style="object-fit: cover; height: 268px; opacity:0.5;" />
								<h3 style="color:red;position:absolute;top:30%;left:50%;transform: translate(-50%, -50%);">품절</h3>
							</div>
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center" style="height:120px;">
									<!-- Product name-->
									<h5 class="fw-bolder">${vo.productName }</h5>
									<!-- Product price-->
									₩ ${vo.productPrice }
								</div>
								<div class="text-center pt-4">
									<p style="color:#848BA0;">★${vo.avgStar }(${vo.reviewCnt})</p>
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="detailProduct.do?pno=${vo.productNo }&cno=${vo.categoryNo}&type=${vo.petType}">상세보기</a>
								</div>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<div class="hoverImg">
								<img class="card-img-top"
									src="productImage/${petType }/${vo.productImage }" alt="..."
									style="object-fit: cover; height: 268px;" />
							</div>
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center" style="height:120px;">
									<!-- Product name-->
									<h5 class="fw-bolder">${vo.productName }</h5>
									<!-- Product price-->
									₩ ${vo.productPrice }
								</div>
								<div class="text-center my-2">
									<p style="color:#848BA0;">★${vo.avgStar }(${vo.reviewCnt})</p>
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="detailProduct.do?pno=${vo.productNo }&cno=${vo.categoryNo}&type=${vo.petType}">상세보기</a>
								</div>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
			</c:forEach>
		</div>
	</div>
</section>
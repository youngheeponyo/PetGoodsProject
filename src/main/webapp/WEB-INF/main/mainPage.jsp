<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
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
         <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

	<c:forEach items="${registDesc }" var="vo">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <div class="hoverImg">
                            	<img class="card-img-top" src="productImage/${petType }/${vo.productImage }" alt="..." style="object-fit: cover; height: 268px;" />
                            </div>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${vo.productName }</h5>
                                    <!-- Product price-->
                                   ₩ ${vo.productPrice }
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="detailProduct.do?pno=${vo.productNo }&cno=${vo.categoryNo}&type=${vo.petType}">상세보기</a></div>
                            </div>
                        </div>
                    </div>
	</c:forEach>
	                </div>
            </div>
</section>
<section class="py-2">
	<div class="container px-4 px-lg-5 mt-5">
	         	<div>
        			<h2 class="pl-2 py-2">리뷰 많은 순</h2>
    			</div>
         <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

	<c:forEach items="${reviewDesc }" var="vo">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <div class="hoverImg">
                            	<img class="card-img-top" src="productImage/${petType }/${vo.productImage }" alt="..." style="object-fit: cover; height: 268px;"/>
                            </div>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${vo.productName }</h5>
                                    <!-- Product price-->
                                   ₩ ${vo.productPrice }
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="detailProduct.do?pno=${vo.productNo }&cno=${vo.categoryNo}">상세보기</a></div>
                            </div>
                        </div>
                    </div>
	</c:forEach>
	                </div>
            </div>
</section>
<section class="py-2">
	<div class="container px-4 px-lg-5 mt-5">
	         	<div>
        			<h2 class="pl-2 py-2">별점 높은순</h2>
    			</div>
         <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

	<c:forEach items="${starCntDesc }" var="vo">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <div class="hoverImg">
                            	<img class="card-img-top" src="productImage/${petType }/${vo.productImage }" alt="..." style="object-fit: cover; height: 268px;"/>
                            </div>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${vo.productName }</h5>
                                    <!-- Product price-->
                                   ₩ ${vo.productPrice }
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="detailProduct.do?pno=${vo.productNo }&cno=${vo.categoryNo}">상세보기</a></div>
                            </div>
                        </div>
                    </div>
	</c:forEach>
	                </div>
            </div>
</section>
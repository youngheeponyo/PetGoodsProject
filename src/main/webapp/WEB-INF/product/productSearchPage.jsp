<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:choose>
	<c:when test="${curShowPetType eq 0}">
		<c:set var="petType" value="dog" />
	</c:when>
	<c:otherwise>	
		<c:set var="petType" value="cat" />
	</c:otherwise>
</c:choose>


<div class="container mt-5">
	<h2 class="text-center"><b>'${query }'</b>에 대한 검색결과</h1>
	<h3 class="text-center"><b>${fn:length(searchList) }</b>개의 상품</h3>
</div>
<section class="py-3">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <c:forEach items="${searchList }" var="product">
					<div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="productImage/${petType }/${product.productImage}" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${product.productName }</h5>
                                    <!-- Product price-->
                                    ${product.productPrice }원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="detailProduct.do?pno=${product.productNo }">상세보기</a></div>
                            </div>
                        </div>
                    </div>
				</c:forEach>
                </div>
            </div>
        </section>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
	<c:when test="${curShowPetType eq 0}">
		<c:set var="petType" value="dog" />
	</c:when>
	<c:otherwise>	
		<c:set var="petType" value="cat" />
	</c:otherwise>
</c:choose>

<section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="productImage/${petType }/${pno.productImage }" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">${pno.productRegist }</div>
                        <h1 class="display-5 fw-bolder">${pno.productName }</h1>
                        <div class="fs-5 mb-5">
                            <span>가격  ${pno.productPrice }원</span>
                        </div>
                        <p class="lead">${pno.productDesc }</p>
                        <div class="d-flex">
                            <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />
                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                <i class="bi-cart-fill me-1"></i>
                                Add to cart
                            </button>
                        </div>
                    </div>
                </div>
				<img class="container px-4 px-lg-5 my-5" src="productImage/detail/${pno.productDetailImage }" alt="" />
            </div>
        </section>
        
        
        
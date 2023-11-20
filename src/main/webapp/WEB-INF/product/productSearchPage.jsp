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
	<h3 class="text-center"><b>${pagination.total }</b>개의 상품</h3>
</div>
<section class="py-3">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <c:forEach items="${searchList }" var="product">
					<div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <div class="hoverImg">
                            	<img class="card-img-top" src="productImage/${petType }/${product.productImage}" alt="..." style="object-fit: cover; height: 268px;" />
                            </div>
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
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="detailProduct.do?pno=${product.productNo }&cno=${product.categoryNo}&type=${product.petType}">상세보기</a></div>
                            </div>
                        </div>
                    </div>
				</c:forEach>
                </div>
            </div>
        </section>

<c:set var="curPage" value="${pagination.currentPage }" />
<c:set var="start" value="${pagination.startPage }" />
<c:set var="end" value="${pagination.endPage }" />

<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
  	<c:if test="${pagination.prev }">
    	<li class="page-item">
    		<c:choose>
    			<c:when test="${active eq 'category' }">
    				<a class="page-link" href="categorySearch.do?categoryNo=${categoryNo }&type=${curShowPetType}&page=${curPage - 1}" aria-label="Next">
    			</c:when>
    			<c:when test="${active eq 'search' }">
    				<a class="page-link" href="productSearch.do?q=${query }&type=${curShowPetType}&page=${curPage - 1}" aria-label="Next">
    			</c:when>
    			<c:when test="${active eq 'newProduct' }">
    				<a class="page-link" href="showNewProduct.do?page=${curPage - 1}" aria-label="Next">
    			</c:when>
    			<c:when test="${active eq 'bestSell' }">
    				<a class="page-link" href="showBestProduct.do?page=${curPage - 1}" aria-label="Next">
    			</c:when>
    			<c:when test="${active eq 'highStar' }">
    				<a class="page-link" href="showRecommendProduct.do?page=${curPage - 1}" aria-label="Next">
    			</c:when>
    		</c:choose>
        		<span aria-hidden="true">&laquo;</span>
        		<span class="sr-only">Previous</span>
      		</a>
    	</li>
    </c:if>
    <c:forEach var="idx" begin="${start }" end="${end }" step="1">
    	<c:choose>
    		<c:when test="${active eq 'category' }">
    			<c:choose>
            		<c:when test="${idx == curPage}">
            			<li class="page-item active"><a class="page-link" href="categorySearch.do?categoryNo=${categoryNo }&type=${curShowPetType}&page=${idx}">${idx}</a></li>		
            		</c:when>
            		<c:otherwise>
            			<li class="page-item"><a class="page-link" href="categorySearch.do?categoryNo=${categoryNo }&type=${curShowPetType}&page=${idx}">${idx}</a></li>
            		</c:otherwise>
        		</c:choose>
    		</c:when>
    		<c:when test="${active eq 'search' }">
				<c:choose>
            		<c:when test="${idx == curPage}">
            			<li class="page-item active"><a class="page-link" href="productSearch.do?q=${query }&type=${curShowPetType}&page=${idx}">${idx}</a></li>		
            		</c:when>
            		<c:otherwise>
            			<li class="page-item"><a class="page-link" href="productSearch.do?q=${query }&type=${curShowPetType}&page=${idx}">${idx}</a></li>
            		</c:otherwise>
        		</c:choose>
			</c:when>
			<c:when test="${active eq 'newProduct' }">
				<c:choose>
            		<c:when test="${idx == curPage}">
            			<li class="page-item active"><a class="page-link" href="showNewProduct.do?page=${idx}">${idx}</a></li>		
            		</c:when>
            		<c:otherwise>
            			<li class="page-item"><a class="page-link" href="showNewProduct.do?page=${idx}">${idx}</a></li>
            		</c:otherwise>
        		</c:choose>
			</c:when>
			<c:when test="${active eq 'bestSell' }">
				<c:choose>
            		<c:when test="${idx == curPage}">
            			<li class="page-item active"><a class="page-link" href="showBestProduct.do?page=${idx}">${idx}</a></li>		
            		</c:when>
            		<c:otherwise>
            			<li class="page-item"><a class="page-link" href="showBestProduct.do?page=${idx}">${idx}</a></li>
            		</c:otherwise>
        		</c:choose>
    		</c:when>
    		<c:when test="${active eq 'highStar' }">
				<c:choose>
            		<c:when test="${idx == curPage}">
            			<li class="page-item active"><a class="page-link" href="showRecommendProduct.do?page=${idx}">${idx}</a></li>		
            		</c:when>
            		<c:otherwise>
            			<li class="page-item"><a class="page-link" href="showRecommendProduct.do?page=${idx}">${idx}</a></li>
            		</c:otherwise>
        		</c:choose>
    		</c:when>
		</c:choose>
	</c:forEach>
	<c:if test="${pagination.next}">
    	<li class="page-item">
    		<c:choose>
    			<c:when test="${active eq 'category' }">
    				<a class="page-link" href="categorySearch.do?categoryNo=${categoryNo }&type=${curShowPetType}&page=${curPage + 1}" aria-label="Next">
    			</c:when>
    			<c:when test="${active eq 'search' }">
    				<a class="page-link" href="productSearch.do?q=${query }&type=${curShowPetType}&page=${curPage + 1}" aria-label="Next">
    			</c:when>
    			<c:when test="${active eq 'newProduct' }">
    				<a class="page-link" href="showNewProduct.do?page=${curPage + 1}" aria-label="Next">
    			</c:when>
    			<c:when test="${active eq 'bestSell' }">
    				<a class="page-link" href="showBestProduct.do?page=${curPage + 1}" aria-label="Next">
    			</c:when>
    			<c:when test="${active eq 'highStar' }">
    				<a class="page-link" href="showRecommendProduct.do?page=${curPage + 1}" aria-label="Next">
    			</c:when>
    		</c:choose>
        		<span aria-hidden="true">&raquo;</span>
        		<span class="sr-only">Next</span>
      		</a>
    	</li>
    </c:if>
  </ul>
</nav>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
 <!-- 다른경로로 진입시 main에서 categoryList 다시 받아오게끔유도 -->
<c:if test="${empty categoryMap }">
	<jsp:forward page="/main.do"></jsp:forward>
</c:if>

<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light"> <!-- bg-light -->
            <div class="container px-4 px-lg-5">
                
                <c:choose>
                	<c:when test="${curShowPetType eq '0'}">
                		<a class="navbar-brand mr-0" href="main.do" style="font-family: 'Single Day', cursive;font-size:28px;font-weight:bold;color:#f0768b">디어마이 독</a>
                		<img class ="mr-3" src="commonResource/image/mainIcon/dogIcon.png" alt="dog" style="width:40px;height:40px;">
                	</c:when>
                	<c:otherwise>
                		<a class="navbar-brand mr-0" href="main.do" style="font-family: 'Single Day', cursive;font-size:28px;font-weight:bold;color:#f0768b">디어마이 캣</a>
                		<img class ="mr-3" src="commonResource/image/mainIcon/catIcon.png" alt="cat" style="width:40px;height:40px;">
                	</c:otherwise>
                </c:choose>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse d-flex justify-content-between" id="navbarSupportedContent">
                	<div class="input-group w-50">
  						<input type="text" class="form-control" placeholder="Search" aria-label="Username" aria-describedby="basic-addon1" id="searchBar">
  						<div class="input-group-append">
    						<button class="input-group-text" id="searchBtn"><i class="fa fa-search pt-2"></i></button>
  						</div>
					</div>
					
                    <form class="d-flex gap-3">
                    	<button class="btn" id="changeBtn">
                    	<c:choose>
                    		<c:when test="${curShowPetType == '0' }">
                            	<i class="fas fa-cat fa-2x"></i>
                            </c:when>
                            <c:otherwise>
                            	<i class="fas fa-dog fa-2x"></i>
                            </c:otherwise>
                        </c:choose>	
                        </button>
		                <c:choose>
		                	<c:when test="${!empty uno }">
		                		<button class="btn" type="button" onclick="location.href='myPage.do'">
                             		<i class="far fa-user fa-2x"></i>
                        		</button>
                        		<button class="btn" type="button" onclick="location.href='logout.do'">
                             		<i class="far fa-user fa-2x">로그아웃</i>
                        		</button>
		                		<button class="btn" type="button" onclick="location.href='myCart.do?uno=${uno }'">
                            		<i class="bi-cart-fill me-1"></i>
                            		<span class="badge bg-dark text-white ms-1 rounded-pill" id="cartCnt">
                            		<c:set var="sum" value="0"/>
                            		<c:forEach items="${cl }" var="vo" varStatus="status">
                            			<c:set var="sum" value="${sum + vo.selCnt }"></c:set>
                            		</c:forEach>
                            		<c:out value="${sum }"/>
									</span>
                        		</button>
		                	</c:when>
		                	<c:otherwise>
		                		<button class="btn" type="button" onclick="location.href='loginForm.do'">
                             		<i class="far fa-user fa-2x"></i>
                        		</button>
		                		<button class="btn" type="button" onclick="location.href='loginForm.do'">
                            		<i class="bi-cart-fill me-1"></i>
                            		<span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        		</button>
		                	</c:otherwise>
		                </c:choose>     
                    </form>
                </div>
            </div>
        </nav>
        <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container px-4 px-lg-5 d-flex justify-content-between">
            	<ul class="navbar-nav">
            			<li class="nav-item dropdown d-flex">
            				<i class="fas fa-bars custom-padding"></i>
                            <a class="nav-link dropdown-toggle" id="multiDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <c:forEach items="${categoryMap }" var="category">
                                	<c:set var="mainCategoryName" value="${category.value[0].mainCateName }" scope="request" />
                                	<li class="dropdown-submenu dropend">
                						<a class="dropdown-item dropdown-toggle" href="#">${mainCategoryName }</a>
                						<ul class="dropdown-menu">
                						<c:forEach items="${category.value }" var="sub">
                    						<li><a class="dropdown-item" id="${sub.subCateNo }" href="#" onclick="searchCategory(this.id);">${sub.subCateName}</a></li>
                						</c:forEach>
                						</ul>
            						</li>
                                </c:forEach>
                            </ul>
                        </li>
                        	<li class="nav-item"><a class="nav-link" aria-current="page" href="showNewProduct.do">신상품</a></li>
	                        <li class="nav-item"><a class="nav-link" href="showBestProduct.do">베스트상품</a></li>
	                        <li class="nav-item"><a class="nav-link" href="showRecommendProduct.do">추천상품</a></li>
                    </ul>
                <ul class="navbar-nav">
                	<li class="nav-item"><a class="nav-link" href="#">나의쿠폰(임시)</a></li>
                	<li class="nav-item"><a class="nav-link" aria-current="page" href="noticeList.do">공지사항</a></li>
                    <li class="nav-item"><a class="nav-link" href="getUserQnaAllList.do">고객센터</a></li>
                    <c:choose>
						<c:when test="${uno == 0 && permission == 0}">
							<li class="nav-item"><a class="nav-link" aria-current="page" href="adminPage.do">관리자페이지</a></li>
						</c:when>
				</c:choose>
                </ul>
            </div>
        </nav>
        
<script>

<!-- 카테고리 Dropdown관련  -->
	$(document).ready(function(){
    	$('.dropdown-submenu a.dropdown-item').on("click", function(e){
        	var $submenu = $(this).next('ul');

        	$('.dropdown-submenu ul.show').not($submenu).removeClass('show');

        	$submenu.toggleClass('show');
        	e.stopPropagation();
        	e.preventDefault();
    	});
    
    	$(document).on('click', function(e){
        	if(!$(e.target).closest('.dropdown-submenu').length){
            	$('.dropdown-submenu ul.show').removeClass('show');
        	}
    	});
	});
	
	
	let queryContent = "";
	let queryURL = "productSearch.do?q=";
	let petType = ${curShowPetType};
	<!-- 검색. page전환되므로 ajax는 x -->
	const searchInput = document.getElementById('searchBar');
	searchInput.addEventListener("keyup", (e) => {
		if(e.keyCode === 13) {
			const queryString = String(e.target.value);
			if(queryString.length <= 0)
				return;
			
			queryContent = queryString;
			document.getElementById('searchBtn').click();
		}
	});
	
	const searchBtn = document.getElementById('searchBtn');
	searchBtn.addEventListener("click", (e) => {
		queryContent = document.getElementById('searchBar').value;
		if(queryContent.length <= 0)
			return;
		
		queryURL += queryContent + "&type=" + petType + "&page=1";
		window.location.href = queryURL;
		
		queryContent = "";
		queryURL = "productSearch.do?q=";
	});
	
	function searchCategory(id) {
		window.location.href = "categorySearch.do?categoryNo=" + id + "&type=" + petType + "&page=1";
	}
	
	document.getElementById('changeBtn').addEventListener('click', changePetType)
	
	function changePetType(e) {
		e.preventDefault();
		let curPetType = ${curShowPetType};
		if(curPetType == "0") {
			curPetType = "1";	
		}
		else {
			curPetType = "0";
		}
		console.log(curPetType);
		window.location.href = "changePetType.do?changeType=" + curPetType;
	}
	
	
	//document.getElementById('cartCnt').innerHTML=2;
	
	
</script>
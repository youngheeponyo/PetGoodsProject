<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light"> <!-- bg-light -->
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand mr-0" href="main.do">마이디어 독</a>
                <img class ="mr-3" src="commonResource/image/mainIcon/dogIcon.png" alt="dog" style="width:40px;height:40px;">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse d-flex justify-content-between" id="navbarSupportedContent">
                	<div class="input-group w-50">
  						<input type="text" class="form-control" placeholder="Search" aria-label="Username" aria-describedby="basic-addon1">
  						<div class="input-group-append">
    						<span class="input-group-text" id="basic-addon2"><i class="fa fa-search pt-2"></i></span>
  						</div>
					</div>
					
                    <form class="d-flex gap-3">
                    	<button class="btn" type="submit">
                            <i class="fas fa-cat fa-2x"></i>	
                        </button>
                        <c:choose>
                        	<c:when test="${empty uno }">
		                        <a class="btn" href="loginForm.do">
		                            <i class="far fa-user fa-2x">로그인</i>
		                        </a>
		                        <a class="btn" href="addUserForm.do">
                           		 	<i class="far fa-user fa-2x">회원가입</i>
                       			</a>
                        	</c:when>
                        	<c:otherwise>
                        		<a class="btn" href="logout.do">
		                            <i class="far fa-user fa-2x">로그아웃</i>
		                        </a>
                        	</c:otherwise>
                        </c:choose>
                        
                        
                        
                        <button class="btn" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                        
                        
                    </form>
                </div>
            </div>
        </nav>
        <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container px-4 px-lg-5 d-flex justify-content-between">
            	<ul class="navbar-nav">
            			<li class="nav-item dropdown d-flex">
            				<i class="fas fa-bars custom-padding"></i>
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!"></a></li>
                                <!-- <li><hr class="dropdown-divider" /></li> 선 -->
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="#!">신상품</a></li>
	                        <li class="nav-item"><a class="nav-link" href="#!">베스트상품</a></li>
	                        <li class="nav-item"><a class="nav-link" href="#!">추천상품</a></li>
                    </ul>
                
                <ul class="navbar-nav">
                	<li class="nav-item"><a class="nav-link" aria-current="page" href="#!">공지사항</a></li>
                    <li class="nav-item"><a class="nav-link" href="#!">고객센터</a></li>
                </ul>
            </div>
        </nav>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="px-4 py-1 my-5 text-center">
		<h4 class="fw-bold text-body-emphasis mb-3">구매가 정상적으로 완료되었습니다!</h4>
    <div class="d-flex justify-content-center">
    	<hr class="w-50">
    </div>
    <div class="col-lg-6 mx-auto">
      <div class="d-grid gap-6 d-sm-flex justify-content-between py-5">
        <div>
        	<h5>상품명</h5>
        </div>
        <div>
        	<h5>${pName }</h5>
        </div>
      </div>
      <div class="d-grid gap-6 d-sm-flex justify-content-between py-5">
        <div>
        	<h5>주문번호</h5>
        </div>
        <div>
        	<h5>${orderList[0].merUid}</h5>
        </div>
      </div>
      <div class="d-grid gap-6 d-sm-flex justify-content-between py-5">
        <div>
        	<h5>결제일</h5>
        </div>
        <div>
        	<fmt:formatDate value="${orderList[0].orderDate}" pattern="yyyy-MM-dd HH:mm:ss" var="formattedDate" />
        	<h5>${formattedDate}</h5>
        </div>
      </div>
    </div>    
    <div class="d-flex justify-content-center">
    	<hr class="w-50">
    </div>
    
    <div class="col-lg-6 mx-auto">
      <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
        <button type="button" class="btn btn-outline-secondary  btn-lg px-4 gap-3" style="background-color:pink;"><a href="#" style="color:white;">주문내역 확인하기</a></button>
        <button type="button" class="btn btn-outline-secondary btn-lg px-4"><a href="main.do" style="color:black;">메인으로 가기</a></button>
      </div>
    </div>
  </div>
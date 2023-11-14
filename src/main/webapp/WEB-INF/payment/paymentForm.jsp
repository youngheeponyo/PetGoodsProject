<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="container">
<div class="row g-5">
      <div class="col-md-5 col-lg-4 order-md-last">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
          <span class="text-primary">장바구니</span>
          <span class="badge bg-primary rounded-pill">${fn:length(cartList) }</span>
        </h4>
        <ul class="list-group mb-3">
          <c:forEach items="${cartList }" var="cart">
          	<li class="list-group-item d-flex justify-content-between lh-sm">
            	<div>
              		<h6 class="my-0">${cart.productName }</h6>
              		<small class="text-muted">${cart.selCnt }개</small>
            	</div>
            	<span class="text-muted">${cart.productPrice }원</span>
          	</li>
          </c:forEach>
          <li class="list-group-item d-flex justify-content-between">
            <span>주문금액</span>
            <strong>${sumPrice }원</strong>
          </li>
        </ul>

        <form class="card p-2">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="">
            <button type="submit" class="btn btn-secondary">쿠폰선택</button>
          </div>
        </form>
      </div>
      <div class="col-md-7 col-lg-8">
        <h3 class="mb-5">주문하기</h3>
        <form class="needs-validation" novalidate>
          <div class="row g-3">
          	<div class="col-12">
          		<h2>배송지 정보</h2>
          		<hr>
          	</div>
          	
            <div class="col-12">
              <label for="firstName" class="form-label">이름</label>
              <input type="text" class="form-control" id="firstName" placeholder="" value="${userInfo.nickName }" required>
              <div class="invalid-feedback">
                이름 입력해주세요.
              </div>
            </div>

            <div class="col-12">
              <label for="email" class="form-label">이메일 <span class="text-muted">(Optional)</span></label>
              <input type="email" class="form-control" id="email" placeholder="you@example.com" value="${userInfo.userMail }">
              <div class="invalid-feedback">
                Please enter a valid email address for shipping updates.
              </div>
            </div>

            <div class="col-12">
              <label for="address" class="form-label">주소</label>
              <input type="text" class="form-control" id="address" placeholder="" value="${userInfo.userAddr }" required>
              <div class="invalid-feedback">
                주소 입력해주세요.
              </div>
            </div>
            
            <div class="col-12">
              <label for="phone" class="form-label">연락처</label>
              <input type="text" class="form-control" id="phone" placeholder="" value="${userInfo.userPhone }" required>
              <div class="invalid-feedback">
                연락처 입력해주세요.
              </div>
            </div>
            
            <div class="col-12">
              <label for="requestDelivery" class="form-label">배송 요청사항</label>
              <input type="text" class="form-control" id="requestDelivery" placeholder="" value="${userInfo.userPhone }" required>
            </div>

            
          </div>
			
		  <hr class="my-4">
		  
          <h4 class="mb-3">결제수단</h4>

          <div class="my-3">
            <div class="form-check">
              <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked required>
              <label class="form-check-label" for="credit">Credit card</label>
            </div>
            <div class="form-check">
              <input id="debit" name="paymentMethod" type="radio" class="form-check-input" required>
              <label class="form-check-label" for="debit">Debit card</label>
            </div>
            <div class="form-check">
              <input id="paypal" name="paymentMethod" type="radio" class="form-check-input" required>
              <label class="form-check-label" for="paypal">PayPal</label>
            </div>
          </div>

          <div class="row gy-3">
            <div class="col-md-6">
              <label for="cc-name" class="form-label">Name on card</label>
              <input type="text" class="form-control" id="cc-name" placeholder="" required>
              <small class="text-muted">Full name as displayed on card</small>
              <div class="invalid-feedback">
                Name on card is required
              </div>
            </div>

            <div class="col-md-6">
              <label for="cc-number" class="form-label">Credit card number</label>
              <input type="text" class="form-control" id="cc-number" placeholder="" required>
              <div class="invalid-feedback">
                Credit card number is required
              </div>
            </div>

            <div class="col-md-3">
              <label for="cc-expiration" class="form-label">Expiration</label>
              <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
              <div class="invalid-feedback">
                Expiration date required
              </div>
            </div>

            <div class="col-md-3">
              <label for="cc-cvv" class="form-label">CVV</label>
              <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
              <div class="invalid-feedback">
                Security code required
              </div>
            </div>
          </div>

          <hr class="my-4">
          
          <hr class="my-4">

          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="same-address">
            <label class="form-check-label" for="same-address">위 주문 내용을 확인하였으며 결제에 동의합니다.</label>
          </div>

          <hr class="my-4">

          <button class="w-100 btn btn-primary btn-lg" type="submit">결제하기</button>
        </form>
      </div>
    </div>
   </div>
   <script>
   (function () {
	   'use strict'

	   // Fetch all the forms we want to apply custom Bootstrap validation styles to
	   var forms = document.querySelectorAll('.needs-validation')

	   // Loop over them and prevent submission
	   Array.prototype.slice.call(forms)
	     .forEach(function (form) {
	       form.addEventListener('submit', function (event) {
	         if (!form.checkValidity()) {
	           event.preventDefault()
	           event.stopPropagation()
	         }

	         form.classList.add('was-validated')
	       }, false)
	     })
	 })()
   </script>
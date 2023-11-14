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
            		<input type="hidden" value="${cart.productNo }" class="prInfo">  <!-- productNo캐싱용 -->
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
              <label class="form-check-label" for="credit">신용카드</label>
            </div>
          </div>

          <hr class="my-4">

          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="confirmPayment">
            <label class="form-check-label" for="confirmPayment">위 주문 내용을 확인하였으며 결제에 동의합니다.</label>
          </div>

          <hr class="my-4">

          <button class="w-100 btn btn-primary btn-lg" id="paymentBtn">결제하기</button>
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
	 
	 // submit이면 새로고침되기에 addEventListener방식으로 처리
	 document.getElementById('paymentBtn').addEventListener('click', (e) => {
	   e.preventDefault();
	   let confirm = document.getElementById('confirmPayment').checked;
	   if(!confirm) {
			alert('결제 동의란 체크');
			return;
	   }
	   // 고유한 주문번호/거래번호 id
	   let merchantUID = String(new Date().getTime()) + ${uno};
	   let productCnt = ${fn:length(cartList)};
	   let productName = "";
	   let productNoList = document.querySelectorAll('.prInfo');

	   if(productCnt > 1) {
		   productName = '${cartList[0].productName}' + '외 ' + (productCnt - 1) + '개'
	   }
	   else {
		   productName = '${cartList[0].productName}';
	   }
	   let allPrice = ${sumPrice};
	   
	   // amount allPrice로 변경하자.
	   IMP.request_pay({ // param
	          pg: "html5_inicis",
	          pay_method: "card",
	          merchant_uid: merchantUID,
	          name: productName,
	          amount: 10, // 나중에 변경
	          buyer_email: "TEST@gmail.com",
	          buyer_name: "TEST",
	          buyer_tel: "010-1111-1111",
	          buyer_addr: "테스트"
	      }, function (response) { // callback
	          if (response.success) {
	              // 성공시 response.imp_uid에 정상적인값이 들어감.
	              // response.imp_uid(아임포트가 부여한 uid)
	              // response.merchant_uid(가맹점(나)이 지정한 uid)
	              console.log(response);
	              
	              const dataArray = [];
	              productNoList.forEach((obj) => {
	            	  dataArray.push({name : 'productNo', value: obj.value });
	              })
	              
	              dataArray.push({name : 'impUid', value: response.imp_uid});
	              dataArray.push({name : 'merUid', value: response.merchant_uid});
	              dataArray.push({name : 'payAmount', value: response.paid_amount});
	              
	              // URLSearchParams 객체 생성
	              const formData = new URLSearchParams();

	              // 배열의 데이터를 URLSearchParams에 추가
	              dataArray.forEach(({ name, value }) => {
	            	formData.append(name, value);
	              });
	              console.log(dataArray);
	              // 서버에서 가격검증
	              fetch('paymentComplete.do', {
	            	  method: "POST",
	            	  headers: {
	            		  "Content-Type":"application/x-www-form-urlencoded"
	            	  },
	              	  body: formData
	              })
	              .then(resolve => {
	            	  return resolve.json();
	              })
	              .then(result => {
	            	  console.log(result);
	              })
	          } else {
	              alert(response.error_msg);
	          }
	      });
   })
	 
	 IMP.init("imp46368323");
	 console.log(new Date().getTime());
   
   </script>
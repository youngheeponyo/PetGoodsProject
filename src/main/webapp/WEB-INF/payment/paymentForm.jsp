<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div id="couponmodal" class="modal fade" tabindex="-1" role="dialog" style="display: none;" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">쿠폰</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
      	<!-- 쿠폰연동할 예정 -->
         <select class="form-select" id="selectCoupon">
         	<option selected disabled>쿠폰선택</option>
  				<c:forEach items="${couponList }" var="coupon">
  					<option value="${coupon.couponNo }" class="${coupon.discountPct }">${coupon.couponName }</option>
  				</c:forEach>
		</select>
      </div>
      <div class="modal-footer">
      	<c:if test="${couponList.size() > 0 }">
      		<button type="button" class="btn btn-primary" id="selectCpn" onclick="selectCoupon()" data-dismiss="modal">쿠폰적용</button>
      	</c:if>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>  
<div class="container">
<div class="row g-5">
      <div class="col-md-5 col-lg-4 order-md-last">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
          <span class="text-primary">장바구니</span>
          <span class="badge bg-primary rounded-pill">${allAmount }</span>
        </h4>
        <ul class="list-group mb-3" id="pList">
          <c:forEach items="${cartList }" var="cart">
          	<li class="list-group-item d-flex justify-content-between lh-sm">
            	<div>
            		<input type="hidden" value="${cart.productNo }" class="prInfo">  <!-- productNo캐싱용 -->
              		<h6 class="my-0">${cart.productName }</h6>
              		<small class="prSel">${cart.selCnt }</small><small>개</small>
            	</div>
            	<span class="text-muted">${cart.productPrice * cart.selCnt }원</span>
          	</li>
          </c:forEach>
          <c:if test="${!empty addrFee }">
          	<li class="list-group-item d-flex justify-content-between bg-body-tertiary">
            	<div class="text-success">
              		<h6 class="my-0" id="fee">배송비</h6>
            	</div>
            	<span class="text-success">2500원</span>
          	</li>
          </c:if>
          <li class="list-group-item d-flex justify-content-between">
            <span>총 결제금액</span>
            <strong id="priceTag">${sumPrice }원</strong>
          </li>
        </ul>

        <form class="card p-2">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="" id="couponNameBox" style="font-size:10px;">
            <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#couponmodal">쿠폰선택</button>
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
              <select name="fruit" class="form-control" id="requestDelivery">
              	<option value="" disabled selected>배송 요청 사항을 선택하세요</option>
  				<option value="배송 전 연락바랍니다.">배송 전 연락바랍니다.</option>
  				<option value="부재시 휴대전화로 연락주세요.">부재시 휴대전화로 연락주세요.</option>
  				<option value="부재시 경비실에 맡겨주세요.">부재시 경비실에 맡겨주세요.</option>
  				<option value="부재시 문앞에 놓아주세요.">부재시 문앞에 놓아주세요.</option>
			  </select>
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
          
          <div class="my-3">
            <div class="form-check">
              <input id="toss" name="paymentMethod" type="radio" class="form-check-input" required>
              <label class="form-check-label" for="credit">토스페이</label>
            </div>
          </div>
          
          <div class="my-3">
            <div class="form-check">
              <input id="kakao" name="paymentMethod" type="radio" class="form-check-input" required>
              <label class="form-check-label" for="credit">카카오페이</label>
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
	 
	 let couponNo = -1;
	 
	 // submit이면 새로고침되기에 addEventListener방식으로 처리
	 document.getElementById('paymentBtn').addEventListener('click', (e) => {
	   e.preventDefault();
	   let deliveryReq = document.getElementById('requestDelivery');
	   let reqString = deliveryReq.options[deliveryReq.selectedIndex].value;
	   if(reqString == '') {
		   alert('배송 요청사항 선택');
		   return;
	   }
	   
	   let confirm = document.getElementById('confirmPayment').checked;
	   if(!confirm) {
			alert('결제 동의란 체크');
			return;
	   }
	   
	   // 고유한 주문번호/거래번호 id
	   let merchantUID = String(new Date().getTime()) + ${uno};
	   let productCnt = ${allAmount};
	   let productName = "";
	   let productNoList = document.querySelectorAll('.prInfo');
	   let productSelCntList = document.querySelectorAll('.prSel');
	   
	   if(productCnt > 1) {
		   productName = '${cartList[0].productName}' + '외 ' + (productCnt - 1) + '개'
	   }
	   else {
		   productName = '${cartList[0].productName}';
	   }
	   
	   let allPrice = document.getElementById('priceTag').innerHTML;
	   allPrice = allPrice.replace('원','');
	   allPrice = Number(allPrice);
	   
	   let choicePg = "";
	   if(document.getElementById('credit').checked) {
		   choicePg = "html5_inicis";
	   }
	   else if(document.getElementById('toss').checked) {
		   choicePg = "tosspay";
	   }
	   else if(document.getElementById('kakao').checked) {
		   choicePg = "kakaopay";
	   }
	   else {
		   alert('결제사 선택해주세요.')
		   return;
	   }
	   
	   // amount allPrice로 변경하자.
	   IMP.request_pay({ // param
	          pg: choicePg,
	          pay_method: "card",
	          merchant_uid: merchantUID,
	          name: productName,
	          amount: allPrice, 
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
	              
	              productSelCntList.forEach((obj) => {
	            	  dataArray.push({name : 'productSelCnt', value: obj.innerHTML });
	              })
	              
	              dataArray.push({name : 'impUid', value: response.imp_uid});
	              dataArray.push({name : 'merUid', value: response.merchant_uid});
	              dataArray.push({name : 'payAmount', value: response.paid_amount});
	              
	              if(document.getElementById('fee') != null) {
	              	dataArray.push({name: 'fee', value: 2500 });
	              }
	              
	              dataArray.push({name : 'deliveryReq', value: reqString});
	              if(couponNo >= 0) {
	            	  dataArray.push({name : 'couponNo', value: couponNo});  
	              }
	              
	              // URLSearchParams 객체 생성
	              const formData = new URLSearchParams();

	              // 배열의 데이터를 URLSearchParams에 추가
	              dataArray.forEach(({ name, value }) => {
	            	formData.append(name, value);
	              });
	              
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
	            	  if(result.retCode == 'invalidPrice') {
	            		  alert('실제 상품가격과 결제한 금액이 일치하지 않음.');
	            		  window.location.href="main.do";
	            	  }
	            	  else if(result.retCode == 'serverError') {
						  alert('서버 에러.');
						  window.location.href="main.do";
	            	  }
	            	  else {
	            		  // 결제완료 Form이동
	            		  var formData = new FormData();
	            		  for(let i = 0; i < productNoList.length; ++i) {
	            			  formData.append("pno", productNoList[i].value);
	            		  }
	            		  
	            		  // post방식으로 보내기위해서.
	            		  let form = document.createElement("form");
	            		  form.method = "post";
	            		  form.action = "payCompleteForm.do";
	            		  
	            		  for (var pair of formData.entries()) {
							var input = document.createElement("input");
	            			input.type = "hidden";
	            			input.name = pair[0];
	            			input.value = pair[1];
	            			form.appendChild(input);
	            		  }
	            		  
	            		  let input2 = document.createElement("input");
	            		  input2.type = "hidden";
	            		  input2.name = "merUid";
	            		  input2.value = merchantUID;
	            		  form.appendChild(input2);
	            		  
	            		  let input3 = document.createElement("input");
	            		  input3.type = "hidden";
	            		  input3.name = "pName";
	            		  input3.value = productName;
	            		  form.appendChild(input3);

	            		  document.body.appendChild(form);
	            		  form.submit();
	            		  
	            		  //window.location.href="payCompleteForm.do?" + queryString + '&merUid=' + merchantUID + '&pName=' + productName;  
	            		          		  
	            	  }
	              })
	          } else {
	              alert(response.error_msg);
	          }
	      });
   })
	 
	 IMP.init("imp46368323");
	 console.log(new Date().getTime());
   
	 
	 function selectCoupon() {
		let selectCoupon = document.getElementById("selectCoupon");
		let cpName = selectCoupon.options[selectCoupon.selectedIndex].text;
		let cpNo = selectCoupon.options[selectCoupon.selectedIndex].value;
		if(cpNo == "쿠폰선택") {
			alert('쿠폰을 선택해주세요.')
			return;
		}
		document.getElementById('couponNameBox').value = cpName;
		couponNo = cpNo;
		
		let discountPercent = Number(selectCoupon.options[selectCoupon.selectedIndex].className);
		// 이미 있는지 체크.
		let checkNode = document.getElementById('discount');
		if(checkNode != null) {
			checkNode.remove();
		}
		
		let len = document.getElementById('pList').children.length;
		let markNode = document.getElementById('pList').children[len-2];
		let insertNode;
		if(document.getElementById('fee') != null)
			insertNode = document.getElementById('pList').children[len-2];
		else
			insertNode = document.getElementById('pList').children[len-1];
		
		let parentNode = markNode.parentNode;
		let newNode = markNode.cloneNode(true);
		newNode.id = "discount";
		
		// 새로들어갈 노드.
		parentNode.insertBefore(newNode, insertNode);
		
		let divTag = document.getElementById('discount').querySelector('div');
		divTag.className = "text-danger";
		let notUseTags = divTag.querySelectorAll('small');
		if(notUseTags.length > 0) {
			for(let i = 0; i < notUseTags.length; ++i) {
				notUseTags[i].remove();
			}
		}
		
		let spanTag = document.getElementById('discount').querySelector('span');
		spanTag.className = "text-danger";
		
		let h6Tag = divTag.querySelector('h6');
		h6Tag.id = 'a';
		h6Tag.innerHTML = "할인금액";
		
		let inputTag = divTag.querySelector('input');
		if(inputTag != null) {
			inputTag.remove();
		}
		
		// 배송비를 제외한 상품금액에서의 할인을 때린다.
		let sumPric = ${sumPrice};
		let originalPrice = Number(sumPric);
		let fee = 0;
		if(document.getElementById('fee') != null) {
			originalPrice -= 2500;
			fee = 2500;
		}
		
		let disPrice = Math.floor(originalPrice * (discountPercent / 100));
		spanTag.innerHTML = disPrice + "원";	
		
		let finalPrice = originalPrice - disPrice + fee;
		document.getElementById('priceTag').innerHTML = finalPrice + "원";
	 }
   </script>
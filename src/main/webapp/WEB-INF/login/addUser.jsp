<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 화면 샘플 - Bootstrap</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
.cont{
	width:800px;
	margin:auto;
}
.input-form {
	max-width: 600px;
	padding: 32px;
	background: #e6c1c161;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
}
.hello {
	text-align:center;
	font-size:30px;
	margin: 20px;
	
}
</style>
</head>

<body>
	<form action="addUser.do" name="coupon" method="post">
		<div class="cont">
			<div class="input-form-backgroud row">
				<div class="input-form col-md-12 mx-auto">
					<h4 class="hello">회원가입</h4>
						<div class="row">
						<c:choose>
							<c:when test="${kId!=null }">
								<div class="col-md-6 mb-3">
									<label for="name"></label> <input type="hidden"
										class="form-control" id="names" name="uid" placeholder=""
										value="${kId }" required>
									<div class="invalid-feedback">아이디를 입력해주세요.</div>
								</div>
	
								<div class="col-md-6 mb-3">
									<label for="name"></label> <input type="hidden"
										class="form-control" id="pw" name="upw" placeholder=""
										value="${kPw }" required>
									<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col-md-6 mb-3">
									<label for="name">아이디</label> <input type="text"
										class="form-control" id="names" name="uid" placeholder="아이디"
										value="" required>
									<div class="invalid-feedback">아이디를 입력해주세요.</div>
								</div>
									<input type="button" onclick="chkfunction(uid.value)" id="idCheck" value="아이디 중복확인" style="margin-top:35px;width:150px;height:30px">
								<hr>
								<div class="col-md-6 mb-3">
									<label for="name">비밀번호</label> <input type="password" onchange="checkPWfunction(upw.value)"
										class="form-control" id="pw" name="upw" placeholder="비밀번호" value="" required>
									<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
								</div>
									<p id='alert' style="color:red;font-size:12px">비밀번호: 8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.</p>
								<hr>
							</c:otherwise>
						</c:choose>

							<div class="col-md-6 mb-3">
								<label for="nick">이름</label> <input type="text"
									class="form-control" id="nickname" name="nick" placeholder=""
									value="" required>
								<div class="invalid-feedback">이름을 입력해주세요.</div>
							</div>
						</div>

						<div class="mb-3">
							<label for="email">이메일</label> <input type="email"
								class="form-control" id="email" name="mail"
								placeholder="you@example.com" required>
							<div class="invalid-feedback">이메일을 입력해주세요.</div>
						</div>

						<div class="mb-3">
							<label for="birth">생년월일</label> <input type="date"
								class="form-control" id="birth" name="ubirth" placeholder=""
								required>
							<div class="invalid-feedback">생년월일을 입력해주세요.</div>
						</div>

						<div class="mb-3">
							<label for="phone">전화번호</label> <input type="text"
								class="form-control" id="phone" name="phone"
								placeholder="010-1234-1234" required>
							<div class="invalid-feedback">전화번호를 입력해주세요.</div>
						</div>
						
						<input type="text" id="sample4_postcode" placeholder="우편번호"  style="margin:5px 0" readonly>
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="margin:5px 0"><br> 
						<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="addr" style="margin:5px 0" readonly> 
						<span id="guide" style="color: #999; display: none"></span>
						<input type="text" id="sample4_detailAddress" name="addr_detail" placeholder="상세주소" style="margin:5px 0">

						<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<script>
							//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
							function sample4_execDaumPostcode() {
								new daum.Postcode(
										{
											oncomplete : function(data) {
												// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

												// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
												// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
												var roadAddr = data.roadAddress; // 도로명 주소 변수
												var extraRoadAddr = ''; // 참고 항목 변수

												// 법정동명이 있을 경우 추가한다. (법정리는 제외)
												// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
												if (data.bname !== ''
														&& /[동|로|가]$/g
																.test(data.bname)) {
													extraRoadAddr += data.bname;
												}
												// 건물명이 있고, 공동주택일 경우 추가한다.
												if (data.buildingName !== ''
														&& data.apartment === 'Y') {
													extraRoadAddr += (extraRoadAddr !== '' ? ', '
															+ data.buildingName
															: data.buildingName);
												}
												// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
												if (extraRoadAddr !== '') {
													extraRoadAddr = ' ('
															+ extraRoadAddr
															+ ')';
												}

												// 우편번호와 주소 정보를 해당 필드에 넣는다.
												document
														.getElementById('sample4_postcode').value = data.zonecode;
												document
														.getElementById("sample4_roadAddress").value = roadAddr;

												var guideTextBox = document
														.getElementById("guide");
												// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
												if (data.autoRoadAddress) {
													var expRoadAddr = data.autoRoadAddress
															+ extraRoadAddr;
													guideTextBox.innerHTML = '(예상 도로명 주소 : '
															+ expRoadAddr + ')';
													guideTextBox.style.display = 'block';

												} else {
													guideTextBox.innerHTML = '';
													guideTextBox.style.display = 'none';
												}
											}
										}).open();
								
								
							}
								function chkfunction(uid){
									console.log(uid)
									fetch('idCheck.do?uid='+uid)
										.then(resolve=>resolve.json())
										.then(result=>{
											console.log(result)
											if(result.retCode=='NG'){
												console.log(result)
												alert(uid+"는 사용 가능한 아이디입니다!");
												document.getElementById('submit').disabled=false;
											}else{
												alert(uid+"는 이미 사용 중인 아이디입니다");
												document.getElementById('names').value=null;
											}
										})
								}
								
								function checkPWfunction(upw){
									 var num = upw.search(/[0-9]/g);
									 var eng = upw.search(/[a-z]/ig);
									 var spe = upw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

									 if(upw.length < 8 || upw.length > 20){
										//document.getElementById('alert').style="display:block";
									  //alert("8자리 ~ 20자리 이내로 입력해주세요.");
									  return false;
									 }else if(upw.search(/\s/) != -1){
									  return false;
									 }else if(num < 0 || eng < 0 || spe < 0 ){
									  return false;
									 }else {
										 document.getElementById('alert').style="display:none";
										console.log("통과"); 
									    return true;
									 }
								}
												
								
						</script>
						<hr class="mb-4">
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input"
								id="aggrement" required> <label
								class="custom-control-label" for="aggrement">개인정보 수집 및
								이용에 동의합니다.</label>
						</div>
						<div class="mb-4"></div>
						<c:choose>
							<c:when test="${kId!=null }">
								<button class="btn btn-primary btn-lg btn-block" id="submit" type="submit" style="background-color:pink;border:none;">회원가입하기</button>
							</c:when>
							<c:otherwise>
								<button class="btn btn-primary btn-lg btn-block" id="submit" type="submit" style="background-color:pink;border:none;" disabled>회원가입하기</button>
							</c:otherwise>
						</c:choose>						
				</div>
			</div>
		</div>
	</form>
	<footer class="my-3 text-center text-small"> </footer>
	
	
	<script>
	document.forms.coupon.addEventListener('submit', function (e){
		alert("축하합니다. 회원가입 전용 쿠폰이 발급되었습니다.\n 로그인 후 이용하시기 바랍니다.")
	})
	</script>
</body>

</html>


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
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>


.input-form {
	max-width: 500px;
	padding: 32px;
	background: #e6c1c161;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
}
#box{
	border:1px;
	width:600px;
	margin:auto;
}
</style>
</head>


<body>
<div id="box">
		<div class="container">
			<div class="input-form-backgroud row">
				<div class="input-form col-md-12 mx-auto">
					<h4 class="mb-3" style="text-align: center;font-size:50px;color:pink">Dear My Pet</h4>
						<div class="row">
							<div class="mb-3">
								<label for="name">아이디</label> <input type="text"
									class="form-control" id="userId" name="userId" placeholder=""
									value="" required>
								<div class="invalid-feedback">아이디를 입력해주세요.</div>
							</div>
							<div class="mb-3">
								<label for="name">비밀번호</label> <input type="password"
									class="form-control" id="userPw" name="userPw" placeholder=""
									value="" required>
								<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
							</div>
							<div class="mb-4"></div>
							<input class="btn btn-primary btn-lg btn-block" type="button" value="로그인" onclick="loginfunction(userId.value,userPw.value)" style="background-color:pink;border:1px white;width:200px;margin:auto;">
							<input class="btn btn-primary btn-lg btn-block" type="button" value="회원가입" style="background-color:pink;border:1px white;width:200px;margin:auto" onclick="location.href='addUserForm.do'">
							<a id="kakao-login-btn"><img src="https://developers.kakao.com/tool/resource/static/img/button/login/full/ko/kakao_login_medium_narrow.png" style="width:200px;height:46px;margin:20px auto;text-align:center;"></a>
							<div style="text-align:center">
								<a style="font-size:14px;color:black;" href="findIdForm.do">아이디 찾기</a>
								<a style="font-size:14px;color:black;" href="findPwForm.do">/ 비밀번호 찾기</a>
							</div>
						</div>
					<!-- 카카오로그인 -->
	            	<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	            	<script type='text/javascript'>
	            	console.log(${list})
						Kakao.init('');
						$("#kakao-login-btn").on("click", function(){
						    //1. 로그인 시도
						    Kakao.Auth.login({
						    	scope:'profile_nickname',
						        success: function(authObj) {
						          //2. 로그인 성공시, API 호출
						          Kakao.API.request({
						            url: '/v2/user/me',
						            success: function(res) {
						              const kakaoId = res.id;
						              const kakaoPw = "kakao" + res.id;
									  scope : 'account_email';
										fetch('idCheck.do?uid='+kakaoId)
										.then(resolve=>resolve.json())
										.then(result=>{
											console.log(result)
											if(result.retCode=='NG'){
												console.log(result);
												alert("회원가입 후 사용하실 수 있습니다");
												location.href="addUserForm.do?kId="+kakaoId+"&kPw="+kakaoPw;
											}else{
												fetch('login.do',{
													method:'post',
													headers:{'Content-Type':'application/x-www-form-urlencoded'},
													body:'userId='+kakaoId+'&userPw='+kakaoPw
												})
												.then(resolve=>resolve.json())
												.then(result=>{
													if(result.retCode=='OK'){
														alert('로그인 성공!');
														location.href="main.do";
													}else{
														alert('아이디/비밀번호가 일치하지 않습니다')
													}
												})
											}
										})
						        }
						          })
						          var token = authObj.access_token;
						        },
						        fail: function(err) {
						          alert(JSON.stringify(err));
						        }
						      });
						        
						})
						
						function loginfunction(userId,userPw){
							fetch('login.do',{
								method:'post',
								headers:{'Content-Type':'application/x-www-form-urlencoded'},
								body:'userId='+userId+'&userPw='+userPw
							})
							.then(resolve=>resolve.json())
							.then(result=>{
								if(result.retCode=='OK'){
									alert('로그인 성공!');
									location.href="main.do";
								}else{
									alert('아이디/비밀번호가 일치하지 않습니다')
								}
							})
						}
					</script>
					<a id="kakao-login-btn"></a>
	            	
				</div>
				<footer class="my-3 text-center text-small"> </footer>
			</div>
		</div>
	</div>
</body>
</html>

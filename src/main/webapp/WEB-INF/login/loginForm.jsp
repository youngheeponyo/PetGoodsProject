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
body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
		to(#1d466c));
	background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
</style>
</head>


<body>
	<form action="login.do" method="post">
		<div class="container">
			<div class="input-form-backgroud row">
				<div class="input-form col-md-12 mx-auto">
					<h4 class="mb-3" style="text-align: center">My Deat Pet</h4>
					<form class="validation-form" novalidate>
						<div class="row">
							<div class="mb-3">
								<label for="name">아이디</label> <input type="text"
									class="form-control" id="name" name="userId" placeholder=""
									value="" required>
								<div class="invalid-feedback">이름을 입력해주세요.</div>
							</div>
							<div class="mb-3">
								<label for="name">비밀번호</label> <input type="password"
									class="form-control" id="name" name="userPw" placeholder=""
									value="" required>
								<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
							</div>
							<div class="mb-4"></div>
							<input class="btn btn-primary btn-lg btn-block" type="submit" value="로그인">
						</div>
					</form>
					<!-- 카카오로그인 -->
					<div class="button-login" align ="center">
	                	<a id="kakao-login-btn" >
	    				<img src="https://developers.kakao.com/tool/resource/static/img/button/login/full/ko/kakao_login_medium_narrow.png"  /></a>
	            	</div>
	            	<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	            	<script type='text/javascript'>
						Kakao.init('d462b7d737c1a7561172e7cffc4ef53b');
						$("#kakao-login-btn").on("click", function(){
						    //1. 로그인 시도
						    Kakao.Auth.login({
						    	scope:'profile_nickname',
						        success: function(authObj) {
						          //2. 로그인 성공시, API 호출
						          Kakao.API.request({
						            url: '/v2/user/me',
						            success: function(res) {
						              console.log(res);
						          console.log(authObj);
						              const kakaoId = res.id;
						              const nick = res.nickname;
									  scope : 'account_email';
									  alert('로그인성공');
						              location.href="addUserForm.do?uid="+kakaoId+"&nick="+nick;
						        }
						          })
						          var token = authObj.access_token;
						        },
						        fail: function(err) {
						          alert(JSON.stringify(err));
						        }
						      });
						        
						})
					</script>

	            	<a id="kakao-login-btn"></a>
					<button class="api-btn" onclick="unlinkApp()">앱 탈퇴하기</button>
					<div id="result"></div>
					<script type="text/javascript">
						function unlinkApp() {
							Kakao.API.request({
								url : '/v1/user/unlink',
								success : function(res) {
								alert('success: '
										+ JSON.stringify(res))
								},
								fail : function(err) {
									alert('fail: '
											+ JSON.stringify(err))
								},
							})
						}
					</script>
	            	
				</div>
				<footer class="my-3 text-center text-small"> </footer>
			</div>
		</div>
	</form>
</body>
</html>
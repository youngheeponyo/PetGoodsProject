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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
.api-btn{
	width:180px;
	height:46px;
	background-color:yellow;
	border:1px white;
	color:black;
	font-size:16px;
	font:bolder;
	border-radius: 5px;
}
</style>
</head>


<body>
<div id="box">
	<form action="delUser.do" method="post">
		<div class="container">
			<div class="input-form-backgroud row">
				<div class="input-form col-md-12 mx-auto">
					<h4 class="mb-3" style="text-align: center;font-size:50px;color:pink">My Dear Pet</h4>
						<div class="row">
							<div class="mb-3">
								<label for="name">탈퇴할 아이디를 입력하세요</label> <input type="text"
									class="form-control" id="name" name="userId" placeholder=""
									value="" required>
								<div class="invalid-feedback"></div>
							</div>
							<div class="mb-3">
								<label for="name">비밀번호를 입력하세요</label> <input type="password"
									class="form-control" id="name" name="userPw" placeholder=""
									value="" required>
								<div class="invalid-feedback"></div>
							</div>

							<div class="mb-4"></div>
							<input class="btn btn-primary btn-lg btn-block" type="submit" value="회원탈퇴" style="background-color:pink;border:1px white;width:280px;margin:auto">
							<button  class="api-btn" onclick="unlinkApp()">카카오로그인 탈퇴</button>
						</div>
										
	            	<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	            	<script type='text/javascript'>
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
					
					<div id="result"></div>
					<script type="text/javascript">
						function unlinkApp() {
							Kakao.API.request({
								url : '/v1/user/unlink',
								success : function(res) {
									const kId = res.id;
						            const kPw = "kakao" + res.id;
						            if('${uid}'==kId){
										alert('탈퇴가 완료되었습니다!')
										 location.href="delUser.do?userId="+kId+"&userPw="+kPw;
						            }else{
						            	alert('카카오 사용자가 아닙니다');
									}
								},
								fail : function(err) {
									alert('fail: '
											+ JSON.stringify(err)+'탈퇴 실패')
								},
							})
						}
					</script>
				</div>
			</div>
		</div>
	</form>
	</div>
</body>

	<footer class="my-3 text-center text-small"> </footer>

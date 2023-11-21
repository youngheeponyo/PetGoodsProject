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
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3" style="text-align:center">서비스 이용시 아이디/비밀번호를 다시 입력하여 본인인증을 해주세요</h4>
				<div class="row">
					<div class="mb-3">
						<label for="name">아이디</label> <input type="text" class="form-control" id="uid" name="uid" value="" required>
					</div>
					<div class="mb-3">
						<label for="name">비밀번호</label> <input type="password" class="form-control" id="upw" name="upw" value="" required>
					</div>
					<div class="mb-4">
					<input class="btn btn-primary btn-lg btn-block" type="button" value="본인인증" onclick="checkfunction(uid.value,upw.value)"
					style="background-color:pink;border:1px white;width:200px;margin:auto"></div>
					<div><a id="kakao-login-btn"><input class="btn btn-primary btn-lg btn-block" type="button" value="카카오인증" style="background-color:pink;border:1px white;width:200px;margin:auto"></a></div>
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
						              const kakaoId = res.id;
						              const kakaoPw = "kakao" + res.id;
									  scope : 'account_email';
										fetch('idpwCheck.do?uid='+kakaoId+'&upw='+kakaoPw)
										.then(resolve=>resolve.json())
										.then(result=>{
											if(result.retCode=='OK'){
												alert('확인되었습니다!');
												location.href="updateInfoForm.do?uid="+kakaoId+"&upw="+kakaoPw;
											}else{
												alert('아이디/비밀번호가 일치하지 않습니다')
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
					</script>
					<a id="kakao-login-btn"></a>
				</div>
				<footer class="my-3 text-center text-small"> </footer>
			</div>
		</div>
</div>
</body>
<script type="text/javascript">
	function checkfunction(userid,upw){
			fetch('idpwCheck.do?uid='+userid+'&upw='+upw)
			.then(resolve=>resolve.json())
			.then(result=>{
				if(result.retCode=='OK'){
						alert('확인되었습니다!');
						location.href="updateInfoForm.do?uid="+userid+"&upw="+upw;
				}else{
					alert('아이디/비밀번호가 일치하지 않습니다')
				}
			})
	}
</script>
</html>
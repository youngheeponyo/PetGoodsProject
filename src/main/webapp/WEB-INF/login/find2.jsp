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
			<c:choose>
				<c:when test="${empty pwd }">
					<h4 class="mb-3" style="text-align:center">존재하는 회원이 없습니다</h4>
					<input class="btn btn-primary btn-lg btn-block" type="button" value="회원가입하기" onclick="location.href='addUserForm.do'"
					style="background-color:pink;border:1px white;width:200px;margin:30px auto;">
					<input class="btn btn-primary btn-lg btn-block" type="button" value="이전페이지" onclick="location.href='findPwForm.do'"
					style="background-color:pink;border:1px white;width:200px;margin:30px auto;">
				</c:when>
				<c:otherwise>
					<div style="text-align:center;">변경할 비밀번호를 입력하세요
					<input type="password" value="" style="width:200px;margin:30px auto;" id="upw" name="upw"  onchange="checkPW(upw.value)"></div>
					<p id='alert' style="color:red;font-size:12px">비밀번호: 8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.</p>
					<input class="btn btn-primary btn-lg btn-block" type="button" value="변경하기" onclick="updatePw(upw.value)"
					style="background-color:pink;border:1px white;width:200px;margin:30px auto;">
				</c:otherwise>
			</c:choose>
				<footer class="my-3 text-center text-small"> </footer>
			</div>
		</div>
</div>
<script type="text/javascript">

	function checkPW(upw){
	 var num = upw.search(/[0-9]/g);
	 var eng = upw.search(/[a-z]/ig);
	 var spe = upw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	 if(upw.length < 8 || upw.length > 20){
		 alert('비밀번호 조건을 확인하세요');
	  return false;
	 }else if(upw.search(/\s/) != -1){
		 alert('비밀번호 조건을 확인하세요');
	  return false;
	 }else if(num < 0 || eng < 0 || spe < 0 ){
		 alert('비밀번호 조건을 확인하세요');
	  return false;
	 }else {
		document.getElementById('alert').style="display:none";
		console.log("통과"); 
	    return true;
	 }
	}

	function updatePw(upw){
		fetch('updatePw.do?upw='+upw+'&uid=${pwd.userId}')
		.then(resolve=>resolve.json())
		.then(result=>{
			if(result.retCode=='OK'){
				alert('변경되었습니다!')
				location.href="loginForm.do"
			}else{
				alert('변경에 실패하였습니다');
				return;
			}
		})
	}
</script>
</body>
</html>
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
				<c:when test="${empty ivo }">
					<h4 class="mb-3" style="text-align:center">존재하는 회원이 없습니다</h4>
					<input class="btn btn-primary btn-lg btn-block" type="button" value="회원가입하기" onclick="location.href='addUserForm.do'"
					style="background-color:pink;border:1px white;width:200px;margin:30px auto;">
					<input class="btn btn-primary btn-lg btn-block" type="button" value="이전페이지" onclick="location.href='findIdForm.do'"
					style="background-color:pink;border:1px white;width:200px;margin:30px auto;">
				</c:when>
				<c:otherwise>
					<h4 class="mb-3" style="text-align:center">회원님의 정보입니다</h4>
					<div style="text-align:center;">아이디 : ${ivo.userId }</div>
					<input class="btn btn-primary btn-lg btn-block" type="button" value="로그인 화면가기" onclick="location.href='loginForm.do'"
					style="background-color:pink;border:1px white;width:200px;margin:30px auto;">
				</c:otherwise>
			</c:choose>
				<footer class="my-3 text-center text-small"></footer>
			</div>
		</div>
</div>
</body>
</html>
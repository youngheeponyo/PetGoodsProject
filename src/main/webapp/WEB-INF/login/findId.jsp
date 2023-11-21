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
<form action="findId.do" method="post">
<div id="box">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3" style="text-align:center">가입하신 정보를 입력하세요</h4>
				<div class="row">
					<div class="mb-3">
						<label for="name">이름</label> <input type="text" class="form-control" id="nickname" name="nickname" value="" required>
					</div>
					<div class="mb-3">
						<label for="name">전화번호</label> <input type="text" class="form-control" id="phone" name="phone" placeholder="010-1234-1234"
						value="" required>
					</div>
					<div class="mb-4"></div>
					<input class="btn btn-primary btn-lg btn-block" type="submit" value="아이디 찾기"
					style="background-color:pink;border:1px white;width:200px;margin:auto;">
				</div>
				<footer class="my-3 text-center text-small"> </footer>
			</div>
		</div>
</div>
</form>
</body>
</html>
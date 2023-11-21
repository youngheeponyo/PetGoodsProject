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
				<h4 class="mb-3" style="text-align:center">비밀번호를 입력하세요</h4>
				<div class="row">
					<div class="mb-3">
						<label for="name">기존 비밀번호</label><input type="password" class="form-control" id="upw" name="upw" value="" required>
					</div>
					<div class="mb-3">
						<label for="name">변경할 비밀번호</label> <input type="password" class="form-control" id="newPw" name="newPw" value="" onchange="checkPWfunction(newPw.value)" required>
					</div>
					<p id='alert' style="color:red;font-size:12px">비밀번호: 8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.</p>
					<div class="mb-4">
					<input class="btn btn-primary btn-lg btn-block" type="button" value="변경하기" onclick="checkfunction(upw.value,newPw.value)"
					style="background-color:pink;border:1px white;width:200px;margin:auto"></div>
				</div>
				<footer class="my-3 text-center text-small"> </footer>
			</div>
		</div>
</div>
</body>
<script type="text/javascript">
	function checkfunction(upw,newPw){
			fetch('updatePw2.do',{
				method:'post',
				headers:{'Content-Type':'application/x-www-form-urlencoded'},
				body:'uid=${uid}&upw='+upw+'&newPw='+newPw
			})
			.then(resolve=>resolve.json())
			.then(result=>{
				if(result.retCode=='OK'){
						alert('수정완료!');
						location.href="myPage.do";
				}else{
					alert('비밀번호를 다시 확인하세요')
				}
			})
	}
	
	function checkPWfunction(upw){
		 var num = upw.search(/[0-9]/g);
		 var eng = upw.search(/[a-z]/ig);
		 var spe = upw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

		 if(upw.length < 8 || upw.length > 20){
			//document.getElementById('alert').style="display:block";
			 alert("비밀번호 형식을 확인해주세요!");
		  return false;
		 }else if(upw.search(/\s/) != -1){
			 alert("비밀번호 형식을 확인해주세요!");
		  return false;
		 }else if(num < 0 || eng < 0 || spe < 0 ){
			 alert("비밀번호 형식을 확인해주세요!");
		  return false;
		 }else {
			document.getElementById('alert').style="display:none";
		    return true;
		 }
	}
	
</script>
</html>
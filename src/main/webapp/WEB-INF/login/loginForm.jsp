<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<body>
<form action="login.do" method="post">
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">로그인</h4>
        <form class="validation-form" novalidate>
          <div class="row">
          
           <div class="col-md-6 mb-3">
              <label for="name">아이디</label>
              <input type="text" class="form-control" id="name" name="userId" placeholder="" value="" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
           </div>
           <div class="col-md-6 mb-3">
              <label for="name">비밀번호</label>
              <input type="password" class="form-control" id="name" name="userPw" placeholder="" value="" required>
              <div class="invalid-feedback">
                비밀번호를 입력해주세요.
              </div>
           </div>

          <div class="mb-4"></div>
          <input class="btn btn-primary btn-lg btn-block" type="submit" value="로그인">
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
    </footer>
  </div>
 </form>
</body>
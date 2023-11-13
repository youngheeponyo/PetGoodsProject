<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<body>
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<h3>공지사항 작성</h3>
			<form action="addBoard.do" method="post">
				<table class="table">
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" class="form-control"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="2"><textarea cols="40" rows="6" name="content"
								class="form-control"></textarea></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="저장"
							class="btn btn-primary"> <input type="reset" value="초기화"
							class="btn btn-warning"></td>
					</tr>
				</table>
			</form>
		</div>
	</section>
</body>

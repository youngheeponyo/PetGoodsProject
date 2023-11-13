<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body>
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<form action="modifyForm.do" name="myForm">
				<h3>상세 화면</h3>
				<input type="hidden" name="nno" value="nno.noticeNo"
					class="form-control">
				<table class="table">
					<tr>
						<th>글 번호</th>
						<td class="noticeNo">nno.noticeNo</td>
						<th>작성일자</th>
						<td>sysdate</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3">nno.noticeTitle</td>
					</tr>
					<tr>
						<td colspan="4"><textarea rows="5" cols="40"
								class="form-control">nno.noticeContent</textarea></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>관리자</td>
						<th>조회수</th>
						<td>nno.noticeView</td>
					</tr>
					<tr>
						<td colspan="4" align="center"><c:choose>
								<c:when test="${!empty logId && logId == bno.writer}">
									<input type="submit" value="수정" class="btn btn-primary">
									<input type="button" value="삭제"
										onclick="location.href='removeBoard.do?bno=${bno.boardNo}'"
										class="btn btn-warning">
								</c:when>
								<c:otherwise>
									<input type="submit" value="수정" disabled>
									<input type="button" value="삭제" disabled>
								</c:otherwise>
							</c:choose></td>
					</tr>
				</table>
				<p>
					<a href="noticeList.do">목록으로</a>
				</p>
			</form>
		</div>
	</section>
</body>

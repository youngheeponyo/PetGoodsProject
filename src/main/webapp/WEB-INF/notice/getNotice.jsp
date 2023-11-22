<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<body>
	<section class="pt-2 pb-4">
		<div class="container px-4 px-lg-5 mt-3">
			<form action="modifyForm.do" name="myForm">
				<h3>상세 화면</h3>
				<input type="hidden" name="nno" value="nno.noticeNo"
					class="form-control">
				<table class="table">
					<tr>
						<th>글 번호</th>
						<td class="noticeNo">${nno.noticeNo }</td>
						<th>작성일자</th>
						<td><fmt:formatDate value="${nno.noticeDate}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3">${nno.noticeTitle }</td>
					</tr>
					<tr>
						<td colspan="4"><textarea readonly rows="5" cols="40"
								class="form-control">${nno.noticeContent }</textarea></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>관리자</td>
						<th>조회수</th>
						<td>${nno.noticeView }</td>
					</tr>
					<c:choose>
						<c:when test="${uno == 0 && permission == 0}">
							<tr>
								<td colspan="4" align="center">
									<input type="submit" value="수정" class="btn btn-primary">
									<input type="button" value="삭제"
										onclick="location.href='removeNotice.do?nno=${nno.noticeNo}'"
										class="btn btn-warning">
								</td>
							</tr>
						</c:when>
					</c:choose>
				</table>
			</form>
				<p>
					<button type="button" onclick="location.href='noticeList.do'">목록</button>
				</p>
		</div>
	</section>
</body>

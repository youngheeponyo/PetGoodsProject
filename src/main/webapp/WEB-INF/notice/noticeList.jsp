<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<body>
	<section class="pt-2 pb-4">
		<div class="container px-4 px-lg-5 mt-3">
			<h3>공지사항</h3>
			<form action="addNotice.do" method="post">
				<table class="table">
					<thead>
						<tr>
							<th>글 번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="vo">
							<tr>
								<td>${vo.noticeNo}</td>
								<td><a href="getNotice.do?nno=${vo.noticeNo}">${vo.noticeTitle}</a></td>
								<td>관리자</td>
								<td><fmt:formatDate value="${vo.noticeDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
							</tr>
						</c:forEach>	
					</tbody>
				</table>
				 <c:choose>
					<c:when test="${uno == 0 && permission == 0}">
						<button type="button" onclick="location.href='noticeForm.do'">공지작성</button>
					</c:when>
				</c:choose>
			</form>
		</div>
	</section>
</body>

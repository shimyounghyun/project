<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

.left
{
	float: left;
}

.right
{
	float: right;
}

</style>
</head>
<body>
	<div id="page-wrapper">
		<div class="container-fluid">
			<!-- Page Heading -->
			<h1 class="page-header">
			<span class="left">
				공지사항 <small>Notice</small>
			</span>
			<span class="right"><c:if test="${sessionScope.member.teamNum eq 1}">
			<button type="button" class="btn btn-success" onclick="location.href='/sport/notice/write'">글 작성</button>
			</c:if>
			</span>
			<br>
			</h1>
			<table class="table table-striped">
				<thead class="thead-inverse">
					<tr>
						<th width="100">번호</th>
						
						<th align="center"width="800">제목</th>
						
						<th align="center" width="200">작성자</th>
						<th align="center" width="100">작성 날짜</th>
					</tr>
				<tbody>
					<c:forEach var="vo" items="${list.list}">

						<tr style="cursor:pointer" onclick="location.href='notice/view?idx=${vo.idx}&p=${currentPage}'">
							<td><c:out value="${vo.idx}" /></td>
							<td><c:out value="${vo.subject}" /></td>
							<td><a style="color: red">관리자</a></td>
							<td><fmt:formatDate value="${vo.regdate }" type="date"
									dateStyle="short" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
				<%-- 시작 페이지 번호가 1보다 크다면 이전 페이지가 존재한다. --%>
			<div class="text-center">
				<div class="row">
					<div class="col-lg-12">

						<ul class="pagination">
							<c:if test="${list.startPage>1 }">
								<li><a href="?p=${list.startPage-1 }"><span
										class="glyphicon glyphicon-chevron-left"></span></a></li>
							</c:if>
							<c:if test="${list.startPage<=1 }">
								<li class="disabled"><a href="#"><span
										class="glyphicon glyphicon-chevron-left"></span></a></li>
							</c:if>
							<%-- 페이지 목록 --%>
							<c:forEach var="i" begin="${list.startPage }"
								end="${list.endPage }">
								<c:if test="${i eq currentPage }">
									<li class="active"><a>${i }</a></li>
								</c:if>
								<c:if test="${i ne currentPage }">
									<li><a href="?p=${i }">${i }</a></li>
								</c:if>
							</c:forEach>
							<%-- 끝 페이지 번호가 전체페이지 보다 적다면 다음 페이지가 존재한다. --%>
							<li><c:if test="${list.endPage<list.totalPage }">
									<a href="?p=${list.endPage+1 }"><span
										class="glyphicon glyphicon-chevron-right"></span></a>
								</c:if></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
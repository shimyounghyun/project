<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>


	<div id="page-wrapper">
		<div class="container-fluid">
			<!-- 공지사항 헤드라인 -->
			<h1 class="page-header">
				<c:out value="${vo.subject }" />
				<br> <small><font size="2"><span
						class="glyphicon glyphicon-time"></span> <fmt:formatDate
							value="${vo.regdate }" type="date" pattern="yyyy년MM월dd일" />
						&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-user"></span>
						관리자 &nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-comment"></span>
						<c:out value="${count }"></c:out>댓글</font></small>
			</h1>
			<!-- 내용 -->
			<c:out value="${vo.content }" />
			<!-- 댓글 구분선-->
			<h1 class="page-header"></h1>
		</div>



		<div class="jumbotron">
			<!-- 댓글 작성 폼 -->
			<c:if test="${sessionScope.member.username ne null }">
				<form class="form-inline" role="form"
					action="/sport/notice/view?idx=${idx }&p=${p}" method="post">
					<input type="hidden" class="form-control" id="board_id" name="board_id" value="${vo.idx}"> 
						<input type="hidden" class="form-control" id="writer" name="writer" value="${sessionScope.member.username}">
						<input type="hidden" class="form-control" id="img" name="img" value="${sessionScope.member.thumnail}">
					<table>
						<tr>
							<td rowspan="2">
							
							<c:if test="${sessionScope.member.thumnail eq null }">
						<img src="${pageContext.request.contextPath}/resources/img/profile.png"
							class="img-cirlce" width="70" height="70">
							</c:if>
					<c:if test="${sessionScope.member.thumnail ne null }">
						<img src="${path }${sessionScope.member.thumnail}" class="img-cirlce" width="70" height="70">
						
					</c:if>
								
								
								</td>
							<td>&nbsp;&nbsp;&nbsp;
								<div class="form-group">
									<input type="password" class="form-control" id="pw" name="pw"
										placeholder="비밀번호">
								</div>
							</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;
								<div class="form-group">
									<textarea rows=4 cols=100 class="form-control" id="content" name="content"></textarea>
								</div>
								<div class="form-group">
									<button type="submit" class="btn btn-default" style="width: 65pt; height: 65pt;">등록</button>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</c:if>
			<!-- //댓글 작성 폼 -->





			<!-- 댓글이 보여질 곳 -->
			<div class="row">
                        <div class="col-md-12">
			<c:forEach var="vo" items="${list }">
				<hr style="border: none; border-top: 3px dotted white; color: '#fff'; height: 1px;">

				<table>
					<tr>
					
						<td rowspan="2">
						<c:if test="${vo.img eq null }">
						<img src="${pageContext.request.contextPath}/resources/img/profile.png" class="img-cirlce" width="70" height="70">
							</c:if>
						<c:if test="${vo.img ne null }">
						<img src="${pageContext.request.contextPath}/upload/${vo.img}" class="img-cirlce" width="70" height="70">
						
							</c:if>
							</td>
							
						<td>&nbsp;<strong><c:out value="${vo.writer }" /></strong>&nbsp;&nbsp;&nbsp;<small
							style="opacity: 0.7;"><fmt:formatDate value="${vo.regdate }" type="date" pattern="yyyy.MM.dd HH:mm" /></small></td>
					</tr>
					<tr>
						<td>&nbsp;<c:out value="${vo.content }" /></td>
					</tr>
				</table>

			</c:forEach>
			</div>
			</div>
			<!-- //댓글이 보여질 곳 -->

		</div>
	</div>
	<!-- /.container-fluid -->

</body>
</html>
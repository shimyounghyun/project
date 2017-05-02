<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/match.css">
<style>
.pagination>li>a, .pagination>li>span { border-radius: 50% !important;margin: 0 5px;}
.sub_tabmenu04			{background:url("${pageContext.request.contextPath}/resources/img/subtabmenu04_bg.jpg") repeat-x left top;width:100%;height:36px;margin:0 0 1px 0;} 
.sub_tabmenu04 p		{float:left;text-align:center; font-weight:bold;letter-spacing:0;}
.sub_tabmenu04 a.tab01:link, a.tab01:visited, a.tab01:active	{margin:0 ;float:left;padding:8px 20px; color:#555;background:url("${pageContext.request.contextPath}/resources/img/subtabmenu04.gif") no-repeat right top;}
.sub_tabmenu04 a.tab01:hover		{color:#e85900;}
.sub_tabmenu04 a.tab01_on:link, a.tab01_on:visited, a.tab01_on:active	{margin:0 ;float:left;padding:8px 20px;background:url("${pageContext.request.contextPath}/resources/img/subtabmenu04_on.gif") repeat-x left top;color:#fff;}
.sub_tabmenu04 a.tab01_on:hover		{color:#fff;}
.left
{
	float: left;
}

.right
{
	float: center;
}

</style>


</head>
<body>
<div id="page-wrapper">
<div class="container">
<div class="row text-center">
<div style="color:#d9140a; font-size:14px; font-weight:bold;" align="center">※ 매치등록은 신중하게 작성하여 주시기 바랍니다.</div><br>
			<span class="right"><c:if test="${sessionScope.member.teamNum ne 0}">
			<img src="${pageContext.request.contextPath}/resources/img/btn_match_insert.gif" onclick="location.href='/sport/team/matchWrite'">
			</c:if>
			</span>
		</div>
		<br>
    <div class="row">
		<div class="text-center">
		<div class="sub_tabmenu04">
			<p><a href="/sport/team/match" class="tab01 ${area eq null ? 'tab01_on' : ''}" id="all">전체</a></p>
			<p><a href="/sport/team/match?area=서울" class="tab01 ${area eq '서울' ? 'tab01_on' : ''}" id="tab01">서울</a></p>
			<p><a href="/sport/team/match?area=경기" class="tab01 ${area eq '경기' ? 'tab01_on' : ''}" id="tab02">경기</a></p>
			<p><a href="/sport/team/match?area=강원" class="tab01 ${area eq '강원' ? 'tab01_on' : ''}" id="tab03">강원</a></p>
			<p><a href="/sport/team/match?area=충청" class="tab01 ${area eq '충청' ? 'tab01_on' : ''}" id="tab04">충청</a></p>
			<p><a href="/sport/team/match?area=전라" class="tab01 ${area eq '전라' ? 'tab01_on' : ''}" id="tab05">전라</a></p>
			<p><a href="/sport/team/match?area=제주" class="tab01 ${area eq '제주' ? 'tab01_on' : ''}" id="tab06">제주</a></p>
			<p><a href="/sport/team/match?area=경상" class="tab01 ${area eq '경상' ? 'tab01_on' : ''}" id="tab07">경상</a></p>
	</div>
	</div>
		<div class="well">
		
		
		
		
		
		
		
        <div class="list-group">
        <c:forEach var="vo" items="${list.list}">
          <a href="#" class="list-group-item">
                <div class="media col-md-3">
                    <figure class="pull-left">
                        <img class="media-object img-rounded img-responsive" src="${pageContext.request.contextPath}/resources/img/teamlogo.jpg" width=120 height=30>
                        <br><div class="text-center"><strong><c:out value="${vo.teamname}"></c:out> </strong></div>
                    </figure>
                </div>
                <div class="col-md-6">
                    <h4 class="list-group-item-heading" style="color:#FE642E; font-size:16pt;"> <c:out value="${vo.matchday}"></c:out> <c:out value="${vo.matchhour}"></c:out> <c:out value="${vo.matchmin}"></c:out> 매치 요청합니다</h4>
                    <p class="list-group-item-text">경기날짜 : <c:out value="${vo.matchday}"></c:out><br>
                    경기 시간 : <c:out value="${vo.matchhour}"></c:out> <c:out value="${vo.matchmin}"></c:out><br>
                    장소 : <c:out value="${vo.area}"></c:out><br>
                    남기는 한마디 : <c:out value="${vo.content}"></c:out>
                    </p>
                </div>
                <div class="col-md-3 text-center">
                <br><br>
                <img src="${pageContext.request.contextPath}/resources/img/homebg.png" width=120 height=45>
                    <img src="${pageContext.request.contextPath}/resources/img/btn_match.gif" width=150 height=45
                    onclick="location.href='matchRead?idx=${vo.idx}&p=${currentPage}'">
                   
                </div>
          </a>
          </c:forEach>
          
        </div>
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
</div>
</div>
</body>
</html>
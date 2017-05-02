<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team</title>
 <script src="${pageContext.request.contextPath }/resources/js/moment.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fullcalendar.css">
  <script src="${pageContext.request.contextPath }/resources/js/fullcalendar.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/ko.js"></script>
<script src="resources/js/socket.io.js"></script>
<script src="resources/js/teaminfo.js"></script>
<style type="text/css">
.cbm_wrap {
	background: #FFFFFF;
	background: -moz-linear-gradient(0deg, #F5F5F5 0%, #FFF 25%, #FFF 75%, #F5F5F5 100%);
	background: -ms-linear-gradient(0deg, #F5F5F5 0%, #FFF 25%, #FFF 75%, #F5F5F5 100%);
	background: -webkit-linear-gradient(0deg, #F5F5F5 0%, #FFF 25%, #FFF 75%, #F5F5F5
		100%);
	background: linear-gradient(0deg, #F5F5F5 0%, #FFF 25%, #FFF 75%, #F5F5F5 100%);
	border: 1px solid #777777;
	-moz-border-radius: 6px 6px 6px 6px;
	-webkit-border-radius: 6px 6px 6px 6px;
	border-radius: 6px 6px 6px 6px;
	-moz-box-shadow: 0 0 6px rgba(0, 0, 0, 0.5);
	-webkit-box-shadow: 0 0 6px rgba(0, 0, 0, 0.5);
	box-shadow: 0 0 6px rgba(0, 0, 0, 0.5);
	margin: 20px auto;
	padding: 12px;
	position: relative;
	min-height: 400px;
}

.cbm_wrap :before, .cbm_wrap :after {
	background: none;
	bottom: 12px;
	-moz-box-shadow: 0 10px 12px rgba(0, 0, 0, 0.5);
	-webkit-box-shadow: 0 10px 12px rgba(0, 0, 0, 0.5);
	box-shadow: 0 10px 12px rgba(0, 0, 0, 0.5);
	content: '';
	height: 10px;
	left: 12px;
	position: absolute;
	width: 40%;
	z-index: -1;
	-moz-transform: skew(-4deg) rotate(-4deg);
	-webkit-transform: skew(-4deg) rotate(-4deg);
	transform: skew(-4deg) rotate(-4deg);
}

.cbm_wrap :after {
	-moz-transform: skew(4deg) rotate(4deg);
	-webkit-transform: skew(4deg) rotate(4deg);
	transform: skew(4deg) rotate(4deg);
	right: 12px;
}

.cbm_wrap p {
	margin-top: 15px !important;
	text-align: justify !important;
}

.cbm_wrap h1 {
	font-size: 30px;
	font-weight: bold;
	margin-top: 5px;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
}

.cbm_wrap h4 {
	font-size: 17px;
	font-weight: bold;
	margin-top: 3px;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
}

.cbm_wrap h5 {
	font-size: 17px;
	margin-top: 3px;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
}

.cbm_wrap a {
	text-decoration: none;
	color: #4A4A4A !important;
}
.gubun,.team,.sign{
display: table-cell;
vertical-align:middle !important;
}
  body {
        margin: 40px 10px;
        padding: 0;
        font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
        font-size: 14px;
    }

    #calendar {
    
        max-width: 900px;
        margin: 0 auto;
    }
    

</style>
<script>
$(function(){
	$(".gubun").each(function(){
		
		var rows = $(".gubun:contains('"+$(this).text()+"')");
		if(rows.length > 1){
			rows.eq(0).attr("rowspan",rows.length);
			rows.not(":eq(0)").remove();
		}
	});
	$(".team").each(function(){
		
		var rows1 = $(".team:contains('"+$(this).text()+"')");
		var rows2 = $(".sign:contains('"+$(this).text()+"')");
		if(rows1.length > 1){
			rows1.eq(0).attr("rowspan",rows1.length);
			rows2.eq(0).attr("rowspan",rows2.length);
			rows1.not(":eq(0)").remove();
			rows2.not(":eq(0)").remove();
		}
	});
	 $('#calendar').fullCalendar({
		
		 header:{
	    		left: "today prev,next",
	    		center: "title",
	    		right: ""
	    	},
	    	events:function(start,end,timezone,callback){
	    		$.ajax({
	    			url:'/sport/team/cal',
	    			type:'post',
	    			dataType:'json',
	    			success:function(data){
	    				var events=[];
						$.each(data,function(index,value){
	    				var json_string = JSON.stringify(value);
	    				var context = JSON.parse(json_string);
						events.push({
							title: context.title,
							start: context.start,
							end: context.end
							});
						});
						callback(events);
	    			},
	    			complete:function(){
	    			},
	    			error:function(){
	    			}
	    			
	    		});
	    	}
	    });
});
	function team(){
		var checkedValue = $("input[type=radio][name=chk_info]:checked").val();
		$.ajax({
			type:"post",
			url:'/sport/team/matchAgree?idx='+checkedValue,
			success:function(){
				alert('성공');
				window.location.reload(true);
			}
		});
	}
</script>
</head>
<body>
	<div id="page-wrapper">
		<c:if test="${sessionScope.member.teamNum ne 0}">
			<div class="col-lg-5 cbm_wrap">
				<div class="col-lg-12">
			<div class="row">
					<h1 class="page-header">
						팀정보 <small>teaminfo</small>
					</h1>
				</div>
				</div>
				<div class="col-lg-4">
					<div class="text-center">
						<img
							src="${pageContext.request.contextPath}/resources/img/teamlogo.jpg"
							class="img-cirlce" width="150" height="150"> <br>
						<h1>
							<c:out value="${teaminfo.name }"></c:out>
						</h1>
					</div>
				</div>
				<div class="col-lg-7">
					<div class="text-left">
						<h4>지 역 : <c:out value="${teaminfo.selOne }"></c:out>-<c:out value="${teaminfo.selTwo }"></c:out></h4>
						<br>
						<h4>팀원 수 : <c:out value="${teaminfo.teamCount }"></c:out> 명</h4>
						<br>
						<h4>소 개 : <c:out value="${teaminfo.content }"></c:out></h4>
						<br>
						<h4>팀 생성일 : <fmt:formatDate value="${teaminfo.regdate }" type="date" pattern="yyyy-MM-dd" /></h4>
					</div>
				</div>
				
				</div>
	
			<!-- /.row -->
			<!-- /.row -->
			<div class="row" style="margin-top:25px;">
				<div class="col-lg-6">
				<ul id="myTab" class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">팀원 목록</a></li>
    <li><a data-toggle="tab" href="#menu1">가입 관리</a></li>
    <li><a data-toggle="tab" href="#menu2">매치 관리</a></li>
    
  </ul>
					<div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <ul class="list-group text-center">
             <li class="list-group-item">
<div class="table-responsive" style="min-height:250px;">
               <table class="table table-bordered table-hover table-striped text-center">
		<thead>
		 <tr>
		 <th class="text-center">번호</th>
			<th class="text-center">이름</th>
			<th class="text-center">아이디</th>
			<th class="text-center">상태</th>
		</tr>
		</thead>
<tbody>
<c:forEach var="vo" items="${list.list }" varStatus="i">
<tr>
<td><c:out value="${(currentPage-1)*pageSize+i.index +1}"></c:out></td>
<td><c:out value="${vo.username }"></c:out></td>
<td><c:out value="${vo.userid }"></c:out></td>
<c:if test="${vo.lv eq 1}">
<td>리더</td>
</c:if>
<c:if test="${vo.lv ne 1}">
<td>팀원</td>
</c:if>
</tr>
</c:forEach>
</tbody>
              </table>
              </div>
<%-- 시작 페이지 번호가 1보다 크다면 이전 페이지가 존재한다. --%>
<div class="row">
<div class="col-lg-12">
<div class="text-center">

<ul class="pagination">
<c:if test="${list.startPage>1 }">
<li><a href="?p=${list.startPage-1 }"><span class="gphicon glyphicon-chevron-left"></span></a></li>
</c:if>
<c:if test="${list.startPage<=1 }">
<li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
</c:if>
<%-- 페이지 목록 --%>
<c:forEach var="i" begin="${list.startPage }" end="${list.endPage }">
<c:if test="${i eq currentPage }">
<li class="active"><a>${i }</a></li>
</c:if>
<c:if test="${i ne currentPage }">
<li><a href="?p=${i }">${i }</a></li>
</c:if>
</c:forEach>
<%-- 끝 페이지 번호가 전체페이지 보다 적다면 다음 페이지가 존재한다. --%>
<li><c:if test="${list.endPage<list.totalPage }">
<a href="?p=${list.endPage+1 }"><span class='glyphicon glyphicon-chevron-right'></span></a>
</c:if></li>
											</ul>
										</div>
									</div>
								</div>
             </li>
     </ul>
   </div>



<!-- 가입신청목록 -->
    <div id="menu1" class="tab-pane fade">
      	<ul class="list-group text-center">
             <li class="list-group-item">
<div class="table-responsive" style="overflow-y:scroll; min-height:320px; height:320px;">
               <table class="table table-bordered table-hover table-striped text-center">
		<thead>
		 <tr>
		 <th class="text-center">대기</th>
			<th class="text-center">이름</th>
			<th class="text-center">아이디</th>
			<th class="text-center">상태</th>
		</tr>
		</thead>
<tbody>
<c:forEach var="vo" items="${waitlist}" varStatus="i">
<tr>
<td><c:out value="${i.index+1}"></c:out></td>
<td><c:out value="${vo.username }"></c:out></td>
<td><c:out value="${vo.userid }"></c:out></td>
<td> <button type="button" class="btn btn-primary" onclick="agree('${vo.useridx}','${vo.username}','${vo.userid}','${vo.teamidx}',this)">승인</button> / <button type="button" class="btn btn-danger" onclick="refuse('${vo.useridx}','${vo.username}','${vo.userid}','${vo.teamidx}',this)">거절</button> </td>
</tr>
</c:forEach>

</tbody>
              </table>
              </div>

             </li>
     </ul>
    </div>
    <!-- 매치 신청 목록 -->
    <div id="menu2" class="tab-pane fade">
    <ul class="list-group text-center">
     <li class="list-group-item">
     <div class="table-responsive" style="overflow-y:scroll; min-height:320px; height:320px;">
     <table class="table table-bordered table-hover table-striped text-center" style="vertical-align:middle">
     <thead>
		 <tr>
		 <th class="text-center" width="100">경기날짜</th>
			<th class="text-center" width="60">글번호</th>
			<th class="text-center" width="50">선택</th>
			<th class="text-center">팀이름</th>
			<th class="text-center" width="120">신청일</th>
			<th class="text-center">승인</th>
		</tr>
		</thead>
		<tbody>
<c:forEach var="vo" items="${matchlist}" varStatus="i">
<tr>
<td class="gubun"><c:out value="${vo.board_date}"></c:out></td>
<td class="team"><c:out value="${vo.board_id}"></c:out></td>
<td><input type="radio" name="chk_info" value="${vo.idx}"></td>
<td><c:out value="${vo.teamname}"></c:out></td>
<td><small style="opacity: 0.7;"><fmt:formatDate value="${vo.regdate }" type="date" pattern="yyyy.MM.dd HH:mm" /></small></td>
<td class="sign"><button onclick="team()">승인</button><span style="display:none"><c:out value="${vo.board_id}"></c:out></span></td>
</tr>
</c:forEach>
</tbody>
     </table>
     </div>
     </li>
    </ul>
    </div>
    
    
  </div>
				</div>

			</div>

		</c:if>
		
				<hr>
	<div class="col-lg-5">
	<div id="calendar"></div>
	</div>
	
	</div>
</body>

</html>
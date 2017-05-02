<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath }/resources/css/MySchedule2.css" rel="stylesheet" type="text/css">
<title>Team</title>
<style type="text/css">
.modal-dialog.modal-80size {
  width: 40%;
  height: 100%;
  margin: 0;
  padding: 0;
}

.modal-content.modal-80size {
  height: auto;
  min-height: 80%;
}

.modal.modal-center {
  text-align: center;
}
@media screen and (min-width: 768px) {
  .modal.modal-center:before {
    display: inline-block;
    vertical-align: middle;
    content: " ";
    height: 100%;
  }
}

.modal-dialog.modal-center {
  display: inline-block;
  text-align: left;
  vertical-align: middle;
}
</style>
</head>
<body>
	<div id="page-wrapper">
		<div class="container-fluid">
			<h1 class="page-header">
				팀검색 <small>team</small>

			</h1>
			<%-- 검색 바 --%>
			
			<div class="row">
				<form class="navbar-form navbar text-center" role="search"
					method="post">
					<div class="col-lg-12">
					<div class="form-group">
						<select name="selOne" id="one"
							class="form-control selectpicker">
							<option value="default">지역 선택</option>
							<c:forEach var="vo" items="${location}" varStatus="i">
								<option value="${vo}"><c:out value="${vo}" /></option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<select name="selTwo" id="two" class="form-control selectpicker">
							<option value="default">상세</option>
						</select>
						</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="팀명" name="name">
					</div>
					<button type="submit" class="btn btn-default">검색</button>
						</div>
				</form>
			</div>
			
			<%-- 팀 목록 --%>
			<div class="wrapper_body text-center">
				<c:forEach var="vo" items="${list.list}">
					<div class="col-lg-3">
					<div class="gallery">
					<div class="gallery-item">
						<div class="gallery-item-image">
						<ul class="list-group">
							<li class="list-group-item" style="vertical-align: middle;">
							<img src="${pageContext.request.contextPath}/resources/img/teamlogo.jpg"
								class="img-cirlce" width="100" height="100" align=left hspace=10 vspace=3> <br> <strong><c:out
										value="${vo.name}"></c:out></strong><br> <c:out value="${vo.selOne}"></c:out>-<c:out value="${vo.selTwo}"></c:out><br>
								<c:out value="${vo.teamCount}"></c:out> 명<br clear=left></li>
						</ul>
						</div>
						<div class="gallery-item-description">
							<%--팀원 정보 부르는 모달 버튼 --%>
							<span><button type="button" class="btn btn-primary text-center" style="width:125px" onclick="show('${vo.teamidx}',1,'${vo.name}','${vo.selOne}','${vo.selTwo}')"><h3>팀원 정보</h3></button>
							<%--회원 가입신청 하는 모달 버튼 --%>
							<button type="button" class="btn btn-success text-center" style="width:125px" data-toggle="modal" data-target="#teamSign" data-title="${vo.teamidx }"><h3>가입 신청</h3></button></span>
						</div>
						</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<%-- 페이징 번호 시작 --%>
			<div class="row"></div>
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
			
		<%--팀원 목록 모달창 --%>
			<div class="modal modal-center fade" id="my80sizeCenterModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
  				<div class="modal-dialog modal-80size modal-center" role="document">
    				<div class="modal-content modal-80size">
				      <div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       	 					<%--모달 타이틀 시작--%>
       	 					<h4 class="modal-title" id="myModalLabel">
        				<img src="${pageContext.request.contextPath}/resources/img/teamlogo.jpg" class="img-cirlce" 
        				width="100" height="100" align=left hspace=10 vspace=3>
							<strong id="teamname"></strong><br>
							<small id="teamarea"></small><br clear=left></h4></div>
      						<div class="modal-body">
        						 <!-- 리스트 들어갈  자리 -->
      						<table class="table table-bordered table-hover table-striped text-center">
									<thead>
										<tr>
											<th class="text-center">번호</th>
											<th class="text-center">이름</th>
											<th class="text-center">아이디</th>
											<th class="text-center">상태</th>
										</tr>
									</thead>
									<tbody id="here">
									
									</tbody>
									</table>
									<div class="text-center">
										<div class="row">
										<div class="col-lg-12">
										<ul class="pagination" id="pagi">

												</ul>
											</div>
										</div>
									</div>
      							</div>
    			</div>
  			 </div>
		   </div>
			<!-- 가입신청 모달 -->
			<div class="modal fade" id="teamSign" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-body text-center">
          <strong>가입신청 하시겠습니까?</strong><br><br>
          <form method="post" action="/sport/team/teamwait">
			<div id="haaa"></div>
          <input type="hidden" value="${sessionScope.member.username}" name="username">
          <input type="hidden" value="${sessionScope.member.idx}" name="useridx">
          <input type="hidden" value="${sessionScope.member.userid}" name="userid">
          <button type="submit" class="btn btn-success">승인</button>
          <button type="button" class="btn btn-cancel" data-dismiss="modal">취소</button>
          </form>
        </div>
        
      </div>
    </div>
  </div>
		</div>
	</div>
	
	<script>
$("#teamSign").on('show.bs.modal',function(event){
	var button = $(event.relatedTarget);
	var teamidx = button.data('title');
	$("#haaa").empty();
	$("#haaa").append("<input type='hidden' value='"+teamidx+"' name='teamidx'>");
});	
function show(str,pageno,name,selOne,selTwo){
	$("#my80sizeCenterModal").modal('show');
	var t = new String(str);
	var name = new String(name);
	var area1 = new String(selOne);
	var area2 = new String(selTwo);

	var list = [];
	var innerHTML='';
	var pagi='';
	$("#teamname").empty();
	$("#teamarea").empty();
	$("#here").empty();
	$("#pagi").empty();
	$.ajax({ type: "POST",
		url: "/sport/team/teamsearch/json",
		data: "t="+t+"&p="+pageno,
		success: function(data){
			list = data.list;
			if(data.length==0){
			}
			$.each(list,function(index,value){
				console.log(value.username);
				console.log(index);
				innerHTML +="<tr><td>"+((data.currentPage-1)*data.pageSize+index+1)+"</td>";
				innerHTML +="<td>"+value.username +"</td>";
				innerHTML +="<td>"+value.userid+"</td>";
			if(value.lv==1){
				innerHTML +="<td>리더</td></tr>";
				}else innerHTML +="<td>팀원</td></tr>";
			});
			console.log(data.startPage);
			if(data.startPage>1){
				pagi +="<li><a onclick=\"show("+t+","+(data.startPage-1)+",'"+name+"','"+area1+"','"+area2+"')\"><span class='glyphicon glyphicon-chevron-left'></span></a></li>";
				}else{
				pagi +="<li class='disabled'><a href='#'><span class='glyphicon glyphicon-chevron-left'></span></a></li>";	
				}
				for(var i=data.startPage; i<=data.endPage; i++){
					if(i==data.currentPage){
						pagi +="<li class='active'><a>"+i+"</a></li>";
					}else{
						pagi +="<li><a onclick=\"show("+t+","+i+",'"+name+"','"+area1+"','"+area2+"')\">"+i+"</a></li>";
					}
				}
				if(data.endPage<data.totalPage){
					pagi +="<li><a onclick=\"show("+t+","+(data.endPage+1)+",'"+name+"','"+area1+"','"+area2+"')\"><span class='glyphicon glyphicon-chevron-right'></span></a></li>";
				}
			
			$("#here").append(innerHTML);
			$("#pagi").append(pagi);
			$("#teamname").append(name);
			$("#teamarea").append(area1+"-"+area2);
		},
		complete: function(){
			
		},
		error: function(){
		}
		});
	}

</script>
</body>
</html>
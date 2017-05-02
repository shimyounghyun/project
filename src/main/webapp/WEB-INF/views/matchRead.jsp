<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/matchRead.css">
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCFCjtcydbgKp0PekbpVN9qSXJLjQ4ia7I"></script>
<title>Insert title here</title>



<script>
function googleapisView() {
	var search = "${vo.area}";
    var address = encodeURIComponent(search);
    var geocode = "http://maps.googleapis.com/maps/api/geocode/json?address="+address+"&sensor=false";
    jQuery.ajax({
        url: geocode,
        type: 'POST',
           success: function(myJSONResult){
                    if(myJSONResult.status == 'OK') {
                        var tag = "";
                        var lat ="";
                        var lng ="";
                        var i;
                        for (i = 0; i < myJSONResult.results.length; i++) {
                          tag += myJSONResult.results[i].formatted_address; //주소
                          lat =myJSONResult.results[i].geometry.location.lat;
                          lng = myJSONResult.results[i].geometry.location.lng;
   							var map = new google.maps.Map(document.getElementById('map'), {
                     	  center: {lat: Number(lat), lng: Number(lng)},
                       	  zoom: 16,
                     	});
   					new google.maps.InfoWindow({content:tag}).open(map, new google.maps.Marker({
   						position:{lat: Number(lat), lng: Number(lng)},
   							map:map
   			}));
                        }

                    } else if(myJSONResult.status == 'ZERO_RESULTS') {
                        alert("결과가 없습니다.")
                    } else if(myJSONResult.status == 'OVER_QUERY_LIMIT') {
                        alert("할당량이 초과되었습니다.");
                    } else if(myJSONResult.status == 'REQUEST_DENIED') {
                        alert("요청이 거부되었습니다");
                    } else if(myJSONResult.status == 'INVALID_REQUEST') {
                        alert("주소가 누락되었습니다.");
                    }
            }
    });
}
googleapisView();


</script>
</head>
<body>
<div id="page-wrapper">
<div class="container">

<div class="row">
<fmt:parseDate value="${vo.matchday}" var="matchday" pattern="yyyy-MM-dd"/>
    <h2>
       <fmt:formatDate value="${matchday}" pattern="yyyy년 MM월 dd일"/> 매치 신청
    </h2>
    
    <div class="col-md-1">
        <br>
        <p class="calendar">
            <fmt:formatDate value="${matchday}" pattern="dd"/><em><fmt:formatDate value="${matchday}" pattern="MM"/>월</em>
        </p>
    </div><!--./col-md-->
    
    <div class="col-md-6">
        <h4>
             <c:out value="${vo.area}"></c:out>
        </h4>
        <p>
            팀명 : <c:out value="${vo.teamname}"></c:out>  
        </p>
        <p>
            팀 활동지역 : <c:out value="${vo.teamarea1}"></c:out> - <c:out value="${vo.teamarea2}"></c:out>  
        </p>
        <p>
            시간 : <c:out value="${vo.matchhour}"></c:out> <c:out value="${vo.matchmin}"></c:out>  
        </p>
        
        <p>
            금액 : <c:out value="${vo.money}"></c:out>
        <p>
        <p>
            남긴 한마디 : <c:out value="${vo.content}"></c:out>
        <p>
        
    </div><!--/. col-md -->
    
    <div class="col-md-5">
        <div id="map" style="width:300px; height: 300px;"></div>
    </div><!--/span-->
</div><!--/row-->
<br>
<div class="row">
<div class="col-lg-12 text-center">
<img src="${pageContext.request.contextPath}/resources/img/btn_match.gif" style="width:125px" data-toggle="modal" data-target="#matchSign" data-title="${vo.teamidx }">
<img src="${pageContext.request.contextPath}/resources/img/btn_list.gif" onclick="location.href='/sport/team/match?p=${p}'">
</div>
</div>

        <hr>
        
<div class="row">
    <div class="col-md-12">
<div class="comment-tabs">
            <ul class="nav nav-tabs" role="tablist">
                <li class="active"><a href="#comments-logout" role="tab" data-toggle="tab"><h4 class="reviews text-capitalize">댓글 목록</h4></a></li>
                <li><a href="#add-comment" role="tab" data-toggle="tab"><h4 class="reviews text-capitalize">댓글 달기</h4></a></li>
            </ul>            
            <div class="tab-content">
                <div class="tab-pane active" id="comments-logout">                
                    <ul class="media-list">
                    <c:forEach var="vo" items="${list}">
                      <li class="media">
                        <a class="pull-left" href="#">
                        <c:if test="${vo.img eq '' or vo.img eq null}">
						<img src="${pageContext.request.contextPath}/resources/img/profile.png" class="media-object img-circle">
						</c:if>
						<c:if test="${vo.img ne '' and vo.img ne null}">
						<img src="${pageContext.request.contextPath}/upload/${vo.img}" class="media-object img-circle">
						</c:if>
                        </a>
                        <div class="media-body">
                          <div class="well well-lg">
                              <h4 class="media-heading text-uppercase reviews"><c:out value="${vo.username}"></c:out></h4>
                              <ul class="media-date text-uppercase reviews list-inline">
                                <li class="dd"><fmt:formatDate value="${vo.regdate }" type="date" pattern="yyyy.MM.dd HH시 mm분" /></li>
                              </ul>
                              <p class="media-comment">
                                <c:out value="${vo.content}"></c:out>
                              </p>
                          </div>              
                        </div>
                      </li>          
                      </c:forEach>
                   
                    </ul> 
                </div>
                <div class="tab-pane" id="add-comment">
                    <form method="post" action="/sport/team/matchRead?idx=${vo.idx }&p=${p}" class="form-horizontal" id="commentForm" role="form">
                    	<input type="hidden" class="form-control" id="board_id" name="board_id" value="${vo.idx}"> 
						<input type="hidden" class="form-control" id="writer" name="username" value="${sessionScope.member.username}">
						<input type="hidden" class="form-control" id="img" name="img" value="${sessionScope.member.thumnail}">
                        <div class="form-group">
                            <label for="email" class="col-sm-2 control-label">내용</label>
                            <div class="col-sm-10">
                              <textarea class="form-control" name="content" id="addComment" rows="5"></textarea>
                            </div>
                        </div>
                       
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">                    
                                <button class="btn btn-success btn-circle text-uppercase" type="submit" id="submitComment"><span class="glyphicon glyphicon-send"></span> 전송</button>
                            </div>
                        </div>            
                    </form>
                </div>
                
            </div>
        
    </div><!--/span-->
</div><!--/row-->
</div>
<!-- 매치신청 모달 -->
			<div class="modal fade" id="matchSign" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-body text-center">
          <strong>매치신청 하시겠습니까?</strong><br><br>
          <form method="post" action="/sport/team/matchwait">
			<div id="haaa"></div>
                   	<input type="hidden" class="form-control" id="board_id" name="board_id" value="${vo.idx}"> 
						<input type="hidden" class="form-control" id="teamidx" name="board_teamidx" value="${vo.teamidx}">
						<input type="hidden" class="form-control" id="img" name="board_date" value="${vo.matchday}">
						<input type="hidden" class="form-control" id="img" name="teamidx" value="${sessionScope.member.teamNum}">
          <button type="submit" class="btn btn-success">승인</button>
          <button type="button" class="btn btn-cancel" data-dismiss="modal">취소</button>
          </form>
        </div>
        
      </div>
    </div>
  </div>
</div><!--./container -->
</div>
</body>
</html>
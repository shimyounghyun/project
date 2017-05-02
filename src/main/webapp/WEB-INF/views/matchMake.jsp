<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCFCjtcydbgKp0PekbpVN9qSXJLjQ4ia7I&callback=a"></script>
<title>Insert title here</title>
<script>
$(function() {
    $( "#testDatepicker" ).datepicker({
    	dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNames: ['일','월','화','수','목','금','토'],
        dayNamesShort: ['일','월','화','수','목','금','토'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
        showMonthAfterYear: true,
        changeMonth: true,
        changeYear: true,
        yearSuffix: '년'
    });
});
function a(c,d,tag){
	console.log(typeof(c));
	var lat =  37.570627;
	if(c){	
	lat = c;
	}
	var lng = 127.0706515;
	if(d){
		lng = d;
	}
	var detail ="서울특별시 동대문구 장안동 장안벚꽃로";
	if(tag){
		detail = tag;
	}
	console.log(lat);
   var map = new google.maps.Map(document.getElementById('map'), {
                     	  center: {lat: Number(lat), lng: Number(lng)},
                       	  zoom: 16,
                     	});
   			new google.maps.InfoWindow({content:detail}).open(map, new google.maps.Marker({
   				position:{lat: Number(lat), lng: Number(lng)},
   				map:map
   			}));
   			$("#area").val(detail);
}
  function googleapisView() {
		var search = $("#area").val();
	    var address = encodeURIComponent(search);
	    var geocode = "http://maps.googleapis.com/maps/api/geocode/json?address="+address+"&sensor=false";
	    jQuery.ajax({
	        url: geocode,
	        type: 'POST',
	           success: function(myJSONResult){
	                    if(myJSONResult.status == 'OK') {
	                        var tag = "";
	                        var i;
	                        for (i = 0; i < myJSONResult.results.length; i++) {
	                          tag += myJSONResult.results[i].formatted_address; //주소
	                      	a(myJSONResult.results[i].geometry.location.lat,myJSONResult.results[i].geometry.location.lng,tag);
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
</script>
</head>
<body>
<div id="page-wrapper">
<h1 class="page-header">
			매치 신청 <small>match</small>
		</h1>
		
		<div style="color:#d9140a; font-size:14px; font-weight:bold;" align="center">※ 매치등록은 신중하게 작성하여 주시기 바랍니다.</div>
		<form method="post" class="form-horizontal">
		<div class="form-group">
		<label class="col-sm-2 control-label"><span style="color:red">*</span> 경기일</label>
		<div class="col-sm-2">
			<input type="text" id="testDatepicker" name="matchday" class="form-control">
		</div>
			</div> 
		<div class="form-group">
		<label class="col-sm-2 control-label"><span style="color:red">*</span> 시간</label>
		<div class="col-sm-1 col-xs-11">
			<select id="hour" name="matchhour" class="form-control selectpicker">
				<c:forEach begin="0" end="23" step="1" varStatus="i">
				<option value="${i.index}시">${i.index} 시</option>
				</c:forEach>
			</select>
			</div>
		<div class="col-sm-1 col-xs-11">
			<select id="hour" name="matchmin" class="form-control selectpicker">
				<c:forEach begin="0" end="5" step="1" varStatus="i">
				<option value="${i.index*10}분">${i.index*10} 분</option>
				</c:forEach>
			</select>
			</div>
			</div>
		<div class="form-group">
		<label class="col-sm-2 control-label"> 금액</label>
		<div class="col-sm-2">
		<input type="text" id="money" name="money" class="form-control">
		</div>
		</div>
		<div class="form-group">
		<label class="col-sm-2 control-label"><span style="color:red">*</span> 남기는 한마디</label>
		<div class="col-sm-7">
		<textarea rows=7 cols=100 class="form-control" id="content" name="content"></textarea>
		</div>
		</div>
		<div class="form-group">
		<label class="col-sm-2 control-label"> 경기 위치</label>
		<div class="col-sm-2 navbar-form">
		<input type="text" name="area" id="area" class="form-control">
		<button  class="btn btn-default" type="button" onclick="googleapisView()">검색</button>
		</div>
		</div>
		<label class="col-sm-2 control-label"> 지역정보</label>
		<div id="map" style="width:400px; height: 300px;"></div>
		<div class="form-group">
			 <div class="col-xs-12 text-center">
			 <br>
			 <input type="image" name="submit" src="${pageContext.request.contextPath}/resources/img/btn_confirm2.gif" style="vertical-align:middle">
			 <img src="${pageContext.request.contextPath}/resources/img/btn_cancel.gif" onclick="location.href='/sport/team/match'" style="vertical-align:middle">
			 </div>
			 </div>
			 <input type="hidden" name="teamidx" value="${teamidx}">
			 <input type="hidden" name="teamname" value="${teamname}">
			 <input type="hidden" name="teamarea1" value="${teamarea1}">
			 <input type="hidden" name="teamarea2" value="${teamarea2}">
			 <input type="hidden" name="teamimg" value="${teamimg}">
		</form>
</div>
</body>
</html>
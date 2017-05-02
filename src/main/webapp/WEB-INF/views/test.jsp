<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script src="${pageContext.request.contextPath }/resources/js/moment.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 
  <script src="${pageContext.request.contextPath }/resources/js/fullcalendar.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/ko.js"></script>
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fullcalendar.css">
<title>Insert title here</title>
<style>
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
<script type="text/javascript">
$(document).ready(function() {

    $('#calendar').fullCalendar({
    	height:500,
    	header:{
    		left: "",
    		center: "title",
    		right: "today prev,next"
    	},
    	events:function(start,end,timezone,callback){
    		$.ajax({
    			url:'/sport/test/cal2',
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
$(function(){
	$(".gubun").each(function(){
		
		var rows = $(".gubun:contains('"+$(this).text()+"')");
		if(rows.length > 1){
			rows.eq(0).attr("rowspan",rows.length);
			rows.not(":eq(0)").remove();
		}
	$(".team").each(function(){
		
		var rows1 = $(".team:contains('"+$(this).text()+"')");
		if(rows1.length > 1){
			rows1.eq(0).attr("rowspan",rows1.length);
			rows1.not(":eq(0)").remove();
		}
	});
});
});
</script>
</head>

 <body>
 <div id="calendar"></div>
 <table>
 <tr>
 <td class="gubun">4/28</td>
 <td class="team">1</td>
 <td>선택</td>
 <td>백호팀</td>
 </tr>
 <tr>
 <td class="gubun">4/28</td>
 <td class="team">1</td>
 <td>선택</td>
 <td>블루팀</td>
 </tr>
 <tr>
 <td class="gubun">4/28</td>
 <td class="team">1</td>
 <td>선택</td>
 <td>양개비팀</td>
 </tr>
 <tr>
 <td class="gubun">4/28</td>
 <td class="team">2</td>
 <td>선택</td>
 <td>호날두팀</td>
 </tr>
 <tr>
 <td class="gubun">4/28</td>
 <td class="team">2</td>
 <td>선택</td>
 <td>호날두팀</td>
 </tr>
 <tr>
 <td class="gubun">4/29</td>
 <td class="team">3</td>
 <td>선택</td>
 <td>호날두팀</td>
 </tr>
 </table>
</body>
</html>
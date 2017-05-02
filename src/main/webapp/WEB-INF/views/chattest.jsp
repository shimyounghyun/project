<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/resources/js/socket.io.js"></script>
<title>Insert title here</title>
<script>
$(document).ready(function() {
	var content='';
	var team = "";
		team += ${sessionScope.member.teamNum};
			var socket = io.connect("http://localhost:11113");
			
			socket.on(team, function(msg){
				console.log("receive message :: " + msg.content);
				content = msg.content;
				$("#hi").append("<li>"+content+"</li>");
			});
			$("#sendBtn").bind("click", function() {
				var msg = $("input[name=chat]").val();
				$.ajax({
					type:'post',
					url:'/sport/chat',
					data:'&msg='+msg,
					success:function(data){
						
					socket.emit('msg', data);
					}
				});
			});

		});
</script>
</head>
<body>
	<div class="popup-box chat-popup" style="display:none" id="qnimate">
    		  <div class="popup-head">
				<div class="popup-head-left pull-left">Team</div>
			  </div>
			<div class="popup-messages" id="hoi">
			
			<div class="direct-chat-messages" id="hi">
                    
					
					<div class="chat-box-single-line">
								<abbr class="timestamp">October 8th, 2015</abbr>
					</div>
					
					
					<!-- Message. Default to the left -->
                      <div class="direct-chat-info clearfix">
                        <span class="direct-chat-name pull-left">Osahan</span>
                      </div>
                      <!-- /.direct-chat-info -->
                      <img alt="message user image" src="http://bootsnipp.com/img/avatars/bcf1c0d13e5500875fdd5a7e8ad9752ee16e7462.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
                      <div class="direct-chat-text">
                      호놀롤루루루루룰루루루룰루루루ㅜ
                      </div>
					  <div class="direct-chat-info clearfix">
                        <span class="direct-chat-timestamp pull-right">3.36 PM</span>
                      </div>
                      <!-- /.direct-chat-text -->
                    <!-- /.direct-chat-msg -->
					
                    

                  </div>
			
			</div>
			<div class="popup-messages-footer">
			<textarea id="status_message" placeholder="Type a message..." rows="10" cols="40" name="chat"></textarea>
			<button class="bg_none pull-right btn btn-primary" style="height:60px;" id="sendBtn">전송</button>
			</div>
	  </div>
</body>
</html>
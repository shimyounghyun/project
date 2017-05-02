<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
<link href="${pageContext.request.contextPath }/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
   <link href="${pageContext.request.contextPath }/resources/css/sb-admin.css" rel="stylesheet">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/chat.css">
 <script src="${pageContext.request.contextPath}/resources/js/chat.js"></script>
 <script src="${pageContext.request.contextPath}/resources/js/socket.io.js"></script>
<title>Soccer</title>
<script>
$(document).ready(function() {
	var content='';
	var team = "";
		team += ${sessionScope.member.teamNum};
			var socket = io.connect("http://localhost:11114");
			
			socket.on(team, function(msg){
				content='';
				console.log("receive message :: " + msg.content +" team ::"+team);
				content += "<div class='direct-chat-info clearfix'><span class='direct-chat-name pull-left'>"+msg.userid+"</span></div>";
				content += "<img src='${pageContext.request.contextPath}/resources/img/profile.png' class='direct-chat-img'>";
				content += "<div class='direct-chat-text' id='hi'>"+msg.content+"</div>";
				content += "<div class='direct-chat-info clearfix'><span class='direct-chat-timestamp pull-right'>"+msg.regdate+"</span></div>";
				$("#hi").append(content);
				var obj = document.getElementById("hoi");
				obj.scrollTop = obj.scrollHeight;
			});
			$("#sendBtn").bind("click", function() {
				var msg = $("textarea[name=chat]").val();
				$.ajax({
					type:'post',
					url:'/sport/chat',
					data:'msg='+msg,
					success:function(data){
						
					socket.emit('msg', data);
					$("textarea[name=chat]").val('');
					}
				});
			});
		});
			function onkey(){
				if (window.event.keyCode == 13) {
					$("#sendBtn").click();
				}
			}
</script>
</head>
<body>
		
			<div class="popup-box chat-popup popup-box-on" style="display:none" id="qnimate">
    		  <div class="popup-head">
				<div class="popup-head-left pull-left">Team</div>
			  </div>
			<div class="popup-messages" id="hoi">
			
			<div class="direct-chat-messages" id="hi">
                    
					
					<div class="chat-box-single-line">
								<abbr class="timestamp">today</abbr>
					</div>
					
					
					
                    

                  </div>
			
			</div>
			<div class="popup-messages-footer">
			<textarea id="status_message" placeholder="Type a message..." rows="10" cols="40" name="chat" onkeyup="onkey();"></textarea>
			<button class="bg_none pull-right btn btn-primary" style="height:60px;" id="sendBtn">전송</button>
			</div>
	  </div>
		<!-- //로그인 유저메뉴 -->
		

		

		

</body>
</html>
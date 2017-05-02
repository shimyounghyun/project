<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/chat.css">
 <script src="${pageContext.request.contextPath}/resources/js/chat.js"></script>
</head>

<body>
<div class="container text-center">
	<div class="row">
        <div class="round hollow text-center">
        <a href="#" id="addClass"><span class="glyphicon glyphicon-comment"></span> Teamchat </a>
        </div>
	</div>
</div>

<div class="popup-box chat-popup popup-box-on" style="display:none" id="qnimate">
    		  <div class="popup-head">
				<div class="popup-head-left pull-left">Team</div>
			  </div>
			<div class="popup-messages">
			
			<div class="direct-chat-messages">
                    
					
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
			<textarea id="status_message" placeholder="Type a message..." rows="10" cols="40" name="message"></textarea>
			<button class="bg_none pull-right"><i class="glyphicon glyphicon-send"></i></button>
			</div>
	  </div>
</body>
</html>
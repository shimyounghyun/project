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
   
<title>Soccer<sitemesh:write property='title' /></title>
<style>
/* ------------4닝겐 이미지-----------*/
.container {
    padding: 80px 120px;
}
.person {
    border: 10px solid transparent;
    margin-bottom: 25px;
    width: 80%;
    height: 80%;
    opacity: 0.7;
}
.person:hover {
    border-color: #f1f1f1;
}
/* ------------//4닝겐 이미지-----------*/


/* Add a gray color to all navbar links */
.navbar li a, .navbar .navbar-brand { 
    color: #d5d5d5 !important;
}

/* On hover, the dropdown links will turn red */
.dropdown-menu li a:hover {
    background-color: red !important;
}




/*-----모달-----*/
.modal-header, h4, .close {
    background-color: #333;
    color: #fff !important;
    text-align: center;
    font-size: 30px;
}

.modal-header, .modal-body {
    padding: 40px 50px;
}
/*-----//모달-----*/
/*----메인화면------*/
.carousel-inner img {
    -webkit-filter: grayscale(90%);
    filter: grayscale(90%); /* make all photos black and white */ 
    width: 100%; /* Set width to 100% */
    margin: auto;
}

.carousel-caption h3 {
    color: #fff !important;
}

@media (max-width: 600px) {
    .carousel-caption {
        display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
    }
}
/*-----//메인화면------*/

img {
height : 100%;
width : 100%;
}
.haha{
height : 700px;
}
</style>
<script type="text/javascript">
	$(function(){
		$("#registerBtn").click(function(){
			// 폼검사
			if(!$("#user").val() || $("#user").val().trim()==""){
				alert($("#passwordOk").val());
				alert('아이디는 반드시 입력해야 합니다.');
				$("#user").val("");
				$("#user").focus();
				return;
			}
			// 여기에서 아이디가 이메일형식이 맞는지 검사한다.
			// 정규식 - 이메일 유효성 검사
        	var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        	
        	if(!regEmail.test($("#user").val())) {
                 alert('아이디는 이메일 주소형식이어야 합니다.');
                 $("#user").val("");
 				 $("#user").focus();
                 return false;
            }
			
			if(!$("#pw").val() || $("#pw").val().trim()==""){
				alert('암호는 반드시 입력해야 합니다.');
				$("#pw").val("");
				$("#pw").focus();
				return;
			}
			// 암호길이를 제한하고 싶으면 여기서 처리한다.
			if($("#pw").val().length<6){
				alert('암호는 10자 이상으로 입력해야 합니다.');
				$("#pw").val("");
				$("#pw").focus();
				return;
			}
			
			if(!$("#username").val() || $("#username").val().trim()==""){
				alert('사용자 이름은 반드시 입력해야 합니다.');
				$("#username").val("");
				$("#username").focus();
				return;
			}
			$("#registerForm").submit();
		});
		$("#pw").blur(function(){
		if($("#pw").val() != $("#pw").val()){
			$("#pwMsg").html("일치하지 않습니다").css('color','red')
			return;
		}else{
			$("#pwMsg").html("확인").css('color','green');
		}
			
		})
		
		// 아이디 중복확인
		$("#user").blur(function(){
			var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			var t = $("#user").val();
			if(!regEmail.test(t)) {
				$("#idcheckMsg").html("이메일 주소형식이어야 합니다.").css('color','red')
                return;
           }
			else{$.ajax({ type: 'get' , 
					 url: 'idchk?userid=' + t , 
					 success: function(data) { 
						 	if(data==0){
						 		$("#idcheckMsg").html("사용 가능").css('color','green');
						 	}else{
						 		$("#idcheckMsg").html("사용 불가").css('color','red');
						 	}		
						 } 
					});}	
		});
function area(a,b)
			{
			  
			    $('#'+a+'').change(function(){
			    	$('#'+b+' option').remove();
			    	var i = $('#'+a+' option').index($('#'+a+' option:selected'))-1;
			    	$("#"+b+"").append("<option>동 선택</option>");
					for(var s=0; s<listValue[i].length; s++){
						$("#"+b+"").append("<option value="+listValue[i][s]+">"+listValue[i][s]+"</option>");
					}
					$('#'+b+'').selectpicker('refresh');
			    });
			};
area('selOne','selTwo');
	});
			    	var listValue = new Array();
			    	
			    	<c:forEach var="vo" items="${location}" varStatus="a">
			    	listValue["${a.index}"] = new Array();
			    	<c:forEach var="v" items="${lo[a.index]}" varStatus="i">
			    		listValue["${a.index}"]["${i.index}"] ="${v}";
					</c:forEach>
					</c:forEach>
	function openWin(){  
	    window.open("http://localhost:8080/sport/chat", "팀채팅창", "width=270, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=no" );  
	} 

</script>
<sitemesh:write property='head' />
</head>
<body>
		<!--  navbar -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/sport/home">ABCD</a>
			</div>
			<!-- 기본 메뉴 -->
			
			<ul class="nav navbar-nav navbar-left">
			<li class="dropdown"><a class="dropdown-toggle" href="http://localhost:8080/sport/notice?p=1">공지사항</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">마이페이지 <span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
					<c:if test="${sessionScope.member ne null }">
						<li><a href="#">내정보</a></li>
						<li><a href="http://localhost:8080/sport/team">팀정보</a></li>
						<li><a href="http://localhost:8080/sport/team/teamsearch">팀검색</a></li>
						</c:if>
						<c:if test="${sessionScope.member eq null }">
						<li><a href="#" data-toggle="modal" data-target="#signIn">로그인</a></li>
						<li><a href="#" data-toggle="modal" data-target="#signUp">회원가입</a></li>
						</c:if>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">매치보드 <span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="http://localhost:8080/sport/team/match">매치신청</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">커뮤니티 <span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="#">자유게시판</a></li>
					</ul></li>
			</ul>
			<!-- //기본 메뉴 -->
			<!-- 비로그인유저 메뉴 -->
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${sessionScope.member.username eq null }">
					<li><a href="#" data-toggle="modal" data-target="#signIn"><span
							class="glyphicon glyphicon-log-in"></span>로그인</a></li>
					<li><a href="#" data-toggle="modal" data-target="#signUp"><span
							class="glyphicon glyphicon-user"></span>회원가입</a></li>
				</c:if>
				</ul>
				<!-- //비로그인유저 메뉴 -->

				<!-- 로그인 유저메뉴 -->
				<c:if test="${sessionScope.member.username ne null }">
					<ul class="nav navbar-right top-nav">
					<li class="dropdown">
        <a onclick="javascript:openWin();" id="addClass" href="#"><span class="glyphicon glyphicon-comment"></span> Teamchat </a>
						</li>
						
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><i class="fa fa-bell"></i> <b
								class="caret"></b></a>
							<ul class="dropdown-menu alert-dropdown">
								<li><a href="#">Alert Name <span
										class="label label-default">Alert Badge</span></a></li>
								<li><a href="#">Alert Name <span
										class="label label-primary">Alert Badge</span></a></li>
								<li><a href="#">Alert Name <span
										class="label label-success">Alert Badge</span></a></li>
								<li><a href="#">Alert Name <span
										class="label label-info">Alert Badge</span></a></li>
								<li><a href="#">Alert Name <span
										class="label label-warning">Alert Badge</span></a></li>
								<li><a href="#">Alert Name <span
										class="label label-danger">Alert Badge</span></a></li>
								<li class="divider"></li>
								<li><a href="#">View All</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><i class="fa fa-user"></i>${sessionScope.member.username }<b
								class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="fa fa-fw fa-user"></i> 내 정보</a></li>
								<li class="divider"></li>
								<li><a href="logout"><i class="fa fa-fw fa-power-off"></i>
										Log Out</a></li>
							</ul></li>
					</ul>
				</c:if>
		</nav>
				
		<!-- //로그인 유저메뉴 -->
		

		
		<!-- 로그인 Modal -->
<div class="modal fade" id="signIn" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4><span class="glyphicon glyphicon-user"></span> 로그인</h4>
      </div>
      <div class="modal-body">
        <form role="form" action="login" method="post">
          <div class="form-group">
            <label for="userid"><span class="glyphicon glyphicon-envelope"></span> 아이디</label>
            <input type="text" class="form-control" id="userid" name="userid" placeholder="ex) jeoun@naver.com">
          </div>
          <div class="form-group">
            <label for="password"><span class="glyphicon glyphicon-pencil"></span> 비밀번호</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="********">
          </div>
          <button type="submit" class="btn btn-success btn-block">확인 
            <span class="glyphicon glyphicon-ok"></span>
          </button>
        </form>
      </div>
      <div class="modal-footer">
      
        <a href="#">비밀번호를 잊어버리셨나요?</a>
      </div>
    </div>
  </div>
</div>
<!-- //로그인 모달 -->

<!-- 회원가입 Modal -->
<div class="modal fade" id="signUp" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
        <form role="form" method="post" id="registerForm" enctype="multipart/form-data" class="form-horizontal">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4><span class="glyphicon glyphicon-pencil"></span> 회원가입</h4>
      </div>
      <div class="modal-body">
          <div class="form-group">
            <label for="userid">이메일 </label>
            <input type="text" class="form-control" id="user" name="userid">
            <div id="idcheckMsg"></div>
            </div>
            <div class="form-group">
            <label for="password">비밀번호</label>
            <input type="password" class="form-control" id="pw" name="password">
            </div>
            <div class="form-group">
             <label for="user_passwordOk">재입력 </label>
            <input type="password" class="form-control" id="passwordOk">
            <div id="pwMsg"></div>
          </div>
          <div class="form-group">
             <label for="username">이름</label>
            <input type="text" class="form-control" id="username" name="username">
          </div>
          <div class="form-group">
          <label for="file">사진</label>
           <input type="file" name="file"/>
          </div>
      <div class="form-group">
      <label>활동 지역</label><br/><div class="col-sm-5">
      <select name="selOne" id="selOne" class="form-control selectpicker">
	    			<option value="default">시,구 선택</option>
	    <c:forEach var="vo" items="${location}" varStatus="i">
					<option value="${vo}"><c:out value="${vo}"/></option>
			</c:forEach>
			    </select>
			    </div>
			    <div class="col-sm-5">
      <select name="selTwo" id="selTwo" class="form-control selectpicker">
					<option>동 선택</option>
			    </select>
			    </div>
    </div>
    
      </div>
    
    
    
      <div class="modal-footer">
       <button type="submit" class="btn btn-success" id="registerBtn">
            <span class="glyphicon glyphicon-ok"></span> 가입하기
          </button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">
          <span class="glyphicon glyphicon-remove"></span> 취소
        </button>
      </div>
        </form>
    </div>
  </div>
</div>
<!-- //회원가입 모달 -->
<!-- Main 화면 -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
    <div class="haha">
      <img src="resources/img/ABCDimg.jpg" alt="soccer">
      </div>
      <div class="carousel-caption">
        <h3>Ben Zema</h3>
        <p>REAL MADRID</p>
      </div> 
    </div>

    <div class="item">
    <div class="haha">
      <img src="resources/img/ABCDimg2.jpg" alt="Soccer">
      </div>
      <div class="carousel-caption">
        <h3>Messi</h3>
        <p>BARCELONA</p>
      </div> 
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<!-- // Main 화면  -->
<sitemesh:write property='body' />
</body>
</html>
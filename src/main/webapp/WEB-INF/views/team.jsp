<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team</title>
<style type="text/css">
.cbm_wrap  {
    background: #FFFFFF;
    background: -moz-linear-gradient(0deg, #F5F5F5 0%, #FFF 25%, #FFF 75%, #F5F5F5 100%);
    background: -ms-linear-gradient(0deg, #F5F5F5 0%, #FFF 25%, #FFF 75%, #F5F5F5 100%);
    background: -webkit-linear-gradient(0deg, #F5F5F5 0%, #FFF 25%, #FFF 75%, #F5F5F5 100%);
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
    width: 600px;
    min-height:310px;
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
.cbm_wrap p{ 
    margin-top: 15px !important;
    text-align: justify !important;
}
.cbm_wrap h1{
    font-size: 20px;
    font-weight: bold;
    margin-top: 5px; 
    text-shadow: 1px 1px 3px rgba(0,0,0,0.3);
}

.cbm_wrap a{
    text-decoration: none;
    color: #4A4A4A !important;
}
​
</style>
</head>
<body>
<div id="page-wrapper" style="height:500px">
			<c:if test="${sessionScope.member.teamNum eq null or sessionScope.member.teamNum eq 0}">
<h1 class="page-header">
				팀정보 <small>team</small>
			</h1>
			<div class="wrapper_body">
     <div class="cbm_wrap">
     <div class="text-center"><img src="${pageContext.request.contextPath}/resources/img/team1.gif"></div>
     <h1 class="page-header"></h1>
     <br>
     <a onclick="href='/sport/team/make'"><img src="${pageContext.request.contextPath}/resources/img/btn_team_make.gif" align=left style="margin-left:50px;" hspace=30></a>  <b>새로운 팀을 직접 생성하시려면</b><br>팀 생성 버튼을 눌러주세요.<br clear=left>
     <hr style="border: none; border-top: 1px dotted gray; color: '#fff'; height: 1px; width: 85%; opacity:0.5;">
     <a onclick="href='#'"><img src="${pageContext.request.contextPath}/resources/img/btn_team_search.gif"  align=left style="margin-left:50px;" hspace=30></a>  <b>이미 생성되어 있는 팀에 가입하시려면</b><br>팀 검색 버튼을 눌러주세요.<br clear=left>
     </div>
</div>

</c:if>

			</div>
</body>
</html>
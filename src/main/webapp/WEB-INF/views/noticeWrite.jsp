<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="page-wrapper">
		<div class="container-fluid">
		<div class="panel panel-default">
      <div class="panel-heading">
    <h1 class="text-center">
				공지사항 <small>작성</small>
			</h1>
    </div>
      <div class="panel-body">
      <!-- 폼시작 -->
     <form class="form-horizontal" role="form" action="/sport/notice/write" method="post">
  <div class="form-group">
    <label class="control-label col-sm-2" for="subject">제목</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="subject" name="subject">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="content">내용</label>
    <div class="col-sm-10"> 
      <textarea rows=10 cols=50 class="form-control" id="content" name="content"></textarea>
    </div>
  </div>
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">작성</button>
    </div>
  </div>
</form>
 <!-- 폼종료 -->
    </div>
		</div>
	</div>
	</div>
</body>
</html>
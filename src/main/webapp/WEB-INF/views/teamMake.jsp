<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Team</title>
<style type="text/css">
.filebox label { display: inline-block; padding: .5em .75em; 
color: #fff; font-size: inherit; 
line-height: 1.5; vertical-align: middle; 
background-color: #337ab7; cursor: pointer; 
border: 1px solid #ebebeb; 
border-color: #2e6da4;
border-bottom-color: #e2e2e2; 
border-radius: .25em; }
.filebox .upload-name { display: inline-block; padding: .5em .75em; /* label의 패딩값과 일치 */ font-size: inherit; font-family: inherit; line-height: 1.5; vertical-align: middle; background-color: #f5f5f5; border: 1px solid #ebebeb; border-bottom-color: #e2e2e2; border-radius: .25em; -webkit-appearance: none; /* 네이티브 외형 감추기 */ -moz-appearance: none; appearance: none; } 
.filebox input[type="file"] { /* 파일 필드 숨기기 */ position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0; } 
.upload-thumb-wrap { /* 추가될 이미지를 감싸는 요소 */ display: inline-block; width: 75px; padding: 2px; vertical-align: middle; border: 1px solid #ddd; border-radius: 5px; background-color: #fff; } 
</style>
<script type="text/javascript">
	$(document).ready(
			function() {
				var listValue = new Array();

				<c:forEach var="vo" items="${location}" varStatus="a">
				listValue["${a.index}"] = new Array();
				<c:forEach var="v" items="${lo[a.index]}" varStatus="i">
				listValue["${a.index}"]["${i.index}"] = "${v}";
				</c:forEach>
				</c:forEach>
				
				$('#one').change(
						function() {
							$('#two option').remove();
							var i = $('#one option').index(
									$('#one option:selected')) - 1;
							$("#two").append("<option>동 선택</option>");
							for (var s = 0; s < listValue[i].length; s++) {
								$("#two")
										.append(
												"<option value="+listValue[i][s]+">"
														+ listValue[i][s]
														+ "</option>");
							}
						$('#two').selectpicker('refresh');
						});
			});
	$(function() {
		var fileTarget = $('.filebox .upload-hidden'); 
        $("#imgInp").on('change', function(){
            readURL(this);
            if(window.FileReader){ // modern browser 
            	var filename = $(this)[0].files[0].name; 
            	} 
            	else { // old IE 
            	var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
            	} 
            	// 추출한 파일명 삽입
            	 $(this).siblings('.upload-name').val(filename); 
        });
    });
    function readURL(input) {
    	
        if (input.files && input.files[0]) {
        	var reader = new FileReader();

        	reader.onload = function (e) {
                $('#blah').attr('src', e.target.result);
            }
          $('#blah').css('display', 'block');
          reader.readAsDataURL(input.files[0]);
          
        }
    }
 
</script>



</head>
<body>
	<div id="page-wrapper" style="height: 700px">
		<h1 class="page-header">
			신규 팀생성 <small>team</small>
		</h1>
		<form method="post" enctype="multipart/form-data" class="form-horizontal">
		<div class="form-group">
			<label class="col-sm-2 control-label"><span style="color:red">*</span> 팀명</label>
			<div class="col-sm-2"><input type="text" name="name" class="form-control"></div>
			</div>
			<div class="form-group">
			<label class="col-sm-2 control-label"><span style="color:red">*</span> 활동 지역</label>
			<div class="col-sm-2">
			<select name="selOne" id="one" class="form-control selectpicker">
				<option value="default">시,구 선택</option>
				<c:forEach var="vo" items="${location}" varStatus="i">
					<option value="${vo}"><c:out value="${vo}" /></option>
				</c:forEach>
			</select>
			</div>
			<div class="col-sm-2">
			<select name="selTwo" id="two" class="form-control selectpicker">
				<option>동 선택</option>
			</select>
			</div>
			</div>
			<div class="form-group">
			<label class="col-sm-2 control-label"><span style="color:red">*</span> 팀 소개</label>
			<div class="col-sm-7">
			<textarea rows=7 cols=100 class="form-control" id="content" name="content"></textarea>
			</div>
			</div>
			<div class="form-group">
			<label for="file" class="col-sm-2 control-label">팀 엠블럼</label>
			<div class="col-sm-3">
           	<img id="blah" src="#" alt="your image" width="70" height="70" style="display:none;" class="upload-thumb-wrap"/>
           	
           	
           	<div class="filebox">
           	<input type="file" name="file" class="form-control" id="imgInp"/>
           	<input class="upload-name" value="파일선택" disabled="disabled">
           	<label for="imgInp">업로드</label>
           	</div>
           	
           	</div>
			 </div>
			 <div class="form-group">
			 <div class="col-sm-offset-2 col-sm-10">
			 <button type="submit" class="btn btn-default">팀 만들기</button>
			 </div>
			 </div>
			
		</form>
	</div>
</body>
</html>
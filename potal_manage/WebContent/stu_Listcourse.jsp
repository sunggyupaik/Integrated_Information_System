<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>학생 페이지</title>
<style>
h2{
color:#B794CA;
font-weight:bolder;
}
h2:before {
	content: "●";
	font-size: 1.2em;
	vertical-align: 110%;
}
.button {
	font-weight:bold;
	width: 100px;
	background-color: #B794CA;
	border: none;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px;
	cursor: pointer;
}
</style>
</head>
<body>
<h2>학생 - 학적관리</h2><br/>
<input type="button" class="button" value="학적 확인" onclick="location.href='stu_infocheck.jsp'"> 
<input type="button" class="button" value="학적 수정" onclick="location.href='stu_updateForm.jsp'">
<input type="button" class="button" value="강의계획서 확인" style="width:130px;" onclick="location.href='stu_searchplanForm.jsp'">
<input type="button" class="button" value="학생 홈" onclick="location.href='stu_List.jsp'">
</body>
</html>
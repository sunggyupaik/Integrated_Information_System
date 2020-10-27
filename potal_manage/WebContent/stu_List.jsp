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
<h2>학생</h2><br/>
<input type="button" class="button" value="교과 관리" onclick="location.href='stu_Listlecture.jsp'">
<input type="button" class="button" value="수강 관리" onclick="location.href='stu_Listform.jsp'">
<input type="button" class="button" value="성적 관리" onclick="location.href='stu_Listgrade.jsp'">
<input type="button" class="button" value="장학 관리" onclick="location.href='stu_Listscholar.jsp'">
<input type="button" class="button" value="학적 관리" onclick="location.href='stu_Listcourse.jsp'"> 
<input type="button" class="button" value="홈" onclick="location.href='firstForm.jsp'">
</body>
</html>
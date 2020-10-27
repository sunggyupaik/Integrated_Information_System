<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>교수 페이지</title>
</head>
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
<h2>교수</h2><br/>
<input type="button" class="button" value="성적 관리" onclick="location.href='pro_Listform.jsp'"> 
<input type="button" class="button" value="수강 관리" onclick="location.href='pro_Listgrade.jsp'"> 
<input type="button" class="button" value="정보 수정" onclick="location.href='pro_updateForm.jsp'">
<input type="button" class="button" value="홈" onclick="location.href='firstForm.jsp'">
</body>
</html>
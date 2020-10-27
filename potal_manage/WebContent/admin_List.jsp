<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>관리자 페이지</title>
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
<h2>관리자</h2><br/>
<input type="button" class="button" value="교과관리" onclick="location.href='admin_Listcourse.jsp'">
<input type="button" class="button" value="학적관리" onclick="location.href='admin_Listform.jsp'">
<input type="button" class="button" value="장학관리" onclick="location.href='admin_Listscholar.jsp'">
<input type="button" class="button" value="홈" onclick="location.href='firstForm.jsp'"><br/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ �α���</title>
<style>
h2{
color:#B794CA;
font-weight:bolder;
}
b{
color:#B794CA;
}
.button {
	font-weight:bold;
	width: 90px;
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
<h2>������ �α���</h2>
<form method="post" action="admin_FormPro.jsp">
	<b>������ ��й�ȣ</b> : <input type="password" name="m_password" size="20" maxlength="30"><br/><br/>
	<input type="submit" class = "button" value="������ Ȩ">
</form>
</body>
</html>
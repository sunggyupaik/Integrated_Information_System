<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α���</title>
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
<h2>�л�</h2></br>
<form method="post" action="stu_loginPro.jsp">
   <b>���̵�</b> : <input type="text" name="stu_num" size="20" maxlength="30"><br/>
   <b>��й�ȣ</b> : <input type="password" name="s_password" size="20" maxlength="30"><br/>
<input type="submit" class="button" value="�α���">
</form>
</body>
</html>
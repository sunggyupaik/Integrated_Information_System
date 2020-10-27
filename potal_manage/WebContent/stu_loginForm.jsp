<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
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
<h2>학생</h2></br>
<form method="post" action="stu_loginPro.jsp">
   <b>아이디</b> : <input type="text" name="stu_num" size="20" maxlength="30"><br/>
   <b>비밀번호</b> : <input type="password" name="s_password" size="20" maxlength="30"><br/>
<input type="submit" class="button" value="로그인">
</form>
</body>
</html>
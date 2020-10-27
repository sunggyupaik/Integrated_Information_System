<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>교수 번호 찾기</title>
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
	width: 110px;
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
<h2>교수 번호 찾기</h2>
<form method="post" action="pro_searchNumPro.jsp">
<b>이름</b> : <input type="text" name="all_name" size="20" maxlength="30"><br/>
<b>주민번호</b> : <input type="password" name="all_resident_num" size="20" maxlength="30" placeholder="숫자만 입력하세요."><br/><br/>
<input type="submit" class="button" value="교수 번호 찾기">
</form>
</body>
</html>
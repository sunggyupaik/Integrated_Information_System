<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ������</title>
<style>
h2{
color:#B794CA;
font-weight:bolder;
}
h2:before {
	content: "��";
	font-size: 1.2em;
	vertical-align: 110%;
}
.button {
	font-weight:bold;
	width: 150px;
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
<h2>������ - ��������</h2><br/>
<input type="button" class="button" value="�й�/������ȣ �ο�" onclick="location.href='admin_addForm.jsp'">
<input type="button" class="button" value="������ Ȩ" onclick="location.href='admin_List.jsp'"><br/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�л� ������</title>
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
<h2>�л� - ��������</h2><br/>
<input type="button" class="button" value="���� Ȯ��" onclick="location.href='stu_infocheck.jsp'"> 
<input type="button" class="button" value="���� ����" onclick="location.href='stu_updateForm.jsp'">
<input type="button" class="button" value="���ǰ�ȹ�� Ȯ��" style="width:130px;" onclick="location.href='stu_searchplanForm.jsp'">
<input type="button" class="button" value="�л� Ȩ" onclick="location.href='stu_List.jsp'">
</body>
</html>
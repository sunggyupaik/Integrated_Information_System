<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean"
	rel="stylesheet">
<style>
h3 {
	padding-left: 3em;
	font-family: cursive;
	font-size: 1.8em;
	margin-top: 2em;
	margin-left: -1em;
	color: #B794CA;
}

div {
	padding-left:3.3em;
}

h3:before {
	content: "��";
	font-size: 1.2em;
	vertical-align: 110%;
}

h3:after {
	content: "��";
	font-size: 0.7em;
	vertical-align: -140%;
}

.left_m {
	margin-left: 1.5em;
}

.button {
	font-weight:bolder;
	width: 80px;
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
<meta charset="EUC-KR">
<title>���������ý��� ����</title>
</head>
<h3>
	2018�� 2�б� <br />
	<span class="left_m">���������ý���</span>
</h3>
<div>
	<input type="button" class="button" value="�л�"
		onclick="location.href='stu_Form.jsp'"> <input type="button"
		class="button" value="����" onclick="location.href='pro_Form.jsp'">
	<input type="button" class="button" value="������"
		onclick="location.href='admin_Form.jsp'">
</div>
</body>
</html>
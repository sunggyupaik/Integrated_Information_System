<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���ǰ�ȹ�� �˻�</title>
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
<h2>���ǰ�ȹ�� �˻� (����� �Ǵ� �������� �Է��ϼ���.)</h2>
	<form method="post" action="stu_searchplanPro.jsp">
		����� �Է� : <input type="text" name="cour_name" size="30" maxlength="30"><br/>
	 	������ �Է�	: <input type="text" name="professor" size="30" maxlength="30"><br/>
      <input type="submit" class="button" value="�˻�">
      <input type="button" class="button" value="�������� Ȩ" onclick="location.href='stu_Listcourse.jsp'">
   </form>
</body>
</html>

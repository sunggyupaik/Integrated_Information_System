<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = "";
	
   try{
      Cookie[] cookies = request.getCookies();
      if(cookies != null){
         for (int i =0;i<cookies.length;++i){
            if(cookies[i].getName().equals("stu_num")){
               id = cookies[i].getValue();}
         }
      }
   }catch(Exception e){
  		e.printStackTrace();
  	}
%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="EUC-KR">
<title>���� ����</title>
</head>
<body>
<h2><b><%=id %></b>�� ��������</h2>
<form method="post" action="stu_updatePro.jsp">
		<input value="<%=id%>" name="customer_id" type=hidden><br/>
		<b>���� ��й�ȣ</b> : <input type="password" name="s_password" size="43" maxlength="30"><br/>
	 	<b>�� ��й�ȣ</b>	: <input type="password" name="s_password_new" size="43" maxlength="30"><br/>
	 	<b>����</b> : <input type="text" name="stu_mail" size="43" maxlength="30"><br/>
	 	<b>�ڵ��� ��ȣ</b> : <input type="text" name="stu_phone" size="43" maxlength="20"><br/>
      <input type="submit" class="button" value="�Է¿Ϸ�">
   </form>
</body>
</html>

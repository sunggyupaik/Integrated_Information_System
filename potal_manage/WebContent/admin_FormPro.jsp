<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<%
	String m_password = request.getParameter("m_password");

	if(m_password.equals("dhdlchl**S2")){
		%>
		<script>alert('�����ڴ� ȯ���մϴ�'); location.href="admin_List.jsp"</script>
		<%
	}
	else{
		%>
		<script>alert('������ �����!'); window.history.back(); </script>
		<%		
	}
%>
<body>
</body>
</html>
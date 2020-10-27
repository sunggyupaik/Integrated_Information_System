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
		<script>alert('관리자님 환영합니다'); location.href="admin_List.jsp"</script>
		<%
	}
	else{
		%>
		<script>alert('권한이 없어요!'); window.history.back(); </script>
		<%		
	}
%>
<body>
</body>
</html>
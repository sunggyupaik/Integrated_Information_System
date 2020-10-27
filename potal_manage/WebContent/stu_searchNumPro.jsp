<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="user.DBConn" %>
<!DOCTYPE html>
<html>
<head>
<style>
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
<title>학번찾기</title>
<% request.setCharacterEncoding("euc-kr");%>
<%	
	String all_name = request.getParameter("all_name");
	String resident_num = request.getParameter("all_resident_num");
	String all_num=null;

	Connection conn = DBConn.getMySqlConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		String sql = "select * from STUDENT where stu_name=? and stu_resident_num=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,all_name);
		pstmt.setString(2,resident_num);
		rs = pstmt.executeQuery();
		rs.next();
		all_num = rs.getString("stu_num");
	}catch(Exception ex){
		%>
		<script>
		alert('해당 정보가 없습니다.');
		history.go(-1);
		</script>
		<%
		ex.printStackTrace();
	}finally {
		if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
		if(conn != null) try {conn.close();} catch(SQLException ex) {}
	}%>
</head>
<body>
<%
	if(all_num!=null){
		%>
		<%=all_name %> 의 학번/교수번호는 <strong><%=all_num %></strong> 입니다. <br/>
		<%
	}
	%>

<input type="button" class="button" value="로그인" onclick="location.href='stu_loginForm.jsp'">
</body>
</html>
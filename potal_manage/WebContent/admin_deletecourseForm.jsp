<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
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
<meta charset="EUC-KR">
<title>교과목 삭제</title>
</head>
<body> 
<h2>삭제할 과목 번호를 입력하세요.</h2>
<b>현재 등록되어 있는 과목 번호</b><br/>
<% request.setCharacterEncoding("euc-kr");
    Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	 try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/potaldatabase";
		String dbId = "root";
		String dbPass = "apfhddlek65";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

		String sql ="select cour_no from lecture";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int n = 0;
		while(rs.next()){
			String cour = rs.getString("cour_no");
			if(n!=0&&n%5==0){
				%><br/><%
			}
			%>
			<b><%=cour %></b>&nbsp;&nbsp;
			<%
			n++;
		}
	}catch(Exception ex){
			ex.printStackTrace();
	}finally {
		if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
		if(conn != null) try {conn.close();} catch(SQLException ex) {}
	}%>
<form method="post" action="admin_deletecoursePro.jsp">
	과목 번호 : <input type="text" name="cour_no" size="5"><br/>

	
    <input type="submit" class = "button" value="입력 완료"><br/>
 </form>

</body>
</html>
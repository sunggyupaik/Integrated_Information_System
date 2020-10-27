<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("euc-kr");
  
	String num = request.getParameter("del_num");
	String sem = request.getParameter("del_sem");
	String sch = request.getParameter("del_sch");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	if(num.equals("")){
		%>
		<script>
		alert("체크내역이 없습니다.");
		history.go(-1);
		</script>
		<%
	}
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/potaldatabase";
		String dbId = "root";
		String dbPass = "apfhddlek65";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			String sql ="delete from scholarship where stu_num = ? and semester = ? and sch_name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.setString(2, sem);
			pstmt.setString(3, sch);
			pstmt.executeUpdate();
		
	}catch(Exception ex){
			ex.printStackTrace();
	}finally {
		if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
		if(conn != null) try {conn.close();} catch(SQLException ex) {}
	}
	%>
	<script>
	alert("장학내역을 삭제하였습니다.");
	location.href="admin_scholarshipForm.jsp";
	</script>
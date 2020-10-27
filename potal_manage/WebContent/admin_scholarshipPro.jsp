<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("euc-kr");
   
	String semes = request.getParameter("semester");
	String sname = request.getParameter("sch_name");
	String schol = request.getParameter("schol");
	String num = request.getParameter("stu_num");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	if(semes.equals("") || sname.equals("") || schol.equals("") || num.equals("")){
		%>
		<script>
		alert("항목을 모두 작성하세요.");
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
			String sql ="insert into scholarship(semester, sch_name, schol, stu_num) values (?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, semes);
			pstmt.setString(2, sname);
			pstmt.setString(3, schol);
			pstmt.setString(4, num);
			pstmt.executeUpdate();
			%>
			<script>
			alert("장학내역을 추가하였습니다.");
			location.href="admin_scholarshipForm.jsp";
			</script>
			<%
	}catch(Exception ex){
			ex.printStackTrace();
			%>
			<script>
			alert("학번이 존재하지 않습니다.");
			history.go(-1);
			</script>
			<%
	}finally {
		if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
		if(conn != null) try {conn.close();} catch(SQLException ex) {}
	}
	
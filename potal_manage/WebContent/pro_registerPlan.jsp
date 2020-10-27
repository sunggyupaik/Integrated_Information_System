<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<%
request.setCharacterEncoding("euc-kr");
	request.setCharacterEncoding("euc-kr");
	String cour_no = request.getParameter("cour_no");
	String content = request.getParameter("content");
	String name = request.getParameter("name");
	String professor="";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	System.out.print(cour_no);
	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/potaldatabase";
		String dbId = "root";
		String dbPass = "apfhddlek65";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		pstmt = conn.prepareStatement("select professor from lecture where cour_no=?");
		pstmt.setString(1, cour_no);
		rs=pstmt.executeQuery();
		if(rs.next()){
			professor=rs.getString("professor");
		}
		pstmt.close();
		if(professor.equals(name)){
			String sql = "update lecture set description=? where cour_no=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setString(2, cour_no);
			pstmt.executeUpdate();%>
			<script>
			alert("강의계획작성이 완료되었습니다");
			location.href="pro_List.jsp";
			</script>
			<%
		}
		else{
			%>
			<script>
			alert("담당 과목번호가 아닙니다.");
			location.href="pro_List.jsp";
			</script>
			<%
		}
	} catch (Exception ex) {
		ex.printStackTrace();
	} finally {
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException ex) {
			}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException ex) {
			}
	}
%>

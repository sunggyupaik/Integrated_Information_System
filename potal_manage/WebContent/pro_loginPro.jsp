<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("euc-kr");

	String num = request.getParameter("pro_num");
	String password = request.getParameter("p_password");

	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/potaldatabase";
		String dbId = "root";
		String dbPass = "apfhddlek65";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			String sql ="select p_password, pro_name from professor where pro_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String pw = rs.getString("p_password");
				String name = rs.getString("pro_name");
				if(pw.equals(password)){
					Cookie cookie = new Cookie("pro_num", num);
				      cookie.setMaxAge(20*60);
				      response.addCookie(cookie);
					%>
					<script>
					alert("<%=name%>�� ȯ���մϴ�.");
					location.href="pro_List.jsp";
					</script>
					
					<% 
				}else{
					%>
					<script>
					alert("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
					history.go(-1);
					</script>
					<%
				}
			}else{
				%>
				<script>
				alert("���̵� Ʋ�Ƚ��ϴ�.");
				history.go(-1);
				</script>
				<%
			}
		
	}catch(Exception ex){
			ex.printStackTrace();
	}finally {
		if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
		if(conn != null) try {conn.close();} catch(SQLException ex) {}
	}%>
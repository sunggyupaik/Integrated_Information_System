<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	String password = request.getParameter("s_password");
	String password_new = request.getParameter("s_password_new");
	String id="";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Cookie[] cookies = request.getCookies();
	      if(cookies != null){
	         for (int i =0;i<cookies.length;++i){
	            if(cookies[i].getName().equals("pro_num")){
	               id = cookies[i].getValue();}
	         }
	      }	
		
		String jdbcUrl = "jdbc:mysql://localhost:3306/potaldatabase";
		String dbId = "root";
		String dbPass = "apfhddlek65";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		String sql = "select p_password from professor where pro_num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		if(rs.next()){
			String o_password = rs.getString("p_password");
			if(password.equals(o_password)){
				sql = "update professor set p_password = ? where pro_num = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,password_new);
				pstmt.setString(2,id);
				pstmt.executeUpdate();%>
				<script>
				alert("정보를 수정하였습니다.");
				location.href="pro_List.jsp";
				</script>
				<%
			}
			else{%>
			<script>
			alert("비밀번호가 일치하지 않습니다.");
			history.go(-1);
			</script>
		<%	
			}
		}
}catch(Exception e){
		e.printStackTrace();
	}finally{
        if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
        if(conn != null) try {conn.close();} catch(SQLException ex) {}
	}
%>


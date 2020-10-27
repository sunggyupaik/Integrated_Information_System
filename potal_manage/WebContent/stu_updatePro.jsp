<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	String password = request.getParameter("s_password");
	String password_new = request.getParameter("s_password_new");
	String mail = request.getParameter("stu_mail");
	String phone = request.getParameter("stu_phone");
	String id="";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Cookie[] cookies = request.getCookies();
	      if(cookies != null){
	         for (int i =0;i<cookies.length;++i){
	            if(cookies[i].getName().equals("stu_num")){
	               id = cookies[i].getValue();}
	         }
	      }	
		
		String jdbcUrl = "jdbc:mysql://localhost:3306/potaldatabase";
		String dbId = "root";
		String dbPass = "apfhddlek65";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		String sql = "select s_password from student where stu_num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		if(rs.next()){
			String o_password = rs.getString("s_password");
			if(password.equals(o_password)){
				sql = "update student set s_password = ?, stu_mail = ?, stu_phone = ? where stu_num = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,password_new);
				pstmt.setString(2,mail);
				pstmt.setString(3,phone);
				pstmt.setString(4,id);
				pstmt.executeUpdate();%>
				<script>
				alert("������ �����Ͽ����ϴ�.");
				location.href="stu_List.jsp";
				</script>
				<%
			}
			else{%>
			<script>
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
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


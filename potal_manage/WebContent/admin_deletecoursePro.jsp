<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>


<% request.setCharacterEncoding("euc-kr");
   
	String no = request.getParameter("cour_no");
	int check = 0;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	if(no.equals("")){
		%>
		<script>
		alert("�����ȣ�� �Է��ϼ���.");
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
		
		String sql = "select cour_no from lecture";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			String s = rs.getString("cour_no");
			if(s.equals(no)){
				check = 1;
				break;
			}
		}
		if(check == 0){
			%>
			<script>
			alert("�����ȣ�� �������� �ʽ��ϴ�.");
			history.go(-1);
			</script>
			<%
		}
		sql ="delete from lecture where cour_no = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, no);
		pstmt.executeUpdate();
		%>
		<script>
		alert("�������� �����Ͽ����ϴ�.");
		location.href="admin_List.jsp";
		</script>
		<%
	}catch(Exception ex){
			ex.printStackTrace();
			%>
			<script>
			alert("�����ȣ�� �������� �ʽ��ϴ�.");
			history.go(-1);
			</script>
			<%
	}finally {
		if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
		if(conn != null) try {conn.close();} catch(SQLException ex) {}
	}%>
	
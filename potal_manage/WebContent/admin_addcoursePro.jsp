<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("euc-kr");
   
	String semes = request.getParameter("semester");
	System.out.print(semes);
	String no = request.getParameter("cour_no");
	String name = request.getParameter("cour_name");
	String pro = request.getParameter("professor");
	String grade = request.getParameter("grade");
	String classify= request.getParameter("classify");
	String num = request.getParameter("cour_stu_num");
	String lec_day = request.getParameter("lec_day");
	String lec_time = request.getParameter("lec_time");
	String lec_day2 = request.getParameter("lec_day2");
	String lec_time2 = request.getParameter("lec_time2");
	String lec_room = request.getParameter("lec_room");
	String lec_room2 = request.getParameter("lec_room2");
	
	if(no.equals("") || name.equals("") ||pro.equals("") ||grade.equals("") ||classify.equals("") ||num.equals("") ||lec_day.equals("") ||lec_time.equals("") ||lec_room.equals("")){
		%>
        <script>
        	alert("입력이 올바르지 않습니다.");
            history.go(-1);
        </script>
        <%      
	}
	if(!lec_time2.equals("")){
		if(lec_room2.equals("")){
			%>
	        <script>
	        	alert("입력이 올바르지 않습니다.");
	            history.go(-1);
	        </script>
	        <%
		}
	}
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
 	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/potaldatabase";
		String dbId = "root";
		String dbPass = "apfhddlek65";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		String sql ="insert into lecture values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, semes);
		pstmt.setString(2, no);
		pstmt.setString(3, name);
		pstmt.setString(4, pro);
		pstmt.setFloat(5, Float.parseFloat(grade));
		pstmt.setString(6, lec_time);
		pstmt.setString(7, lec_time2);
		pstmt.setString(8, classify);
		pstmt.setInt(9, Integer.parseInt(num));
		pstmt.setInt(10, 0);
		pstmt.setString(11, null);
		pstmt.setString(12, lec_room);
		pstmt.setString(13, lec_room2);
		pstmt.setString(14, lec_day);
		pstmt.setString(15, lec_day2);
		pstmt.executeUpdate();
		%>
		<script>
			alert("교과목을 등록하였습니다.");
			location.href="admin_List.jsp";
		</script>
		<%
	}catch(Exception ex){
			ex.printStackTrace();
			%>
			<script>
			alert("과목번호가 중복됩니다.");
			history.go(-1);
			</script>
			<%
	}finally {
		if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
		if(conn != null) try {conn.close();} catch(SQLException ex) {}
	}
	
%>
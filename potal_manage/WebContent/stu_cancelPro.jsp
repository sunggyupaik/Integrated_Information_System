<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("euc-kr");%>
<%
String cour_no = request.getParameter("cour_n");
System.out.print(cour_no);
int current_stu_num= 0;
int cour_stu_num = 0;
String stu_num="";
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
   try{
	   Cookie[] cookies = request.getCookies();
	      if(cookies != null){
	         for (int i =0;i<cookies.length;++i){
	            if(cookies[i].getName().equals("stu_num")){
	               stu_num = cookies[i].getValue();}
	         }
	      }	
	  System.out.print(stu_num);
      String jdbcUrl = "jdbc:mysql://localhost:3306/potaldatabase";
      String dbId = "root";
      String dbPass = "apfhddlek65";
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
      
      String sql = "select current_stu_num, cour_stu_num from LECTURE where cour_no=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, cour_no);
      rs = pstmt.executeQuery();
      rs.next();
      current_stu_num = rs.getInt("current_stu_num");
      cour_stu_num = rs.getInt("cour_stu_num");
      System.out.print(current_stu_num);
      int num = current_stu_num-1;
      sql = "update lecture set current_stu_num=? where cour_no=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1,num);
      pstmt.setString(2,cour_no);
      pstmt.executeUpdate();
      sql = "delete from manage_course where cour_no=? and stu_num=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1,cour_no);
      pstmt.setString(2,stu_num);
      pstmt.executeUpdate();
      %>
		<script>
		alert("수강이 취소되었습니다.");
		location.href="stu_cancelForm.jsp";
		</script>
		<%
        	 
}catch(Exception e){
		e.printStackTrace();
	}finally{
        if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
        if(conn != null) try {conn.close();} catch(SQLException ex) {}
	}
%>
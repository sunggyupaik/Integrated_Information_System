<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="user.DBConn" %>

<% request.setCharacterEncoding("euc-kr");
	
   String name = request.getParameter("all_name");
   String resident_num = request.getParameter("all_resident_num");
   String depart = request.getParameter("all_depart");
   String num = request.getParameter("all_num");
   String position = request.getParameter("all_position");
   String grade = request.getParameter("all_grade");
   String password="";
   
   Connection conn = DBConn.getMySqlConnection();
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   try{
      password = resident_num.substring(0,6);
      System.out.print(password);
      if(position.equals("stu")){
    	  String sql = "select stu_num, stu_resident_num from student where stu_num=? or stu_resident_num=?";
    	  pstmt = conn.prepareStatement(sql);
    	  pstmt.setString(1,num);
    	  pstmt.setString(2,resident_num);
    	  rs = pstmt.executeQuery();
    	  if(rs.next()){
    		  %>
<script>
    		  alert('이미 등록되어있습니다');
    		  history.go(-1);
    		  </script>
<%
    	  }
    	  else{
    		  sql ="insert into STUDENT values (?, ?, ?, ?, ?, ?, ?, ?)";
    	         pstmt = conn.prepareStatement(sql);
    	         pstmt.setInt(1, Integer.parseInt(num));
    	         pstmt.setString(2, name);
    	         pstmt.setString(3, null);
    	         pstmt.setString(4, depart);
    	         pstmt.setInt(5, Integer.parseInt(grade));
    	         pstmt.setString(6, null);
    	         pstmt.setString(7, resident_num);
    	         pstmt.setString(8, password);
    	         pstmt.executeUpdate();
    	         %>
<script>
   alert("학번/교수번호를 등록하였습니다.");
   location.href="admin_List.jsp";
   </script>
<%
    	  }         
      }else if(position.equals("pro")){
    	  String sql = "select pro_num from professor where pro_num=?";
    	  pstmt = conn.prepareStatement(sql);
    	  pstmt.setString(1,num);
    	  rs = pstmt.executeQuery();
    	  if(rs.next()){
    		  %>
			<script>
    		  alert('이미 등록되어있습니다');
    		  history.go(-1);
    		  </script>
<%
    	  }
    	  else{
    		  sql ="insert into professor values (?, ?, ?, ?, ?)";
    	         pstmt = conn.prepareStatement(sql);
    	         pstmt.setString(1, name);
    	         pstmt.setInt(2, Integer.parseInt(num));
    	         pstmt.setString(3, resident_num);
    	         pstmt.setString(4, depart);
    	         pstmt.setString(5, password);
    	         pstmt.executeUpdate();
    	         %>
<script>
    	       alert("학번/교수번호를 등록하였습니다.");
    	       location.href="admin_List.jsp";
    	       </script>
<%
    	  }	  
      }
   }catch(Exception ex){
         ex.printStackTrace();
   }finally {
      if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
      if(conn != null) try {conn.close();} catch(SQLException ex) {}
   }%>
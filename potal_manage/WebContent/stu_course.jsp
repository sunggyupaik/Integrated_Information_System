<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("euc-kr");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ Ȯ��</title>
<style>
th{
	background-color : pink;
	color : white;
	border:1px solid white;
	
}
td{
	border:1px solid pink;
	text-weight:bold;
}
table{
	border-collapse:collapse;
	border:1px solid white;
}
</style>
</head>
<body>
<table border="1">
<th>�⵵/�б�</th><th>�����ȣ</th><th>�����</th><th>��� ����</th><th>����</th><th>���ǽð�(���ǽ�)</th><th>����/����</th>
<%
    String stu_num="";
	String cour_no="";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    ResultSet rs1 = null;
    float sum=0;
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
    	      String sql = "select cour_no from manage_course where stu_num=?";
    	      pstmt = conn.prepareStatement(sql);
    	      pstmt.setString(1, stu_num);
    	      rs = pstmt.executeQuery();
    	      while(rs.next()){
    	    	  cour_no = rs.getString("cour_no");
    	    	  System.out.println(cour_no);
        	      sql = "select semester,cour_name,professor,grade,cour_time1,cour_time2,classify,cour_room1,cour_room2,cour_day,cour_day2 from lecture where cour_no=?";
        	      pstmt = conn.prepareStatement(sql);
        	      pstmt.setString(1,cour_no);
    	    	  rs1 = pstmt.executeQuery();
    	    	  rs1.next();
    	    	  String semester = rs1.getString("semester");
    	    	  String cour_name = rs1.getString("cour_name");
    	    	  String professor = rs1.getString("professor");
    	    	  float grade = rs1.getFloat("grade");
    	    	  sum += grade;
    	    	  String cour_time1 = rs1.getString("cour_time1");
    	    	  String cour_time2 = rs1.getString("cour_time2");
    	    	  String classify = rs1.getString("classify");
    	    	  String cour_room1 = rs1.getString("cour_room1");
    	    	  String cour_room2 = rs1.getString("cour_room2");
    	    	  String cour_day = rs1.getString("cour_day");
    	    	  String cour_day2 = rs1.getString("cour_day2");
    	    	  if(cour_room2!=null){ //���� ��Ʋ
    	         	 %>
    	          <tr>
    	          <td><%=semester %></td>
    	          <td><%=cour_no %></td><td><%=cour_name %></td><td><%=professor %></td><td><%=grade %></td><td><%=cour_day %>-<%=cour_time1 %>(<%=cour_room1 %>), <%=cour_day2 %>-<%=cour_time2 %>(<%=cour_room2 %>)</td><td><%=classify %></td>
    	          </tr>
    	          <%
    	          }
    	          else{ //���� �Ϸ�
    	         	 %>
    	          <tr>
    	          <td><%=semester %></td>
    	          <td><%=cour_no %></td><td><%=cour_name %></td><td><%=professor %></td><td><%=grade %></td><td><%=cour_day %>-<%=cour_time1 %>(<%=cour_room1 %>)</td><td><%=classify %></td>
    	          </tr>
    	          <%
    	          }
    	    	  
      		}   
   }catch(Exception ex){
      ex.printStackTrace();
   }finally {
      if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
      if(conn != null) try {conn.close();} catch(SQLException ex) {}
}
%>
</table>
<br><b><%=stu_num %><b> �л��� ���� ��� ���� : <b><%=sum %></b><br/>    
<input type="button" value="�л� Ȩ" onclick="location.href='stu_List.jsp'">  
</body>
</html>
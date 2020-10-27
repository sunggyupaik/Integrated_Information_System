<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("euc-kr");

   String id="";
   String num="";
   String name="";
   String mail="";
   String depart="";
   String grade="";
   String phone="";
   String resident_num="";

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
      
      String sql ="select * from student where stu_num = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1,Integer.parseInt(id));
      rs = pstmt.executeQuery();
      if(rs.next()){
         num = rs.getString("stu_num");
         name = rs.getString("stu_name");
         mail = rs.getString("stu_mail");
         depart = rs.getString("stu_depart");
         grade = rs.getString("stu_grade");
         phone = rs.getString("stu_phone");
         resident_num = rs.getString("stu_resident_num");
      }
      if(mail==null)
         mail = "������� ����";
      if(phone==null)
         phone = "������� ����";
      %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� Ȯ��</title>
<style>
h2 {
	color: #B794CA;
	font-weight: bolder;
}

b {
	color: #B794CA;
}
</style>
</head>
<body>
	<h2><%=id %>���� ����
	</h2>
	<br />
	<br />
	<b>�й�</b> :
	<%=num %><br />
	<b>�̸�</b> :
	<%=name %><br />
	<b>����</b> :
	<%=mail %><br />
	<b>�Ҽ�</b> :
	<%=depart %><br />
	<b>�г�</b> :
	<%=grade %><br />
	<b>�ڵ��� ��ȣ</b> :
	<%=phone %><br />
	<b>�ֹε�Ϲ�ȣ</b> :
	<%=resident_num.substring(0,6)%>
	-
	<%=resident_num.substring(6,13)%><br />
	<%
   }catch(Exception ex){
         ex.printStackTrace();
   }finally {
      if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
      if(conn != null) try {conn.close();} catch(SQLException ex) {}
   }%>
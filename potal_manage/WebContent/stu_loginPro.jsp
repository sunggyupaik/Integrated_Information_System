<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("euc-kr");

   String num = request.getParameter("stu_num");
   String password = request.getParameter("s_password");

   
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;

   try{
      String jdbcUrl = "jdbc:mysql://localhost:3306/potaldatabase";
      String dbId = "root";
      String dbPass = "apfhddlek65";
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
         String sql ="select s_password, stu_name from student where stu_num=?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1,num);
         rs = pstmt.executeQuery();
         if(rs.next()){
            String pw = rs.getString("s_password");
            String name = rs.getString("stu_name");
            if(pw.equals(password)){
               Cookie cookie = new Cookie("stu_num", num);
                  cookie.setMaxAge(20*60);
                  response.addCookie(cookie);
                  %>
                  <script>
                  alert("<%=name%>님 환영합니다.");
                  location.href="stu_List.jsp";
                  </script>
                  
                  <%
            }else{
               %>
               <script>
               alert("비밀번호가 틀렸습니다.");
               history.go(-1);
               </script>
               <%
            }
         }else{
            %>
            <script>
            alert("아이디가 틀렸습니다.");
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
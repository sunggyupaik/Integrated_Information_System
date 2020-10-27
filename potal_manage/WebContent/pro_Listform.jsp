<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>교수 페이지</title>

<script>
   function display(s) {
      document.getElementById(s).style.display = "block";
   }
   function undisplay(s) {
      document.getElementById(s).style.display = "none";
   }
</script>
</head>
<style>
h2 {
   color: #B794CA;
   font-weight: bolder;
}

h2:before {
   content: "●";
   font-size: 1.2em;
   vertical-align: 110%;
}

h4 {
   color: #B794CA;
}

.button {
   font-weight: bold;
   width: 100px;
   background-color: #B794CA;
   border: none;
   color: #fff;
   padding: 15px 0;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 15px;
   margin: 4px;
   cursor: pointer;
}

#stu_list {
   display: none;
   border: 2px solid #B794CA;
}

#registerPlan {
   display: none;
   border: 2px solid #B794CA;
}

#list {
   border: 1px solid #B794CA;
}

th {
   background-color: pink;
   color: white;
   border: 1px solid white;
}

td {
   border: 1px solid pink;
   text-weight: bold;
}

table {
   border-collapse: collapse;
   border: 1px solid white;
   text-align: center;
}

table, td, th {
   padding: 5px;
}
</style>
<body>
   <h2>교수 - 성적관리</h2>
   <br />
   <input type="button" class="button" value="학생 성적처리"
      onclick="display('stu_list')">
   <input type="button" class="button" value="교수 홈"
      onclick="location.href='pro_List.jsp'">
   <div id="stu_list">
      <%
            String id = "";
            String name = "";
            String cour_name = "";//과목명
            String stu_num = "";//학번
            String stu_name="";//학생이름
            String credit = "";//학점
            String semester = "";//학기
            String classify = "";//전공/교양
            String cour_no="";//과목번호
         
            float grade = 0;
            try {
               Cookie[] cookies = request.getCookies();
               if (cookies != null) {
                  for (int i = 0; i < cookies.length; ++i) {
                     if (cookies[i].getName().equals("pro_num")) {
                        id = cookies[i].getValue();
                     }
                  }
               }
            } catch (Exception e) {
               e.printStackTrace();
            }

            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs=null, rs1 = null;

            try {
               String jdbcUrl = "jdbc:mysql://localhost:3306/potaldatabase";
               String dbId = "root";
               String dbPass = "apfhddlek65";
               Class.forName("com.mysql.jdbc.Driver");
               conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
               String sql = "select pro_name from professor where pro_num=?";
               pstmt = conn.prepareStatement(sql);
               pstmt.setString(1, id);
               rs = pstmt.executeQuery();
               if (rs.next()) {
                  name = rs.getString("pro_name");
               }
               

               sql = "select semester, cour_no, cour_name, grade, classify from lecture where professor=?";//교수이름으로 lecture에서 과목명 검색
               pstmt = conn.prepareStatement(sql);
               pstmt.setString(1, name);
               rs = pstmt.executeQuery();
               while (rs.next()) {
                  semester = rs.getString("semester");
                  cour_no = rs.getString("cour_no");
                  cour_name = rs.getString("cour_name");
                  credit = rs.getString("grade");
                  classify = rs.getString("classify");
                  %>
      <h4>
         *****"<b><%=cour_name %></b>" 수강 학생 리스트*****
      </h4>
      <div id="list">
         <table>
            <thead>
               <tr>
                  <th>학번</th>
                  <th>이름</th>
                  <th>성적</th>
               </tr>
            </thead>
            <tbody>
               <form method="post" action="pro_treatGrade.jsp">
                  <%                  
               
                  sql = "select s.stu_num, s.stu_name from student s, manage_course m where s.stu_num=m.stu_num and m.cour_no=?";
                  pstmt = conn.prepareStatement(sql);
                  pstmt.setString(1, cour_no);
                  rs1 = pstmt.executeQuery();
      
                  int i = 0;
                  while(rs1.next()){
                  stu_num = rs1.getString("s.stu_num");
                  stu_name = rs1.getString("s.stu_name");
                           
                  %>
               
               <tr>
                  <td><%=stu_num%></td>
                  <input type="hidden" value=<%=stu_num%> name="stu_num">
                  <td><%=stu_name%></td>
                  <td><input type="text" name="grade"></td>
               </tr>
               <%
                  }
               %>
                
               
            </tbody>
         </table>
         
         <input type="hidden" name="cour_name" value=<%=cour_name%>> <input
            type="hidden" name="semester" value=<%=semester%>> <input
            type="hidden" name="classify" value=<%=classify%>> <input
            type="hidden" name="credit" value=<%=credit%>> <input
            type="submit" value="성적등록"> <input type="button" value="닫기"
            onclick="undisplay('stu_list')">

         </form>
         <%
               }
            
            } catch (Exception e) {
               e.printStackTrace();
            }
         %>
      </div>
   </div>
   <br />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<% 
   String id="";
   float all_credit = 0;
   float all_grade =0;
   float credit=0;
   float grade=0;
   String[] semesters={};
   int count=0;%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
h2{
color:#B794CA;
font-weight:bolder;
}
b{
color:#B794CA;
}
.button {
   font-weight:bold;
   width: 130px;
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
table {
   text-align: center;
   border-collapse: collapse;
   border: 1px solid white;
}

table, td, th {
   padding: 5px;
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
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성적조회</title>
<script>
   function display(s) {
      document.getElementById(s).style.display = "block";
   }
   function undisplay(s){
      document.getElementById(s).style.display = "none";
   }
   
</script>
</head>
<% 
   
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   try{
       Cookie[] cookies = request.getCookies();
         if(cookies != null){
               for (int j =0;j<cookies.length;j++){
                  if(cookies[j].getName().equals("stu_num")){
                     id = cookies[j].getValue();}
               }
            }   
         
      String jdbcUrl = "jdbc:mysql://localhost:3306/potaldatabase";
       String dbId = "root";
       String dbPass = "apfhddlek65";
       Class.forName("com.mysql.jdbc.Driver");
       conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
       
       pstmt = conn.prepareStatement("select credit, grade from handled_grade where stu_num=?");
       pstmt.setString(1, id);
      rs = pstmt.executeQuery();
      while(rs.next()){
         credit=rs.getFloat("credit");
         grade=rs.getFloat("grade");
         all_credit+=credit;
         all_grade=all_grade+(credit*grade);
      }
      pstmt.close();
      
      pstmt = conn.prepareStatement("select distinct(semester) from handled_grade where stu_num=?");
      pstmt.setString(1,id);
      rs=pstmt.executeQuery();
      while(rs.next()){
         count++;
      }
      semesters = new String[count];
      int i=0;
      rs=pstmt.executeQuery();
      while(rs.next()){
         semesters[i]=rs.getString("semester");
         i++;
      }
      credit=0;
      grade=0;//전체평균계산할때 all_credit과 all_grade만 쓰기 때문에  다음 변수들은 초기화해준다.
%>
<body>
<h2>성적조회</h2>
<br/>
   <input type="button" class="button" value="당학기 성적조회" onclick="location.href='stu_checkCurrentGrade.jsp'">
   <div id="currentGrade">
      
   </div>
   <input type="button" class="button" value="전체 성적조회" onclick="display('allGrade')">
   <div id="allGrade" style="display:none;">
      <h3>전체평균</h3>
      <table>
         <thead>
            <tr>
               <th>취득 학점</th>
               <th>평점계</th>
               <th>평점 평균</th>
               <th>평점</th>
            </tr>
         </thead>
         <tbody>
            <tr>
               <td><%=all_credit %></td>
               <td><%=all_grade %></td>
               <td><%=all_grade/all_credit %></td>
               <%if(all_grade/all_credit>=4.25){ %>
                  <td>A+</td>
               <%}else if(all_grade/all_credit>=3.75){ %>
                  <td>A0</td>
               <%}else if(all_grade/all_credit>=3.25){ %>
                  <td>B+</td>
               <%}else if(all_grade/all_credit>=2.75){ %>
                  <td>B0</td>
               <%}else if(all_grade/all_credit>=2.25){ %>
                  <td>C+</td>
               <%}else if(all_grade/all_credit>=1.75){ %>
                  <td>C0</td>
               <%}else if(all_grade/all_credit>=1.25){ %>
                  <td>D+</td>
               <%}else if(all_grade/all_credit>=0.75){ %>
                  <td>D0</td>
               <%}else{%>
                  <td>F</td>
               <%}%>
            </tr>
         </tbody>
      </table><br/>
      <h3>학기별</h3><br/>
      <table>
         <thead>
            <tr>
               <th>년도/학기</th>
               <th>취득학점</th>
               <th>평점계</th>
               <th>확인</th>
            </tr>
         </thead>
         <tbody>
         <%
          
         float sub_credit;
         float sub_grade;
         String semester;
         for(int j=0;j<semesters.length;j++){
            sub_credit=0;
            sub_grade=0;
            semester=semesters[j];
            pstmt=conn.prepareStatement("select credit, grade from handled_grade where stu_num=? and semester=?");
              pstmt.setString(1,id);
              pstmt.setString(2,semesters[j]);
              rs=pstmt.executeQuery();
              
              while(rs.next()){
                 credit=rs.getFloat("credit");
               grade=rs.getFloat("grade");
               sub_credit+=credit;//학기별 학점수
               sub_grade=sub_grade+(grade*credit);//학기별 평점계
              }
              pstmt.close();
         %>
            <tr>
               <td><%=semester %></td>
               <td><%=sub_credit %></td>
               <td><%=sub_grade %></td>
               <td><input type="button" class="button" value=">" onclick="display('<%=semester%>')"></td>
            </tr>
            <%} %>
         </tbody>
      </table>
      
      <%
      //학기 별 과목성적 
      for(int j =0;j<semesters.length;j++){
          String cour_name;
            String classify;
            float c;
            float g;
            pstmt=conn.prepareStatement("select cour_name, classify, credit, grade from handled_grade where stu_num=? and semester=?");
              pstmt.setString(1,id);
              pstmt.setString(2,semesters[j]);
              rs=pstmt.executeQuery();
         %>
         <div id=<%=semesters[j]%> style="width:350px; height:350px; border:1px solid green; display:none; margin:1px 500px;">
            <h3><%=semesters[j] %>의 성적</h3>
            <table>
               <thead>
                <tr>
                  <th>과목명</th>
                  <th>이수구분</th>
                  <th>학점</th>
                  <th>평점</th>
                </tr>
               </thead>
               <tbody>
                  <%
                  while(rs.next()){
                     cour_name=rs.getString("cour_name");
                     classify=rs.getString("classify");
                     c=rs.getFloat("credit");
                     g=rs.getFloat("grade");
                     %>
                     <tr>
                        <td><%=cour_name %></td>
                        <td><%=classify %></td>
                        <td><%=c %></td>
                        <td><%=g %></td>
                     </tr>
                     <% 
                  }
                  %>
               </tbody>
            </table>
            <input type="button" class="button" value="닫기" onclick="undisplay('<%=semesters[j] %>')">
         </div>
         
         <% 
      }
      }catch(Exception ex){
         ex.printStackTrace();
      }finally {
         if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
         if(conn != null) try {conn.close();} catch(SQLException ex) {}
      }%>
      <br/>
   <input type="button" class="button" value="성적 관리 홈" onclick="location.href='stu_Listgrade.jsp'">
      <br/><br/><input type="button" class="button" value="닫기" onclick="undisplay('allGrade')">
   </div>
   
</body>
</html>
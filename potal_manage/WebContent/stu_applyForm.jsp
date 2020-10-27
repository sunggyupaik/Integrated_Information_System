<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>수강신청</title>
<style>
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
}
</style>
<script src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<script src="jquery-1.10.2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<%
//수강신청 기간인지 아닌지를 처리하기위한 날짜 변수들
Date today = new Date();
String start = "2018-12-06";
String end = "2018-12-31";
SimpleDateFormat fomatter = new SimpleDateFormat("yyyy-MM-dd");
String to = fomatter.format(today);
Date beginDate = fomatter.parse(start);//수강신청기간 시작 날짜
Date endDate = fomatter.parse(end);//수강신청기간 끝 날짜
Date todate = fomatter.parse(to);
if(todate.getTime()>=beginDate.getTime()&&todate.getTime()<=endDate.getTime()){
%>
	<form method="post" action="stu_applyPro.jsp">
		<table border="1">
			<th>년도/학기</th>
			<th>과목번호</th>
			<th>과목명</th>
			<th>담당 교수</th>
			<th>학점</th>
			<th>강의시간(강의실)</th>
			<th>전공/교양</th>
			<th>현재인원</th>
			<th>제한인원</th>
			<th>apply</th>
			<% request.setCharacterEncoding("euc-kr");%>
			<%
	String semester = null;
	String cour_no = null;
	String cour_name = null;
	String professor = null;
	float grade = 0;
	String cour_time1 = null;
	String cour_time2 = null;
	String classify = null;
	int current_stu_num=0;
	int cour_stu_num = 0;
	String cour_room1=null;
	String cour_room2 = null;
	String cour_day = null;
	String cour_day2 = null;
	int[] array;
	int count=0;
	String description = null;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs,rs1,rs2,rs3,rs4,rs5,rs6 = null;
	
   try{
      String jdbcUrl = "jdbc:mysql://localhost:3306/potaldatabase";
      String dbId = "root";
      String dbPass = "7346";
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
      
      String sql = "select * from LECTURE";
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while(rs.next()){
         semester = rs.getString("semester");
         cour_no = rs.getString("cour_no");
         cour_name = rs.getString("cour_name");
         professor = rs.getString("professor");
         grade = rs.getFloat("grade");
         cour_time1 = rs.getString("cour_time1");
         cour_time2 = rs.getString("cour_time2");
         classify = rs.getString("classify");
         cour_stu_num = rs.getInt("cour_stu_num");
         current_stu_num = rs.getInt("current_stu_num");
         description = rs.getString("description");
         cour_room1 = rs.getString("cour_room1");
         cour_room2 = rs.getString("cour_room2");
         cour_day = rs.getString("cour_day");
         cour_day2 = rs.getString("cour_day2");
         
         if(cour_room2!=null){ //수업 이틀
        	 %>
			<tr>
				<td><%=semester %></td>
				<td><input type="text" name="cour_no" value=<%=cour_no %>
					style="width: 90%; border: none;" readonly></td>
				<td><%=cour_name %></td>
				<td><%=professor %></td>
				<td><%=grade %></td>
				<td><%=cour_day %>-<%=cour_time1 %>(<%=cour_room1 %>), <%=cour_day2 %>-<%=cour_time2 %>(<%=cour_room2 %>)</td>
				<td><%=classify %></td>
				<td><%=current_stu_num %></td>
				<td><%=cour_stu_num %></td>
				<td><input type="submit" value="신청하기"
					onclick="apply_cour('<%=cour_no%>')"></td>
			</tr>
			<%         	 
         }
         else{ //수업 하루
        	 %>
			<tr>
				<td><%=semester %></td>
				<td><input type="text" name="cour_no" value=<%=cour_no %>
					style="width: 90%; border: none;" readonly></td>
				<td><%=cour_name %></td>
				<td><%=professor %></td>
				<td><%=grade %></td>
				<td><%=cour_day %>-<%=cour_time1 %>(<%=cour_room1 %>)</td>
				<td><%=classify %></td>
				<td><%=current_stu_num %></td>
				<td><%=cour_stu_num %></td>
				<td><input type="submit" value="신청하기"
					onclick="apply_cour('<%=cour_no%>')"></td>
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
		<input type=hidden name="cour_n" id="this_cour" value="">
	</form>
	<script>
function apply_cour(cour){
   document.getElementById("this_cour").value = cour;
}
</script>
<%
}
else{
	%>
	<script>
	alert('수강신청 기간이 아닙니다^^');
	location.href="stu_Listform.jsp";
	</script>
	<%
}
%>
	<br />
	<input type="button" value="수강한 과목"
		onclick="location.href='stu_course.jsp'">
	<input type="button" value="학생 홈"
		onclick="location.href='stu_List.jsp'">
</body>

</html>
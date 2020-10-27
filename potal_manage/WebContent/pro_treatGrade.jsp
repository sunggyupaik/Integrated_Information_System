<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
 String[] stunumArr=request.getParameterValues("stu_num");
 String[] gradeArr = request.getParameterValues("grade");
 String cour_name=request.getParameter("cour_name");
 String semester = request.getParameter("semester");
 String classify = request.getParameter("classify");
 String credit = request.getParameter("credit");
 //성적처리 기간인지 아닌지를 처리하기위한 날짜 변수들
 Date today = new Date();
 String start = "2018-12-06";
 String end = "2018-12-31";
 SimpleDateFormat fomatter = new SimpleDateFormat("yyyy-MM-dd");
 String to = fomatter.format(today);
 Date beginDate = fomatter.parse(start);//성적처리 시작 날짜
 Date endDate = fomatter.parse(end);//성적처리 끝 날짜
 Date todate = fomatter.parse(to);
 
 Connection conn = null;
 PreparedStatement pstmt = null;
 ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/potaldatabase";
		String dbId = "root";
		String dbPass = "apfhddlek65";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		if(todate.getTime()>=beginDate.getTime()&&todate.getTime()<=endDate.getTime()){
			
		for(int i=0;i<stunumArr.length;i++){
			//System.out.println(cour_name+" "+classify+" "+semester+" "+Float.valueOf(gradeArr[i])+" "+Float.valueOf(credit)+" "+stunumArr[i]);
			
			String sql ="insert into handled_grade(cour_stu, cour_name, classify, semester, grade, credit, stu_num) values(?, ?, ?, ?, ?, ?, ?) on duplicate key update grade=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,cour_name+stunumArr[i]);
			pstmt.setString(2,cour_name);
			pstmt.setString(3,classify);
			pstmt.setString(4,semester);
			pstmt.setFloat(5,Float.parseFloat(gradeArr[i]));
			pstmt.setFloat(6,Float.parseFloat(credit));
			pstmt.setString(7,stunumArr[i]);
			pstmt.setFloat(8,Float.parseFloat(gradeArr[i]));
			pstmt.executeUpdate();
		}}else{%>
			<script>alert("성적처리기간이 아닙니다.")
			location.href="pro_List.jsp";
			</script>
			<% 
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
	      if(conn != null) try {conn.close();} catch(SQLException ex) {}
	}
	
%>
<script>
	alert("성적처리가 완료되었습니다.");
	location.href="pro_List.jsp";
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성적처리</title>
</head>

<body>
</body>
</html>
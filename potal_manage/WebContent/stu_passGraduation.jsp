<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	String id="";
	float credit=0;
	float all_credit = 0;
	float gyoyang_credit=0;
	float major_credit=0;
	String depart="";
	String classify="";
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
	    
	    pstmt = conn.prepareStatement("select stu_depart from student where stu_num=?");
	    pstmt.setString(1,id);
	    rs=pstmt.executeQuery();
	    if(rs.next()){
	    	depart=rs.getString("stu_depart");
	    }
	    pstmt.close();
	    rs.close();
	    System.out.println(depart);
	    pstmt=conn.prepareStatement("select credit, classify from handled_grade where stu_num=?");
	    pstmt.setString(1,id);
	    rs=pstmt.executeQuery();
	    while(rs.next()){
	    	credit=rs.getFloat("credit");
	    	classify=rs.getString("classify");
	    	if(classify.equals("major")){
	    		major_credit+=credit;
	    	}else if(classify.equals("gyoyang")){
	    		gyoyang_credit+=credit;
	    	}
	    	all_credit+=credit;
	    }
	} catch (Exception ex) {
		ex.printStackTrace();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>졸업자가진단</title>
</head>
<style>
table {
	text-align: center;
	border-collapse: collapse;
}

table, td, th {
	padding: 10px;
	border: 1px solid white;
}

th{
	background-color:pink;
	color:white;
}
</style>
<body>
	<h1>졸업자가진단</h1>
	<div>
		<table>
			<thead>
				<tr>
					<th>소속학과</th>
					<th>구분</th>
					<th>교양영역</th>
					<th>전공영역</th>
					<th>총학점</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td rowspan="2"><%=depart %></td>
					<td>기준학점</td>
					<td><%=36%></td>
					<td><%=90 %></td>
					<td><%=130 %></td> 
				</tr>
				<tr>
					<td>총취득학점</td>
					<td><%=gyoyang_credit %></td>
					<td><%=major_credit %></td>
					<td><%=all_credit %></td> 
				</tr>
			</tbody>
		</table>
	</div><br/><br/>
	<div>
		<div style="display:inline;">
			교양영역 : <%if(gyoyang_credit>=36){%> <span style="color:blue;">합격</span><%}else{%>
			<span style="color:red;">불합격</span>
			<%}%> 
		</div>
		<div style="display:inline;">
			전공영역 : <%if(major_credit>=90){%> <span style="color:blue;">불합격</span><%}else{%>
			<span style="color:red;">불합격</span>
			<%}%> 
		</div>
		<div style="display:inline;">
			총학점 : <%if(major_credit>=130){%> <span style="color:blue;">불합격</span><%}else{%>
			<span style="color:red;">불합격</span>
			<%}%> 
		</div>
	</div>
</body>
</html>
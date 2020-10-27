<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); 

	String id="";

	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;

	try{
		Cookie[] cookies = request.getCookies();
    	  if(cookies != null){
    	     for (int i =0;i<cookies.length;++i){
    	        if(cookies[i].getName().equals("stu_num")){
    	           id = cookies[i].getValue();}
    	     }
    	  }	
		%>
<!DOCTYPE html>
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
th{
	background-color : pink;
	color : white;
	border:1px solid white;
	height:30px;
	font-weight:bolder;
}
td{
	border:1px solid pink;
	text-weight:bold;
	color:pink;
	width:100px;
	text-align:center;
	font-weight:bolder;
	height:30px;
}
table{
	border-collapse:collapse;
	border:1px solid white;
}
</style>
<meta charset="EUC-KR">
<title>강의시간표</title>
</head>
<body>
<h2><b><%=id %></b>님의 강의시간표</h2>
<table border=1>
<tr>
<th> </th> <th>월</th> <th>화</th> <th>수</th> <th>목</th> <th>금</th>
</tr>
<tr>
<td>1교시</td> <td id="mon1"> </td> <td id="tue1"> </td> <td id="wed1"> </td> <td id="thu1"> </td> <td id="fri1"> </td>
</tr>
<tr>
<td>2교시</td> <td id="mon2"> </td> <td id="tue2"> </td> <td id="wed2"> </td> <td id="thu2"> </td> <td id="fri2"> </td>
</tr>
<tr>
<td>3교시</td> <td id="mon3"> </td> <td id="tue3"> </td> <td id="wed3"> </td> <td id="thu3"> </td> <td id="fri3"> </td>
</tr>
<tr>
<td>4교시</td> <td id="mon4"> </td> <td id="tue4"> </td> <td id="wed4"> </td> <td id="thu4"> </td> <td id="fri4"> </td>
</tr>
<tr>
<td>5교시</td> <td id="mon5"> </td> <td id="tue5"> </td> <td id="wed5"> </td> <td id="thu5"> </td> <td id="fri5"> </td>
</tr>
<tr>
<td>6교시</td> <td id="mon6"> </td> <td id="tue6"> </td> <td id="wed6"> </td> <td id="thu6"> </td> <td id="fri6"> </td>
</tr>
<tr>
<td>7교시</td> <td id="mon7"> </td> <td id="tue7"> </td> <td id="wed7"> </td> <td id="thu7"> </td> <td id="fri7"> </td>
</tr>
<tr>
<td>8교시</td> <td id="mon8"> </td> <td id="tue8"> </td> <td id="wed8"> </td> <td id="thu8"> </td> <td id="fri8"> </td>
</tr>
<tr>
<td>9교시</td> <td id="mon9"> </td> <td id="tue9"> </td> <td id="wed9"> </td> <td id="thu9"> </td> <td id="fri9"> </td>
</tr>
<tr>
<td>10교시</td> <td id="mon10"> </td> <td id="tue10"> </td> <td id="wed10"> </td> <td id="thu10"> </td> <td id="fri10"> </td>
</tr>
</table>

<%
	String jdbcUrl = "jdbc:mysql://localhost:3306/potaldatabase";
	String dbId = "root";
	String dbPass = "apfhddlek65";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	String sql = "select * from manage_course where stu_num = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,id);
	rs = pstmt.executeQuery();
	while(rs.next()){
		String no = rs.getString("cour_no");
		String sql2 = "select cour_name, professor, cour_time1, cour_time2, cour_room1, cour_room2, cour_day, cour_day2 from lecture where cour_no = ?";
		pstmt2 = conn.prepareStatement(sql2);
		pstmt2.setString(1, no);
		rs2 = pstmt2.executeQuery();
		if(rs2.next()){
			String name = rs2.getString("cour_name");
			String pro = rs2.getString("professor");
			String time1 = rs2.getString("cour_time1");
			int idx = time1.indexOf("t");
			time1 = time1.substring(0,idx);
			String time2 = rs2.getString("cour_time2");
			if(!time2.equals("")){
				int idx2 = time2.indexOf("t");
				time2 = time2.substring(0,idx2);
			}
			String room1 = rs2.getString("cour_room1");
			String room2 = rs2.getString("cour_room2");
			String day1 = rs2.getString("cour_day");
			String day2 = rs2.getString("cour_day2");
			
			String table_id = day1 + time1;
			String table_id2 = day2 + time2;
			%>
			<script>
				function table_insert(id, name){
					document.getElementById(id).innerHTML = name;
				}
				table_insert('<%=table_id%>','<%=name%>');
				table_insert('<%=table_id2%>','<%=name%>')
				
			</script>
			<%
		}
	}
	
	}catch(Exception e){
		e.printStackTrace();
	}finally{
        if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
        if(conn != null) try {conn.close();} catch(SQLException ex) {}
	}
%>
</body>
</html>


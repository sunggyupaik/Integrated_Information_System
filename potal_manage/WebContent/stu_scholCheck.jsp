<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("euc-kr");%>
<%	
	
	String id ="";
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
	      }	%>
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
.button {
	font-weight:bold;
	width: 90px;
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
<meta charset="EUC-KR">
<title>���� Ȯ��</title>
</head>
<body>
<h2><b><%=id %></b>���� ���� ����</h2>
<table border="1" id="table">
<thead>
  <th>&nbsp;�⵵/�б�&nbsp;</th> <th>&nbsp;���и�&nbsp;</th> <th>&nbsp;�ݾ�&nbsp;</th>
</thead>
<tbody id = "schol_tbody"></tbody>
</table>

		
		<%
		String jdbcUrl = "jdbc:mysql://localhost:3306/potaldatabase";
		String dbId = "root";
		String dbPass = "apfhddlek65";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		String sql = "select * from scholarship where stu_num = ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		while(rs.next()){
			String semes = rs.getString("semester");//�б�
			String name = rs.getString("sch_name");//���и�
			String schol = rs.getString("schol");//���б�
			%>
			<script>
			function add_row(data1, data2, data3) {
			    var tbody = document.getElementById('schol_tbody');
			    var row = tbody.insertRow(tbody.rows.length );
			    var cell1 = row.insertCell(0);
			    var cell2 = row.insertCell(1);
			    var cell3 = row.insertCell(2);
			    cell1.innerHTML = data1;
			    cell2.innerHTML = data2;
			    cell3.innerHTML = data3;
			  }
			add_row('<%=semes%>', '<%=name%>', '<%=schol%>');
			</script>
			<% 
		}
	}catch(Exception ex){
		ex.printStackTrace();
	}finally {
		if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
		if(conn != null) try {conn.close();} catch(SQLException ex) {}
	}%>


</body>
</html>
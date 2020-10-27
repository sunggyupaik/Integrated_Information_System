<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>강의계획서 검색</title>
<style>
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
</head>
<body>
<table border="1" id="table">
<thead>
  <th>&nbsp;과목명&nbsp;</th> <th>&nbsp;교수명&nbsp;</th> <th>&nbsp;강의계획서&nbsp;</th>
</thead>
<tbody id = "plan_tbody"></tbody>
</table>
<% request.setCharacterEncoding("euc-kr");%>
<%	
	String name = request.getParameter("cour_name");
	String pro = request.getParameter("professor");
	String cour_name="";
	String pro_name="";
	String des = "";
	int check = 0;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/potaldatabase";
		String dbId = "root";
		String dbPass = "apfhddlek65";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		if(name.equals("")){
			String sql = "select cour_name, description from lecture where professor = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,pro);
			rs = pstmt.executeQuery();
			while(rs.next()){
				check = 1;
				cour_name = rs.getString("cour_name");
				des = rs.getString("description");
				%>
				<script>
				function add_row(data1, data2, data3) {
				    var tbody = document.getElementById('plan_tbody');
				    var row = tbody.insertRow(tbody.rows.length );
				    var cell1 = row.insertCell(0);
				    var cell2 = row.insertCell(1);
				    var cell3 = row.insertCell(2);
				    cell1.innerHTML = data1;
				    cell2.innerHTML = data2;
				    cell3.innerHTML = data3;
				  }
				add_row('<%=cour_name%>', '<%=pro%>', '<%=des%>');
				</script>
				<% 
			}
		}else if(pro.equals("")){
			String sql = "select professor, description from lecture where cour_name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,name);
			rs = pstmt.executeQuery();
			while(rs.next()){
				check = 1;
				pro_name = rs.getString("professor");
				des = rs.getString("description");
				%>
				<script>
				function add_row(data1, data2, data3) {
				    var tbody = document.getElementById('plan_tbody');
				    var row = tbody.insertRow(tbody.rows.length );
				    var cell1 = row.insertCell(0);
				    var cell2 = row.insertCell(1);
				    var cell3 = row.insertCell(2);
				    cell1.innerHTML = data1;
				    cell2.innerHTML = data2;
				    cell3.innerHTML = data3;
				  }
				add_row('<%=name%>', '<%=pro_name%>', '<%=des%>');
				</script>
				<% 
			}
		}else{
			String sql = "select description from lecture where cour_name = ? and professor = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,pro);
			rs = pstmt.executeQuery();
			while(rs.next()){
				check = 1;
				des = rs.getString("description");
				%>
				<script>
				function add_row(data1, data2, data3) {
				    var tbody = document.getElementById('plan_tbody');
				    var row = tbody.insertRow(tbody.rows.length );
				    var cell1 = row.insertCell(0);
				    var cell2 = row.insertCell(1);
				    var cell3 = row.insertCell(2);
				    cell1.innerHTML = data1;
				    cell2.innerHTML = data2;
				    cell3.innerHTML = data3;
				  }
				add_row('<%=name%>', '<%=pro%>', '<%=des%>');
				</script>
				<% 
			}
		}
		if(check == 0){
			%>
			<script>
			alert("검색결과가 없습니다.");
			history.go(-1);
			</script>
			
			
			<%
		}
	}catch(Exception ex){
		ex.printStackTrace();
		%>
		<%
	}finally {
		if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
		if(conn != null) try {conn.close();} catch(SQLException ex) {}
	}%>

<script>

</script>
</body>
</html>
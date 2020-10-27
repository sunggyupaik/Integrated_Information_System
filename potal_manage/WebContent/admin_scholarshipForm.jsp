<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>장학 내역</title>
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
</head>
<body>
<h2>장학 현황</h2><br/>

<table border="1" id="table">
<thead>
  <th>&nbsp;&nbsp;&nbsp;</th> <th>&nbsp;학번&nbsp;</th> <th>&nbsp;년도/학기&nbsp;</th> <th>&nbsp;장학명&nbsp;</th> <th>&nbsp;금액&nbsp;</th>
</thead>
<tbody id = "schol_tbody"></tbody>
</table><br/>
<form method="post" action="admin_scholarshipPro2.jsp">
<input type=hidden name = "del_num" id = "del_num" value="">
<input type=hidden name = "del_sem" id = "del_sem" value="">
<input type=hidden name = "del_sch" id = "del_sch" value="">
<br/>
<input type="submit" value="체크된 장학내역 삭제" class="button" style="width:150px;" onclick="delete_row()">

<input type="button" value="장학내역 추가" class="button" onclick="add_schol()" ><br/><br/>
</form>
<form method="post" action="admin_scholarshipPro.jsp">
<div id="divadd"></div>
</form>
<% request.setCharacterEncoding("euc-kr");
	String semes = "";
	String sname = "";
	String schol = "";
	String num = "";
	String vv = "";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/potaldatabase";
		String dbId = "root";
		String dbPass = "apfhddlek65";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

		String sql ="select * from scholarship";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			semes = rs.getString("semester");
			sname = rs.getString("sch_name");
			schol = rs.getString("schol");
			num = rs.getString("stu_num");
			%>
			<script>
			function add_row(data1, data2, data3, data4) {
			    var tbody = document.getElementById('schol_tbody');
			    var row = tbody.insertRow(tbody.rows.length );
			    var cell1 = row.insertCell(0);
			    var cell2 = row.insertCell(1);
			    var cell3 = row.insertCell(2);
			    var cell4 = row.insertCell(3);
			    var cell5 = row.insertCell(4);
			    cell1.innerHTML = "<input type= 'checkbox'>";
			    cell2.innerHTML = data1;
			    cell3.innerHTML = data2;
			    cell4.innerHTML = data3;
			    cell5.innerHTML = data4;
			    document.getElementById("divadd").innerHTML = "";
			    check=0;
			  }
			add_row('<%=num%>', '<%=semes%>', '<%=sname%>','<%=schol%>');
			</script>
			<% 
		}
	}catch(Exception ex){
			ex.printStackTrace();
	}finally {
		if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
		if(conn != null) try {conn.close();} catch(SQLException ex) {}
	}%>

<script>
var check = 0;
function add_schol(){
	if(check==0){
	document.getElementById("divadd").innerHTML+="<b>학번</b> : <input type='text' id='num' name='stu_num'><br/>";
	document.getElementById("divadd").innerHTML+="<b>년도/학기</b> : <input type='text' id='semes' name='semester' value='2018/2' style='border:none;' readonly><br/>";
	document.getElementById("divadd").innerHTML+="<b>장학명</b> : <input type='text' id='sname' name='sch_name'><br/>";
	document.getElementById("divadd").innerHTML+="<b>금액</b> : <input type='text' id='money' name='schol'><br/><br/>";
	var num = document.getElementById("num").value;
	var semes = document.getElementById("semes").value;
	var sname = document.getElementById("sname").value;
	var money = document.getElementById("money").value;
	document.getElementById("divadd").innerHTML+="<input type='submit' class = 'button' value='추가'>";
	check++;
	}else if(check==1){
		document.getElementById("divadd").innerHTML="";
		check=0;
	}
}
  
  function delete_row() {
	var a ="";
	var b ="";
	var c ="";
    var table = document.getElementById("table");
    var rowCnt = table.rows.length;
	for(var i = 0; i < rowCnt; i++){
		var row = table.rows[i];
		var chkBox = row.cells[0].childNodes[0];
		if(chkBox != null && chkBox.checked == true){
			table.deleteRow(i);
			rowCnt--;
			i--;
			a = row.cells[1].innerHTML;
			b = row.cells[2].innerHTML;
			c = row.cells[3].innerHTML;
		}
	}
	document.getElementById("del_num").value=a;
	document.getElementById("del_sem").value=b;
	document.getElementById("del_sch").value=c;
  }
</script>
</body>
</html>
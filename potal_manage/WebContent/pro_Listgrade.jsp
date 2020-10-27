<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ������</title>

<script>
	function display(s) {
		document.getElementById(s).style.display = "block";
	}
	function undisplay(s){
		document.getElementById(s).style.display = "none";
	}
</script>
</head>
<style>
h2{
color:#B794CA;
font-weight:bolder;
}
h2:before {
	content: "��";
	font-size: 1.2em;
	vertical-align: 110%;
}
h4{
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
#stu_list {
	display: none;
	border: 2px solid #B794CA;
}

#registerPlan {
	display: none;
	border: 2px solid #B794CA;
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
<h2>���� - ��������</h2><br/>
<br />
	<input type="button" value="���ǰ�ȹ�� ���" class="button" style="width:130px;" onclick="display('registerPlan')">	
	<input type="button" class="button" value="���� Ȩ" onclick="location.href='pro_List.jsp'">
	<div id="registerPlan">
		<h3>���� �������� ��������</h3>
		<form action="pro_registerPlan.jsp">
			<table>
				<thead>
					<tr>
						<th>�����ڵ�</th>
						<th>�����</th>
						<th>�̼�����</th>
						<th>�������</th>
						<th>���μ�</th>
						<th>���ǽð�(���ǽ�)</th>
						<th>����</th>
					</tr>
				</thead>
				<tbody>
			<%
				String id = "";
				String name = "";
				String cour_no = "";//�����ڵ�
				String cour_name = "";//�����
				String stu_num = "";//�й�
				String stu_name = "";
				String credit = "";//����
				String semester = "";//�б�
				String classify = "";//����/����
				String depart = "";//���μ�
				String time1 = "";//���ǽð�
				String time2 = "";
				String day1 = "";
				String day2 = "";
				String content = "";//���ǰ�ȹ����
				String room1 = "";//���ǽ�
				String room2 = "";
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
				ResultSet rs = null;
				try {
					String jdbcUrl = "jdbc:mysql://localhost:3306/potaldatabase";
					String dbId = "root";
					String dbPass = "apfhddlek65";
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
					String sql = "select pro_name, pro_depart from professor where pro_num=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						name = rs.getString("pro_name");
						depart = rs.getString("pro_depart");
					}

					sql = "select cour_no, cour_name, grade, classify, semester,cour_time1, cour_time2, cour_room1, cour_room2, cour_day, cour_day2 from lecture where professor=?";//�����̸����� lecture���� ����� �˻�
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, name);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						cour_no = rs.getString("cour_no");
						cour_name = rs.getString("cour_name");
						credit = rs.getString("grade");
						classify = rs.getString("classify");
						semester = rs.getString("semester");
						grade = rs.getFloat("grade");
						time1 = rs.getString("cour_time1");
						time2 = rs.getString("cour_time2");
						room1 = rs.getString("cour_room1");
						room2 = rs.getString("cour_room2");
						day1 = rs.getString("cour_day");
						day2 = rs.getString("cour_day2");%>
						<%
						if(room2!=null){ //���� ��Ʋ
		    	         	 %>
		    	          <tr>
		    	          <td><%=cour_no %></td><td><%=cour_name %></td><td><%=classify %></td><td><%=grade %></td>
		    	          <td><%=depart%></td><td><%=day1 %>-<%=time1 %>(<%=room1 %>), <%=day2 %>-<%=time2 %>(<%=room2 %>)</td>
		    	          </tr>
		    	          <%
		    	          }
		    	          else{ //���� �Ϸ�
		    	         	 %>
		    	          <tr>
		    	          <td><%=cour_no %></td><td><%=cour_name %></td><td><%=classify %></td><td><%=grade %></td>
		    	          <td><%=depart%></td><td><%=day1 %>-<%=time1 %>(<%=room1 %>)</td>
		    	          </tr>
		    	          <%
		    	          }
		    	          %>
					<% }
				} catch (Exception e) {
					e.printStackTrace();
				}
				%>
	
				</tbody>
			</table>
				<input type="hidden" name="name" value=<%=name %>>
				��ȹ���� ����� �����ȣ : <input type="text" name="cour_no"><br/>
				<textarea rows=6 cols=25 name="content"
				placeholder="���� ��ȹ �� ������ �����ּ���."></textarea>
				<input type="submit" value="�ۼ��Ϸ�">
				</form>
				<input type="button" value="�ݱ�" onclick="undisplay('registerPlan')">
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
<title>���� ���</title>
</head>
<body>
<%
//������� �Ⱓ���� �ƴ����� ó���ϱ����� ��¥ ������
Date today = new Date();
String start = "2018-12-06";
String end = "2018-12-31";
SimpleDateFormat fomatter = new SimpleDateFormat("yyyy-MM-dd");
String to = fomatter.format(today);
Date beginDate = fomatter.parse(start);//������ұⰣ ���� ��¥
Date endDate = fomatter.parse(end);//������ұⰣ �� ��¥
Date todate = fomatter.parse(to);
if(todate.getTime()>=beginDate.getTime()&&todate.getTime()<=endDate.getTime()){
%>
	<h2>���� ���</h2>
	<br />
	<form method="post" action="stu_cancelPro.jsp">
		<table border="1">
			<th>�⵵/�б�</th>
			<th>�����ȣ</th>
			<th>�����</th>
			<th>��� ����</th>
			<th>����</th>
			<th>���ǽð�(���ǽ�)</th>
			<th>����/����</th>
			<th>�������</th>
			<%
				request.setCharacterEncoding("euc-kr");
			%>
			<%
				String semester = null;
				String cour_no = null;
				String cour_name = null;
				String professor = null;
				float grade = 0;
				String classify = null;
				int current_stu_num = 0;
				int cour_stu_num = 0;
				int[] array;
				int count = 0;
				String stu_num = "";

				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				ResultSet rs2 = null;

				try {
					Cookie[] cookies = request.getCookies();
					if (cookies != null) {
						for (int i = 0; i < cookies.length; ++i) {
							if (cookies[i].getName().equals("stu_num")) {
								stu_num = cookies[i].getValue();
							}
						}
					}
					String jdbcUrl = "jdbc:mysql://localhost:3306/potaldatabase";
					String dbId = "root";
					String dbPass = "apfhddlek65";
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

					String sql = "select cour_no from manage_course where stu_num=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, stu_num);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						cour_no = rs.getString("cour_no");
						sql = "select * from LECTURE where cour_no=?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, cour_no);
						rs2 = pstmt.executeQuery();
						while (rs2.next()) {
							semester = rs2.getString("semester");
							cour_no = rs2.getString("cour_no");
							cour_name = rs2.getString("cour_name");
							professor = rs2.getString("professor");
							grade = rs2.getFloat("grade");
							String cour_time1 = rs2.getString("cour_time1");
							String cour_time2 = rs2.getString("cour_time2");
							classify = rs2.getString("classify");
							String cour_room1 = rs2.getString("cour_room1");
							String cour_room2 = rs2.getString("cour_room2");
							String cour_day = rs2.getString("cour_day");
							String cour_day2 = rs2.getString("cour_day2");

							if (cour_room2 != null) { //���� ��Ʋ
			%>
			<tr>
				<td><%=semester%></td>
				<td><input type="text" name="cour_no" value=<%=cour_no%>
					style="width: 90%; border: none;" readonly></td>
				<td><%=cour_name%></td>
				<td><%=professor%></td>
				<td><%=grade%></td>
				<td><%=cour_day%>-<%=cour_time1%>(<%=cour_room1%>), <%=cour_day2%>-<%=cour_time2%>(<%=cour_room2%>)</td>
				<td><%=classify%></td>
				<td><input type="submit" value="����ϱ�"
					onclick="apply_cour('<%=cour_no%>')"></td>
			</tr>
			<%
				} else { //���� �Ϸ�
			%>
			<tr>
				<td><%=semester%></td>
				<td><input type="text" name="cour_no" value=<%=cour_no%>
					style="width: 90%; border: none;" readonly></td>
				<td><%=cour_name%></td>
				<td><%=professor%></td>
				<td><%=grade%></td>
				<td><%=cour_day%>-<%=cour_time1%>(<%=cour_room1%>)</td>
				<td><%=classify%></td>
				<td><input type="submit" value="����ϱ�"
					onclick="apply_cour('<%=cour_no%>')"></td>
			</tr>
			<%
				}

						}
					}
				} catch (Exception ex) {
					ex.printStackTrace();
				} finally {
					if (pstmt != null)
						try {
							pstmt.close();
						} catch (SQLException ex) {
						}
					if (conn != null)
						try {
							conn.close();
						} catch (SQLException ex) {
						}
				}
			%>
		</table>
		<input type=hidden name="cour_n" id="this_cour" value="">
	</form>
	<script>
		function apply_cour(cour) {
			document.getElementById("this_cour").value = cour;
		}
	</script>
	<%
}
else{
	%>
	<script>
	alert('������� �Ⱓ�� �ƴմϴ�^^');
	location.href="stu_Listform.jsp";
	</script>
	<%
}
	%>
	<br />
	<input type="button" value="�л� Ȩ"
		onclick="location.href='stu_List.jsp'">
</body>

</html>
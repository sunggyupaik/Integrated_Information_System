<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성적조회</title>
</head>
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
<body>
		<%
			String id = "";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			float all_grade = 0;
			float all_credit = 0;
			try {
				Cookie[] cookies = request.getCookies();
				if (cookies != null) {
					for (int i = 0; i < cookies.length; ++i) {
						if (cookies[i].getName().equals("stu_num")) {
							id = cookies[i].getValue();
						}
					}
				}

				String jdbcUrl = "jdbc:mysql://localhost:3306/potaldatabase";
				String dbId = "root";
				String dbPass = "apfhddlek65";
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

				Date today = new Date();
				String start = "2018-12-07";
				String end = "2018-12-31";
				SimpleDateFormat fomatter = new SimpleDateFormat("yyyy-MM-dd");
				String to = fomatter.format(today);
				Date beginDate = fomatter.parse(start);//성적처리 시작 날짜
				Date endDate = fomatter.parse(end);//성적처리 끝 날짜
				Date todate = fomatter.parse(to);
				String cour_n = "";
				String cl = "";
				float t_g;
				float t_c;
				
		%>
		<table>
			<thead>
				<tr>
					<th>과목명</th>
					<th>이수구분</th>
					<th>학점</th>
					<th>평점</th>
				</tr>
			</thead>
			<tbody id="tbody">

				<%
					if (todate.getTime() >= beginDate.getTime() && todate.getTime() <= endDate.getTime()) {
							pstmt = conn.prepareStatement(
									"select cour_name, classify, grade, credit from handled_grade where stu_num=? and semester=?");
							pstmt.setString(1, id);
							pstmt.setString(2, "2018/2");//당학기 설정
							rs = pstmt.executeQuery();
							while (rs.next()) {
								cour_n = rs.getString("cour_name");
								cl = rs.getString("classify");
								t_g = rs.getFloat("grade");
								t_c = rs.getFloat("credit");
								all_grade = all_grade + (t_g * t_c);
								all_credit += t_c;
				%>
				<tr>
					<td><%=cour_n%></td>
					<td><%=cl%></td>
					<td><%=t_c%></td>
					<td><%=t_g%></td>
				</tr>
				<%
					}
						} else {
				%>
				<script>
					alert("성적처리기간이 아닙니다.");
					location.href = "stu_checkGrade.jsp";
				</script>
				<%
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
			</tbody>
		</table>
	<h2>2018년 2학기 성적 평균 <%=all_grade/all_credit %></h2>
	<input type="button" class="button" value="뒤로가기"
		onclick="location.href='stu_checkGrade.jsp'">
</body>
</html>
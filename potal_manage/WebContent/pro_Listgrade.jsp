<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>교수 페이지</title>

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
	content: "●";
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
<h2>교수 - 수강관리</h2><br/>
<br />
	<input type="button" value="강의계획서 등록" class="button" style="width:130px;" onclick="display('registerPlan')">	
	<input type="button" class="button" value="교수 홈" onclick="location.href='pro_List.jsp'">
	<div id="registerPlan">
		<h3>현재 강의중인 과목정보</h3>
		<form action="pro_registerPlan.jsp">
			<table>
				<thead>
					<tr>
						<th>과목코드</th>
						<th>과목명</th>
						<th>이수구분</th>
						<th>담당학점</th>
						<th>담당부서</th>
						<th>강의시간(강의실)</th>
						<th>선택</th>
					</tr>
				</thead>
				<tbody>
			<%
				String id = "";
				String name = "";
				String cour_no = "";//과목코드
				String cour_name = "";//과목명
				String stu_num = "";//학번
				String stu_name = "";
				String credit = "";//학점
				String semester = "";//학기
				String classify = "";//전공/교양
				String depart = "";//담당부서
				String time1 = "";//강의시간
				String time2 = "";
				String day1 = "";
				String day2 = "";
				String content = "";//강의계획설명
				String room1 = "";//강의실
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

					sql = "select cour_no, cour_name, grade, classify, semester,cour_time1, cour_time2, cour_room1, cour_room2, cour_day, cour_day2 from lecture where professor=?";//교수이름으로 lecture에서 과목명 검색
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
						if(room2!=null){ //수업 이틀
		    	         	 %>
		    	          <tr>
		    	          <td><%=cour_no %></td><td><%=cour_name %></td><td><%=classify %></td><td><%=grade %></td>
		    	          <td><%=depart%></td><td><%=day1 %>-<%=time1 %>(<%=room1 %>), <%=day2 %>-<%=time2 %>(<%=room2 %>)</td>
		    	          </tr>
		    	          <%
		    	          }
		    	          else{ //수업 하루
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
				계획서를 등록할 과목번호 : <input type="text" name="cour_no"><br/>
				<textarea rows=6 cols=25 name="content"
				placeholder="강의 계획 및 설명을 적어주세요."></textarea>
				<input type="submit" value="작성완료">
				</form>
				<input type="button" value="닫기" onclick="undisplay('registerPlan')">
	</div>
</body>
</html>
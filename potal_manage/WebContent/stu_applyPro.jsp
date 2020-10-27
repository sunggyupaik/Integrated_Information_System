<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("euc-kr");
%>
<%
String cour_no = request.getParameter("cour_n");
	System.out.print(cour_no);
	int current_stu_num = 0;
	int cour_stu_num = 0;
	String stu_num = "";
	Connection conn = null, conn1 = null, conn2 = null;
	PreparedStatement pstmt = null, pstmt1 = null, pstmt2 = null, pstmt3 = null, pstmt4 = null;
	ResultSet rs = null, rs1 = null, rs2 = null, rs3 = null, rs4 = null, rs5 = null, rs6 = null;
	try {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; ++i) {
				if (cookies[i].getName().equals("stu_num")) {
					stu_num = cookies[i].getValue();
				}
			}
		}
		System.out.print(stu_num);
		String jdbcUrl = "jdbc:mysql://localhost:3306/potaldatabase";
		String dbId = "root";
		String dbPass = "apfhddlek65";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

		String sql = "select * from LECTURE where cour_no=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cour_no);
		rs = pstmt.executeQuery();
		rs.next();
		String cour_time1 = rs.getString("cour_time1");
		String cour_time2 = rs.getString("cour_time2");
		current_stu_num = rs.getInt("current_stu_num");
		cour_stu_num = rs.getInt("cour_stu_num");
		String cour_day = rs.getString("cour_day");
		String cour_day2 = rs.getString("cour_day2");
		String cour_room2 = rs.getString("cour_room2");
		System.out.print(cour_day);
		int num = current_stu_num + 1;

		sql = "select * from manage_course where cour_no=? and stu_num=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cour_no);
		pstmt.setString(2, stu_num);
		rs = pstmt.executeQuery();
		sql = "update LECTURE set current_stu_num=? where cour_no=?";
		pstmt = conn.prepareStatement(sql);
		if (rs.next()) {
%>
<script>
	alert("중복된 수강과목입니다.");
	location.href = "stu_applyForm.jsp";
</script>
<%
	} else {

			sql = "select cour_no from manage_course";
			pstmt1 = conn.prepareStatement(sql);
			rs1 = pstmt1.executeQuery();
			int a=0;
			while (rs1.next()) {
				String cour_n = rs1.getString("cour_no");
				sql = "select cour_day, cour_time1, cour_day2, cour_time2 from lecture where cour_no=?";
				pstmt2 = conn.prepareStatement(sql);
				pstmt2.setString(1, cour_n);
				rs2 = pstmt2.executeQuery();
				rs2.next();
				String c_day = rs2.getString("cour_day");
				String c_time1 = rs2.getString("cour_time1");
				String c_day2 = rs2.getString("cour_day2");
				String c_time2 = rs2.getString("cour_time2");
				if (cour_day.equals(c_day) && cour_time1.equals(c_time1)) {
					a=1;
%>
<script>
	alert("수강 시간이 중복됩니다.");
	location.href = "stu_applyForm.jsp";
</script>
<%
	break;
				} else if (cour_day.equals(c_day2) && cour_time1.equals(c_time2)) {
					a=1;
%>
<script>
	alert("수강 시간이 중복됩니다.");
	location.href = "stu_applyForm.jsp";
</script>
<%
	break;
				} else if (cour_day2.equals(c_day) && cour_time2.equals(c_time1)) {
					a=1;
%>
<script>
	alert("수강 시간이 중복됩니다.");
	location.href = "stu_applyForm.jsp";
</script>
<%
	break;
				} else if (cour_day2.equals(c_day2) && cour_time2.equals(c_time2)) {
					a=1;
%>
<script>
	alert("수강 시간이 중복됩니다.");
	location.href = "stu_applyForm.jsp";
</script>
<%
	break;
				}
			}
			System.out.print(cour_stu_num+" "+current_stu_num);
			if(a==0){
			if (cour_stu_num > current_stu_num) {
				pstmt.setString(1, String.valueOf(num));
				pstmt.setString(2, cour_no);
				pstmt.executeUpdate();
				sql = "insert into manage_course(stu_num,cour_no) values(?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, stu_num);
				pstmt.setString(2, cour_no);
				pstmt.executeUpdate();
%>
<script>
	alert("수강이 신청되었습니다.");
	location.href = "stu_applyForm.jsp";
</script>
<%
	} else {
%>
<script>
	alert("수강 인원이 꽉 찼습니다.");
	location.href = "stu_applyForm.jsp";
</script>
<%
	}
			}
		}

	} catch (Exception e) {
		e.printStackTrace();
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

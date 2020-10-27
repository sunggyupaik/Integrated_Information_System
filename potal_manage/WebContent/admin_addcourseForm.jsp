<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ �߰�</title>
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
</style>
</head>
<body> 
<h2>�߰��� �������� ������ �Է��ϼ���.</h2><br/>
<form method="post" action="admin_addcoursePro.jsp">
	<b>�⵵/�б�</b> : <input type="text" name="semester" value="2018/2" style="width: 90%; border: none;" readonly><br/>
	<b>���� ��ȣ</b> : <input type="text" name="cour_no" size="20"><br/>
	<b>���� �̸�</b> : <input type="text" name="cour_name" size="20"><br/>
 	<b>��� ����</b> : <input type="text" name="professor" size="20"><br/>
 	<b>����</b> : <input type="number" name="grade" size="20"><br/>
 	<b>���� �ð� </b><br/>
 	<b>�� �ֿ� ���� Ƚ��</b> : <input type="radio" name="lec_radio" value="1" onclick="lecture_num(1)">1��
 	<input type="radio" name="lec_radio" value="2" onclick="lecture_num(2)">2�� <br/>
 	<div id="lec_div"></div>
 	<b>���� ���� �ο�</b> : <input type="number" name="cour_stu_num" size="20"><br/>
	<b>�̼� ����</b> : <input type="radio" name="classify_radio" value="major" onclick="classify_sel('major')">����
			<input type="radio" name="classify_radio" value="gyoyang" onclick="classify_sel('gyoyang')">����<br/>
			<input type=hidden id="classify" name="classify" value="">
	
	<input type=hidden name ="lec_day" id="lec_day" value="">
	<input type=hidden name ="lec_time" id="lec_time" value="">
	<input type=hidden name ="lec_day2" id="lec_day2" value="">
	<input type=hidden name ="lec_time2" id="lec_time2" value="">

    
 
 <script>
 var check = 0;
 function classify_sel(c){
	 document.getElementById("classify").value=c;
 }
 
 
 function lecture_num(n){
	 if(n==1){
		 document.getElementById("lec_div").innerHTML="";
		 document.getElementById("lec_div").innerHTML += "<div id='one'></div>";
		 document.getElementById("one").innerHTML += "���� : <select id = 'day1'> <option>mon</option> <option>tue</option><option>wed</option><option>thu</option><option>fri</option></select>"
		 document.getElementById("one").innerHTML += "�ð� : <select id = 'time1'> <option>1time</option> <option>2time</option><option>3time</option><option>4time</option><option>5time</option><option>6time</option><option>7time</option><option>8time</option><option>9time</option><option>10time</option></select>"
		 document.getElementById("one").innerHTML += "���ǽ� : <input type='text' name = 'lec_room'>"
		 check = 1; 
		 
	 
	 }else if(n==2){
		 check = 2;
		 document.getElementById("lec_div").innerHTML="";
		 document.getElementById("lec_div").innerHTML += "<div id='one'></div>";
		 document.getElementById("one").innerHTML += "<select id = 'day2'> <option>mon</option> <option>tue</option><option>wed</option><option>thu</option><option>fri</option></select>"
		 document.getElementById("one").innerHTML += "<select id = 'time2'> <option>1time</option> <option>2time</option><option>3time</option><option>4time</option><option>5time</option><option>6time</option><option>7time</option><option>8time</option><option>9time</option><option>10time</option></select>"
		 document.getElementById("one").innerHTML += "���ǽ� : <input type='text' name = 'lec_room'>"

		 document.getElementById("lec_div").innerHTML += "<div id='two'></div>";
		 document.getElementById("two").innerHTML += "<select id = 'day3'> <option>mon</option> <option>tue</option><option>wed</option><option>thu</option><option>fri</option></select>"
		 document.getElementById("two").innerHTML += "<select id = 'time3'> <option>1time</option> <option>2time</option><option>3time</option><option>4time</option><option>5time</option><option>6time</option><option>7time</option><option>8time</option><option>9time</option><option>10time</option></select>"
		 document.getElementById("two").innerHTML += "���ǽ� : <input type='text' name = 'lec_room2'>"
	     
	 }
 }
 function setvalue(){
	 if(check==1){
		 var sday = document.getElementById("day1");
		  var tday = sday.options[sday.selectedIndex].text;
		  document.getElementById("lec_day").value = tday;
		  var stime = document.getElementById("time1");
		  var ttime = stime.options[stime.selectedIndex].text;
		  document.getElementById("lec_time").value = ttime;
	 }else if(check==2){
		 var sday = document.getElementById("day2");
		  var tday = sday.options[sday.selectedIndex].text;
		  document.getElementById("lec_day").value = tday;
		  var stime = document.getElementById("time2");
		  var ttime = stime.options[stime.selectedIndex].text;
		  document.getElementById("lec_time").value = ttime;
		  
		  var sday = document.getElementById("day3");
		  var tday = sday.options[sday.selectedIndex].text;
		  document.getElementById("lec_day2").value = tday;
		  var stime = document.getElementById("time3");
		  var ttime = stime.options[stime.selectedIndex].text;
		  document.getElementById("lec_time2").value = ttime;
	 }
 }
 

 </script><br/>
 <input type="submit" class="button" value="������ ���" onclick="setvalue()"> 
    <input type="reset" class="button" value="�ٽ��Է�"><br/>
 </form>
</body>
</html>
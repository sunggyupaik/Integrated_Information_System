<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>교과목 추가</title>
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
<h2>추가할 교과목의 정보를 입력하세요.</h2><br/>
<form method="post" action="admin_addcoursePro.jsp">
	<b>년도/학기</b> : <input type="text" name="semester" value="2018/2" style="width: 90%; border: none;" readonly><br/>
	<b>과목 번호</b> : <input type="text" name="cour_no" size="20"><br/>
	<b>과목 이름</b> : <input type="text" name="cour_name" size="20"><br/>
 	<b>담당 교수</b> : <input type="text" name="professor" size="20"><br/>
 	<b>학점</b> : <input type="number" name="grade" size="20"><br/>
 	<b>강의 시간 </b><br/>
 	<b>한 주에 수강 횟수</b> : <input type="radio" name="lec_radio" value="1" onclick="lecture_num(1)">1번
 	<input type="radio" name="lec_radio" value="2" onclick="lecture_num(2)">2번 <br/>
 	<div id="lec_div"></div>
 	<b>제한 수강 인원</b> : <input type="number" name="cour_stu_num" size="20"><br/>
	<b>이수 구분</b> : <input type="radio" name="classify_radio" value="major" onclick="classify_sel('major')">전공
			<input type="radio" name="classify_radio" value="gyoyang" onclick="classify_sel('gyoyang')">교양<br/>
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
		 document.getElementById("one").innerHTML += "요일 : <select id = 'day1'> <option>mon</option> <option>tue</option><option>wed</option><option>thu</option><option>fri</option></select>"
		 document.getElementById("one").innerHTML += "시간 : <select id = 'time1'> <option>1time</option> <option>2time</option><option>3time</option><option>4time</option><option>5time</option><option>6time</option><option>7time</option><option>8time</option><option>9time</option><option>10time</option></select>"
		 document.getElementById("one").innerHTML += "강의실 : <input type='text' name = 'lec_room'>"
		 check = 1; 
		 
	 
	 }else if(n==2){
		 check = 2;
		 document.getElementById("lec_div").innerHTML="";
		 document.getElementById("lec_div").innerHTML += "<div id='one'></div>";
		 document.getElementById("one").innerHTML += "<select id = 'day2'> <option>mon</option> <option>tue</option><option>wed</option><option>thu</option><option>fri</option></select>"
		 document.getElementById("one").innerHTML += "<select id = 'time2'> <option>1time</option> <option>2time</option><option>3time</option><option>4time</option><option>5time</option><option>6time</option><option>7time</option><option>8time</option><option>9time</option><option>10time</option></select>"
		 document.getElementById("one").innerHTML += "강의실 : <input type='text' name = 'lec_room'>"

		 document.getElementById("lec_div").innerHTML += "<div id='two'></div>";
		 document.getElementById("two").innerHTML += "<select id = 'day3'> <option>mon</option> <option>tue</option><option>wed</option><option>thu</option><option>fri</option></select>"
		 document.getElementById("two").innerHTML += "<select id = 'time3'> <option>1time</option> <option>2time</option><option>3time</option><option>4time</option><option>5time</option><option>6time</option><option>7time</option><option>8time</option><option>9time</option><option>10time</option></select>"
		 document.getElementById("two").innerHTML += "강의실 : <input type='text' name = 'lec_room2'>"
	     
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
 <input type="submit" class="button" value="교과목 등록" onclick="setvalue()"> 
    <input type="reset" class="button" value="다시입력"><br/>
 </form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
<title>학번/교수번호 부여</title>
</head>
<body>
<h2>학번/교수번호 부여</h2><br/>
<form method="post" action="admin_addPro.jsp">
<b>이름</b> : <input type="text" name="all_name" size="20" maxlength="30"><br/>
<b>주민번호</b> : <input type="password" name="all_resident_num" size="20" maxlength="30" placeholder="숫자만 입력하세요."><br/>
<b>소속</b> : <input type="text" name="all_depart" size="20" maxlength="30"><br/>
<b>학번/교수번호</b> : <input type="number" name="all_num" size="20" maxlength="30"><br/>
<b>직급</b> : <input type="radio" name="all_position" value="stu" onclick="position('stu')"> 학생
   <input type="radio" name="all_position" value="pro" onclick="position('pro')"> 교수
<div id="div">

</div>
<input type="hidden" class="button" id="grade" name="gradenum" value="">
<input type="submit" class="button" value="입력완료" onclick="grade_check()">
</form>
   <script>
   var check=0;
   function position(id){
      var div = document.getElementById("div");
      if(id=="stu" && check=="0"){
         div.innerHTML+="학년 : <input type='radio' name='all_grade' value='1'> 1학년";
         div.innerHTML+="<input type='radio' name='all_grade' value='2'> 2학년";
         div.innerHTML+="<input type='radio' name='all_grade' value='3'> 3학년";
         div.innerHTML+="<input type='radio' name='all_grade' value='4'> 4학년";
         check=1;
      }else if (id=="pro"){
         while(document.getElementById("div").firstChild) {
            div.removeChild(div.firstChild);
         }
         check=0;
      }
      
   }
   
    function grade_check(){
          var grade_radio = document.getElementsByName('all_grade');
          for(var i =0; i<grade_radio.length;i++){
            if(grade_radio[i].checked==true){
               document.getElementById("grade").value = grade_radio[i].value;
               check++;
              }
           }
     }
   </script>
</body>
</html>
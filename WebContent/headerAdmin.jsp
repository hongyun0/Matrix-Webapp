<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headSetting.jsp" %>

</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
#sideMenu {
  width: 30px;
  height: 30px;
  position: absolute;
  left: 0px;
  top: 0px;
  z-index: 1;
  background-image: url('images/menu.png');
  background-size: 50%;
  background-repeat: no-repeat;
  background-position: center;
 };
.tabs {
  padding: 50px;
};

</style>
<body>

	
<div class="w3-top">
    <img class="inline" src="images/menu.png" width="30pt" />
    <p class="inline" align="center">앱이름</p>

	<div class="tabs">
	    <div class="w3-col s3">
	      <a id="dailyTaskTab" class="w3-button w3-block" style="background-color: #e6f2ff">일일업무</a>
	    </div>
	    <div class="w3-col s3">
	      <a id="manualTab" class="w3-button w3-block" style="background-color: #e6f2ff">매뉴얼</a>
	    </div>
	    <div class="w3-col s3">
	      <a id="staffManagementTab" class="w3-button w3-block" style="background-color: #e6f2ff">직원관리</a>
	    </div>
	</div> 
</div> 
	<div class="w3-padding-64" id="result"><%@include file="dailyTaskHeaderAdmin.jsp"%></div>


<script>
$(".inline").css({
	"display":"inline"
});
$("#dailyTaskTab").click(
		function(){
			 $.ajax({
			        url : "dailyTaskHeaderAdmin.jsp", 
			        success : function(result){
			           $("#result").html(result);
			        }
			    });
		});
$("#manualTab").click(
		function(){
			 $.ajax({
			        url : "manual.jsp", 
			        success : function(result){
			           $("#result").html(result);
			        }
			    });
		});
$("#staffManagementTab").click(
		function(){
			 $.ajax({
			        url : "staffManagement.jsp", 
			        success : function(result){
			           $("#result").html(result);
			        }
			    });
		});

</script>
</body>
</html>
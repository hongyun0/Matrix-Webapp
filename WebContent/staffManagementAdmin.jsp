<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@include file = "loginCheckAdmin.jsp" %>
<%@include file = "tabMenuAdmin.jsp" %>
<style type="text/css">
.accordion {
	background: linear-gradient(#d4e5f7, #d4e5f7, #d4e5f7, #d4e5f7, rgba(212, 229, 247, 0.4));
    color: #003366;
    cursor: pointer;
    padding: 8px 8px 8px 15px;
    width: 95%;
    text-align: left;
    font-weight: bold;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
    margin: auto;
    border-radius: 5px 5px 5px 5px;
    border: 1px solid white;
    letter-spacing: 1px;
}
.active {
    background: linear-gradient(#206591, #206591, #206591, #206591, rgba(32, 101, 145, 0.2));
    color: #FFFFFF;
}

.accordion:after {
	font-family: FontAwesome;
    content: '\f0da';
    font-size: 20px;
    color: #003366;
    float: right;
    margin-top: -3px;
    margin-right: 10px;
    vertical-align: middle;
}

.active:after {
    font-family: FontAwesome;
    content: '\f0d7';
    color: #FFFFFF;
}

.panel, .subPanel {
	width:90%;
	margin:auto;
    padding: 0;
  	background: linear-gradient(#FFFFFF, #FFFFFF, #FFFFFF, #FFFFFF, rgba(192, 222, 241, 0.3));
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
}
.inline {
	display:inline;
}

/* modal */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
.modal-content {
	outline: 0;
	background-color: white;
	height: 40%;
	width: 300px;
	border-radius: 10px;
	margin-left: 30px;
	margin-top: 70px;
	text-align: center;
}
.profilePhoto {
	border-radius: 50%;
	height: 40px;
	width: 40px;
	float: left;
}
.resultStaffTable {
	width: 100%;
	font-size: 10pt;
	padding-top: 10px;
	padding-bottom: 10px;
}
.resultStaffTable tr td {
	padding-right: 5px;
}
.resultStaffTable .yesButton{
	background-color: white;
	border: rgb(50, 132, 226) 1px solid;
	border-radius: 10px;
	color: black;
	padding: 3px;
	width: 36px;
}
.resultStaffTable .yesButton:hover{
	background-color: rgb(50, 132, 226);
}
.resultStaffTable .noButton{
	background-color: white;
	border: rgb(255, 128, 128) 1px solid;
	border-radius: 10px;
	color: black;
	padding: 3px;
	width: 36px;
}
.setWorkPartHeader{
	padding-top: 10px;
   	margin-left: auto;
   	margin-right: auto;
	text-align: center;
	width: 50%;
	border-bottom: #d4e5f7 solid;
}
.setWorkPartHeader h4{
	margin-bottom: 5px;
	color: rgb(0, 51, 102);
	font-weight: bolder;
	letter-spacing: 2px;
}
.workParts {
	padding: 8px;
	margin: 10px 10px 17px 10px;
	background: #ededed;
	border: none;
	border-radius: 10px;
	box-shadow: 2px 2px 5px lightgray;
}
.selected {
	background-color: rgb(0, 51, 102);
	color: white;
}
.staffManagementHeader {
	margin: auto;
	text-align: center;
	width: 50%;
	border-bottom: #d4e5f7 solid;
}
.staffManagementHeader h4{
	margin-bottom: 5px;
	color: rgb(0, 51, 102);
	font-weight: bolder;
	letter-spacing: 1px;
}
.panel {
	padding-left: 7px;
}
.staffInfoToSetWorkPart {
	margin-left:10px;
	margin-right:10px;
	width:280px;
}
.staffInfoToSetWorkPart span{
	color: rgb(0, 51, 102);
	font-weight: bold;	
}
</style>
</head>
<body>
<div class="container">
<div class="staffManagementHeader">
	<h4>직원 관리</h4>
</div>
<br>
<div id="preStaffs" class="accordion" onclick="activateAcc(this)">승인 요청 내역</div>
<div class="panel"></div>

<div id="workingStaffs" class="accordion" onclick="activateAcc(this)">재직 중인 직원들</div>
<div class="panel"></div>

<div id="leftStaffs" class="accordion" onclick="activateAcc(this)">퇴사한 직원들</div>
<div class="panel"></div>

<!-- 파트 수정 Modal content -->
<div class="modal">	<!-- 얘 위치를 정확히 모르겠음 -->
<div class="modal-content">
</div>
</div>

</div>
<script>
$(document).ready(function(){
	$("#preStaffs").click();
});

$("#staffManagementTab").addClass("tapped");

/**승인 요청 내역 관련 event*/
var acceptStaff = function(input){
	var acceptedStaff = $(input).parent().siblings(".preStaffName").html();
	if(confirm(acceptedStaff+' 님을 직원으로 승인하시겠습니까?')) {
		var staffIdToSetJoinDate = $(input).parents("tr").attr("id");
		$.ajax({
			url : "controller?cmd=setJoinDateAction",
			data : {
				staffId : staffIdToSetJoinDate
			},
			success : function(result){
				alert("승인되었습니다.");
				document.querySelector("#staffManagementTab").click();	//jQuery로는 안됨
			}
		});
	}
};
var rejectStaff = function(input){
	var rejectedStaff = $(input).parent().siblings(".preStaffName").html();
	if(confirm(rejectedStaff+' 님의 직원 승인을 거부하시겠습니까?')) {
		var staffIdToRemoveStaff = $(input).parents("tr").attr("id");
		$.ajax({
			url : "controller?cmd=removeStaffAction",
			data : {
				staffId : staffIdToRemoveStaff
			},
			success : function(result){
				alert("거부되었습니다.");
				document.querySelector("#staffManagementTab").click();	//jQuery로는 안됨
			}
		});
	}
};

/**재직 중인 직원들 관련 event*/
/*파트 변경*/
var modal = document.querySelector(".modal");
//console.log($(".modal"));	//jQuery로는 안됨
var getWorkPart = function(input){
	var staffIdToSetWorkPart = $(input).parents("tr").attr("id");
	var staffNameToSetWorkPart = $(input).parent().siblings().next("td.workingStaffName").html();
	var workPartToSet = $(input).val();
	 $.ajax({
		 url : "controller?cmd=getWorkPartsAction",
		 data : {
			 staffId : staffIdToSetWorkPart,
			 staffName : staffNameToSetWorkPart,
			 oldWorkPart : workPartToSet
		 },
		 success : function(result){
			$(".modal-content").html(result);
			modal.style.display = "block";
		 }
	 })
};

var setWorkPart = function(input){
	if($(input).siblings().hasClass("selected")){
		$(input).siblings().removeClass("selected");	
	}
	$(input).addClass("selected");
	$(".modal-content").fadeOut('slow');
	$(".modal").fadeOut('slow');
	var workPart = $(input).html();
	var staffId = $(".staffInfoToSetWorkPart").attr("id");
	$.ajax({
		url : "controller?cmd=setWorkPartAction",
		data : {
			staffId : staffId,
			workPart : workPart
		},
		success : function(result){
			alert("수정되었습니다.");
			document.querySelector("#staffManagementTab").click();
		}
	});
}

window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
var closeModal = function(){
	modal.style.display="none";	
};

/*퇴사*/
var setLeaveDate= function(input){
	var staffIdToSetLeaveDate = $(input).parents("tr").attr("id");
	if(confirm($(input).parent().prevAll(".workingStaffName").html()+' 님을 퇴사시키겠습니까?')){
		$.ajax({
			url : "controller?cmd=setLeaveDateAction",
			data : {
				staffId : staffIdToSetLeaveDate
			},
			success : function(result) {
				alert("퇴사되었습니다.");
				document.querySelector("#staffManagementTab").click();
			}
		});
	}
};

/**직원 상세 페이지 관련 event*/
var getStaffDetail = function(input){
	var staffIdToGetStaffDetail = $(input).parent("tr").attr("id");
	location.href = "controller?cmd=staffDetailAdminUI&staffId="+staffIdToGetStaffDetail;
}

/**세부 페이지 이동 event*/
var activateAcc = function(input){
    input.classList.toggle("active");
    var panel = input.nextElementSibling;
    if (panel.style.maxHeight){
      panel.style.maxHeight = null;
    } else {
      if(input.id=="preStaffs"){
    		$.ajax({
    	        url : "controller?cmd=getPreStaffsAction", 
    	        data: {},
    	        success : function(result){
    	        	panel.innerHTML = result;
    	        	panel.style.maxHeight = panel.scrollHeight + "px";
    	        }
    	    });
    	}
      
       if(input.id=="workingStaffs"){
	  		$.ajax({
	  	        url : "controller?cmd=getWorkingStaffsAction", 
	  	        data: {},
	  	        success : function(result){
	  	        	panel.innerHTML = result;
	  	        	panel.style.maxHeight = panel.scrollHeight + "px";
	  	        }
	  	    });
	  	}
       
       if(input.id=="leftStaffs"){
	  		$.ajax({
	  	        url : "controller?cmd=getLeftStaffsAction", 
	  	        data: {},
	  	        success : function(result){
	  	        	panel.innerHTML = result;
	  	        	panel.style.maxHeight = panel.scrollHeight + "px";
	  	        }
	  	    });
  		}
      
    } 
}
</script>
</body>
</html>

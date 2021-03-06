<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file = "loginCheckAdmin.jsp" %>
<%@include file="headSetting.jsp"%>
<%@include file = "tabMenuAdmin.jsp" %>
<style>
.staffDetailHeader {
	margin: auto;
	text-align: center;
	width: 60%;
	border-bottom: #d4e5f7 solid;
	margin-top: 10px;
	height: auto;
}
.staffDetailHeader h4{
	color: rgb(0, 51, 102);
	font-weight: bolder;
	letter-spacing: 1px;
}
</style>
</head>
<body>
<div class="staffDetailHeader">
	<i id="backToStaffManagementAdmin" class="fa fa-chevron-left" aria-hidden="true" style="margin-right: 25px"></i>
	<h4 style="display:inline;">직원 상세 정보</h4>
</div>
	<div id="getStaffDetailContent" style="padding-top: 5%;"></div>
</body>
<script>
var detailStaffCall = function(input){
	alert($(input).prev().html());
};	//추후 업데이트

$("#backToStaffManagementAdmin").click(function(){
	location.href = "controller?cmd=staffManagementAdminUI";
});

var staffId = "${param.staffId}";
$(document).ready(function(){
	$.ajax({
		url : "controller?cmd=getStaffDetailAction",
		data : {
			staffId : staffId
		},
		success : function(result){
			$("#getStaffDetailContent").html(result);
		}
	});
})
</script>
</html>
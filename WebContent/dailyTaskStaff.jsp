<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="tabMenuStaff.jsp" %>
<style>
.accordion {
    background-color: #e6f2ff;
    font-weight: bold;
    color: #444;
    cursor: pointer;
    padding: 8px;
    width: 100%;
    border: none;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
}

.active, .accordion:hover {
    background-color: #99ccff;
}

.accordion:before {
	font-family: FontAwesome;
    content: '\f0da';
    color: #003366;
    font-weight: bold;
    float: left;
    margin-right: 5px;
}

.active:before {
    font-family: FontAwesome;
    content: '\f0d7';
}

.panel {
    padding: 0 18px;
    background-color: white;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
}

.unfinished {
	color: gray;
}
ul {
	margin-left: -20pt;
	list-style: none;
}
li {
	font-size: 10pt;
}
li.important::before {
	content: "\2605";
	color: orange;
	width: 1em;
	margin-left: -1.4em;
}
li.deleting:hover {
	background-color: #99ccff;
}
li.deleting:hover:after {
	content: "\26D4";
	color: red;
}
.ui-datepicker-trigger {
	width: 20pt;
	cursor: pointer;
}
.ui-datepicker-trigger:hover {
	width: 25pt;
}
#datemenu {
	vertical-align: middle 
}
#scrollPast:hover, #scrollFuture:hover {
	width: 17pt;
}
.container {
	max-width: 1000px;
    margin: auto;
    background: #3284E2;
	text-align: center;
}
</style>
<script type="text/javascript">

$(function(){
   $("#datepicker").datepicker({
      showOn : "button",
      buttonImage : "images/calendar.png",
      buttonText: "날짜 선택",
      buttonImageOnly : true,
      showButtonPanel : true,
      currentText : '이번 달로',
      closeText : '닫기',
      nextText : "다음 달",
      prevText : "이전 달",
      dateFormat : "yy/mm/dd",
      altField: "#alterDate",
      altFormat: "m"+"월 "+"d"+"일",
      showMonthAfterYear : true,
      showOtherMonths : true,
      selectOtherMonths : true,
      changeMonth: false, //true 하면 스크롤로 월 선택 가능
        dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        yearSuffix: "년",
      maxDate: "+1d",
      onSelect : function(dateText, inst){
       contentLoad();
    }
   });
});
</script>
</head>
<body>
<!-- 날짜선택바 -->
<div id="dateMenu" class="w3-center" style="vertial-align:center; padding:1px;">
   <span>
      <input type="text" id="datepicker" hidden="hidden">
      <input type="text" id="alterDate" hidden="hidden">
  </span>
  <span>
      <img id="scrollPast" src="images/leftTriangle.png" width="15pt"/>
   </span>
   <h2 id="date" style="display: inline;"></h2>
   <span>
      <img id="scrollFuture" src="images/rightTriangle.png" width="15pt"/>
   </span>
</div>

<div id="content"></div>

<div id="selectedTaskModal" style="z-index:3;display:none;position:fixed;left:0;top:0;width:100%;height:100%;overflow:auto;background-color:rgb(0,0,0);background-color:rgba(0,0,0,0.4);">
</div>
<div id="selectedTaskPopup" style="z-index:4;position:fixed;outline:0;width:100%; background-color: white; display:none;">
    <span id="updatePopup"></span>
    <span id="closeModal" class="w3-button" style="pad; top:0; padding:3px 6px;">&times;</span>
    <span id="update" class="w3-button" style="pad; position:absolute; padding:3px 6px;">수정완료</span>
</div>

<script>
var setCheckBox = function(input){
	$(input).removeClass("fa fa-square-o");
	$(input).addClass("fa fa-check-square-o");
	var dailyTaskToFinish = input.parentNode.childNodes[0].nodeValue;
	$.ajax({
		url : "controller?cmd=setFinisherAction",
		data : {
			assignDate : $("#datepicker").val(),
			dailyTask : dailyTaskToFinish
		},
		success : function(result){
			alert("완료 등록되었습니다.");
			location.reload();
		}
	});
};

	// 아코디언
	var activateAcc = function(input){
	    input.classList.toggle("active");
	    var panel = input.nextElementSibling;
	    if (panel.style.maxHeight){
	      panel.style.maxHeight = null;
	    } else {
			$.ajax({
		        url : "controller?cmd=getDailyTasksStaffAction", 
		        data: {
		        	assignDate : $("#datepicker").val(),
		        	assignType : input.id
				},
		        success : function(result){
		        	panel.innerHTML = result;
		        	panel.style.maxHeight = panel.scrollHeight + "px";
		        	
		        }
		    });
	    } 
	}
	
	/**날짜 포맷 변환*/
	Date.prototype.format = function(){
		var date = this;
		var year = date.getFullYear();
		var month = (1 + date.getMonth());
		month = month >= 10 ? month : '0' + month;
		var day = date.getDate();
		day = day >= 10 ? day : '0' + day;
		return year + '/' + month + '/' + day;
	}

	/**일일업무 컨텐츠 로드 및 UI 설정*/
	var contentLoad = function() {
		$("#date").html($("#alterDate").val());
		var today = new Date();
		var tomorrow = new Date();
		tomorrow.setDate(today.getDate() + 1);
		today = today.format("yyyy/MM/dd");
		tomorrow = tomorrow.format("yyyy/MM/dd");
		if ($("#datepicker").val() == today) {
			$("#scrollFuture").show();
		} else if ($("#datepicker").val() == tomorrow) {
			$("#scrollFuture").hide();
		} else {
			$("#scrollFuture").show();
		}
		$.ajax({
			url : "controller?cmd=getAssignedPartsAction",
			data : {
				date : $("#datepicker").val()
			},
			success : function(result) {
				$("#content").html(result);
				
			}
		});
	}
	$(document).ready(function() {
		$("#datepicker").datepicker("setDate", "0d");
		contentLoad();
	});

	/**왼쪽/오른쪽 버튼으로 날짜 선택 시 세부 페이지 이동 기능*/
	$("#scrollPast").on("click", function() {
		var dateVal = $("#datepicker").datepicker("getDate");
		dateVal.setDate(dateVal.getDate() - 1);
		$("#datepicker").datepicker("setDate", dateVal);
		contentLoad();
	});

	$("#scrollFuture").on("click", function() {
		var dateVal = $("#datepicker").datepicker("getDate");
		dateVal.setDate(dateVal.getDate() + 1);
		$("#datepicker").datepicker("setDate", dateVal);
		contentLoad();
	});
</script>

</body>
</html>
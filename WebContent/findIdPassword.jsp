<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headSetting.jsp"%>
<style>
#logo{
	display:block;
	padding-top:10px;
	margin-left: auto;
	margin-right: auto;
}
body {
	background-image: url("images/joinetc.png");
    background-position: center top;
    background-repeat: no-repeat;
    background-size: 360px 640px;
    margin: auto;
    width: 100%;
}
.findInput {
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 2px solid #004566;
 	line-height : normal;
	width: 200px;
	padding: 10px;
	text-align: center;
	background-color: rgba(0,0,0,0);
	color: #004566;
	font-weight: bold;
}
.findButton {
	width: 200px;
	padding: 10px;
	border-radius: 20px;
	border: none;
	text-align: center;
	background-color: rgb(153, 204, 255);
	color: black;
	margin-top: 20px;
	margin-bottom: 20px;
}
.cancelButton {
	width: 200px;
	padding: 10px;
	border-radius: 10px;
	border: none;
	text-align: center;
	background-color: #bfbfbf;
	color: black;
	margin-top: 20px;
}
.findHeader {
	margin: auto;
	text-align: center;
	width: 50%;
	border-bottom: #d4e5f7 solid;
}
.findHeader h4{
	margin-bottom: 5px;
	color: rgb(0, 51, 102);
	font-weight: bolder;
	letter-spacing: 2px;
}
.findMenu {
	text-align: center;
	height: 40px;
}
.findMenu span {
	font-size: 12pt;
	padding: 10px 15px 3px 15px;
}
.findMenu span.selected  {
	border-bottom: 2px solid #004566;
}
.findContainer {
	padding-top: 20px;
	width: 300px;
	margin: auto;
}
.findIdContent, .findPwContent {
	padding-top: 20px;
	display:inline;
	font-size: 11pt;
	margin-left: auto;
	margin-right: auto;
	width:80px;
	text-align: center;
}
#idCheck, #getUserPhoneNum, #,userPhoneNum, #findIdResult {
	font-size: 11pt;
}
h5{
	margin:0;
}
button {
	width: 200px;
	padding: 10px;
	border-radius: 10px;
	border: none;
	text-align: center;
	background-color: #d4e5f7;
	color: black;
	margin-top: 20px;
	margin-bottom: 20px;
}
input {
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 2px solid #004566;
 	line-height : normal;
	width: 200px;
	padding: 10px;
	text-align: center;
	background-color: rgba(0,0,0,0);
	color: #004566;
}
#goHome {

}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<img id="logo" src="images/logo_white.png" width="100%" height="100%" onclick="goHome()"><br>
<br><br>
<div class="findHeader">
	<h4>아이디/비밀번호 찾기</h4>
</div>

<div class="findContainer">
<div class="findMenu">
	<span id="showFindId" class="selected">아이디 찾기</span>
	 | 
	<span id="showFindPw">비밀번호 찾기</span>
</div>
<div class="findIdContent">
	<div>&nbsp;&nbsp;&nbsp;&nbsp;본인명의 휴대폰 번호로 인증</div>
	<div id="findId">
		<input type="text" id="phoneNum" class="roundBox" required="required" placeholder="휴대폰 번호만 입력">
		<button id="certify1" class="roundBox">인증</button>
		<div id="certifyResult"></div>
	</div>
	<!-- findId end -->

	<div id="certifier">
		<input type="text" id="inputCertification" class="roundBox" placeholder="인증번호입력">
		<button id="certify2" class="roundBox">확인</button>
	</div>
	<!-- certifier end -->
<div id="findIdResult"></div>
<!-- findIdResult end -->
</div>
<div class="findPwContent">
	<div id="findPassword">
		<div id="findPwByPhoneNum">
			<input type="text" id="userId" class="roundBox" required="required" placeholder="아이디"><div id="idCheck"></div><br>
			<button id="findUserPhoneNum" class="roundBox">휴대폰 번호 찾기</button><br>
			<h5>회원정보에 등록된 휴대폰 번호로 인증</h5>
			<input type="text" id="getUserPhoneNum" class="roundBox" placeholder="" readonly><br>
			<button id="certify3" class="roundBox">인증</button><br>
		</div><!-- findPwByPhoneNum end -->
		<div id="phoneNumCertify">
			<h5>본인명의 휴대폰 번호로 인증</h5><br>
			<input type="text" id="userPhoneNum" class="roundBox" placeholder="휴대폰 번호만 입력">
			<div id="certifyResult"></div>
			<button id="certify4" class="roundBox">인증</button>
		</div><!-- phoneNumCertify end -->
	</div><!-- findPassword end -->
	
	<div id="updatePassword">
		<input type="password" id="newPw" class="roundBox" required="required" placeholder="비밀번호 재설정"><div id="pwCheck"></div><br>
		<input type="password" id="checkPw" class="roundBox" required="required" placeholder="비밀번호 확인"><div id="pwCheck2"></div>
		<button id="resetPw" class="roundBox" >변경</button>
	</div><!-- updatePassword end -->
</div>

<div style="text-align:center;"><button id="goHome" class="roundBox cancelButton" onclick="goHome()">취소</button></div>
</div>
<script>
$(document).ready(function() {
	$(".findPwContent").hide();
});
$("#showFindId").click(function(){
	$(".selected").removeClass("selected");
	$(this).addClass("selected");
	$(".findIdContent").show();
	$(".findPwContent").hide();
});
$("#showFindPw").click(function(){
	$(".selected").removeClass("selected");
	$(this).addClass("selected");
	$(".findPwContent").show();
	$(".findIdContent").hide();
});
		
	/* 아이디/비밀번호 찾기		
	아이디 찾기	
		휴대폰 번호 중복 검사
		휴대폰 인증번호 요청
		인증번호 입력값 형식 검사
		인증번호 유효성 검사
	비밀번호 재설정	
		휴대폰 번호 입력값 형식 검사
		휴대폰 인증번호 요청
		인증번호 입력값 형식 검사
		인증번호 유효성 검사
 */	

$("#updatePassword").hide();
//휴대폰 인증번호 요청 : 입력값 검사
	//휴대폰 번호 입력값 형식 검사/정규표현식: 01[016-9]{1}[1-9]{1}[0-9]{2,3}[0-9]{4}
	$("#phoneNum").keyup(function() {
		var regExpPhone = new RegExp("01[016-9]{1}[1-9]{1}[0-9]{2,3}[0-9]{4}");
		var phoneNumber=$("#phoneNum").val();
		phoneNumber=phoneNumber.replace(/[^0-9]/g,'');
		phoneNumber=phoneNumber.trim();
		if (phoneNumber.length>=12) {
			$("#certifyResult").html("길이가 맞지 않습니다.");
		} else if(!regExpPhone.test(phoneNumber)) {
			$("#certifyResult").html("잘못된 번호 양식입니다.");
		} else {
			$("#phoneNum").val(phoneNumber);
			$("#certifyResult").html("");
		}
	});
		
	//휴대폰 번호 중복 검사;
	$("#certify1").click(function(){
		if($("#phoneNum").val()==""){
			alert("휴대폰 번호를 입력해주세요");
		} else {
			$.ajax({
				url: "controller?cmd=isUserPhoneAction",
				data: {
					phoneNum : $("#phoneNum").val()
				}, 
				success: function(result) {	//dao에서 result는 boolean으로 리턴될 것; false: DB에 없음=인증가능
					var result = JSON.parse(result);
					if(result["result"] == "false") {
						alert("존재하지 않는 번호입니다.");
					} else {
						alert("인증번호가 발송되었습니다.");
					}
				}
			});	
		}
	});
			
	//인증번호 입력값 형식 검사 - 차후 구현			

	//인증번호 유효성 검사 - 차후 구현
	
	//아이디찾기: 휴대폰 번호 입력하여 아이디 가져오기
	$("#certify2").click(function(){
		if($("#phoneNum").val()=="") {
			$("#findIdResutl").html("휴대폰 인증을 진행해주세요");
		} else {
			$.ajax({
				url: "controller?cmd=getUserIdByPhoneNumAction",
				data: {
					phoneNum : $("#phoneNum").val()
				},
				success: function(result) {
					var result = JSON.parse(result);
					if(result["result"] == "null") {
						$("#findIdResult").html("존재하지 않는 아이디입니다.");
					} else {
						$("#findIdResult").html("회원님의 아이디는 "+result["result"]+"입니다.");
					}
				}
			});
		}
	});
	
	//아이디 입력값 형식 검사: 
	//아이디 : 6~16자 영소문자, 숫자-영소문자 1자 반드시 포함/정규표현식: ^(?=.*[a-z])[a-z0-9]{6,16}$
	$("#userId").keyup(function() {
		var regExpId = new RegExp("^(?=.*[a-z])[a-zA-Z0-9]{6,16}$");
		if ($("#userId").val().length >= 17) {
			$("#idCheck").html("아이디는 6~16자여야 합니다.");
		} else if(!regExpId.test($("#userId").val())) {
			$("#idCheck").html("아이디는 영문 소문자, 숫자만 사용가능합니다.");
		} else {
			$("#idCheck").html("");
		}
	}); 
	
	/* //아이디 유무 검사: v표 띄우기;;;;
		$.ajax({
			url: "controller?cmd=isUserIdAction",
			data: {
				userId: $("#userId").val()
			},
			success: function(result) {
				var result = JSON.parse(result);
				if(result["result"] == "false") {
					$("#idCheck").html("존재하지 않는 아이디");					
				} else {
					$("#idCheck").html("이것이자바다");	//나중에 깔쌈한 v표 그림을 넣든지 해주세요...
					$("#userId").attr("readonly","readonly");
					$("#userPhoneNum").attr("disabled", true);
				}
			}
		}); */
	
	//아이디에 해당하는 휴대폰 번호 보기
		$("#findUserPhoneNum").click(function(){
			if($("#userId").val()=="") {
				$("#idCheck").html("아이디를 입력해주세요");
			} else {
				$.ajax({
					url: "controller?cmd=getUserPhoneAction",
					data: {
						userId : $("#userId").val()
					},
					success: function(result) {
						var result = JSON.parse(result);
						if(result["result"] == "null") {	//해당하는 경우가 없음
							$("#getUserPhoneNum").val("존재하지 않는 번호입니다");
						} else {
							$("#getUserPhoneNum").val(result["result"]);
							$("#phoneNumCertify").hide();
							$("#updatePassword").show();
						}
					}
				});
			}
		});
	
		//휴대폰 번호 명의자 일치여부 검사: 차후 구현.
	
		//비밀번호 입력값 형식 검사
		$("#newPw").keyup(function(){
			var regExpPw = new RegExp("^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9!@#$%^&*]{6,16}$");
			if($("#newPw").val().length >=17) {
				$("#pwCheck").html("비밀번호는 6~16자여야 합니다.");
			} else if( !regExpPw.test($("#newPw").val())) {
				$("#pwCheck").html("비밀번호는 영문 대소문자, 숫자, 특수문자로 구성되어야 합니다.");
			} else {
				$("#pwCheck").html("");
			}
		});
		
		//비밀번호 확인 일치여부 검사
		$("#checkPw").keyup(function(){
			if($("#newPw").val()!=$("#checkPw").val()){
				$("#pwCheck2").html("불일치")
			} else {
				$("#pwCheck2").html("");
			}
		});
		
		//비밀번호 재설정: 아이디를 알고 있는 상태. 
		$("#resetPw").click(function(){
			$.ajax({
				url:"controller?cmd=resetPwAction",
				data: {
					userId : $("#userId").val(),
					newPw : $("#newPw").val()
				},
				success: function(result){
					alert("비밀번호가 변경되었습니다. 다시 로그인해주세요.")
					location.href="controller?cmd=loginUI";
				}
			});		
		});
		
		
		function goHome(){
			location.href="controller?cmd=homeUI";
		}
	</script>
</body>
</html>
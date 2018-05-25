<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<title>지점 검색</title>
</head>
<body>
	<h1>지점관리</h1>
	<select id="addressCity">
		<option selected>시/도</option>
		<option value="서울">서울</option>
		<option value="경기">경기</option>
		<option value="부산">부산</option>
	</select>
	<select id="addressGu">
		<option selected>시/군/구</option>
		<option value="송파">송파</option>
		<option value="해운대">해운대</option>
		<option value="마포">부산</option>
	</select>
	<div id="resultBranch">
		<!-- 지점검색; 이하는 더미 데이터. -->
		<table id="branchList" border="2">
			<tr>
				<th>지점명</th>
				<th>도로명 상세주소</th>
				<th>지번 상세주소</th>
			</tr>
			<tr>
				<td>송파구청사거리</td>
				<td>오금로 81</td>
				<td>방이동 22-3</td>
			</tr>
			<tr>
				<td>경찰병원역</td>
				<td>중대로 135</td>
				<td>가락동 79</td>
			<tr>
				<td>잠실롯데</td>
				<td>올림픽로 240</td>
				<td>잠실동 40-1</td>
			</tr>
		</table>
	</div>
	<!-- resultBranch end-->
	<script type="text/javascript">
		/* 지점 검색		findBranch.jsp		본사 DB	HEAD_BRANCHES	select			
		 본사 DB	HEAD_BRANCHES	select	 */
				
	
	//시/도 선택지 보기: 본사 DB에서 시/도 선택지 기본적으로 가져오기
	/* $.ajax(function(){
		url: "",
		success: function(result){
			//값을 시/도 선택지 박스로 뿌려주기;
		}
	}); */	
	//구/군 선택지 보기: 시/도 선택지 값 입력 -> 해당하는 구/군 선택지 가져오기
		$("#addressGu").click(function(){
			if($("#addressCity").val()=="") {
				alert("시/도를 먼저 선택해주세요");			
			} else {
				/* $.ajax(function(){
					url: "",
					data: {
						addressCity: $("#addressCity").val();
					},
					success: function(result){
						//값을 구/군 선택지 박스로 뿌려주기
					}
				}); */
			}
		});
	//선택한 지역의 지점 목록 보기: 시/도, 구/군 선택지 값 입력 -> 해당하는 지점 목록 가져오기; 입력값이 없다면 resultBranch div에 문구 출력.
	
	
	//지점 리스트에서 지점명 클릭시 값이 certifyStaff의 지점명으로 들어가도록.
		 
	</script>

</body>
</html>
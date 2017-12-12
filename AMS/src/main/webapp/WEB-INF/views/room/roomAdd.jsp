<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	$(document).ready(function(){
		var dupTest = "yet";
		//중복검사
		$('#dupBtn').click(function(){
			$.ajax({
	        	url:"rtDupTest",
				type:"GET",
				data:"insertRt="+ $('#insertRt').val(),
				success: function(data) {
					dupTest = JSON.parse(data)
					console.log(dupTest);
					if(dupTest == "no"){
						$('.dupMessage').html('<span>중복된 객실코드 입니다.</span>')
					}else{
						$('.dupMessage').html('<span>입력가능한 객실코드 입니다.</span>')
					}
				},
				fail: function(request, status, error){
				}
			})
		});
		// 모든 항목 입력되었는지, 중복검사 해결했는지 확인 후 등록
		$('#submitBtn').click(function(){
			if($('#selId').val() && $('#nameId').val() && $('#sizeId').val() && $('#insertRt').val() != null){
				if(dupTest == "yet"){
					$('.yetdupMessage').html('<span>객실코드 중복검사를 해주세요.</span>')
				}else if(dupTest == "ok"){
					$('#addFrom').submit();
				}else{
					$('.yetdupMessage').html('<span>중복된 객실코드 입니다.</span>')
				}
			}else{
				$('.yetdupMessage').html('<span>모든항목을 입력해주세요.</span>')
			}
		});
	})
</script>
</head>

<body>
	<div class="topb">객실 등록</div>
	<form action="roomAdd" method="post" class="form-horizontal"
		id="addFrom">
		<div class="formb">
			객실코드 : <input type="text" name="roomCode" id="insertRt"
				class="input-sm" required> <input type="button"
				name="dupBtn" id="dupBtn" class="btn-default btn-sm" value="중복검사">
			<span class="dupMessage"></span>
		</div>
		<div class="formb">
			등록인 : <input type="text" value="${loginfor.eId}" name="eId"
				readonly="readonly" class="input-sm">
		</div>
		<div class="formb">
			객실 타입명 : <select name="roomTypeCode" class="input-sm" required
				id="selId">
				<option value="">선택하세요</option>
				<c:forEach items="${roomTypeSelect}" var="rt">
					<option value="${rt.roomTypeCode}">${rt.roomTypeName}</option>
				</c:forEach>
			</select>
		</div>
		<div class="formb">
			객실명 : <input type="text" name="roomName" class="input-sm" required
				id="nameId">
		</div>
		<div class="formb">
			객실사이즈 : <input type="text" name="roomSize" class="input-sm" required
				id="sizeId">
		</div>
		<div class="dupmeseeage">
			<input type="button" value="등록" class="btn-default btn-sm"
				id="submitBtn"> <span class="yetdupMessage"></span>
		</div>
	</form>
</body>
</html>
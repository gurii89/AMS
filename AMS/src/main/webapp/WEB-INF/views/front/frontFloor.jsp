<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
$('document').ready(function(){
	
	//상세정보 가져오기
	$('.de').click(function(){
		$('.visible').fadeIn();
		$('.minirtcode').html('<input class="hidden "name="roomCode" value="'+$(this).val()+'">'+$(this).val()+'호')
		$.ajax({
			url:"frontDetail",
			type:"GET",
			data:"FrCode="+$(this).val(),
			success: function(data) {
				var rtname = JSON.parse(data)
				console.log(rtname.FrRCon);
				$('.dert').val(rtname.FrCode.roomTypeCode);
				$('.derc').val(rtname.FrRCon);
			},
			fail: function(request, status, error){
			}
		})
			$('.rdbtn').click(function(){
				$('.hidevdv').html('')
				$('.vdv').html('<select class="roomCon" name="roomConCondition"><option>예약</option><option>공실</option><option>청소요청</option><option>점검요청</option><option>입실</option></select>')
		})
	})
});
</script>
</head>
<body>
	<div class="clearfix col-sm-10 top">
		<div class="topb">${selfrontfloor} 층입니다.</div> 
		<c:forEach items="${frontRoom}" var="FrontRoom" begin="0"
			end="${allroomcode}">
			<c:if test="${FrontRoom.roomCodeMarkF eq selfrontfloor}">
					<span class="frontR"><input class="de" type="button" value="${FrontRoom.roomCodeF}"></span>
			</c:if>
		</c:forEach>
	</div>
	
	<div class="col-sm-2 top">
		<div class="visible">
		<div class="rdtop">객실 상세정보</div>
			<div class="well rdcon">
				<form action="roomConAdd" method="post">
					<table class="frontdetal">
						<tr>
							<td class="minirtcode"></td>
						</tr>
						<tr>
							<td>객실타입</td>
							<td><input type="text" class="dert" value="" readonly="readonly"></td>
							<td></td>
						</tr>
						<tr>
							<td>객실상태</td>
							<td class="vdv"><input type="text" class="derc" value="" readonly="readonly"></td>
							<td class="hidevdv"><input type="button" value="수정" class="rdbtn"></td>
						</tr>
						<tr>
							<td>고객정보</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>체크인</td>
							<td></td>
							<td><input type="text" value="${loginfor.eId}" name="eId" class="hidden"></td>
						</tr>
					</table><br>
					<textarea rows="4" cols="15"></textarea><br>
					
					<input type="submit" class="btn btn-info" value="저장">
					<button type="button" class="btn btn-primary">뭐넣지</button>	
				</form>
			</div>
		</div>
	</div>
</body>
</html>
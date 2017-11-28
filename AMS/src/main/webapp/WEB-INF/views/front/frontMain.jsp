<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	$(document).ready(function(){
		
		$('.typeselect').change(function(){
			var typeValue = $(this).val();
			
			$('.dn').each(function(i){				
				var dnValue = $(this).val();				
				if(dnValue == typeValue){
					$(this).parent().fadeIn();
				}else if(typeValue == '타입별 보기'){
					$(this).parent().fadeIn();
				}
				else{
					$(this).parent().hide();
				}
			})	
		});
		
		$('.floorselect').change(function(){
			var floorValue = $(this).val();
			
			$('.dm').each(function(j){				
				var dmValue = $(this).val();				
				if(dmValue == floorValue){
					$(this).parent().fadeIn();
				}else if(floorValue == '층별 보기'){
					$(this).parent().fadeIn();
				}
				else{
					$(this).parent().hide();
				}
			})	
		});
				
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
		<div class="topb">객실 프론트</div>
		<div class="floorside">
			<select class="input-sm floorselect">
				<option>층별 보기</option>
				<c:forEach items="${floor}" var="Floor">
					<option>${Floor}</option>
				</c:forEach>
			</select>
		</div>
		<div class="">
			<select class="input-sm typeselect">
				<option>타입별 보기</option>
				<c:forEach items="${frontdroprt}" var="frontdropRt">
					<option>${frontdropRt.roomTypeName}</option>
				</c:forEach>
			</select><p></p>
		</div>
		<c:set target="${toproom}" var="toproo" value="${toproom}"></c:set>
		<c:forEach items="${frontRoom}" var="FrontRoom" begin="0"
			end="${allroomcode}">
			<c:choose>
				<c:when test="${FrontRoom.roomCodeMarkF eq toproo}">
					<span class="frontR"><input class="de" type="button" value="${FrontRoom.roomCodeF}"><input class="dn hidden" value="${FrontRoom.roomTypeCodeNameF}"><input class="dm hidden" value="${FrontRoom.roomCodeMarkF}"></span>
				</c:when>
				<c:otherwise>
					<c:set var="toproo" value="${toproo-1}"></c:set>
					<c:choose>
						<c:when test="${FrontRoom.roomCodeMarkF ne toproo}">
							<c:set var="for" value="false"></c:set>
							<c:forEach var="result" begin="0" end="${toproom-bottomroom}">
								<c:choose>
									<c:when test="${FrontRoom.roomCodeMarkF eq toproo}">
										<c:set var="for" value="true"></c:set>
									</c:when>
									<c:otherwise>
										<c:set var="toproo" value="${toproo-1}"></c:set>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<span class="wcon"><br></span>
							<span class="frontR"><input class="de" type="button" value="${FrontRoom.roomCodeF}"><input class="dn hidden" value="${FrontRoom.roomTypeCodeNameF}"><input class="dm hidden" value="${FrontRoom.roomCodeMarkF}"></span>
						</c:when>
						<c:otherwise>
							<span><br class="wcon"></span>
							<span class="frontR"><input class="de" type="button" value="${FrontRoom.roomCodeF}"><input class="dn hidden" value="${FrontRoom.roomTypeCodeNameF}"><input class="dm hidden" value="${FrontRoom.roomCodeMarkF}"></span>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
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
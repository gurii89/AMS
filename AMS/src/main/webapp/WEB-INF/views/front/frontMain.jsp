<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	$(document).ready(function(){
		
		//상태에 따라서 css 변경
		$('.drc').each(function(q){
			var drcolor = $(this).val();
			if(drcolor == '입실'){
				var checkcon = $(this).parent();
				$(checkcon).removeClass('frontR');
				$(checkcon).addClass('frontR2');
				var checkCon = checkcon.children();
				$(checkCon.eq(4)).html('<p><div class="drccheck">입실</div>');
			}else if(drcolor == '청소요청'){
				var checkcon = $(this).parent();
				$(checkcon).removeClass('frontR');
				$(checkcon).addClass('frontR3');
				var checkCon = checkcon.children();
				$(checkCon.eq(4)).html('<p><div class="drccheck">청소요청</div>');
			}else if(drcolor == '청소완료'){
				var checkcon = $(this).parent();
				$(checkcon).removeClass('frontR');
				$(checkcon).addClass('frontR4');
				var checkCon = checkcon.children();
				$(checkCon.eq(4)).html('<p><div class="drccheck">청소완료</div>');
				$(checkCon.eq(5)).hide();
			}else if(drcolor == '예약'){
				var checkcon = $(this).parent();
				$(checkcon).removeClass('frontR');
				$(checkcon).addClass('frontR5');
				var checkCon = checkcon.children();
				$(checkCon.eq(4)).html('<p><div class="drccheck">예약</div>');
			}else if(drcolor == '공실'){
				var checkcon = $(this).parent();
				var checkCon = checkcon.children();
				$(checkCon.eq(5)).hide();
			}else if(drcolor == '점검요청'){
				var checkcon = $(this).parent();
				$(checkcon).removeClass('frontR');
				$(checkcon).addClass('frontR6');
				var checkCon = checkcon.children();
				$(checkCon.eq(4)).html('<p><div class="drccheck">점검요청</div>');
			}
		});
		
		//등록시간의 12시간 후와 현재시간 비교
		
		//1. 현재시간
		var Noww = new Date;
		//console.log(Noww);
		var oneDay = 60 * 60 * 24 * 1000;
		//console.log(Noww.getTime());
		var noww = Noww.getTime() + oneDay;
		//console.log("현재시간의 getTime+oneDay ="+noww);
		
		//2. 12시간후 리스트
		var after12List = new Array();
		$('.after12').each(function(t){
			after12List.push($(this).val());
		});
		
		//3. String to date 반복문
		for(s=0; s<after12List.length; s++){
			//console.log(after12List[s]);
			
			var first = after12List[s];
			var year = first.substring(0, 4);
			var month = first.substring(5, 7);
			var day = first.substring(8, 10);
			var timeh = first.substring(11, 13);
			var timem = first.substring(14, 16);
			//console.log("확인 :"+year+"/"+month+"/"+day+"/"+timeh+"/"+timem);
			
			var ddate = new Date(year, month-1, day, timeh, timem);
			//console.log(ddate);
			//console.log(ddate.getTime());
			//console.log("12시간후 getTime+oneDay ="+Math.abs(ddate.getTime() + oneDay));
			after12List[s] = Math.abs(ddate.getTime() + oneDay);
			var checktime = noww - after12List[s];
			//.log("현재시간 - 12시간후 = "+checktime);
			if(checktime >= 0){
				after12List[s] = "over";
			}else{
				after12List[s] = "yet";
			}
		}
		
		// 4. 등록시간 이후 12시간이 지나면 텍스트를 붉은색으로 바꾸기.
		$('.data').each(function(w){
			var prdate = $(this);
			if(after12List[w] == "over"){
				$(prdate).css('color', '#ff0000');
			}else{	
				}
		});
		
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
		
		$('.conselect').change(function(){
			var conValue = $(this).val();
			
			
			$('.drc').each(function(k){				
				var drcValue = $(this).val();				
				if(drcValue == conValue){
					$(this).parent().fadeIn();
				}else if(conValue == '객실 상태별 보기'){
					$(this).parent().fadeIn();
				}
				else{
					$(this).parent().hide();
				}
			})	
		});
				
		//상세정보 가져오기
		$('.de').click(function(){
			$('.hidevdv').html('<input type="button" value="수정" class="rdbtn">');
			$('.vdv').html('<input type="text" class="derc" value="" readonly="readonly">');
			$('.visible').fadeIn();
			$('.minirtcode').html('<input class="hidden "name="roomCode" value="'+$(this).val()+'">'+$(this).val()+'호')
			$.ajax({
				url:"frontDetail",
				type:"GET",
				data:"FrCode="+$(this).val(),
				success: function(data) {
					var rtname = JSON.parse(data)
					console.log(rtname.FrRCon);
					console.log(rtname.FrRConTime);
					$('.dert').val(rtname.FrCode.roomTypeCode);
					$('.derc').val(rtname.FrRCon);
					//경과시간 시계 만들기
					$('.timecheck')
				},
				fail: function(request, status, error){
				}
			})
				$('.rdbtn').click(function(){
					$('.hidevdv').html('')
					$('.vdv').html('<select class="roomCon" name="roomConCondition"><option>공실</option><option>예약</option><option>청소요청</option><option>점검요청</option><option>입실</option></select>')
			})
		})
	});
</script>
</head>

<body>
	<div class="clearfix col-sm-9 top">
		<div class="topb">객실 프론트</div>
		<div class="floorside">
			<select class="input-sm floorselect">
				<option>층별 보기</option>
				<c:forEach items="${floor}" var="Floor">
					<option>${Floor}</option>
				</c:forEach>
			</select>
		</div>
		<div class="floorside2">
			<select class="input-sm typeselect">
				<option>타입별 보기</option>
				<c:forEach items="${frontdroprt}" var="frontdropRt">
					<option>${frontdropRt.roomTypeName}</option>
				</c:forEach>
			</select><p></p>
		</div>
		<div class="">
			<select class="input-sm conselect">
					<option>객실 상태별 보기</option>
					<option>공실</option>
					<option>예약</option>
					<option>입실</option>
					<option>점검요청</option>
					<option>청소요청</option>
					<option>청소완료</option>
			</select><p></p>
		</div>
		<!-- hidden START-->
		<c:forEach items="${after12to}" var="after12to">
			<input type="text" class="hidden after12" value="${after12to}">
		</c:forEach>
		<c:set target="${toproom}" var="toproo" value="${toproom}"></c:set>
		<c:forEach items="${frontRoom}" var="FrontRoom" begin="0"
			end="${allroomcode}">
			<c:choose>
				<c:when test="${FrontRoom.roomCodeMarkF eq toproo}">
					<span class="frontR"><input class="de" type="button" value="${FrontRoom.roomCodeF}"><input class="dn hidden" value="${FrontRoom.roomTypeCodeNameF}"><input class="dm hidden" value="${FrontRoom.roomCodeMarkF}"><input class="drc hidden" value="${FrontRoom.roomConF}"><div class="drccheck"></div><input class="data" type="text" value="${FrontRoom.roomConTimeF}"></span>
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
							<span class="frontR"><input class="de" type="button" value="${FrontRoom.roomCodeF}"><input class="dn hidden" value="${FrontRoom.roomTypeCodeNameF}"><input class="dm hidden" value="${FrontRoom.roomCodeMarkF}"><input class="drc hidden" value="${FrontRoom.roomConF}"><div class="drccheck"></div><input class="data" type="text" value="${FrontRoom.roomConTimeF}"></span>
						</c:when>
						<c:otherwise>
							<span><br class="wcon"></span>
							<span class="frontR"><input class="de" type="button" value="${FrontRoom.roomCodeF}"><input class="dn hidden" value="${FrontRoom.roomTypeCodeNameF}"><input class="dm hidden" value="${FrontRoom.roomCodeMarkF}"><input class="drc hidden" value="${FrontRoom.roomConF}"><div class="drccheck"></div><input class="data" type="text" value="${FrontRoom.roomConTimeF}"></span>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>

	<div class="col-sm-3 top">
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
							<td>경과시간</td>
							<td></td>
							<td><input type="text" value="${loginfor.eId}" name="eId" class="hidden timecheck"></td>
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
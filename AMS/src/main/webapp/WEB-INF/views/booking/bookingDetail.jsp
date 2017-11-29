<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script>
			$(function(){
				// 이용 금액 합계, 잔금 계산 및 출력
				var sum = 0;
				var result;
				var booCode = $('#booCode').text();
				$('.rate').each(function(i, t){
					sum += Number($(this).text())
				})				
				$('#sumRate').text(sum)
				$('#RMP').text(eval(sum-$('#sumPay').text()))
				
				// 결제창으로 이동
				$('#payBtn').click(function(){
					$(location).attr('href', 'paymentAdd?booCode='+booCode+"&payTotal="+sum)
				})
				
				// 호수 출력
				if($('.bookingRoom').length > 0){
					$('.bookingRoom').each(function(index, item){
						// 예약 상태일 경우 호수 출력
						if($(item).children().eq(1).text() == '예약'){
							$.get("bookingRoomCode?roomTypeCode="+$(item).children().first().attr('id'), function(data){
								var roomCode = JSON.parse(data)
								var output = '<option value="">호수 선택</option>'; 
								$.each(roomCode, function(index, item){
									output += '<option>'+item.roomCode+'</option>'
								})
								$(item).children().last().html('<select class="inCode">'+output+'</select>')
							})
						
						// 예약 상태가 아닐 경우 호수 출력
						}else{
							$.get("bookingSearchRoom?booRoomCode="+$(item).children().last().attr('id'), function(data){
								$(item).children().last().text(data)
							})
						}
					})
				}
				
				// 체크인 처리
				$('#inBtn').click(function(){
					if($('.inCode').length > 0){
						$.each($('.inCode'), function(index, item){
							if($(item).val()){
								$.get("checkInAdd?roomCode="+$(item).val()
									+"&booRoomCode="+$(item).parent().attr('id'), function(){
									$(location).attr('href', 'bookingDetail?booCode='+booCode)
								})
							}
						})
					}
				})
			})
		</script>
	</head>
	<body>	
		<div class="topb">예약 상세</div>
		<div class="clearfix col-sm-12">
			<div class="text-right">
				<button id="payBtn" class="btn-default btn-sm">결제</button>
				<button id="inBtn" class="btn-default btn-sm">체크인</button>
				<button class="btn-default btn-sm">체크아웃</button>
				<button class="btn-default btn-sm">예약 취소</button>
			</div>
			<table class="bs">
				<tr>
					<th>예약 번호</th>
					<th>예약 상태</th>
					<th>예약일</th>
					<th>체크인 예정일</th>
					<th>숙박일</th>
					<th>인원</th>
					<th>유입경로</th>
					<th>등록자</th>
					<th>메모</th>
				</tr>
				<tr>
					<td id="booCode">${booking.booCode }</td>
					<td>${booking.booCondition }</td>
					<td>${booking.booDate }</td>
					<td>${booking.booIn }</td>
					<td>${booking.booNight }</td>
					<td>${booking.booCount }</td>
					<td>${booking.booPath }</td>
					<td>${booking.eId }</td>
					<td>${booking.booMemo }</td>
				</tr>
			</table>
		</div>
		<div class="clearfix col-sm-12">
			<div class="col-sm-6">
			<table class="bs">
				<tr>
					<th>객실 종류</th>
					<th>객실 예약 상태</th>
					<th>객실 이용금액</th>
					<th>호수</th>
				</tr>
				<c:forEach items="${bookingRoomList }" var="br">
					<tr class="bookingRoom">
						<td id="${br.booCode }">${br.roomTypeCode }</td>
						<td>${br.booRoomCondition }</td>
						<td class="rate">${br.booRoomRate }</td>
						<td id="${br.booRoomCode }" class="roomCode"></td>
					</tr>
				</c:forEach>
			</table>
			</div>
			<div class="col-sm-6">
				<table class="bs">
					<tr>
						<th>서비스명</th>
						<th>예약일</th>
						<th>서비스 상태</th>
						<th>서비스 이용금액</th>
					</tr>
					<c:forEach items="${bookingExtraList }" var="be">
						<tr>
							<td>${be.extraCode }</td>
							<td>${be.booExtraDate }</td>
							<td>${be.booExtraCondition }</td>
							<td class="rate">${be.booExtraRate }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="clearfix col-sm-12">
			<div class="col-sm-6">
				<table class="bs">
					<tr>
						<th>총 금액</th>
						<th>결제 금액</th>
						<th>잔금</th>
					</tr>
					<tr>
						<td id="sumRate">0</td>
						<td id="sumPay">${bookingPayment }</td>
						<td id="RMP"></td>
					</tr>
				</table>
			</div>
			<div class="col-sm-6">
				<table class="bs">
					<tr>
						<th>고객 번호</th>
						<th>고객명</th>
						<th>고객 성별</th>
						<th>국적</th>
						<th>연락처</th>
					</tr>
					<c:forEach items="${bookingGuestList }" var="bg">
						<tr>
							<td>${bg.gCode }</td>
							<td>${bg.gName }</td>
							<td>${bg.gGender }</td>
							<td>${bg.gNation }</td>
							<td>${bg.gPhone }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</body>
</html>
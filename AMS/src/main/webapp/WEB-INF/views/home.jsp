<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.js"></script>
		<script>
			$(function(){
				var rate = document.getElementById('rate').getContext('2d')
				var boo = document.getElementById('booking').getContext('2d')
				var percent = document.getElementById('percent').getContext('2d')
				
				// 최근 일주일 데이터 받아오기
				$.get("bookingWeek", function(data){
					var booking = JSON.parse(data)
					var bookingDate = []
					var bookingCount = []
					var bookingRoom = []
					var bookingExtra = []
					$(booking).each(function(index, item){
						var sum = 0
						bookingDate.push(item.booDate)
						bookingCount.push(item.booCount)
						bookingRoom.push(item.booIn)
						bookingExtra.push(item.booOut)
					})
					
					// 수익 차트
					var rateChart = new Chart(rate, {
						type : 'bar',
						data : {
							labels: bookingDate,
							datasets: [{
								label: '객실 수익',
								lineTension : 0,
								data: bookingRoom,
								backgroundColor : "rgba(153, 255, 51, 1)",
								hoverBackgroundColor : "rgba(189, 37, 113, 0.41)"
							} , {
								label: '서비스 수익',
								lineTension : 0,
								data: bookingExtra,
								backgroundColor : "rgba(255, 153, 0, 1)",
								hoverBackgroundColor : "rgba(34, 49, 186, 0.42)"
							}]
						}
					})
					
					// 예약 현황 차트
					var booChart = new Chart(boo, {
						type : 'line',
						data : {
							labels: bookingDate,
							datasets: [{
								label: '예약 개수',
								lineTension : 0,
								data: bookingCount,
								backgroundColor : "rgba(213,213,213,0.17)"
							}]
						}
					})					
				})		
				
				// 예약율 데이터 받아오기
				$.get("bookingPercent", function(data){
					var booCount = JSON.parse(data)
					$('#booPer').html(parseInt(booCount.normal / (booCount.normal + booCount.cancel)*100)+"%")
					$('#booTotal').html(booCount.normal + booCount.cancel + "개")
					$('#booRate').html(booCount.rate)
					$('#booRoomPer').html(booCount.percent+"%")
					// 예약율 차트
					var percentChart = new Chart(percent, {
						type : 'pie',
						data : {
							labels: ["정상", "취소"],
							datasets: [{
								backgroundColor : ["#3498db", "#F15F5F"],
								hoverBackgroundColor : ["#D1B2FF", "#A6A6A6"],
								data : [booCount.normal, booCount.cancel]
							}]
						}
					})
				})
				
			})
		</script>
	</head>
	<body>
		<div class="clearfix topb col-sm-12 top"></div>
		<div class="col-sm-6">
			<span class="topb">호텔 상황</span>
			<table class="bs">
				<tr>
					<th>누적 예약</th>
					<td id="booTotal"></td>
				</tr>
				<tr>
					<th>누적 예약율</th>
					<td id="booPer"></td>
				</tr>
				<tr>
					<th>누적 매출</th>
					<td id="booRate"></td>
				</tr>
				<tr>
					<th>객실 이용율</th>
					<td id="booRoomPer"></td>
				</tr>
			</table>
		</div>
		<div class="col-sm-6">
			<span class="topb">예약율</span>
			<canvas id="percent"></canvas>
		</div>
		<div class="col-sm-6">
			<span class="topb">최근 일주일 수익 현황</span>
			<canvas id="rate"></canvas>
		</div>
		<div class="col-sm-6">
			<span class="topb">최근 일주일 예약 현황</span>
			<canvas id="booking"></canvas>
		</div>
	</body>
</html>
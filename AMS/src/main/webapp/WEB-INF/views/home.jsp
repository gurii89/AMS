<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	$(document).ready(function(){
		mainClock();
	});

	function mainClock(){
		var clock = $('#clock')[0];
		var currentDate = new Date();
		var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate()
		var currentH = addZeros(currentDate.getHours(),2); 
		var currentM = addZeros(currentDate.getMinutes() ,2);
		var currentS =  addZeros(currentDate.getSeconds(),2);
		    
		clock.innerHTML = currentH+":"+currentM+":"+currentS;
		    
		setTimeout("mainClock()",1000);         // 1초마다 printClock() 함수 호출
		}

		function addZeros(num, digit) { // 자릿수 맞춰주기
			  var zero = '';
			  num = num.toString();
			  if (num.length < digit) {
			    for (i = 0; i < digit - num.length; i++) {
			      zero += '0';
			    }
			  }
			  return zero + num;
		}
</script>
</head>
<body>
	<div class="maina">${today}</div>
	<div id="clock"></div>
</body>
</html>
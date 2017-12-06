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
		    
		setTimeout("mainClock()",1000);         // 1�ʸ��� printClock() �Լ� ȣ��
		}

		function addZeros(num, digit) { // �ڸ��� �����ֱ�
			  var zero = '';
			  num = num.toString();
			  if (num.length < digit) {
			    for (i = 0; i < digit - num.length; i++) {
			      zero += '0';
			    }
			  }
			  return zero + num;
		}
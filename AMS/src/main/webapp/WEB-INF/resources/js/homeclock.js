
	function mainClock(currentDate){
		
		var currentDate = new Date(currentDate.setSeconds(currentDate.getSeconds() + 1));
		var currentH = addZeros(currentDate.getHours(), 2); 
		var currentM = addZeros(currentDate.getMinutes(), 2);
		var currentS = addZeros(currentDate.getSeconds(), 2);
		  
		$('#timecheck').text(currentH+":"+currentM+":"+currentS);
		    
	}

	function addZeros(num, digit) { 
		  var zero = '';
		  num = num.toString();
		  if (num.length < digit) {
		    for (i = 0; i < digit - num.length; i++) {
		      zero += '0';
		    }
		  }
		  return zero + num;
	}
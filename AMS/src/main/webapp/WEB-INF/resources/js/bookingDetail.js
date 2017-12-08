$(function(){
	// 이용 금액 합계, 잔금 계산 및 출력
	var sum = 0;
	var result;
	var booCode = $('#booCode').text();
	var booCon = $('#booCondition').text()
	$('#in').hide()
	$('#out').hide()
	
	// 가격 및 결제 금액 셋팅
	$('.rate').each(function(i, t){
		sum += Number($(this).text())
	})				
	$('#sumRate').text(sum)
	$('#RMP').text(eval(sum-$('#sumPay').text()))
	
	// 결제창으로 이동
	$('#payBtn').click(function(){
		if(booCon != '취소' && booCon != '퇴실'){
			$(location).attr('href', 'paymentAdd?booCode='+booCode+"&payTotal="+sum)
		}else{
			$(location).attr('href', 'paymentList?cate=boo_code&input='+booCode)
		}						
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
					
					// 조건 부합시 체크인 버튼 노출
					checkIn()
				})
			
			// 예약 상태가 아닐 경우 호수 출력
			}else{
				$.get("bookingSearchRoom?booRoomCode="+$(item).children().last().attr('id'), function(data){
					$(item).children().last().text(data)
				})
			}
		})
	}
	
	// 체크인 버튼 노출
	function checkIn(){
		$('.inCode').on('change', function(){						
			if($('.inCode').length > 0 && $('.bookingRoom').length > 0 && $('.bookingGuest').length > 0){
				var checkTest = 0;							
				$.each($('.inCode'), function(index, item){
					if($(item).val()){
						checkTest++									
					}
				})
				// 예약 객실수와 체크인 하려는 객실 수가 같을 때만 체크인 버튼 노출
				if($('.inCode').length == checkTest){
					$('#in').show()
				}else{
					$('#in').hide()
				}
			}
		})					
	}
	
	//체크인 처리
	$('#inBtn').click(function(){
		$.each($('.inCode'), function(index, item){
			if($(item).val()){
				$.get("checkInAdd?roomCode="+$(item).val()
					+"&booRoomCode="+$(item).parent().attr('id'), function(){
					location.reload()
				})
			}
		})
	})
	
	// 예약 취소
	$('#canBtn').click(function(){
		$(location).attr('href', 'bookingCancel?booCode='+$('#booCode').text())
	})
	
	// 고객 등록
	$('#guestBtn').click(function(){
		$(location).attr('href', 'guestAdd?booCode='+$('#booCode').text())
	})
	
	// 예약상태 아닐 경우 예약 버튼 삭제
	if(booCon != '예약'){
		$('#can').html('')
		$('#guest').html('')
	}
	
	// 조건 부합시 체크아웃 버튼 노출
	if($('#RMP').text() == 0){
		if(booCon == '입실' || !($('.bookingRoom').length) && booCon == '예약'){
			$('#out').show()
		}
	}
	
	//체크아웃 처리
	$('#outBtn').click(function(){
		$(location).attr('href', 'checkOutAdd?booCode='+$('#booCode').text())				
	})
})
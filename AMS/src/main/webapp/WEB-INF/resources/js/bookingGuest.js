$('document').ready(function(){
	var pagePerRow = 10;
	var bookingCount;
	var bookingLast;
	var bookingPage = 1;
	var bookingPrev = $('#bookingPrev') 
	var bookingNext = $('#bookingNext')
	
	var guestCount;
	var guestLast;
	var guestPage = 1;
	var guestPrev = $('#guestPrev') 
	var guestNext = $('#guestNext')
	
	// 예약 개수 구하기
	$.ajax({
		url:"bookingCount"
		, type:"GET"
		, success:function(data){
			bookingCount = data
			bookingLast = parseInt(data / pagePerRow);
			if((data % pagePerRow) != 0) {
	        	bookingLast += 1;
	        }
			bookingList()
		}
		, error:function(request, status, error){
			alert('실패');
		}
	})
	
	// 고객수 구하기
	$.ajax({
		url:"guestCount"
		, type:"GET"
		, success:function(data){
			guestCount = data
			guestLast = parseInt(data / pagePerRow);
			if((data % pagePerRow) != 0) {
	        	guestLast += 1;
	        }
			guestList()
		}
		, error:function(request, status, error){
			alert('실패');
		}
	})
	
	// 예약 목록 출력
	var bookingList = function(){
		$.ajax({
			url:"bookingGuestBooking"
			, type:"GET"
			, data:"currentPage="+bookingPage+"&pagePerRow="+pagePerRow
			, success:function(data){
				var result = JSON.parse(data)
				$('#booking').html('')
				for(var i=0; i<result.length; i++){
					$('#booking').append('<tr class="bookingBtn btn-default btn-sm"><td id="code">'+result[i].booCode+'</td><td>'+result[i].booDate+'</td><td>'
							+result[i].booIn+'</td><td>'+result[i].booNight+'</td><td>'+result[i].booCount+'</td></tr>')
				}
				bookingAfter()
				
			}
			, error:function(request, status, error){
				alert('실패');
			}
		})
	}
	
	// 고객 목록 출력
	var guestList = function(){
		$.ajax({
			url:"bookingGuest"
			, type:"GET"
			, data:"currentPage="+guestPage+"&pagePerRow="+pagePerRow
			, success:function(data){
				var result = JSON.parse(data)
				$('#guest').html('')
				for(var i=0; i<result.length; i++){
					$('#guest').append('<tr class="guestBtn btn-default btn-sm"><td id="code">'+result[i].gCode+'</td><td>'+result[i].gName+'</td><td>'
							+result[i].gGender+'</td><td>'+result[i].gNation+'</td><td>'+result[i].gPhone+'</td></tr>')
				}
				guestAfter()
				
			}
			, error:function(request, status, error){
				alert('실패');
			}
		})
	}
	
	var bookingAfter = function(){
		// 예약 페이징 버튼
		if(bookingPage > 1){
			bookingPrev.show()
		}else{
			bookingPrev.hide()
		}				
		if(bookingPage < bookingLast){
			bookingNext.show()
		}else{
			bookingNext.hide()
		}
		
		// 예약 번호 입력
		$('.bookingBtn').click(function(){
			$('#resultBooking').text($(this).children().first().text())
		})
	}
	
	var guestAfter = function(){
		// 고객 페이징 버튼
		if(guestPage > 1){
			guestPrev.show()
		}else{
			guestPrev.hide()
		}				
		if(guestPage < guestLast){
			guestNext.show()
		}else{
			guestNext.hide()
		}
		
		// 고객 번호 입력
		$('.guestBtn').click(function(){
			$('#resultGuest').text($(this).children().first().text())
		})
	}
	
	// 예약 목록 이전
	bookingPrev.click(function(){
		bookingPage--
		bookingList()
	})
	
	// 예약 목록 다음
	bookingNext.click(function(){
		bookingPage++
		bookingList()
	})
	
	// 고객 목록 이전
	guestPrev.click(function(){
		guestPage--
		guestList()
	})
	
	// 고객 목록 다음
	guestNext.click(function(){
		guestPage++
		guestList()
	})
	
	// 예약 고객 등록 처리
	$('#resultBtn').click(function(){
		if($('#resultBooking').text() && $('#resultGuest').text()){
			$.ajax({
				url:"bookingGuestAddPro"
				, type:"GET"
				, data:"booCode="+$('#resultBooking').text()+"&gCode="+$('#resultGuest').text()
				, success:function(data){
					if(data == "ok"){
						$(location).attr('href', 'bookingDetail?booCode='+$('#resultBooking').text())
					}else{
						$('#er').attr('class', 'text-danger')
						$('#er').text('고객 중복')
					}								
				}
				, error:function(request, status, error){
					alert('실패');
				}
			})
		}
	})				
})
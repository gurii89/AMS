$('document').ready(function(){
	var eventPrev = $('#event').html()
	var FX = 1
	var booNight = 1
	
	// 서비스 혹은 객실 하나 이상 등록시에만 예약 가능
	$('#btn').click(function(){
		if($('#booIn').val() && $('#booNight').val() && $('#booCount').val()){
			if($('.booRoom').length < 1 && $('.booExtra').length < 1){
				$('#er').html('객실 혹은 서비스 없이 예약 할 수 없음')
			}else{
				$('#frm').submit()
			}
		}
	})
	
	// 서비스 등록 폼 첨삭 처리
	var extraRS = $('#extra').html()
	$('#extra').html('')
	var extra = false
	var sum = Number($('#sum').text())
	
	$('#extraBtn').click(function(){	
		if(extra){
			$('#extra').html('')
			extra = false
		}else{
			$('#extra').html(extraRS)
			$('#room').html('')
			room = false
			// 서비스 임시 등록
			$('#submitExtra').click(function(){
				if($('#cateCode').val() && $('#extraCode').val() && $('#extraDate').val()){
					$.ajax({
						url:"bookingExtra"
						, type:"GET"
						, data:"extraCode="+$('#extraCode').val()+"&extraRate="+$('#extraRate').val()
								+"&extraDate="+$('#extraDate').val()
						, success:function(data){
							var result = JSON.parse(data)
							$('#extraTable').append('<tr class="booExtra"><td>'+$('#extraCode option:selected').text()
							+'</td><td>'+result.booExtraDate+'</td><td>'+result.booExtraRate+'</td></tr>')
							sum += Number(result.booExtraRate)
							$('#sum').text(sum)
							$('#extra').html('')
							extra = false										
						}
						, error:function(request, status, error){
							alert('실패');
						}
					})
				}
			})
			extra = true
			
			// 분류에 따른 서비스 출력
			$('#cateCode').on('change', function(){
				if($('#cateCode').val()){
					$.ajax({
						url:"extraName"
						, type:"GET"
						, data:'cateCode='+$('#cateCode').val()
						, success:function(data){
							var result = JSON.parse(data)
							$('#extraCode').html('<option value="">서비스 선택</option>')
							for(var i=0; i<result.length; i++){
								$('#extraCode').append('<option class="input-sm" value='+result[i].extraCode+' id="'+result[i].extraRate+'">'+result[i].extraName+'</option>')
							}
						}
						, error:function(request, status, error){
							alert('실패');
						}
					});
				}
			})
			
			// 서비스 이용 금액 출력	
			$('#extraCode').on('change', function(){
				if($('#extraCode').val()){
					$('#extraRate').val($('#extraCode option:selected').attr('id'))
				}
			})
		}
	})
	
	// 객실 등록 폼 첨삭 처리
	var roomRS = $('#room').html()
	$('#room').html('')
	var room = false
	
	$('#roomBtn').click(function(){	
		// 체크인 예정일과 숙박일 먼저 선택하도록
		if(!($('#booIn').val()) || !($('#booNight').val())){
			$('#er').html('체크인 예정일과 숙박일 먼저 입력')
			return
		}
		if(room){
			$('#room').html('')
			room = false
		}else{
			$('#room').html(roomRS)
			$('#extra').html('')
			extra = false
			// 객실 임시 등록
			$('#submitRoom').click(function(){
				if($('#roomTypeCode').val()){
					$.ajax({
						url:"bookingRoom"
						, type:"GET"
						, data:'roomTypeCode='+$('#roomTypeCode').val()+'&roomRate='+$('#roomRate').val()
						, success:function(data){
							var result = JSON.parse(data)
							$('#roomTable').append('<tr class="booRoom"><td>'+$('#roomTypeCode option:selected').text()+'</td><td>'
							+result.booRoomRate+'</td></tr>')
							sum += Number(result.booRoomRate)
							$('#sum').text(sum)
							$('#room').html('')
							room = false
							// 객실 임시 등록 후 숙박일 체크인 예정일 변경 불가
							$('#booIn').attr('readonly', 'readonly')
							$('#booNight').attr('readonly', 'readonly')
							// 객실 임시 등록 후 행사가 변경 불가
							$('#event').html('<input type="hidden" id="FX" value="'+$('#FX').val()+'">조정불가')
						}
						, error:function(request, status, error){
							alert('실패');
						}
					});
				}
			})
			room = true
			
			// 객실 이용 금액 출력	
			$('#roomTypeCode').on('change', function(){
				if($('#roomTypeCode').val()){
					var night = $('#booNight').val()
					if(!$.isNumeric(night)){
						night = 1
					}
					var roomSum = $('#FX').val()*$('#roomTypeCode option:selected').attr('id')*night
					$('#roomRate').val(roomSum)
				}
			})						
		}
	})
	
	// 행사가 확인 함수
	function eventCheck(){
		$.get("eventCheck?someday="+$('#booIn').val(), function(data){
			// 행사 있을 경우 행사가만 출력
			if(data){
				var result = JSON.parse(data)
				$('#event').html('<input type="hidden" id="FX" value="'+result.eventFx+'">조정불가')
				nightCheck()
				eventChange()				
			// 행사 없을 경우 기본 행사 출력
			}else{
				$('#event').html(eventPrev)
				eventChange()
				$('#FX').on('change', function(){
					nightCheck()
					eventChange()					
				})
				
			}
		})
	}
	
	// 오늘 날짜 행사 확인
	eventCheck()
	
	// 체크인 예정일 변경시 행사가 확인
	$('#booIn').on('change', function(){
		eventCheck()
	})
	
	// 행사 적용폭 변경시 가격 변경 함수
	function eventChange(){		
		// 이용금액 초기화(2배 했을 경우 0.5배 하도록)
		if(FX != 1){
			FX = 1/FX
		}
		// 총합 이용금 초기화
		$('#sum').html(0)
		// 객실 이용금액 더하기
		$.each($('.booRoom'), function(index, item){
			var result = $(item).children().last().html()*$('#FX').val()*FX*booNight
			$(item).children().last().html(result)
			$('#sum').html(Number($('#sum').html())+Number($(item).children().last().html()))
		})
		// 서비스 이용금액 더하기
		$.each($('.booExtra'), function(index, item){
			$('#sum').html(Number($('#sum').html())+Number($(item).children().last().html()))
		})
		// 임시 객실 등록 폼 가격 변수 연동
		if($('#roomRate').val()){
			$('#roomRate').val($('#roomRate').val()*$('#FX').val()*FX*booNight)
		}
		FX = $('#FX').val()
		booNight = $('#booNight').val()
	}
	
	// 숙박일 변경시 가격 변경
	$('#booNight').on('change', function(){
		nightCheck()
		eventChange()
	})
	
	// 숙박일 체크 함수
	function nightCheck(){
		if(!$('#booNight').val()){
			if(booNight > 0){
				booNight = 1 / booNight
			}else{
				booNight = 1
			}
		}else if(!$.isNumeric($('#booNight').val())){
			if(booNight > 0){
				booNight = 1 / booNight
			}else{
				booNight = 1
			}
			$('#er').html('숙박일은 숫자로 입력')
			$('#booNight').val('')
			$('#booNight').focus()
		}else if($.isNumeric($('#booNight').val())){
			if(booNight > 0){
				booNight = $('#booNight').val() / booNight
				
			}else{
				booNight = $('#booNight').val()
			}
		}
	}
	
})
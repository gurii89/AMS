$('document').ready(function(){
	var eventStart =  $('#eventStart').val()
	var eventEnd = $('#eventEnd').val()
	
	// 시작일 변경시 중복 체크
	$('#eventStart').on('change', function(){
		eventStart =  $('#eventStart').val()
		dateCheck(eventStart)
	})
	
	// 종료일 변경시 중복 체크
	$('#eventEnd').on('change', function(){
		eventEnd = $('#eventEnd').val()
		dateCheck(eventEnd)
	})
	
	// 행사일 중복체크 처리
	function dateCheck(input){
		if(input){
			$.get("eventCheck?someday="+input, function(data){
				if(data){
					$('#er').html('행사 날짜 중복')
					$('#eventStart').val('')
					$('#eventEnd').val('')
				}
			})
		}
	}
	
	$('#btn').click(function(){
		if($('#eventFx').val()){			
			if(eventStart && eventEnd){
				$('#frm').submit()

			// 기본 행사 fx 중복체크
			}else{
				$.get("eventFx?eventFx="+$('#eventFx').val(), function(data){
					if(data == 'ok'){
						$('#frm').submit()
					}else{
						$('#er').html('기본 행사 증감폭 중복불가')
					}
				})
			}
		}else{
			$('#erFx').html('필수 입력')
		}
	})
})
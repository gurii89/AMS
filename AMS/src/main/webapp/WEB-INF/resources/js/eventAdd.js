$('document').ready(function(){	
	$('#btn').click(function(){
		if($('#eventFx').val() != ''){
			var eventStart =  $('#eventStart').val()
			var eventEnd = $('#eventEnd').val()
			if(eventStart != '' && eventEnd != ''){
				$.ajax({
					url:"eventCheck"
					, type:"GET"
					, data:"eventStart="+eventStart+"&eventEnd="+eventEnd
					, success:function(data){
						if(data == 'ok'){
							$('#frm').submit()
						}else{
							$('#er').html('행사 기간을 확인')
						}			
					}
					, error:function(request, status, error){
						alert('실패');
					}
				})	
			}else{
				$.ajax({
					url:"eventFx"
					, type:"GET"
					, data:"eventFx="+$('#eventFx').val()
					, success:function(data){
						if(data == 'ok'){
							$('#frm').submit()
						}else{
							$('#er').html('기본 행사 증감폭 중복불가')
						}			
					}
					, error:function(request, status, error){
						alert('실패');
					}
				})
			}
		}else{
			$('#erFx').html('필수 입력')
		}
	})
})
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
							$('#er').html('행사 기간을 확인해주세요')
						}			
					}
					, error:function(request, status, error){
						alert('실패');
					}
				})	
			}else{
				$('#frm').submit()
			}
		}else{
			$('#erFx').html('필수 입력')
		}
	})
})
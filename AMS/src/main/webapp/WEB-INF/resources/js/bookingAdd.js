$('document').ready(function(){				
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
				if($('#cateCode').val() != '' && $('#extraCode').val() != '' && $('#extraDate').val() != ''){
					$.ajax({
						url:"bookingExtra"
						, type:"GET"
						, data:"extraCode="+$('#extraCode').val()+"&extraRate="+$('#extraRate').val()
								+"&extraDate="+$('#extraDate').val()
						, success:function(data){
							var result = JSON.parse(data)
							$('#extraTable').append('<tr><td>'+$('#extraCode option:selected').text()
							+'</td><td>'+result.extraDate+'</td><td>'+result.extraRate+'</td></tr>')
							sum += Number(result.extraRate)
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
				if($('#cateCode').val() != null){
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
				if($('#extraCode').val() != ''){
					var extraSum = $('#extraCode option:selected').attr('id')
					$('#extraRate').val(extraSum)
				}
			})
		}
	})
	
	// 객실 등록 폼 첨삭 처리
	var roomRS = $('#room').html()
	$('#room').html('')
	var room = false
	
	$('#roomBtn').click(function(){	
		if(room){
			$('#room').html('')
			room = false
		}else{
			$('#room').html(roomRS)
			$('#extra').html('')
			extra = false
			// 객실 임시 등록
			$('#submitRoom').click(function(){
				if($('#roomTypeCode').val() != ''){
					$.ajax({
						url:"bookingRoom"
						, type:"GET"
						, data:'roomTypeCode='+$('#roomTypeCode').val()+'&roomSize='+$('#roomSize').val()
						, success:function(data){
							var result = JSON.parse(data)
							$('#roomTable').append('<tr><td>'+$('#roomTypeCode option:selected').text()+'</td><td>'
							+result.roomSize+'</td></tr>')
							sum += Number(result.roomSize)
							$('#sum').text(sum)
							$('#room').html('')
							room = false
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
				if($('#roomTypeCode').val() != ''){
					var roomSum = Number($('#FX').val())*Number($('#roomTypeCode option:selected').attr('id'))
					$('#roomSize').val(roomSum)
				}
			})						
		}
	})
})
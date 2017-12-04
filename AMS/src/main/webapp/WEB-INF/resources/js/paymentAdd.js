$(function(){
	var sum = Number($('#usePay').text());
	$('#payTotal').text(sum)
	// 결제 금액 총합
	$.each($('.pay'), function(index, item){
		if($(item).children().eq(1).text() == '결제'){
			sum -= Number($(item).children().eq(3).text())
			$('#payTotal').text(sum)
		}
	})
	
	// 이용금액보다 결제금액이 클 경우 결제 불가
	$('#pRate').on('change', function(){
		if($(this).val() > parseInt($('#payTotal').text())){
			$('#er').text('결제금액이 잔금보다 큼')
			$(this).val('')
			.focus()
		}
	})
	
	// 결제 줄 클릭시 취소 팝업 생성 확인시 취소
	$('.pay').click(function(){
		if($(this).children().eq(1).text() == '결제'){
			var test = confirm('결제를 취소하시겠습니까?')
			if(test){
				$.get('paymentCancel?pCode='+$(this).children().first().text(), function(){
					 location.reload()
				})
			}	
		}
	})
	
	// 결제 등록
	$('#btn').click(function(){
		if($('#pRate') && $('#pMethod')){
			$('form').attr('onsubmit', 'return false');
			$.ajax({
				url:"paymentAdd",
				type:"POST",
				data:$('form').serialize(),
				success:function(){
					location.reload()
				}
			})
		}
	})
	
	// 예약 상세로 돌아가기
	$('#back').click(function(){
		$(location).attr('href', 'bookingDetail?booCode='+$('#booCode').val())
	})
})
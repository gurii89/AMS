$(function(){
	var condi = $('#condi').html()
	$('#cate').on('change', function(){
		$('#condi').html(condi)
		var val = $('#cate option:selected').val()
		// 날짜 검색 선택시 input tpye date로 변경
		if(val == 'boo_date' || val == 'boo_in'){
			$('#input').attr('type', 'date');
		// 숙박일 선택시 1박 초과된 건만 되도록
		}else if(val == 'boo_out'){
			$('#input').attr('type', 'hidden')
			$('#input').val('night')
		// 예약 상태 선택시 셀렉트 중 선택
		}else if(val == 'boo_condition'){
			var roomCondition = ['예약', '입실', '퇴실', '취소']
			var result = '';
			for(i=0; i<roomCondition.length; i++){
				result += '<option class="input-sm">'+roomCondition[i]+'</option>'
			}
			$('#condi').html('<select name="input" class="input-sm">'+result+'<select>')
		}else{
			$('#input').attr('type', 'text');
			$('#input').val('')
		}
	})
	
	// 예약 줄 선택시 상세보기로 이동
	$('.boo').click(function(){
		var booCode = $(this).children().first().text()
		$(location).attr('href', 'bookingDetail?booCode='+Number(booCode));
	})
})
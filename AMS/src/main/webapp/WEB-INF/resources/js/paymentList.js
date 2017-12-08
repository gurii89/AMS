$(function(){
	var condi = $('#condi').html()
					
	$('#cate').on('change', function(){
		var val = $('#cate option:selected').val()
		$('#condi').html(condi)
		// 검색조건 결제일 선택시 input type date로
		if(val == 'p_date'){
			$('#input').attr('type', 'date')
		//
		}else if(val == 'p_condition'){
			var pCon = ['결제', '취소']
			var result = '';
			for(i=0; i<pCon.length; i++){
				result += '<option class="input-sm">'+pCon[i]+'</option>'
			}
			$('#condi').html('<select name="input" class="input-sm">'+result+'<select>')
		}else if(val == 'p_method'){
			var pMet = ['cash', 'card', 'etc']
			var result = '';
			for(i=0; i<pMet.length; i++){
				result += '<option class="input-sm">'+pMet[i]+'</option>'
			}
			$('#condi').html('<select name="input" class="input-sm">'+result+'<select>')
		}else{
			$('#input').attr('type', 'text')
			$('#input').val('')
		}
	})
	
	// 클릭시 결제 취소 팝업 생성 확인시 취소
	$('tr').click(function(){
		if($(this).children().eq(1).text() == '결제'){
			var test = confirm('결제를 취소하시겠습니까?')
			if(test){
				$(location).attr('href', 'paymentCancel?pCode='+$(this).children().first().text())
			}	
		}
	})
})
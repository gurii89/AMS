$(function(){
	var condi = $('#condi').html()
			
	// 검색조건 변경시 검색창 연동
	$('#cate').on('change', function(){
		input()
	})
	
	// 초기 검색창 연동
	if(condi){
		input()
	}
	
	// 검색조건 검색창 연동 함수
	function input(){
		var val = $('#cate option:selected').val()
		$('#condi').html(condi)
		// 검색조건 결제일 선택시 input type date로
		if(val == 'p_date'){
			$('#input').attr('type', 'date')
		//결제 상태 선택시 select로
		}else if(val == 'p_condition'){
			var pCon = ['결제', '취소']
			var result = '';
			for(i=0; i<pCon.length; i++){
				result += '<option class="input-sm">'+pCon[i]+'</option>'
			}
			$('#condi').html('<select name="input" class="input-sm">'+result+'<select>')
		//결제 방법 선택시 select로
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
	}
	
})
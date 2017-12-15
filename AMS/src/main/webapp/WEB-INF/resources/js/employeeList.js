$(function(){
	var condi = $('#condi').html()
	
	// 목록 클릭시 상세보기로 이동
	$('.employee').click(function(){
		$(location).attr('href', 'employeeDetail?eId='+$(this).children().first().html())
	})
	
	// 페이지 진입시 검색조건과 검색창 연동
	if(condi){
		input()
	}
	
	$('#cate').on('change', function(){
		input()
	})
	
	// 검색 조건과 검색창 연동
	function input(){
		var val = $('#cate').val()
		
		// 검색 조건 외국어 선택시 외국어 있는 직원만 나오게
		if(val == 'employee.e_language'){
			$('#condi').html(condi)
			$('#input').attr('type', 'hidden')
			$('#input').val('language')
		// 검색 조건 부서 선택시
		}else if(val == 'employee.e_department'){
			var depart = ['manager', 'front', 'clean']
			var result = '<select name="input" id="input" class="input-sm" required>'
			for(i=0; i<depart.length; i++){
				result += '<option class="input-sm">'+depart[i]+'</option>'
			}
			$('#condi').html(result+'</select>')
		// 검색 조건 나라 선택시
		}else if(val == 'nat.cate_code'){
			$('#condi').html(condi)
			$('#input').attr('type', 'hidden')
			$('#input').val('nation')
		}else{
			$('#condi').html(condi)
			$('#input').val('')
		}
	}
	
})
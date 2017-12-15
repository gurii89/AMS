$(function(){
	$('#addBox').hide()
	$('#level').hide()
	
	// 예약 고객 등록시 간소화 메뉴 및 고객 등록 버튼 활성화
	if($('#booCode').val()){
		$('.addForm').hide()
		$('#addBox').show()
		// 고객 선택시 번호 체크
		$('.guest').click(function(){
			$('#addNum').html($(this).children().first().html())
			// 고객 등록
			$('#addBtn').click(function(){
				$(location).attr('href', 'bookingGuestAddPro?gCode='+$(this).prev().html()
								+'&booCode='+$('#booCode').val())
			})
		})				
	// 예약 목록 때 고객 선택시 수정 폼으로 이동(프론트일 때만)
	}else{
		if($('#level').html() == 'front'){
			$('.guest').click(function(){
				$(location).attr('href', 'guestMod?gCode='+$(this).children().first().html())
			})	
		}
	}
	
	// 검색 조건 따라 검색창 변경
	$('#cate').on('change', function(){
		input()
	})
	
	// 초기 검색조건 검색창 연동
	if(condi){
		input()
	}
	
	// 검색조건 검색창 연동 함수
	function input(){
		var val = $('#cate option:selected').val()
		// 검색조건 등록일, 생년월일 선택시 날짜검색창
		if(val == 'g_date' || val == 'g_birthdate'){
			$('#input').attr('type', 'date')
		// 검색창 기본값
		}else{
			$('#input').attr('type', 'text')
			$('#input').val('')
		}
	}
	
})
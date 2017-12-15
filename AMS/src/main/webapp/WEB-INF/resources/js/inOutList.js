$(function(){
	var condi = $('#condi').html()
	
	// 행 선택시 예약 상세보기 이동
	$('.inOut').click(function(){
		$(location).attr('href', 'bookingDetail?booCode='+$(this).children().first().text())
	})
	
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
		var val = $('#cate').val()
		// 검색 조건 날짜 선택시 날짜 입력 가능하게
		if(val == 'chin.e_name' || val == 'chout.e_name' || val == ''){
			$('#condi').html(condi)
			$('#input').val('')
		}else{
			$('#input').attr('type', 'date')						
		}
	}
})
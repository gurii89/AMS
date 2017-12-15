$(function(){				
	// 비번 변경
	$('#pwChange').click(function(){
		if($('#now').val() && $('#after').val()){
			$.get("employeePw?now="+$('#now').val()+'&after='+$('#after').val(), function(data){
				if(data > 0){
					location.reload()
				}else{
					$('#er').html('비밀번호 불일치')
					$('#now').val('')
					$('#after').val('')
				}
			})
		}else{
			$('#er').html('비밀번호를 입력하세요')
		}
	})
	
	// 직원 수정 화면 이동
	$('#empMod').click(function(){
		$(location).attr('href', 'employeeMod?eId='+$('#eId').html())
	})
})
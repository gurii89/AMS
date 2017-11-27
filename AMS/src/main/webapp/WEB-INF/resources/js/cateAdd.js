$('document').ready(function(){
	var largeCheck = true
	// 대분류 직접 버튼 클릭시 직접 입력창 생성
	$('#btnLarge').click(function(){
		$('#large').html('<input type="text" name="cateLarge" id="cateLarge" class="input-sm">')
		$('#small').html('<input type="text" name="cateSmall" id="cateSmall" class="input-sm">')
		$('#btnLarge').html('')
		$('#btnSmall').html('')
		largeCheck = false
	});
	// 소분류 직적 입력 버튼 클릭시 직접 입력창 생성
	$('#btnSmall').click(function(){
		$('#small').html('<input type="text" name="cateSmall" id="cateSmall" class="input-sm">')
		$('#btnSmall').html('')
	})
	// 대분류 선택시 소분류 출력
	$('#cateLarge').click(function(){
		if(largeCheck && $('#cateLarge').val()){
			// 유효한 대분류 선택시 초기값
			$('#btnLarge').html('')
			$('#btnSmall').html('직접 입력')
			$('#cateSmall').html('<option class="input-sm" value="">선택하세요</option>')
			$.ajax({
				url:"cateSmall",
				type:"GET",
				data:"large="+ $('#cateLarge').val(),
				success:function(data){
					var small = JSON.parse(data)							
					// 대분류 하위 소분류 옵션으로 추가
					for(var i=0; i<small.length; i++){
						$('#cateSmall').append('<option class="input-sm" value="'+small[i].cateSmall+'">'+small[i].cateSmall+'</option>')
					}
				},
				error:function(request, status, error){
					//alert("실패");
				}
			});
		// 유효하지 않은 대분류 선택시 소분류 초기화
		}else if($('#cateLarge').val() == ""){
			$('#small').html('<select name="cateSmall" id="cateSmall" class="input-sm">'
							+'<option class="input-sm" value="">대분류를 선택하세요</option></select>')
			$('#btnLarge').html('직접 입력')
			$('#btnSmall').html('')
			largeCheck = true
		}
	})
	$('#btn').click(function(){
		// 모든 항목이 입력 되었는지 확인
		if($('#cateLarge').val() && $('#cateSmall').val() && $('#cateName').val()){
			//카테고리명 중복 검사, 중복 없을 경우에만 전송
			$.ajax({
				url:"cateNameCheck",
				data:"name="+ $('#cateName').val()+"&small="+$('#cateSmall').val(),
				success:function(data){
					if(data == "ok"){
						$('#frm').submit()
					}else{						
						$('#er').html('카테고리명은 중복될 수 없습니다')
						$('#cateName').focus()
					}
				},
				error:function(request, status, error){
					//alert("실패");
				}
			});
		}
	})
})
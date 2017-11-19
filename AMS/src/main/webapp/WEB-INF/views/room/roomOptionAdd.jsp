<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	$('document').ready(function(){
		$('#cateLarge').click(function(){
			$('#cateSmall').html('<option value="">선택하세요</option>')
			$.ajax({
				url:"roomOptionCateSamll",
				type:"GET",
				data:"large="+$('#cateLarge').val(),
				success: function(data) {
					var optionName = JSON.parse(data)
					//console.log(optionName);
					for(var i=0; i<optionName.length; i++){
						$('#cateSmall').append('<option value="'+optionName[i].cateCode+'">'+optionName[i].cateName+'</option>')
					}
				  },
				fail: function(request, status, error){
					alert("실패");
				}
			})
		});
		$('#btn').click(function(){
			$.ajax({
				url:"optionCheck",
				type:"GET",
				data:"cateCode="+$('#cateLarge').val()+"&roomTypeCode="+$('#rt').val(),
				success:function(data){
					if(data == "ok"){
						alert(data+'등록이 완료되었습니다.')
						$('#f').submit()
					}else{
						alert(data+'이미 등록된 특징입니다.')
					}
				},
				error:function(request, status, error){
				}
			});
		})
	})
</script>
</head>

<body>   
	<div class="topb">객실 특징</div>
	<form action="roomOptionAdd" method="post" class="form-horizontal" id="f">
		<div class="formb">객실 타입 코드 :
			<input type="text" value="${rtcode}" name="roomTypeCode" readonly="readonly" class="input-sm" id="rt">
		</div>
		<div class="formb">등록인 :
	 		<input type="text" value="${loginfor.eId}" name="eId" readonly="readonly" class="input-sm">
	 	</div>
		<div class="formb">
			객실 특징 분류: <select name="cateLarge" class="input-sm" required id="cateLarge">
				<option value="">선택하세요</option>
				<c:forEach items="${roomOptionCatelarge}" var="rtcate">
	 				<option value="${rtcate.cateSmall}">${rtcate.cateSmall}</option>
	 			</c:forEach>
			</select>
		</div>
		<div class="formb">
			객실 특징 명: <select name="cateCode" class="input-sm" required id="cateSmall">
				<option value="">분류를 선택하세요</option>
			</select>
		</div>
		<input type="button" value="등록" class="btn-default btn-sm" id="btn">
	</form>			
</body>
</html>
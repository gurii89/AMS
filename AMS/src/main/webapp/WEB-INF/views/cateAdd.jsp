<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
		$('document').ready(function(){
			var largeCheck = true
			// 대분류 직접 버튼 클릭시 직접 입력창 생성
			$('#btnLarge').click(function(){
				$('#large').html('<input type="text" name="cateLarge" id="cateLarge">');
				largeCheck = false
			});
			// 소분류 직적 입력 버튼 클릭시 직접 입력창 생성
			$('#btnSmall').click(function(){
				$('#small').html('<input type="text" name="cateSmall" id="cateSmall">')
			})
			// 대분류 선택시 소분류 출력
			$('#cateLarge').click(function(){
				if(largeCheck && $('#cateLarge').val() != ""){
					// 유효한 대분류 선택시 초기값
					$('#cateSmall').html('<option value="">선택하세요</option>')
					$.ajax({
						url:"cateSmall",
						type:"GET",
						data:"large="+ $('#cateLarge').val(),
						success:function(data){
							var small = JSON.parse(data)							
							// 대분류 하위 소분류 옵션으로 추가
							for(var i=0; i<small.length; i++){
								$('#cateSmall').append('<option value="'+small[i].cateSmall+'">'+small[i].cateSmall+'</option>')
							}
						},
						error:function(request, status, error){
							//alert("실패");
						}
					});
				// 유효하지 않은 대분류 선택시 소분류 초기화
				}else if($('#cateLarge').val() == ""){
					$('#cateSmall').html('<option value="">대분류를 선택하세요</option>')
				}
			})
			$('#btn').click(function(){
				// 모든 항목이 입력 되었는지 확인
				if($('#cateLarge').val() != "" && $('#cateSmall').val() != "" && $('#cateName').val() != ""){					
					//카테고리명 중복 검사, 중복 없을 경우에만 전송
					$.ajax({
						url:"cateNameCheck",
						type:"GET",
						data:"name="+ $('#cateName').val(),
						success:function(data){
							if(data == "ok"){
								$('#frm').submit()
							}else{
								alert('중복된 이름입니다')
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
	</script>
</head>
<body>
	<form action="cateAdd" method="post" id="frm">
		<div>
			대분류 : 
			<span id="large">
				<select name="cateLarge" id="cateLarge">
					<option value="">선택하세요</option>
					<c:forEach items="${list }" var="large">
						<option value="${large.cateLarge }">${large.cateLarge }</option>
					</c:forEach>
				</select>
			</span>
			<span id="btnLarge">직접 입력</span>
		</div>
		<div>
			소분류 : 
			<span id="small">
				<select name="cateSmall" id="cateSmall">
					<option value="">대분류를 선택하세요</option>
				</select>
			</span>
			<span id="btnSmall">직접 입력</span>
		</div>
		<div>
			카테고리명 : 
			<span id="name"><input type="text" name="cateName" id="cateName"></span>
		</div>		
		<div>
			<input type="button" id="btn" value="등록">
		</div>
	</form>
</body>
</html>
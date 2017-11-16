<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/css.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script>
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
					if(largeCheck && $('#cateLarge').val() != ""){
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
					if($('#cateLarge').val() != "" && $('#cateSmall').val() != "" && $('#cateName').val() != ""){					
						//카테고리명 중복 검사, 중복 없을 경우에만 전송
						$.ajax({
							url:"cateNameCheck",
							type:"GET",
							data:"name="+ $('#cateName').val()+"&small="+$('#cateSmall').val(),
							success:function(data){
								if(data == "ok"){
									$('#frm').submit()
								}else{
									alert(data+'중복된 이름입니다')
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
		<div class="container-fluid">
			<div class="row content">
				<c:import url="/WEB-INF/views/division/left.jsp" />
				<c:import url="/WEB-INF/views/division/top.jsp" />			
				<div class="col-sm-10 top">
					<div class="topb">분류 등록</div> 
					<form action="cateAdd" class="form-horizontal" method="post" id="frm">
						<div class="formb">
							대분류 : 
							<span id="large">
								<select name="cateLarge" id="cateLarge" class="input-sm">
									<option class="input-sm" value="">선택하세요</option>
									<c:forEach items="${cateList }" var="large">
										<option class="input-sm" value="${large.cateLarge }">${large.cateLarge }</option>
									</c:forEach>
								</select>
							</span>
							<span id="btnLarge">직접 입력</span>
						</div>
						<div class="formb">
							소분류 : 
							<span id="small">
								<select name="cateSmall" id="cateSmall" class="input-sm">
									<option class="input-sm" value="">대분류를 선택하세요</option>
								</select>
							</span>
							<span id="btnSmall"></span>
						</div>
						<div class="formb">
							카테고리명 : 
							<span id="name"><input type="text" name="cateName" id="cateName" class="input-sm"></span>
						</div>		
						<div class="formb">
							<input type="button" id="btn" class="btn-default btn-sm" value="등록" >
						</div>
					</form>
				</div>				 
				<c:import url="/WEB-INF/views/division/right.jsp" />	
			</div>
		</div>	
	</body>
</html>
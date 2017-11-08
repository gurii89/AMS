<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/css.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
		$('document').ready(function(){
			var largeCheck = true
			// 대분류 직접 버튼 클릭시 직접 입력창 생성
			$('#btnLarge').click(function(){
				$('#large').html('<input type="text" name="cateLarge" id="cateLarge">')
				$('#small').html('<input type="text" name="cateSmall" id="cateSmall">')
				$('#btnLarge').html('')
				$('#btnSmall').html('')
				largeCheck = false
			});
			// 소분류 직적 입력 버튼 클릭시 직접 입력창 생성
			$('#btnSmall').click(function(){
				$('#small').html('<input type="text" name="cateSmall" id="cateSmall">')
				$('#btnSmall').html('')
			})
			// 대분류 선택시 소분류 출력
			$('#cateLarge').click(function(){
				if(largeCheck && $('#cateLarge').val() != ""){
					// 유효한 대분류 선택시 초기값
					$('#btnLarge').html('')
					$('#btnSmall').html('직접 입력')
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
					$('#small').html('<select name="cateSmall" id="cateSmall">'
									+'<option value="">대분류를 선택하세요</option></select>')
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
 <style>
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 550px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      
      background-image: linear-gradient(to top, #accbee 0%, #e7f0fd 100%);
      height: 150%;
    }
    .top{
    	background-color: #ffffff;
    	height: 13%;
    }
    .right{
    	background-image: linear-gradient(to top, #a3bded 0%, #6991c7 100%);
    }    
  </style>
<body>

   <div class="container-fluid">
      <div class="row content">
      
<!-- ////////////////////////////////////왼쪽 메뉴 시작///////////////////////////////////////// -->     
<%@ include file= "division/left.jsp"%>
<!-- ////////////////////////////////////왼쪽 메뉴 끝///////////////////////////////////////// -->
<!-- ////////////////////////////////////상단 메뉴 시작///////////////////////////////////////// -->
<%@ include file= "division/top.jsp"%>
<!-- ////////////////////////////////////상단 메뉴 끝///////////////////////////////////////// -->	
<!-- ////////////////////////////////////가운데 메뉴 시작///////////////////////////////////////// -->			
			 <div class="col-sm-10 top">
			 <h3>카테고리 등록</h3> 
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
			<span id="btnSmall"></span>
		</div>
		<div>
			카테고리명 : 
			<span id="name"><input type="text" name="cateName" id="cateName"></span>
		</div>		
		<div>
			<input type="button" id="btn" value="등록">
		</div>
	</form>
			 </div>
<!-- ////////////////////////////////////가운데 메뉴 끝///////////////////////////////////////// -->	
<!-- ////////////////////////////////////오른쪽 메뉴 시작///////////////////////////////////////// -->				 
<%@ include file= "division/right.jsp"%>
<!-- ////////////////////////////////////오른쪽 메뉴 끝///////////////////////////////////////// -->	         
		</div>
	</div>
	
</body>
</html>
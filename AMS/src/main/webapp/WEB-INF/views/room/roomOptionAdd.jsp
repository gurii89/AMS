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
			});
		})
	})
</script>
</head>

<body>

   <div class="container-fluid">
      <div class="row content">
      
<!-- ////////////////////////////////////왼쪽 메뉴 시작///////////////////////////////////////// -->     
<c:import url="/WEB-INF/views/division/left.jsp" />
<!-- ////////////////////////////////////왼쪽 메뉴 끝///////////////////////////////////////// -->
<!-- ////////////////////////////////////상단 메뉴 시작///////////////////////////////////////// -->
<c:import url="/WEB-INF/views/division/top.jsp" />
<!-- ////////////////////////////////////상단 메뉴 끝///////////////////////////////////////// -->	
<!-- ////////////////////////////////////가운데 메뉴 시작///////////////////////////////////////// -->
			<div class="col-sm-10 top">
				<div class="topb">객실 특징</div>
				<form action="roomOptionAdd" method="post" class="form-horizontal">
					<div class="formb">객실 타입 코드 :
						<input type="text" value="${rtcode}" name="roomTypeCode" readonly="readonly" class="input-sm">
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
					<input type="submit" value="등록" class="btn-default btn-sm">
				</form>
			</div>
			<!-- ////////////////////////////////////가운데 메뉴 끝///////////////////////////////////////// -->	
<!-- ////////////////////////////////////오른쪽 메뉴 시작///////////////////////////////////////// -->				 
<c:import url="/WEB-INF/views/division/right.jsp" />
<!-- ////////////////////////////////////오른쪽 메뉴 끝///////////////////////////////////////// -->	         
		</div>
	</div>
	
</body>
</html>
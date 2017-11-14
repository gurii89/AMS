<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/css.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>

   <div class="container-fluid">
      <div class="row content">
      
<!-- ////////////////////////////////////왼쪽 메뉴 시작///////////////////////////////////////// -->     
<%@ include file= "../division/left.jsp"%>
<!-- ////////////////////////////////////왼쪽 메뉴 끝///////////////////////////////////////// -->
<!-- ////////////////////////////////////상단 메뉴 시작///////////////////////////////////////// -->
<%@ include file= "../division/top.jsp"%>
<!-- ////////////////////////////////////상단 메뉴 끝///////////////////////////////////////// -->	
<!-- ////////////////////////////////////가운데 메뉴 시작///////////////////////////////////////// -->			
			<div class="col-sm-10 top">
			<div class="topb">객실 등록</div>
			<form action="roomAdd" method="post" class="form-horizontal">
				 <div class="formb">객실코드 :
				 	<input type="text" name="roomCode" class="input-sm" required>
				 </div>
				 <div class="formb">등록인 :
				 	<input type="text" value="${loginfor.eId}" name="eId" readonly="readonly" class="input-sm">
				 </div>
				 <div class="formb">객실 타입명 :
				 	<select name="roomTypeCode" class="input-sm" required>
				 		<option value="">선택하세요</option>
				 		<c:forEach items="${roomTypeSelect}" var="rt">
				 			<option value="${rt.roomTypeCode}">${rt.roomTypeName}</option>
				 		</c:forEach>
				 	</select>
				 </div>
				 <div class="formb">객실명 :
				 	<input type="text" name="roomName" class="input-sm" required>
				 </div>
				 <div class="formb">객실사이즈 :
				 	<input type="text" name="roomSize" class="input-sm" required>
				 </div>
				 <input type="submit" value="등록" class="btn-default btn-sm">
			 </form>
			 </div>
<!-- ////////////////////////////////////가운데 메뉴 끝///////////////////////////////////////// -->	
<!-- ////////////////////////////////////오른쪽 메뉴 시작///////////////////////////////////////// -->				 
<%@ include file= "../division/right.jsp"%>
<!-- ////////////////////////////////////오른쪽 메뉴 끝///////////////////////////////////////// -->	         
		</div>
	</div>
	
</body>
</html>
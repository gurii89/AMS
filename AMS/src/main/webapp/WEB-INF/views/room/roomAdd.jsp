<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>
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
</body>
</html>
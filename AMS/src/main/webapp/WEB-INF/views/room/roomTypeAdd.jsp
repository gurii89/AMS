<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>  
	 <div class="topb">객실 타입 등록</div>
	 <form action="roomTypeAdd" method="post" class="form-horizontal">
		 <div class="formb">등록인 :
		 	<input type="text" value="${loginfor.eId}" name="eId" readonly="readonly" class="input-sm" required>
		 </div>
		 <div class="formb">객실 타입명 :
		 	<input type="text" name="roomTypeName" class="input-sm" required>
		 </div>
		 <div class="formb">객실 타입가격 :
		 	<input type="text" name="roomTypeRate" class="input-sm" required>
		 </div>
		 <div class="formb">최대 수용 인원 :
		 	<input type="text" name="roomTypeCount" class="input-sm" required>
		 </div>
		 <input type="submit" value="등록" class="btn-default btn-sm">
	 </form>			 
</body>
</html>
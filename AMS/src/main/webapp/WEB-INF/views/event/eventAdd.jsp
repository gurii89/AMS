<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	<body>	
		<div class="topb">행사 등록</div> 
		<form action="eventAdd" method="post" id="frm" class="form-horizontal">
			<div class="formb">
				요금 증감폭 : 
				<input type="text" name="eventFx" required class="input-sm">
			</div>
			<div class="formb">
				시작일 : 
				<input type="date" name="eventStart" id="eventStart" class="input-sm">
			</div>
			<div class="formb">
				종료일 : 
				<input type="date" name="eventEnd" id="eventEnd" class="input-sm">
			</div>
			<div class="formb">
				<input type="submit" value="등록" class="btn-default btn-sm">
			</div>
		</form>	
	</body>
</html>
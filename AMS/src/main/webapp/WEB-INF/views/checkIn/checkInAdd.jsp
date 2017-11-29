<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	<body>	
		<div class="topb">체크인 등록</div>
		<form action="checkInAdd" method="post">
			<input type="hidden" id="booCode" name="booCode" value="${booCode }">
			<div class="formb">
				호수 : 
				<select name="roomCode" class="input-sm" required>
					<option class="input-sm" value="">호수 선택</option>
					<c:forEach items="${roomList }" var="room">
						<option class="input-sm" value="${room.roomCode }">${room.roomCode }</option>
					</c:forEach>
				</select>
			</div>
			<div>
				<input type="submit" class="btn-default btn-sm" value="등록">
			</div>
		</form>
	</body>
</html>
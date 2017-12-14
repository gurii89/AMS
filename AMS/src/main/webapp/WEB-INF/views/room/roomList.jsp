<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>
	 <div class="topb">객실 목록</div> 
	 <table class="bs">
	 	<tr>
	 		<th>객실 코드</th>
	 		<th>객실 타입</th>
	 		<th>등록인</th>
	 		<th>객실명</th>
	 		<th>객실 등록일</th>
	 		<th>객실 크기</th>
	 		<th>수정</th>
	 		<th>삭제</th>
	 	</tr>
	 	<c:forEach items="${roomList}" var="room">
	 		<tr>
	 			<td>${room.roomCode}</td>
	 			<td>${room.roomTypeCode}</td>
	 			<td>${room.eId}</td>
	 			<td>${room.roomName}</td>
	 			<td>${room.roomDate}</td>
	 			<td>${room.roomSize}</td>
	 			<td>수정</td>
	 			<td>삭제</td>
	 		</tr>
	 	</c:forEach>
	 </table>			
</body>
</html>
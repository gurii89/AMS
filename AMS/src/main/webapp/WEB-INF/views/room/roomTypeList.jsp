<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	$('document').ready(function(){
		$('.opbtn').click(function(){
			alert('test alert >>>>'+$(this).val());
		})
	});
</script>
</head>

<body>	
	<div class="topb">객실 타입 목록</div> 
		<table class="bs">
			<tr>
				<th>객실 타입 코드</th>
				<th>등록인</th>
				<th>객실 타입명</th>
				<th>객실 타입 가격</th>
				<th>등록일</th>
				<th>최대 수용 인원</th>
				<th>특징추가</th>
				<th>특징보기</th>
				<th>특징간략</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<c:forEach items="${roomTypeList}" var="roomType">
	 		<tr>
	 			<td>${roomType.roomTypeCode}</td>
	 			<td>${roomType.eId}</td>
	 			<td>${roomType.roomTypeName}</td>
	 			<td>${roomType.roomTypeRate}</td>
	 			<td>${roomType.roomTypeDate}</td>
	 			<td>${roomType.roomTypeCount}</td>
	 			<td><a href="./roomOptionAdd?rtcode=${roomType.roomTypeCode}">특징추가</a></td>
	 			<td><a href="./roomOptionList?roomTypeCode=${roomType.roomTypeCode}">특징보기</a></td>
	 			<td><input type="button" value="${roomType.roomTypeCode}" class="opbtn"></td>
	 			<td>수정</td>
	 			<td>삭제</td>
	 		</tr>
	 		</c:forEach>
	 	</table>			 
</body>
</html>
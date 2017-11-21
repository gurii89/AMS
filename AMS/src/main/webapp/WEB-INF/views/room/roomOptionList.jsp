<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>
	 <div class="topb">객실 타입 목록</div> 
	 <table class="bs">
	 	<tr>
	 		<th>객실 타입 명</th>
	 		<th>객실 특징</th>
	 		<th>등록인</th>
	 		<th>등록일</th>
	 		<th>삭제</th>
	 	</tr>
	 	<c:forEach items="${roomOptionList}" var="roomOptionList">
	 		<tr>
	 			<td>${roomOptionList.roomTypeCode}</td>
	 			<td>${roomOptionList.cateCode}</td>
	 			<td>${roomOptionList.eId}</td>
	 			<td>${roomOptionList.roomOptDate}</td>
	 			<td><a href="./roomOptionDelete?rort=${roomOptionList.roomTypeName}&rocat=${roomOptionList.cateCodeName}">삭제</a></td>
	 		</tr>
	 	</c:forEach>
	 </table>			
</body>
</html>
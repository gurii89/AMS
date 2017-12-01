<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
</script>
</head>
<body>
<div class="topb">청소 완료 목록</div> 
<table class="bs">
	<tr>
		<th>객실코드</th>
		<th>담당자</th>
		<th>청소시작</th>
		<th>객실종료</th>
	</tr>
	<c:forEach items="${cleanEndList}" var="cleanEndList">
	<tr>
		<td>${cleanEndList.roomCode}</td>	
		<td>${cleanEndList.eId}</td>
		<td>${cleanEndList.cleanStart}</td>
		<td>${cleanEndList.cleanEnd}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>
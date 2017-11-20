<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	<body>
		<div class="topb">행사 목록</div>
		<table class="bs">
			<tr>
				<th>행사 번호</th>
				<th>요금 증감폭</th>
				<th>등록일</th>
				<th>등록자</th>
				<th>시작일</th>
				<th>종료일</th>
			</tr>
			<c:forEach items="${eventList }" var="event">
				<tr>
					<td>${event.eventCode }</td>
					<td>${event.eventFx }</td>
					<td>${event.eventDate }</td>
					<td>${event.eId }</td>
					<td>${event.eventStart }</td>
					<td>${event.eventEnd }</td>
				</tr>
			</c:forEach>
		</table>
		<c:import url="/WEB-INF/views/division/paging.jsp" />					
	</body>
</html>
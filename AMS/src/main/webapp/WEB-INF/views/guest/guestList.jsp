<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	<body>
		<div class="topb">고객 목록</div> 
		<table class="bs">
			<tr>
				<th>고객 번호</th>
				<th>고객명</th>
				<th>고객 성별</th>
				<th>고객 국적</th>
				<th>고객 연락처</th>
				<th>등록자</th>
				<th>고객 생년월일</th>
				<th>고객 직업</th>
				<th>고객 이메일</th>
				<th>고객 등록일</th>
				<th>수정</th>
			</tr>
			<c:forEach items="${guestList }" var="guest">
				<tr>
					<td>${guest.gCode }</td>
					<td>${guest.gName }</td>
					<td>${guest.gGender }</td>
					<td>${guest.gNation }</td>
					<td>${guest.gPhone }</td>
					<td>${guest.eId }</td>
					<td>${guest.gBirthdate }</td>
					<td>${guest.gJob }</td>
					<td>${guest.gEmail }</td>
					<td>${guest.gDate }</td>
					<td><a class="btn-default btn-sm" href="guestMod?gCode=${guest.gCode }">수정</a></td>
				</tr>
			</c:forEach>
		</table>
		<c:import url="/WEB-INF/views/division/paging.jsp" />						
	</body>
</html>
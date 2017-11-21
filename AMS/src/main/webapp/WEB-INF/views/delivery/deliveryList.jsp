<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div class="topb">운송 리스트</div>
	<table class="bs">
		<tr>
			<th>보관품코드</th>
			<th>고객아이디</th>
			<th>등록자</th>
			<th>운송회사</th>
			<th>운송장번호</th>
			<th>등록일</th>
			<th>운송예정일</th>
			<th>수정</th>
		</tr>
		<c:forEach items="${deliveryList}" var="delivery">
			<tr>
				<td>${delivery.kCode}</td>
				<td>${delivery.gCode}</td>
				<td>${delivery.eId}</td>
				<td>${delivery.dConame}</td>
				<td>${delivery.dNumber}</td>
				<td>${delivery.dDate}</td>
				<td>${delivery.dDay}</td>
				<td><a class="btn-default btn-sm"
					href="./deliveryMod?kCode=${delivery.kCode}">수정</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
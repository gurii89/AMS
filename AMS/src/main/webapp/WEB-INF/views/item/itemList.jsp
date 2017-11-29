<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div class="topb">물품 리스트</div>
	<table class="bs">
		<tr>
			<th>물품 번호</th>
			<th>등록인</th>
			<th>물품명</th>
			<th>수량</th>
			<th>등록날짜</th>
		</tr>
		<c:forEach items="${itemList }" var="item">
			<tr>
				<td>${item.itemCode}</td>
				<td>${item.eId }</td>
				<td>${item.itemName }</td>
				<td>${item.itemCount }</td>
				<td>${item.itemDate }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
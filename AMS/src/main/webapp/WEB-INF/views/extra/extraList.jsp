<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	<body>		
		<div class="topb">서비스 목록</div> 
		<table class="bs">
			<tr>
				<th>서비스 번호</th>
				<th>서비스명</th>
				<th>서비스 분류</th>
				<th>서비스 가격</th>
				<th>서비스 등록일</th>
				<th>등록자</th>
			</tr>
			<c:forEach items="${extraList }" var="extra">
				<tr>
					<td>${extra.extraCode }</td>
					<td>${extra.extraName }</td>
					<td>${extra.cateCode }</td>
					<td>${extra.extraRate }</td>
					<td>${extra.extraDate }</td>
					<td>${extra.eId }</td>
				</tr>
			</c:forEach>
		</table>						
	</body>
</html>
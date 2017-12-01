<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>


<body>	
	<div class="topb">보관품 리스트</div>
	<table class="bs">
		<tr>
			<th>보관품번호</th>
			<th>등록인</th>
			<th>보관품명</th>
			<th>보관품상태</th>
			<th>등록날짜</th>
			<th>발견장소</th>
			<th>기타</th>
			<th>수정</th>
			<th>발송</th>
		</tr>
		<c:forEach items="${keepList}" var="keep">
			<tr>
				<td>${keep.kCode}</td>
				<td>${keep.eId}</td>
				<td>${keep.kName}</td>
				<td>${keep.kCondition}</td>
				<td>${keep.kDate}</td>
				<td>${keep.kSite}</td>
				<td>${keep.kMemo}</td>
				<td><a class= "btn-default btn-sm" href="./keepMod?kCode=${keep.kCode}">수정</a></td>
				<td><a class= "btn-default btn-sm" href="./deliveryAdd">택배발송</a></td>
				</tr>
		</c:forEach>
	</table>			
</body>
</html>
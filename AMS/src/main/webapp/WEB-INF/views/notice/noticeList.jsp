<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>  
	<div class="topb">공지사항 리스트</div>
	 <table class="bs">
	 	<tr>
	 		<th>공지사항 번호</th>
	 		<th>등록인</th>
	 		<th>등록날짜</th>
	 		<th>상세보기</th>
	 		<th>수정</th>
	 		<th>삭제</th>
	 	</tr>
	 	<c:forEach items="${list}" var="notice">
	 		<tr>
	 			<td>${notice.nCode}</td>
	 			<td>${notice.eId}</td>
	 			<td>${notice.nDate}</td>
	 			<td>${notice.nMemo}</td>
	 			<td><a href="./noticeUpdate?nCode=${notice.nCode}">수정</a></td>
	 			<td></td>
	 		</tr>
	 	</c:forEach>
	 </table>			
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	$(document).ready(function(){
	})
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
	<c:forEach items="${cleanListR}" var="cleanListR">
	<tr>
		<td>${cleanListR.roomCode}</td>	
		<td>${cleanListR.eId}</td>
		<td>${cleanListR.cleanStart}</td>
		<td>${cleanListR.cleanEnd}</td>
	</tr>
	</c:forEach>
</table>
	<div class="pagebtn">&nbsp;
		<c:if test="${currentPage > 1}">
			<a class="btn btn-default btn-sm" href="?currentPage=${currentPage-1}">이전</a>
		</c:if>
	</div>
	<div class="pagebtnNumber">
		<c:forEach var="perPage" begin="${startPage}" end="${lastPage}">
			<span><a href="?currentPage=${perPage}">${perPage}&nbsp;&nbsp;</a></span>
		</c:forEach>
	</div>
	<c:if test="${currentPage < lastPage}">
		<div class="pagebtn"><a class="btn btn-default btn-sm" href="?currentPage=${currentPage+1}">다음</a></div>
	</c:if>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>
	<div class="topb">공지사항 수정</div>
	<form action="./noticeUpdate" method="post" class="form-horizontal">
		<input type="hidden" value="${noticed.nCode}" name="nCode" class="input-sm">
		<div class="formb">등록인 :
			<input type="text" value="${noticed.eId}" name="eId" readonly="readonly" class="input-sm">
		</div>
		<div class="formb">내용 :</div>
		 <textarea name="nMemo" class="input-sm" rows="10" cols="80">${noticed.nMemo}</textarea>
			<c:choose>
				<c:when test="${loginfor.eId == noticed.eId}">
					<br>
					<input type="submit" value="수정" class="btn-default btn-sm">
				</c:when>
				<c:otherwise>
				<br>
				수정 권한이 없습니다.
				</c:otherwise>
			</c:choose>
		</form>			
</body>
</html>
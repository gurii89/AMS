<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>
	<h4>보관품 등록</h4>
	<form action="keepAdd" method="post">
			<p>등록인 : </p>
			<input type="text" value="${loginfor.eId}" name="eId"
				readonly="readonly"><br>
			<p>보관상태 : </p>
			<select name="cateCode" required="required">
				<option value="">선택하세요</option>
				<c:forEach items = "${cateList}" var="small">
					<option value = "${small.cateCode}">${small.cateName}</option>
				</c:forEach>
			</select>
			<p>보관품명 : </p>
			<textarea name="kName"></textarea><br>
			<p>발견장소 : </p>
			<textarea name="kSite"></textarea><br>
			<p>메모 : </p>
			<textarea name="kMemo"></textarea>
			<input type="submit" value="등록">
	</form>			
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<h4>물품 등록</h4>
	<form action="itemAdd" method="post">
		<p>등록인 :</p>
		<input type="text" value="${loginfor.eId }" id="eId"
			readonly="readonly"><br>
		<p>카테고리 :</p>
		<select name="cateCode" id="cateCode" required class="input-sm">
			<option value="" class="input-sm">카테고리를 선택하세요</option>
			<c:forEach items="${cateList }" var="cate">
				<c:if test="${cate.cateSmall eq 'item' }">
					<option class="input-sm" value="${cate.cateCode }">${cate.cateName }</option>
				</c:if>
			</c:forEach>
		</select> <br>
		<p>물품명 :</p>
		<input type="text" name="itemName" id="itemName" /><br>
		<p>수량 :</p>
		<input type="text" name="itemCount" id="itemCount" /><br> <input
			type="submit" value="등록">
	</form>
</body>
</html>
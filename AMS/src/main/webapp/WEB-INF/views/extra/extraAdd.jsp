<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	<body>		
		<div class="topb">서비스 등록</div> 
			<form action="extraAdd" method="post" id="frm" class="form-horizontal">
				<div class="formb">
					서비스명 :
					<input type="text" name="extraName" required class="input-sm">
				</div>
				<div class="formb">
					서비스 분류 :
					<select name="cateCode" required class="input-sm">
						<option value="" class="input-sm">분류 선택</option>
						<c:forEach items="${cateList }" var="cate">
							<option value="${cate.cateCode }" class="input-sm">${cate.cateName }</option>
						</c:forEach>
					</select>
				</div>
				<div class="formb">
					서비스 가격 : 
					<input type="text" name="extraRate" required class="input-sm" >
				</div>
				<div class="formb">
					<input type="submit" value="등록" class="btn-default btn-sm">
				</div>
			</form>				 	
	</body>
</html>
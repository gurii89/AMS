<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="<c:url value='/resources/js/cateAdd.js'/>"></script>
	</head>
	<body>
		<div class="topb">분류 등록</div>
		<p id="er" class="text-danger"></p>
		<form action="cateAdd" class="form-horizontal" method="post" id="frm">
			<div class="formb">
				대분류 : 
				<span id="large">
					<select name="cateLarge" id="cateLarge" class="input-sm" required>
						<option class="input-sm" value="">선택하세요</option>
						<c:forEach items="${cateList }" var="large">
							<option class="input-sm" value="${large.cateLarge }">${large.cateLarge }</option>
						</c:forEach>
					</select>
				</span>
				<span id="btnLarge">직접 입력</span>
			</div>
			<div class="formb">
				소분류 : 
				<span id="small">
					<select name="cateSmall" id="cateSmall" class="input-sm" required>
						<option class="input-sm" value="">대분류를 선택하세요</option>
					</select>
				</span>
				<span id="btnSmall"></span>
			</div>
			<div class="formb">
				카테고리명 : 
				<span id="name"><input type="text" name="cateName" id="cateName" class="input-sm" required></span>
			</div>		
			<div class="formb">
				<input type="button" id="btn" class="btn-default btn-sm" value="등록" >
			</div>
		</form>
	</body>
</html>
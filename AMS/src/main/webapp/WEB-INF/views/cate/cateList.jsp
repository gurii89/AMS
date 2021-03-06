<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	<body>
		<div class="topb">분류 목록</div>
		<c:choose>
			<c:when test="${cate != null }">
				<input type="hidden" id="cate" value="${cate }">
				<input type="hidden" id="input" value="${input }">
			</c:when>
			<c:otherwise>
				<form action="cateList" method="post" class="form-horizontal">
					<select name="cate" id="cate" required class="input-sm">
						<option id="opt" value="" class="input-sm">검색 조건 선택</option>							
						<option value="cate_code" class="input-sm">분류 번호</option>
						<option value="e_id" class="input-sm">등록자</option>
						<option value="cate_large" class="input-sm">대분류</option>
						<option value="cate_small" class="input-sm">소분류</option>						
						<option value="cate_name" class="input-sm">분류명</option>
					</select>
					<input type="text" name="input" id="input" value="${input }" required class="input-sm">
					<input type="submit" value="검색" class="btn-default btn-sm">
				</form>
			</c:otherwise>
		</c:choose>			
		<table class="bs">
			<tr>
				<th>분류 번호</th>
				<th>대분류</th>
				<th>소분류</th>
				<th>분류명</th>
				<th>등록자</th>
				<th>등록일</th>
			</tr>
			<c:forEach items="${cateList }" var="cate">
				<tr>
					<td>${cate.cateCode }</td>
					<td>${cate.cateLarge }</td>
					<td>${cate.cateSmall }</td>
					<td>${cate.cateName }</td>
					<td>${cate.eId }</td>
					<td>${cate.cateDate }</td>
				</tr>
			</c:forEach>
		</table>
		<c:import url="/WEB-INF/views/division/paging.jsp" />
	</body>
</html>
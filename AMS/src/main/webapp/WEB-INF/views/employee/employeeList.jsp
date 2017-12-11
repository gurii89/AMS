<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="<c:url value='/resources/js/employeeList.js'/>"></script>
	</head>
	<body>
		<div class="topb">직원 목록</div>
		<c:choose>			
			<c:when test="${cate != null }">
					<input type="hidden" id="cate" value="${cate }">
					<input type="hidden" id="input" value="${input }">
			</c:when>
			<c:otherwise>
				<form action="employeeList" method="post" class="form-horizontal">
					<select name="cate" id="cate" class="input-sm" required>
						<option id="opt" class="input-sm" value="">검색 조건 선택</option>
						<option class="input-sm" value="employee.e_name">이름</option>
						<option class="input-sm" value="employee.e_department">부서</option>
						<option class="input-sm" value="nat.cate_code">국적</option>
						<option class="input-sm" value="employee.e_language">외국어</option>
					</select>
					<span id="condi">
						<input type="text" name="input" id="input" value="${input }" required class="input-sm">
					</span>
					<input type="submit" value="검색" class="btn-default btn-sm">
				</form>
			</c:otherwise>
		</c:choose>
		<table class="bs">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>부서</th>
				<th>직급</th>
				<th>연락처</th>	
			</tr>
			<c:forEach items="${employeeList }" var="employee">
				<tr class="employee">
					<td>${employee.eId }</td>
					<td>${employee.eName }</td>
					<td>${employee.eDepartment }</td>
					<td>${employee.ePosition }</td>
					<td>${employee.eGender }</td>
					<td>${employee.eBirthdate }</td>
					<td>${employee.ePhone }</td>
				</tr>
			</c:forEach>
		</table>
		<c:import url="/WEB-INF/views/division/paging.jsp" />				
	</body>
</html>
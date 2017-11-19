<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	<body>
		<div class="topb">고객 등록</div> 
		<form action="guestAdd" method="post" id="frm" class="form-horizontal">
			<div class="formb">
				고객명 :
				<input type="text" name="gName" id="gName" required class="input-sm">
			</div>
			<div class="formb">
				고객 국적 :
				<select name="gCountry" id="gCountry" class="input-sm">
					<option value="" class="input-sm">내국인</option>
					<c:forEach items="${cateList }" var="cate">
						<c:if test="${cate.cateName != 'korea' }">
							<option value="${cate.cateCode }" class="input-sm">${cate.cateName }</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
			<div class="formb">
				고객 성별 :
				<select name="gGender" id="gGender" required class="input-sm">
					<option value="" class="input-sm">성별 선택</option>
					<option value="남" class="input-sm">남</option>
					<option value="여" class="input-sm">여</option>
				</select>
			</div>
			<div class="formb">
				고객 연락처 : 
				<input type="text" name="gPhone" id="gPhone" required class="input-sm">
			</div>
			<div class="formb">
				고객 생년월일 : 
				<input type="date" name="gBirthdate" id="gBirthdate" class="input-sm">
			</div>
			<div class="formb">
				고객 직업 : 
				<input type="text" name="gJob" id="gJob" class="input-sm">
			</div>
			<div class="formb">
				고객 이메일 : 
				<input type="text" name="gEmail" id="gEmail" class="input-sm">
			</div>
			<div class="formb">
				<input type="submit" id="btn" value="등록" class="btn-default btn-sm">
			</div>
		</form>				 
	</body>
</html>
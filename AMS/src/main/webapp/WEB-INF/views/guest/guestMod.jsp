<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	<body>	
		<div class="topb">고객 수정</div> 
		<form action="guestMod" method="post" id="frm" class="form-horizontal">
			<input type="hidden" name="gCode" value="${guest.gCode }">
			<div>
				고객명 :
				<input type="text" name="gName" id="gName" value="${guest.gName }" required class="input-sm">
			</div>
			<div>
				고객 국적 :
				<select name="gCountry" id="gCountry" class="input-sm">
					<c:forEach items="${cateList }" var="cate">
						<c:choose>
							<c:when test="${cate.cateCode eq guest.gCountry }">
								<option selected value="${cate.cateCode }" class="input-sm">${cate.cateName }</option>
							</c:when>
							<c:otherwise>
								<option value="${cate.cateCode }" class="input-sm">${cate.cateName }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</div>
			<div>
				고객 성별 :
				<select name="gGender" id="gGender" required class="input-sm">
					<option value="${guest.gGender }" class="input-sm">${guest.gGender }</option>
					<c:choose>
						<c:when test="${guest.gGender eq '남' }">
							<option value="여" class="input-sm">여</option>
						</c:when>
						<c:when test="${guest.gGender eq '여' }">
							<option value="남" class="input-sm">남</option>
						</c:when>
					</c:choose>
				</select>
			</div>
			<div>
				고객 연락처 : 
				<input type="text" name="gPhone" id="gPhone" value="${guest.gPhone }" required class="input-sm">
			</div>
			<div>
				고객 생년월일 : 
				<input type="date" name="gBirthdate" id="gBirthdate" value="${guest.gBirthdate }" class="input-sm">
			</div>
			<div>
				고객 직업 : 
				<input type="text" name="gJob" id="gJob" value="${guest.gJob }" class="input-sm">
			</div>
			<div>
				고객 이메일 : 
				<input type="text" name="gEmail" id="gEmail" value="${guest.gEmail }" class="input-sm">
			</div>
			<div>
				<input type="submit" value="수정" class="btn-default btn-sm">
			</div>
		</form>					 		
	</body>
</html>
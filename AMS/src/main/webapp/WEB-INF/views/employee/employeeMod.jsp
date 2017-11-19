<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	<body>
		<div class="topb">직원 수정</div>
		<form action="employeeMod" method="post" id="frm" class="form-horizontal">
			<div class="formb">
				직원 아이디 :
				<input type="text" name="eId" id="eId" value="${employee.eId }" readonly class="input-sm">
			</div>
			<div class="formb">
				직원 국적 :
				<select name="eNation" id="eNation" class="input-sm">
					<c:forEach items="${cateList }" var="cate">
						<c:choose>
							<c:when test="${cate.cateCode eq employee.eNation }">
								<option value="${cate.cateCode }" class="input-sm">${cate.cateName }</option>
							</c:when>
							<c:when test="${cate.cateSmall eq 'nation' }">
								<option value="${cate.cateCode }" class="input-sm">${cate.cateName }</option>
							</c:when>
						</c:choose>
					</c:forEach>
				</select>
			</div>
			<div class="formb">
				직원 부서 :
				<select name="eDepartment" id="eDepartment" required class="input-sm">
					<c:forEach items="${cateList }" var="cate">
						<c:choose>
							<c:when test="${cate.cateCode eq employee.eDepartment }">
								<option value="${cate.cateCode }" class="input-sm">${cate.cateName }</option>
							</c:when>
							<c:when test="${cate.cateSmall eq 'department' }">
								<option value="${cate.cateCode }" class="input-sm">${cate.cateName }</option>
							</c:when>
						</c:choose>
					</c:forEach>
				</select>
			</div>
			<div class="formb">
				직원 성별 :
				<select name="eGender" id="eGender" class="input-sm">
					<option value="${employee.eGender }" class="input-sm">${employee.eGender }</option>
					<c:choose>
						<c:when test="${employee.eGender eq '남' }">
							<option value="여" class="input-sm">여</option>
						</c:when>
						<c:when test="${employee.eGender eq '여' }">
							<option value="남" class="input-sm">남</option>
						</c:when>
					</c:choose>
				</select>
			</div>
			<div class="formb">
				직원 직급 :
				<select name="ePosition" id="ePosition" class="input-sm">
					<c:forEach items="${cateList }" var="cate">
						<c:choose>
							<c:when test="${cate.cateCode eq employee.ePosition }">
								<option value="${cate.cateCode }" class="input-sm">${cate.cateName }</option>
							</c:when>
							<c:when test="${cate.cateSmall eq 'position' }">
								<option value="${cate.cateCode }" class="input-sm">${cate.cateName }</option>
							</c:when>
						</c:choose>
					</c:forEach>
				</select>
			</div>
			<div class="formb">
				직원 외국어 :
				<select name="eLanguage" id="eLanguage" class="input-sm">
					<c:if test="${employee.eLanguage eq null }">
						<option value="" class="input-sm">외국어를 선택하세요</option>
					</c:if>
					<c:forEach items="${cateList }" var="cate">
						<c:if test="${cate.cateSmall eq 'language' }">
							<option value="${cate.cateCode }" class="input-sm">${cate.cateName }</option>
						</c:if>
					</c:forEach>
					<c:if test="${employee.eLanguage != null }">
						<option value="" class="input-sm">외국어 불가</option>
					</c:if>
				</select>
			</div>
			<div class="formb">
				직원 이름 :
				<input type="text" name="eName" id="eName" value="${employee.eName }" required class="input-sm">
			</div>
			<div class="formb">
				직원 비밀번호 :
				<input type="text" name="ePw" id="ePw" required class="input-sm">
			</div>
			<div class="formb">
				직원 생년월일 :
				<input type="date" name="eBirthdate" id="eBirthdate" value="${employee.eBirthdate }" required class="input-sm">
			</div>
			<div class="formb">
				직원 이메일 :
				<input type="text" name="eEmail" id="eEmail" value="${employee.eEmail }" required class="input-sm">
			</div>
			<div class="formb">
				직원 주소 :
				<input type="text" name="eAddress" id="eAddress" value="${employee.eAddress }" required class="input-sm">
			</div>
			<div class="formb">
				직원 핸드폰 :
				<input type="text" name="ePhone" id="ePhone" value="${employee.ePhone }" required class="input-sm">
			</div>
			<div class="formb">
				직원 특이사항 :
				<input type="text" name="eMemo" id="eMemo" value="${employee.eMemo }" class="input-sm">
			</div>
			<div class="formb">
				<input type="submit" id="btn" value="수정" class="btn-default btn-sm">
			</div>
		</form>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	<body>
		<div class="topb">직원 등록</div> 
		<form action="employeeAdd" method="post" id="frm" class="form-horizontal">
			<div class="formb">
				직원 아이디 :
				<input type="text" name="eId" id="eId" required class="input-sm">
			</div>
			<div class="formb">
				직원 국적 :
				<select name="eNation" id="eNation" required class="input-sm">
					<option class="input-sm" value="">국적을 선택하세요</option>
					<c:forEach items="${cateList }" var="cate">
						<c:if test="${cate.cateSmall eq 'nation' }">
							<option class="input-sm" value="${cate.cateCode }">${cate.cateName }</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
			<div class="formb">
				직원 부서 :
				<select name="eDepartment" id="eDepartment" required class="input-sm">
					<option value="" class="input-sm">권한을 선택하세요</option>
					<c:forEach items="${cateList }" var="cate">
						<c:if test="${cate.cateSmall eq 'department' }">
							<option class="input-sm" value="${cate.cateCode }">${cate.cateName }</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
			<div class="formb">
				직원 성별 :
				<select name="eGender" id="eGender" required class="input-sm">
					<option class="input-sm" value="">성별을 선택하세요</option>
					<option class="input-sm" value="남">남</option>
					<option class="input-sm" value="여">여</option>
				</select>
			</div>
			<div class="formb">
				직원 직급 :
				<select name="ePosition" id="ePosition" required class="input-sm">
					<option value="" class="input-sm">직급을 선택하세요</option>
					<c:forEach items="${cateList }" var="cate">
						<c:if test="${cate.cateSmall eq 'position' }">
							<option value="${cate.cateCode }" class="input-sm">${cate.cateName }</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
			<div class="formb">
				직원 외국어 :
				<select name="eLanguage" id="eLanguage" class="input-sm">
					<option value="" class="input-sm">외국어를 선택하세요</option>
					<c:forEach items="${cateList }" var="cate">
						<c:if test="${cate.cateSmall eq 'language' }">
							<option value="${cate.cateCode }" class="input-sm">${cate.cateName }</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
			<div class="formb">
				직원 이름 :
				<input type="text" name="eName" id="eName" required class="input-sm">
			</div>
			<div class="formb">
				직원 비밀번호 :
				<input type="text" name="ePw" id="ePw" required class="input-sm">
			</div>
			<div class="formb">
				직원 생년월일 :
				<input type="date" name="eBirthdate" id="eBirthdate" required class="input-sm">
			</div>
			<div class="formb">
				직원 이메일 :
				<input type="text" name="eEmail" id="eEmail" required class="input-sm">
			</div>
			<div class="formb">
				직원 주소 :
				<input type="text" name="eAddress" id="eAddress" required class="input-sm">
			</div>
			<div class="formb">
				직원 핸드폰 :
				<input type="text" name="ePhone" id="ePhone" required class="input-sm">
			</div>
			<div class="formb">
				직원 특이사항 :
				<input type="text" name="eMemo" id="eMemo" class="input-sm">
			</div>
			<div class="formb">
				<input type="submit" value="등록" class="btn-default btn-sm">
			</div>
		</form>	 
	</body>
</html>
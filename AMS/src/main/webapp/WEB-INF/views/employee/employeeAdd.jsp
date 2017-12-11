<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	<body>
		<div class="clearfix topb col-sm-12">직원 등록</div>
		<form action="employeeAdd" method="post" id="frm" class="form-horizontal">
			<div class="col-sm-6">			
				<div class="formb">
					직원 아이디 :
					<input type="text" name="eId" id="eId" required class="input-sm">
				</div>
				<div class="formb">
					직원 비밀번호 :
					<input type="text" name="ePw" id="ePw" required class="input-sm">
				</div>
				<div class="formb">
					직원 이름 :
					<input type="text" name="eName" id="eName" required class="input-sm">
				</div>
				<div class="formb">
					직원 생년월일 :
					<input type="date" name="eBirthdate" id="eBirthdate" required class="input-sm">
				</div>
				<div class="formb">
					직원 성별 :
					<input type="radio" name="eGender" class="eGender" value="남" required>남
					<input type="radio" name="eGender" class="eGender" value="여" required>여
				</div>
				
				<div class="formb">
					직원 부서 :
					<input type="radio" name="eDepartment" class="eDepartment" value="manager" required>manager
					<input type="radio" name="eDepartment" class="eDepartment" value="front" required>front
					<input type="radio" name="eDepartment" class="eDepartment" value="clean" required>clean
				</div>
				
				<div class="formb">
					직원 직급 :
					<select name="ePosition" id="ePosition" required class="input-sm">
						<option value="" class="input-sm">직급 선택</option>
						<c:forEach items="${cateList }" var="cate">
							<c:if test="${cate.cateSmall eq 'position' }">
								<option value="${cate.cateCode }" class="input-sm">${cate.cateName }</option>
							</c:if>
						</c:forEach>
					</select>
				</div>			
			</div> 
			<div class="col-sm-6">
				<c:import url="/WEB-INF/views/employee/employeeAddSub.jsp" />
			</div>			
			<div class="formb col-sm-12">
				<input type="submit" value="등록" class="btn-default btn-sm">
			</div>
		</form>	 
	</body>
</html>
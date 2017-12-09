<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script>
			$(function(){
				$('#gender').hide()
				$('#department').hide()
				
				// 기존 성별 체크
				$('.eGender').each(function(index, item){
					if($(item).val() == $('#gender').html()){
						$(item).attr('checked', 'checked')
					} 
				})
				
				// 기존 부서 체크
				$('.eDepartment').each(function(index, item){
					if($(item).val() == $('#department').html()){
						$(item).attr('checked', 'checked')
					} 
				})
			})
		</script>
	</head>
	<body>
		<div class="clearfix topb col-sm-12">직원 수정</div>
		<form action="employeeMod" method="post" id="frm" class="form-horizontal">
			<div class="col-sm-6">
				<div class="formb">
					직원 아이디 :
					<input type="text" name="eId" id="eId" value="${employee.eId }" readonly class="input-sm">
				</div>
				<div class="formb">
					직원 비밀번호 :
					<input type="text" name="ePw" id="ePw" class="input-sm">
				</div>
				<div class="formb">
					직원 이름 :
					<input type="text" name="eName" id="eName" value="${employee.eName }" required class="input-sm">
				</div>
				<div class="formb">
					직원 생년월일 :
					<input type="date" name="eBirthdate" id="eBirthdate" value="${employee.eBirthdate }" required class="input-sm">
				</div>
				<div class="formb">
					직원 성별 :
					<input type="radio" name="eGender" class="eGender" value="남">남
					<input type="radio" name="eGender" class="eGender" value="여">여
				</div>
				<div class="formb">
					직원 부서 :
					<input type="radio" name="eDepartment" class="eDepartment" value="manager">manager
					<input type="radio" name="eDepartment" class="eDepartment" value="front">front
					<input type="radio" name="eDepartment" class="eDepartment" value="clean">clean
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
			</div>
			<div class="col-sm-6">
				<c:import url="/WEB-INF/views/employee/employeeModSub.jsp" />
			</div>
			<div class="col-sm-12 formb">
				<input type="submit" id="btn" value="수정" class="btn-default btn-sm">
			</div>			
		</form>
		<div id="gender">${employee.eGender }</div>
		<div id="department">${employee.eDepartment }</div>
	</body>
</html>
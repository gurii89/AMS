<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script>
			$(function(){				
				// 비번 변경
				$('#pwChange').click(function(){
					if($('#now').val() && $('#after').val()){
						$.get("employeePw?now="+$('#now').val()+'&after='+$('#after').val(), function(data){
							if(data > 0){
								location.reload()
							}else{
								$('#er').html('비밀번호 불일치')
								$('#now').val('')
								$('#after').val('')
							}
						})
					}else{
						$('#er').html('비밀번호를 입력하세요')
					}
				})
				
				// 직원 수정 화면 이동
				$('#empMod').click(function(){
					$(location).attr('href', 'employeeMod?eId='+$('#eId').html())
				})
			})
		</script>
	</head>
	<body>
		<div class="topb">직원 상세보기</div>
		<p id="er" class="text-danger"></p>
		<c:if test="${loginfor.eDepartment != 'manager' }">
			<button id="pwChange" class="btn-default btn-sm">변경</button>
		</c:if>
		<c:if test="${loginfor.eDepartment eq 'manager' }">
			<button id="empMod" class="btn-default btn-sm">변경</button>
		</c:if>
		<table class="bs">
			<tr>
				<th>아이디</th>
				<td id="eId">${employee.eId }</td>
				<th>이름</th>
				<td>${employee.eName }</td>
			</tr>
			<c:if test="${loginfor.eDepartment != 'manager' }">
				<tr>
					<th>현재 비밀번호</th>
					<td><input type="password" id="now"></td>
					<th>변경할 비밀번호</th>
					<td><input type="password" id="after"></td>
				</tr>
			</c:if>
			<tr>
				<th>생년월일</th>
				<td>${employee.eBirthdate }</td>
				<th>성별</th>
				<td>${employee.eGender }</td>
			</tr>
			<tr>
				<th>부서</th>
				<td>${employee.eDepartment }</td>
				<th>직급</th>
				<td>${employee.ePosition }</td>
			</tr>
			<tr>
				<th>국적</th>
				<td>${employee.eNation }</td>
				<th>외국어</th>
				<td>${employee.eLanguage }</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${employee.ePhone }</td>
				<th>주소</th>
				<td>${employee.eAddress }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${employee.eEmail }</td>
				<th>특이사항</th>
				<td>${employee.eMemo }</td>
			</tr>
		</table>
	</body>
</html>
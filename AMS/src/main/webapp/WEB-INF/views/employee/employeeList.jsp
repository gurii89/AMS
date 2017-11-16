<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/css.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	<body>
	
		<div class="container-fluid">
			<div class="row content">
      
<!-- ////////////////////////////////////왼쪽 메뉴 시작///////////////////////////////////////// -->     
			<c:import url="/WEB-INF/views/division/left.jsp" />
<!-- ////////////////////////////////////왼쪽 메뉴 끝///////////////////////////////////////// -->
<!-- ////////////////////////////////////상단 메뉴 시작///////////////////////////////////////// -->
			<c:import url="/WEB-INF/views/division/top.jsp" />
<!-- ////////////////////////////////////상단 메뉴 끝///////////////////////////////////////// -->	
<!-- ////////////////////////////////////가운데 메뉴 시작///////////////////////////////////////// -->			
				<div class="col-sm-10 top">
					<div class="topb">직원 목록</div> 
					<table class="bs">
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>부서</th>
							<th>직급</th>
							<th>성별</th>
							<th>생년월일</th>
							<th>국적</th>
							<th>외국어</th>
							<th>연락처</th>	
							<th>주소</th>						
							<th>이메일</th>
							<th>등록일</th>
							<th>등록자</th>
							<th>메모</th>
							<th>수정</th>
						</tr>
						<c:forEach items="${employeeList }" var="employee">
							<tr>
								<td>${employee.eId }</td>
								<td>${employee.eName }</td>
								<td>${employee.eDepartment }</td>
								<td>${employee.ePosition }</td>
								<td>${employee.eGender }</td>
								<td>${employee.eBirthdate }</td>
								<td>${employee.eNation }</td>
								<td>${employee.eLanguage }</td>
								<td>${employee.ePhone }</td>
								<td>${employee.eAddress }</td>
								<td>${employee.eEmail }</td>
								<td>${employee.eDate }</td>
								<td>${employee.mId }</td>
								<td>${employee.eMemo }</td>
								<td><a class="btn-default btn-sm" href="employeeMod?eId=${employee.eId }">수정</a></td>
							</tr>
						</c:forEach>
					</table>
					<c:import url="/WEB-INF/views/division/paging.jsp" />
				 </div>
<!-- ////////////////////////////////////가운데 메뉴 끝///////////////////////////////////////// -->	
<!-- ////////////////////////////////////오른쪽 메뉴 시작///////////////////////////////////////// -->				 
			<c:import url="/WEB-INF/views/division/right.jsp" />
<!-- ////////////////////////////////////오른쪽 메뉴 끝///////////////////////////////////////// -->	         
			</div>
		</div>		
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/css.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
					<h3>고객 등록</h3> 
						<form action="guestAdd" method="post" id="frm">
							<div>
								<input type="hidden" name="eId" id="eId" value="${loginfor.eId }">
							</div>
							<div>
								고객명 :
								<input type="text" name="gName" id="gName" required>
							</div>
							<div>
								고객 국적 :
								<select name="gCountry" id="gCountry">
									<option value="">내국인</option>
									<c:forEach items="${cateList }" var="cate">
										<option value="${cate.cateCode }">${cate.cateName }</option>
									</c:forEach>
								</select>
							</div>
							<div>
								고객 성별 :
								<select name="gGender" id="gGender" required>
									<option value="">성별 선택</option>
									<option value="남">남</option>
									<option value="여">여</option>
								</select>
							</div>
							<div>
								고객 연락처 : 
								<input type="text" name="gPhone" id="gPhone" required>
							</div>
							<div>
								고객 생년월일 : 
								<input type="date" name="gBirthdate" id="gBirthdate">
							</div>
							<div>
								고객 직업 : 
								<input type="text" name="gJob" id="gJob">
							</div>
							<div>
								고객 이메일 : 
								<input type="text" name="gEmail" id="gEmail">
							</div>
							<div>
								<input type="submit" value="등록">
							</div>
						</form>
				 </div>
<!-- ////////////////////////////////////가운데 메뉴 끝///////////////////////////////////////// -->	
<!-- ////////////////////////////////////오른쪽 메뉴 시작///////////////////////////////////////// -->				 
			<c:import url="/WEB-INF/views/division/right.jsp" />
<!-- ////////////////////////////////////오른쪽 메뉴 끝///////////////////////////////////////// -->	         
			</div>
		</div>		
	</body>
</html>
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
				 </div>
<!-- ////////////////////////////////////가운데 메뉴 끝///////////////////////////////////////// -->	
<!-- ////////////////////////////////////오른쪽 메뉴 시작///////////////////////////////////////// -->				 
			<c:import url="/WEB-INF/views/division/right.jsp" />
<!-- ////////////////////////////////////오른쪽 메뉴 끝///////////////////////////////////////// -->	         
			</div>
		</div>		
	</body>
</html>
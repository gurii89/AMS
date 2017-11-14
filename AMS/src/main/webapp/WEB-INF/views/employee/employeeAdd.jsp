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
					<h3>직원 등록</h3> 
						<form action="employeeAdd" method="post" id="frm">
							<div>
								<input type="hidden" name="mId" id="mId" value="${loginfor.eId }">
							</div>
							<div>
								직원 아이디 :
								<input type="text" name="eId" id="eId" required>
							</div>
							<div>
								직원 국적 :
								<select name="eNation" id="eNation" required>
									<option value="">국적을 선택하세요</option>
									<c:forEach items="${cateList }" var="cate">
										<c:if test="${cate.cateSmall eq 'nation' }">
											<option value="${cate.cateCode }">${cate.cateName }</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
							<div>
								직원 부서 :
								<select name="eDepartment" id="eDepartment" required>
									<option value="">권한을 선택하세요</option>
									<c:forEach items="${cateList }" var="cate">
										<c:if test="${cate.cateSmall eq 'department' }">
											<option value="${cate.cateCode }">${cate.cateName }</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
							<div>
								직원 성별 :
								<select name="eGender" id="eGender" required>
									<option value="">성별을 선택하세요</option>
									<option value="남">남</option>
									<option value="여">여</option>
								</select>
							</div>
							<div>
								직원 직급 :
								<select name="ePosition" id="ePosition" required>
									<option value="">직급을 선택하세요</option>
									<c:forEach items="${cateList }" var="cate">
										<c:if test="${cate.cateSmall eq 'position' }">
											<option value="${cate.cateCode }">${cate.cateName }</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
							<div>
								직원 외국어 :
								<select name="eLanguage" id="eLanguage">
									<option value="">외국어를 선택하세요</option>
									<c:forEach items="${cateList }" var="cate">
										<c:if test="${cate.cateSmall eq 'language' }">
											<option value="${cate.cateCode }">${cate.cateName }</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
							<div>
								직원 이름 :
								<input type="text" name="eName" id="eName" required>
							</div>
							<div>
								직원 비밀번호 :
								<input type="text" name="ePw" id="ePw" required>
							</div>
							<div>
								직원 생년월일 :
								<input type="date" name="eBirthdate" id="eBirthdate" required>
							</div>
							<div>
								직원 이메일 :
								<input type="text" name="eEmail" id="eEmail" required>
							</div>
							<div>
								직원 주소 :
								<input type="text" name="eAddress" id="eAddress" required>
							</div>
							<div>
								직원 핸드폰 :
								<input type="text" name="ePhone" id="ePhone" required>
							</div>
							<div>
								직원 특이사항 :
								<input type="text" name="eMemo" id="eMemo">
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
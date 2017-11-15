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
				<c:import url="/WEB-INF/views/division/left.jsp" />
				<c:import url="/WEB-INF/views/division/top.jsp" />			
					<div class="col-sm-10 top">
						<h3>고객 수정</h3> 
							<form action="guestMod" method="post" id="frm">
								<input type="hidden" name="gCode" value="${guest.gCode }">
								<div>
									고객명 :
									<input type="text" name="gName" id="gName" value="${guest.gName }" required>
								</div>
								<div>
									고객 국적 :
									<select name="gCountry" id="gCountry">
										<c:forEach items="${cateList }" var="cate">
											<c:choose>
												<c:when test="${cate.cateCode eq guest.gCountry }">
													<option selected value="${cate.cateCode }">${cate.cateName }</option>
												</c:when>
												<c:otherwise>
													<option value="${cate.cateCode }">${cate.cateName }</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
								<div>
									고객 성별 :
									<select name="gGender" id="gGender" required>
										<option value="${guest.gGender }">${guest.gGender }</option>
										<c:choose>
											<c:when test="${guest.gGender eq '남' }">
												<option value="여">여</option>
											</c:when>
											<c:when test="${guest.gGender eq '여' }">
												<option value="남">남</option>
											</c:when>
										</c:choose>
									</select>
								</div>
								<div>
									고객 연락처 : 
									<input type="text" name="gPhone" id="gPhone" value="${guest.gPhone }" required>
								</div>
								<div>
									고객 생년월일 : 
									<input type="date" name="gBirthdate" id="gBirthdate" value="${guest.gBirthdate }">
								</div>
								<div>
									고객 직업 : 
									<input type="text" name="gJob" id="gJob" value="${guest.gJob }">
								</div>
								<div>
									고객 이메일 : 
									<input type="text" name="gEmail" id="gEmail" value="${guest.gEmail }">
								</div>
								<div>
									<input type="submit" value="등록">
								</div>
							</form>
					 </div>				 
				<c:import url="/WEB-INF/views/division/right.jsp" />	         
			</div>
		</div>		
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/css.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script>
			$('document').ready(function(){
				$('#btn').click(function(){
					// 모든 항목이 입력 되었는지 확인
					if($('#eId').val() != "" && $('#eNation').val() != "" && $('#eDepartment').val() != ""
						&& $('#eGender').val() != "" && $('#ePosition').val() != "" && $('#eName').val() != ""
						&& $('#eName').val() != "" && $('#eBirthdate').val() != "" && $('#eEmail').val() != ""
						&& $('#eAddress').val() != "" && $('#ePhone').val() != ""
					){					
						$('#frm').submit()
					}
				})
			})
		</script>
	</head>
	<body>
	
		<div class="container-fluid">
			<div class="row content">
      
<!-- ////////////////////////////////////왼쪽 메뉴 시작///////////////////////////////////////// -->     
			<%@ include file= "division/left.jsp"%>
<!-- ////////////////////////////////////왼쪽 메뉴 끝///////////////////////////////////////// -->
<!-- ////////////////////////////////////상단 메뉴 시작///////////////////////////////////////// -->
			<%@ include file= "division/top.jsp"%>
<!-- ////////////////////////////////////상단 메뉴 끝///////////////////////////////////////// -->	
<!-- ////////////////////////////////////가운데 메뉴 시작///////////////////////////////////////// -->			
				<div class="col-sm-10 top">
					<h3>직원 등록</h3> 
						<form action="employeeAdd" method="post" id="frm">
							<div>
								<input type="hidden" name="mId" id="mId" value="">
							</div>
							<div>
								직원 아이디 :
								<input type="text" name="eId" id="eId">
							</div>
							<div>
								직원 국적 :
								<select name="eNation" id="eNation">
									<option value="">국적을 선택하세요</option>
									<c:forEach items="${list }" var="cate">
										<c:if test="${cate.cateSmall == 'nation' }">
											<option value="${cate.cateCode }">${cate.cateName }</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
							<div>
								직원 부서 :
								<select name="eDepartment" id="eDepartment">
									<option value="">권한을 선택하세요</option>
									<c:forEach items="${list }" var="cate">
										<c:if test="${cate.cateSmall == 'department' }">
											<option value="${cate.cateCode }">${cate.cateName }</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
							<div>
								직원 성별 :
								<select name="eGender" id="eGender">
									<option value="">성별을 선택하세요</option>
									<option value="남">남</option>
									<option value="여">여</option>
								</select>
							</div>
							<div>
								직원 직급 :
								<select name="ePosition" id="ePosition">
									<option value="">직급을 선택하세요</option>
									<c:forEach items="${list }" var="cate">
										<c:if test="${cate.cateSmall == 'position' }">
											<option value="${cate.cateCode }">${cate.cateName }</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
							<div>
								직원 외국어1 :
								<select name="eLanguage1" id="eLanguage1">
									<option value="">외국어를 선택하세요</option>
									<c:forEach items="${list }" var="cate">
										<c:if test="${cate.cateSmall == 'language' }">
											<option value="${cate.cateCode }">${cate.cateName }</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
							<div>
								직원 이름 :
								<input type="text" name="eName" id="eName">
							</div>
							<div>
								직원 비밀번호 :
								<input type="text" name="ePw" id="ePw">
							</div>
							<div>
								직원 생년월일 :
								<input type="date" name="eBirthdate" id="eBirthdate">
							</div>
							<div>
								직원 이메일 :
								<input type="text" name="eEmail" id="eEmail">
							</div>
							<div>
								직원 주소 :
								<input type="text" name="eAddress" id="eAddress">
							</div>
							<div>
								직원 핸드폰 :
								<input type="text" name="ePhone" id="ePhone">
							</div>
							<div>
								직원 특이사항 :
								<input type="text" name="eMemo" id="eMemo">
							</div>
							<div>
								<input type="button" id="btn" value="등록">
							</div>
						</form>
				 </div>
<!-- ////////////////////////////////////가운데 메뉴 끝///////////////////////////////////////// -->	
<!-- ////////////////////////////////////오른쪽 메뉴 시작///////////////////////////////////////// -->				 
			<%@ include file= "division/right.jsp"%>
<!-- ////////////////////////////////////오른쪽 메뉴 끝///////////////////////////////////////// -->	         
			</div>
		</div>		
	</body>
</html>
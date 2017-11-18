<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/cateAdd.js"></script>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	<body>
		<div class="container-fluid">
			<div class="row content">
				<c:import url="/WEB-INF/views/division/left.jsp" />
				<c:import url="/WEB-INF/views/division/top.jsp" />			
				<div class="col-sm-10 top">
					<div class="topb">분류 등록</div> 
					<form action="cateAdd" class="form-horizontal" method="post" id="frm">
						<div class="formb">
							대분류 : 
							<span id="large">
								<select name="cateLarge" id="cateLarge" class="input-sm">
									<option class="input-sm" value="">선택하세요</option>
									<c:forEach items="${cateList }" var="large">
										<option class="input-sm" value="${large.cateLarge }">${large.cateLarge }</option>
									</c:forEach>
								</select>
							</span>
							<span id="btnLarge">직접 입력</span>
						</div>
						<div class="formb">
							소분류 : 
							<span id="small">
								<select name="cateSmall" id="cateSmall" class="input-sm">
									<option class="input-sm" value="">대분류를 선택하세요</option>
								</select>
							</span>
							<span id="btnSmall"></span>
						</div>
						<div class="formb">
							카테고리명 : 
							<span id="name"><input type="text" name="cateName" id="cateName" class="input-sm"></span>
						</div>		
						<div class="formb">
							<input type="button" id="btn" class="btn-default btn-sm" value="등록" >
						</div>
					</form>
				</div>				 
				<c:import url="/WEB-INF/views/division/right.jsp" />	
			</div>
		</div>	
	</body>
</html>
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
					<div class="topb">서비스 등록</div> 
						<form action="extraAdd" method="post" id="frm" class="form-horizontal">
							<div class="formb">
								서비스명 :
								<input type="text" name="extraName" required class="input-sm">
							</div>
							<div class="formb">
								서비스 분류 :
								<select name="cateCode" required class="input-sm">
									<option value="" class="input-sm">분류 선택</option>
									<c:forEach items="${cateList }" var="cate">
										<option value="${cate.cateCode }" class="input-sm">${cate.cateName }</option>
									</c:forEach>
								</select>
							</div>
							<div class="formb">
								서비스 가격 : 
								<input type="text" name="extraRate" required class="input-sm" >
							</div>
							<div class="formb">
								<input type="submit" value="등록" class="btn-default btn-sm">
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
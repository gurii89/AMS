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
						<div class="topb">행사 등록</div> 
							<form action="eventAdd" method="post" id="frm" class="form-horizontal">
								<div class="formb">
									요금 증감폭 : 
									<input type="text" name="eventFx" required class="input-sm">
								</div>
								<div class="formb">
									시작일 : 
									<input type="date" name="eventStart" id="eventStart" class="input-sm">
								</div>
								<div class="formb">
									종료일 : 
									<input type="date" name="eventEnd" id="eventEnd" class="input-sm">
								</div>
								<div class="formb">
									<input type="submit" value="등록" class="btn-default btn-sm">
								</div>
							</form>
					 </div>				 
				<c:import url="/WEB-INF/views/division/right.jsp" />	         
			</div>
		</div>		
	</body>
</html>
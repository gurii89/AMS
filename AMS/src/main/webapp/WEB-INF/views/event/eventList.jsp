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
						<div class="topb">행사 목록</div> 
						<table class="bs">
							<tr>
								<th>행사 번호</th>
								<th>요금 증감폭</th>
								<th>등록일</th>
								<th>등록자</th>
								<th>시작일</th>
								<th>종료일</th>
							</tr>
							<c:forEach items="${eventList }" var="event">
								<tr>
									<td>${event.eventCode }</td>
									<td>${event.eventFx }</td>
									<td>${event.eventDate }</td>
									<td>${event.eId }</td>
									<td>${event.eventStart }</td>
									<td>${event.eventEnd }</td>
								</tr>
							</c:forEach>
						</table>
						<c:import url="/WEB-INF/views/division/paging.jsp" />
					</div>				 
				<c:import url="/WEB-INF/views/division/right.jsp" />
			</div>
		</div>		
	</body>
</html>
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
						<h3>서비스 목록</h3> 
						<table>
							<tr>
								<th>서비스 번호</th>
								<th>서비스명</th>
								<th>서비스 분류</th>
								<th>서비스 가격</th>
								<th>서비스 등록일</th>
								<th>등록자</th>
							</tr>
							<c:forEach items="${extraList }" var="extra">
								<tr>
									<td>${extra.extraCode }</td>
									<td>${extra.extraName }</td>
									<td>${extra.cateCode }</td>
									<td>${extra.extraRate }</td>
									<td>${extra.extraDate }</td>
									<td>${extra.eId }</td>
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
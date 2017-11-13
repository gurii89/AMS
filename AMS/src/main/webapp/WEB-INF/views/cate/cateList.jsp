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
				//
			})
		</script>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row content">     
				<c:import url="/WEB-INF/views/division/left.jsp" />
				<c:import url="/WEB-INF/views/division/top.jsp" />			
				<div class="col-sm-10 top">
					<table>
						<tr>
							<th>분류 번호</th>
							<th>대분류</th>
							<th>소분류</th>
							<th>분류명</th>
							<th>등록자</th>
							<th>등록일</th>
						</tr>
						<c:forEach items="${list }" var="cate">
							<tr>
								<td>${cate.cateCode }</td>
								<td>${cate.cateLarge }</td>
								<td>${cate.cateSmall }</td>
								<td>${cate.cateName }</td>
								<td>${cate.eId }</td>
								<td>${cate.cateDate }</td>
							</tr>
						</c:forEach>
					</table>
					<ul class="pager">
				        <c:if test="${currentPage > 1}">
				            <li class="previous"><a href="cateList?currentPage=${currentPage-1}">이전</a></li>
				        </c:if>
				        <c:if test="${currentPage < lastPage}">
				            <li class="next"><a href="cateList?currentPage=${currentPage+1}">다음</a></li>
				        </c:if>
				    </ul>
				</div>				 
				<c:import url="/WEB-INF/views/division/right.jsp" />
			</div>
		</div>	
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/css.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
			 <div class="topb">객실 타입 목록</div> 
			 <table class="bs">
			 	<tr>
			 		<th>객실 타입 코드</th>
			 		<th>객실 특징</th>
			 		<th>등록인</th>
			 		<th>등록일</th>
			 		<th>삭제</th>
			 	</tr>
			 	<c:forEach items="${roomOptionList}" var="roomOptionList">
			 		<tr>
			 			<td>${roomOptionList.roomTypeCode}</td>
			 			<td>${roomOptionList.cateCode}</td>
			 			<td>${roomOptionList.eId}</td>
			 			<td>${roomOptionList.roomOptDate}</td>
			 			<td>삭제</td>
			 		</tr>
			 	</c:forEach>
			 </table>
			 </div>
<!-- ////////////////////////////////////가운데 메뉴 끝///////////////////////////////////////// -->	
<!-- ////////////////////////////////////오른쪽 메뉴 시작///////////////////////////////////////// -->				 
<c:import url="/WEB-INF/views/division/right.jsp" />
<!-- ////////////////////////////////////오른쪽 메뉴 끝///////////////////////////////////////// -->	         
		</div>
	</div>
	
</body>
</html>
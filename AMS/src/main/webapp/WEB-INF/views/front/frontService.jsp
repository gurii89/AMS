<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	$(document).ready(function(){
		
	});
</script>
</head>

<body>
	<div class="clearfix col-sm-10 top">
		<div class="topb">서비스 프론트</div>
		<c:forEach items="${extralist}" var="extraList">
			<span class="frontE">
				<input type="text" class="exName" value="${extraList.extraName}" readonly="readonly">
				<input type="text" class="exName" value="${extraList.extraRate}" readonly="readonly">
			</span>
		</c:forEach>
	</div>
</body>
</html>
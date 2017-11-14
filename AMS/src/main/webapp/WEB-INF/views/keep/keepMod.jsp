<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/css.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
			
				<h3>보관품 수정</h3>
				<form action="./keepMod" method="post">
				<input type="hidden" value="${keepm.kCode}" name="kCode">
						<p>등록인</p>
						<input type="text" value="${keepm.eId}" name="eId"
							readonly="readonly">
						<p>보관품명</p>
						<textarea name="k_name">${keepm.kName}</textarea>
						<p>발견장소</p>
						<textarea name="k_site">${keepm.kSite}</textarea>
						<p>메모</p>
						<textarea name="k_memo">${keepm.kMemo}</textarea>
						
						
						<input type="submit" value="등록">
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
</html>
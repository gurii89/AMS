<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/css.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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

				<div class="topb">보관품 수정</div>
				<form action="keepMod" method="post" id="frm"
					class="form-horizontal">
					<input type="hidden" value="${keep.kCode}" name="kCode">
					<div>
					보관품 상태 :
					<select name="cateCode" id="cateCode" class="input-sm">
									<c:if test="${keep.cateCode eq null }">
										<option value="" class="input-sm">상태를 선택하세요</option>
									</c:if>
									<c:forEach items="${cateList }" var="cate">
										<c:if test="${cate.cateSmall eq 'keep' }">
											<option value="${cate.cateCode }" class="input-sm">${cate.cateName }</option>
										</c:if>
									</c:forEach>
									<c:if test="${keep.cateCode != null }">
										<option value="" class="input-sm">보관품 상태 표시 없음</option>
									</c:if>
								</select>
					</div>
					<div>
						보관품명 : <input type="text" name="kName" id="kName"
							value="${keep.kName }" required class="input-sm">
					</div>
					<div>
					발견장소 :
					<input type="text" name="kSite" id="kSite"
							value="${keep.kSite }" required class="input-sm">
					<textarea name="k_site" class="input-sm" rows="10" cols="80">${keep.kSite}</textarea>
					<c:choose>
						<c:when test="${loginfor.eId == keep.eId}">
							<br>
							<input type="submit" value="수정" class="btn-default btn-sm">
						</c:when>
						<c:otherwise>
							<br>
					수정 권한이 없습니다.
						</c:otherwise>
					</c:choose>
					</div>
					<div class="formb">메모</div>
					<textarea name="k_memo" class="input-sm" rows="10" cols="80">${keep.kMemo}</textarea>
					<c:choose>
						<c:when test="${loginfor.eId == keep.eId}">
							<br>
							<input type="submit" value="수정" class="btn-default btn-sm">
						</c:when>
						<c:otherwise>
							<br>
					수정 권한이 없습니다.
						</c:otherwise>
					</c:choose>
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
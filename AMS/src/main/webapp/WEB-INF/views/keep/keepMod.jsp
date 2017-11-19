<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>	
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
</body>
</html>
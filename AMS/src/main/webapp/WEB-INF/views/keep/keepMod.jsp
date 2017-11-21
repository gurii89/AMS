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
	<form action="keepMod" method="post" id="frm" class="form-horizontal">
		<input type="hidden" value="${keep.kCode}" name="kCode">
		<div>
			보관품명 : <input type="text" name="kName" id="kName"
				value="${keep.kName }" required class="input-sm">
		</div>
		<div>
			보관품 상태 : <select name="kCondition" id="kCondition" class="input-sm">
			<option value="등록중" class="input-sm">등록중</option>
				<option value="주인찾음" class="input-sm">주인찾음</option>
				
			</select>
		</div>
		<div>
			발견장소 : 
			<input type="text" name="kSite" id="kSite" value="${keep.kSite }" required class="input-sm">
			</div>
		<div class="formb">메모</div>
		<textarea name="k_memo" class="input-sm" rows="10" cols="80">${keep.kMemo}</textarea>
		<div>
				<input type="submit" value="수정" class="btn-default btn-sm">
			</div>
	</form>
</body>
</html>
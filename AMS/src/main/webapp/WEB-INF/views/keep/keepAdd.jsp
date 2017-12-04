<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>
	<h4>보관품 등록</h4>
	<form action="keepAdd" method="post">
			<p>등록인 : </p>
			<input type="text" value="${loginfor.eId}" name="eId"
				readonly="readonly"><br><br>
			<p>보관품명 : </p>
			<input type="text" name="kName" required="required"><br><br>
			<p>보관상태 : </p>
			<select name="kCondition" id="kCondition" required class="input-sm">
			<option value="보관등록" class="input-sm">보관등록</option>
			</select><br><br>
			<p>발견장소 : </p>
			<input type ="text" name="kSite" required="required"><br>
			<p>메모 : </p>
			<input type = "text" name="kMemo"><br><br>
			<input type="submit" value="등록">
	</form>			
</body>
</html>
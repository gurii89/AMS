<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	<body>	
		<div class="topb">결제 등록</div>
		<form action="paymentAdd" method="post">
			<input type="hidden" id="booCode" name="booCode" value="${booCode }">
			<div class="formb">
				결제 방식 : 
				<select name="pMethod" class="input-sm" required>
					<option class="input-sm">방식 선택</option>
					<option class="input-sm" value="card">카드</option>
					<option class="input-sm" value="cash">현금</option>
					<option class="input-sm" value="outside">외부</option>
				</select>
			</div>
			<div class="formb">
				결제 금액
				<input type="text" id="pRate" name="pRate" class="input-sm" required>
			</div>
			<div class="formb">
				특이사항
				<input type="text" name="pMemo" class="input-sm">
			</div>
			<div>
				<input type="submit" class="btn-default btn-sm" value="등록">
			</div>
		</form>
	</body>
</html>
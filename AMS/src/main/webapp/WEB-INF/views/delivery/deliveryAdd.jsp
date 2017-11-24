<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div class="topb">운송 등록</div>
	<form action="deliveryAdd" method="post" id="frm"
		class="form-horizontal">
		<div class="formb">
			보관품코드 : <select name="kCode" id="kCode" required class="input-sm">
				<option value="" class="input-sm">보관품코드 선택</option>
				<c:forEach items="${keepList}" var="keep">
				<c:if test = "${keep.kCondition eq '등록중' }">
					<option class = "input-sm" value = "${keep.kCode}">
					${keep.kName} </option>
					</c:if>
				</c:forEach>
			</select>
		</div>
		<div class="formb">
			고객코드 : <select name="gCode" id="gCode" required class="input-sm">
				<option value="" class="input-sm">고객코드 선택</option>
				<c:forEach items="${guestList}" var="guest">
				<c:if test = "${guest.gNation eq '5' }">
					<option class = "input-sm" value = "${guest.gCode}">
					${guest.gName} </option>
					</c:if>
				</c:forEach>
			</select>
			</div>
	<div class="formb">
		운송회사명 : <select name="dConame" id="dConame" required class="input-sm">
			<option value="cj대한통운" class="input-sm">cj대한통운</option>
			<option value="현대" class="input-sm">현대</option>
			<option value="우체국" class="input-sm">우체국</option>
			<option value="롯데택배" class="input-sm">롯데택배</option>
			<option value="편의점택배" class="input-sm">편의점택배</option>
			<option value="로젠택배" class="input-sm">로젠택배</option>
			<option value="한진" class="input-sm">한진</option>
			<option value="로지아이" class="input-sm">로지아이</option>
			<option value="옐로우캡" class="input-sm">옐로우캡</option>
			<option value="KGB" class="input-sm">KGB</option>
			<option value="FedEx" class="input-sm">FedEx</option>
			<option value="DHL" class="input-sm">DHL</option>
		</select>
	</div>
	<div class="formb">
		운송장번호 : (-하이픈은 생략) <input type="text" name="dNumber" required
			class="input-sm">
	</div>
	<div class="formb">
		운송예정일 :
		<input type="date" name="dDay" id="dDay" required class="input-sm">
	</div>
	<input type="submit" value="등록">
</body>
</html>
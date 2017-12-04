<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>
	<div class="topb">운송 수정</div>
	<form action="deliveryMod" method="post" id="frm" class="form-horizontal">
		<input type="hidden" value="${delivery.kCode}" name="kCode">
		<div>
			고객아이디 : <input type="text" name="gCode" id="gCode"
				value="${delivery.gCode }" required class="input-sm">
		</div>
		<div>
			운송회사명 : <select name="dConame" id="dConame" class="input-sm">
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
		<div>
			운송장번호 : (-하이픈 제외)
			<input type="text" name="dNumber" id="dNumber" value="${delivery.dNumber }" required class="input-sm">
			</div>
			<div>
			발송예정날짜 : 
			<input type="text" name="dDay" id="dDay" value="${delivery.dDay }" required class="input-sm">
			</div>
			<div>	
				<input type="submit" value="수정" class="btn-default btn-sm">
			</div>
	</form>
</body>
</html>
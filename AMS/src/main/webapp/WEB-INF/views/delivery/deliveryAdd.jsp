<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<h4>운송 등록</h4>
	<form action="deliveryAdd" method="post">
		<p>등록인 :</p>
		<input type="text" value="${loginfor.eId}" name="eId"
			readonly="readonly"><br>
		<p>보관품 :</p>
		<select name="kCode" class="input-sm" required>
		 		<option value="">선택하세요</option>
		 		<c:forEach items="${kSelect}" var="k">
		 			<option value="${k.kCode}">${k.kName}</option>
		 		</c:forEach>
		 	</select>
		<p>고객명 :</p>
		<select name="gCode" class="input-sm" required>
		 		<option value="">선택하세요</option>
		 		<c:forEach items="${gSelect}" var="g">
		 			<option value="${g.gCode}">${g.gName}</option>
		 		</c:forEach>
		 	</select>
		<p>운송회사명 :</p>
		<select name="dConame" id="dConame" required class="input-sm">
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
		<p>운송장번호 : (-하이픈은 생략)</p>
		<textarea name="dNumber"></textarea>
		<p>운송예정일 :</p>
		<textarea name="dDay"></textarea>
		<input type="submit" value="등록">
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<div class="col-sm-6">
	<table class="bs">
		<tr>
			<th>총 금액</th>
			<th>결제 금액</th>
			<th>잔금</th>
		</tr>
		<tr>
			<td id="sumRate">0</td>
			<td id="sumPay">${bookingPayment }</td>
			<td id="RMP"></td>
		</tr>
	</table>
</div>
<div class="col-sm-6">
	<table class="bs">
		<tr>
			<th>고객 번호</th>
			<th>고객명</th>
			<th>고객 성별</th>
			<th>국적</th>
			<th>연락처</th>
		</tr>
		<c:forEach items="${bookingGuestList }" var="bg">
			<tr class="bookingGuest">
				<td>${bg.gCode }</td>
				<td>${bg.gName }</td>
				<td>${bg.gGender }</td>
				<td>${bg.gNation }</td>
				<td>${bg.gPhone }</td>
			</tr>
		</c:forEach>
	</table>
</div>
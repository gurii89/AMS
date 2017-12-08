<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<div class="col-sm-6">
	<table class="bs">
		<tr>
			<th>객실 종류</th>
			<th>예약 상태</th>
			<th>이용금액</th>
			<th>호수</th>
		</tr>
		<c:forEach items="${bookingRoomList }" var="br">
			<tr class="bookingRoom">
				<td id="${br.booCode }">${br.roomTypeCode }</td>
				<td>${br.booRoomCondition }</td>
				<td class="rate">${br.booRoomRate }</td>
				<td id="${br.booRoomCode }" class="roomCode"></td>
			</tr>
		</c:forEach>
	</table>
</div>
<div class="col-sm-6">
	<table class="bs">
		<tr>
			<th>서비스명</th>
			<th>예약일</th>
			<th>이용금액</th>
		</tr>
		<c:forEach items="${bookingExtraList }" var="be">
			<tr>
				<td>${be.extraCode }</td>
				<td>${be.booExtraDate }</td>
				<td class="rate">${be.booExtraRate }</td>
			</tr>
		</c:forEach>
	</table>
</div>
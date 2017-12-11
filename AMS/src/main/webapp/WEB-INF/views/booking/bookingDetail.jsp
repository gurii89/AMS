<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="<c:url value='/resources/js/bookingDetail.js'/>"></script>
	</head>
	<body>	
		<div class="topb">예약 상세</div>
		<div class="clearfix col-sm-12">
			<c:if test="${loginfor.eDepartment eq 'front'}">
				<div class="text-right">
					<button id="payBtn" class="btn-default btn-sm">결제</button>
					<span id="in"><button id="inBtn" class="btn-default btn-sm">입실</button></span>
					<span id="can"><button id="canBtn" class="btn-default btn-sm">예약 취소</button></span>
					<span id="guest"><button id="guestBtn" class="btn-default btn-sm">고객 등록</button></span>					
					<span id="out"><button id="outBtn" class="btn-default btn-sm">퇴실</button></span>					
				</div>
			</c:if>
			<table class="bs">
				<tr>
					<th>예약 번호</th>
					<th>예약 상태</th>
					<th>예약일</th>
					<th>체크인 예정</th>
					<th>숙박일</th>
					<th>인원</th>
					<th>유입경로</th>
					<th>등록자</th>
					<th>메모</th>
				</tr>
				<tr>
					<td id="booCode">${booking.booCode }</td>
					<td id="booCondition">${booking.booCondition }</td>
					<td>${booking.booDate }</td>
					<td>${booking.booIn }</td>
					<td>${booking.booOut }</td>
					<td>${booking.booCount }</td>
					<td>${booking.booPath }</td>
					<td>${booking.eId }</td>
					<td>${booking.booMemo }</td>
				</tr>
			</table>
		</div>
		<div class="clearfix">
			<c:import url="/WEB-INF/views/booking/bookingDetailRoomService.jsp" />
		</div>
		<div class="clearfix">
			<c:import url="/WEB-INF/views/booking/bookingDetailRateGuest.jsp" />
		</div>
	</body>
</html>
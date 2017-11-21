<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="<c:url value='/resources/js/bookingAdd.js'/>"></script>
	</head>
	<body>	
		<div class="clearfix topb col-sm-12 top">예약 등록</div>
		<div class="col-sm-6 top">
			<c:import url="/WEB-INF/views/booking/bookingSub.jsp" />
		</div>
		<div class="col-sm-6 top">
			<div class="formb">
				<input type="button" id="roomBtn" class="btn-default btn-sm" value="객실">
				<input type="button" id="extraBtn" class="btn-default btn-sm" value="서비스">
				<hr>
			</div>
			<div id="room" class="formb">
				<c:import url="/WEB-INF/views/booking/bookingRoom.jsp" />
			</div>
			<div id="extra" class="formb">
				<c:import url="/WEB-INF/views/booking/bookingExtra.jsp" />
			</div>
			<p id="er" class="text-danger"> </p>
			<form action="bookingAdd" method="post" id="frm" class="form-horizontal">
				<div class="formb">
					체크인 예정일 :
					<input type="date" name="booIn" id="booIn" class="input-sm" value="${today }" required>
				</div>
				<div class="formb">
					숙박일 :
					<input type="text" name="booNight" id="booNight" class="input-sm" required>
				</div>
				<div class="formb">
					예약인원 :
					<input type="text" name="booCount" id="booCount" class="input-sm" required>
				</div>
				<div class="formb">
					유입경로 :
					<input type="text" name="booPath" id="booPath" class="input-sm" >
				</div>
				<div class="formb">
					특이사항 :
					<input type="text" name="booMemo" id="booMemo" class="input-sm" >
				</div>
				
				<div class="formb">
					<input type="button" id="btn" value="등록" class="btn-default btn-sm">
				</div>
			</form>
		</div>
	</body>
</html>
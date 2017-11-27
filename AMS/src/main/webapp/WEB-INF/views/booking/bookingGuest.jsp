<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="<c:url value='/resources/js/bookingGuest.js'/>"></script>
	</head>
	<body>	
		<div class="clearfix col-sm-12 top topb">	
			<div class="topb">예약 고객 등록</div>
			<div>
				<p id="er"></p>
				<table class="bs">
					<tr>
						<th>예약 번호</th>
						<th>고객 번호</th>
						<th>등록</th>
					</tr>
					<tr>
						<td id="resultBooking">0</td>
						<td id="resultGuest">0</td>
						<td id="resultBtn" class="btn-default btn-sm">등록</td>
					</tr>
				</table>
			</div>		
			<div class="clearfix col-sm-6 top">
				<table class="bs">
					<tr>
						<th>예약 번호</th>
						<th>예약일</th>
						<th>체크인 예정</th>
						<th>숙박일</th>
						<th>인원</th>
					</tr>
					<tbody id="booking"></tbody>
				</table>
				<ul class="pager">
			        <li class="previous"><a id="bookingPrev" class="paging btn-default btn-sm" >이전</a></li>
			        <li class="next"><a id="bookingNext" class="paging btn-default btn-sm">다음</a></li>
				</ul>
			</div>
			<div class="col-sm-6 top">
				<table class="bs">
					<tr>
						<th>고객 번호</th>
						<th>고객명</th>
						<th>성별</th>
						<th>국적</th>
						<th>연락처</th>
					</tr>
					<tbody id="guest"></tbody>
				</table>
				<ul class="pager">
			        <li class="previous"><a id="guestPrev" class="paging btn-default btn-sm" >이전</a></li>
			        <li class="next"><a id="guestNext" class="paging btn-default btn-sm">다음</a></li>
				</ul>
			</div>
		</div>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<div class="col-sm-11 top">
	<c:if test="${top eq 'notice'}">
		<br>
		<ul class="nav navbar-nav">
			<li><a href="./noticeList" class="level">공지사항 리스트</a></li>
			<li><a href="./noticeAdd" class="level">공지사항 등록</a></li>
		</ul>
	</c:if>
	<c:if test="${top eq 'cate' }">
		<br>
		<ul class="nav navbar-nav">
			<li><a href="cateList">분류 목록</a></li>
			<li><a href="cateAdd">분류 등록</a></li>
		</ul>
	</c:if>
	<c:if test="${top eq 'room' }">
		<br>
		<ul class="nav navbar-nav">
			<li><a href="roomTypeList" class="level">객실 타입 목록</a></li>
			<li><a href="roomTypeAdd" class="level">객실 타입 등록</a></li>
			<li><a href="roomList" class="level">객실 목록</a></li>
			<li><a href="roomAdd" class="level">객실 등록</a></li>
		</ul>
	</c:if>
	<c:if test="${top eq 'guest' }">
		<br>
		<ul class="nav navbar-nav">
			<li><a href="guestList" class="level">고객 목록</a></li>
			<li><a href="guestAdd" class="level">고객 등록</a></li>
		</ul>
	</c:if>
	<c:if test="${top eq 'extra' }">
		<br>
		<ul class="nav navbar-nav">
			<li><a href="extraList" class="level">서비스 목록</a></li>
			<li><a href="extraAdd" class="level">서비스 등록</a></li>
		</ul>
	</c:if>
	<c:if test="${top eq 'home'}">
		<br>
		<div class="noticetag1">공지사항 확인하세요.</div>
		<div class="noticetag2">공지사항 입니다.</div>
	</c:if>
	<c:if test="${top eq 'keep'}">
		<br>
		<ul class="nav navbar-nav">
			<li><a href="keepList" class="level">보관품 목록</a></li>
			<li><a href="keepAdd" class="level">보관품 등록</a></li>
		</ul>
	</c:if>
	<c:if test="${top eq 'employee' }">
		<br>
		<ul class="nav navbar-nav">
			<li><a href="employeeList" class="level">직원 목록</a></li>
			<li><a href="employeeAdd" class="level">직원 등록</a></li>
		</ul>
	</c:if>
	<c:if test="${top eq 'front' }">
		<br>
		<ul class="nav navbar-nav">
			<li><a href="frontMain" class="level">객실 프론트</a></li>
			<li><a href="frontService" class="level">서비스 프론트</a></li>
		</ul>
	</c:if>
	<c:if test="${top eq 'event' }">
		<br>
		<ul class="nav navbar-nav">
			<li><a href="eventList" class="level">행사 목록</a></li>
			<li><a href="eventAdd" class="level">행사 등록</a></li>
		</ul>
	</c:if>
	<c:if test="${top eq 'booking' }">
		<br>
		<ul class="nav navbar-nav">
			<li><a href="bookingList" class="level">예약 목록</a></li>
			<li><a href="bookingAdd" class="level">예약 등록</a></li>
			<li><a href="bookingGuestAdd" class="level">예약 고객 등록</a></li>
			<li><a href="paymentList" class="level">결제 목록</a></li>
			<li><a href="inOutList" class="level">입퇴실 목록</a></li>
		</ul>
	</c:if>
	<c:if test="${top eq 'delivery' }">
		<br>
		<ul class="nav navbar-nav">
			<li><a href="deliveryList" class="level">운송 목록</a></li>
			<li><a href="deliveryAdd" class="level">운송 등록</a></li>
		</ul>
	</c:if>
	<c:if test="${top eq 'clean' }">
		<br>
		<ul class="nav navbar-nav">
			<li><a href="cleanMain" class="level">청소메인</a></li>
			<li><a href="cleanEndList" class="level">청소완료목록</a></li>
		</ul>
	</c:if>
</div>


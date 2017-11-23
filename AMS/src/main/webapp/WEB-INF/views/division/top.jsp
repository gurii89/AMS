<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		<ul class="nav navbar-nav">
			<li><a href="">메인입니당</a></li>
		</ul>
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
		<div class="dropdown">
			<button class="btn btn-sm btn-default drbtn dropdown-toggle" type="button" data-toggle="dropdown">층별보기
			<span class="caret"></span></button>
			<ul class="dropdown-menu">
			<c:forEach items="${floor}" var="Floor">
				<li class="drbtn"><a href="frontfloor?ffloof=${Floor}">${Floor}층</a></li>
			</c:forEach>
			</ul>
		</div>
		<div class="">
			<select class="input-sm typeselect">
			<option>타입별 보기</option>	
			<c:forEach items="${frontdroprt}" var="frontdropRt">
				<option>${frontdropRt.roomTypeName}</option>
			</c:forEach>
			</select>
		</div>
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
		</ul>
	</c:if>
</div>


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
	<c:if test="${top eq 'home'}">
		<br>
		<ul class="nav navbar-nav">
			<li><a href="">메인입니당</a></li>
		</ul>
	</c:if>
</div>


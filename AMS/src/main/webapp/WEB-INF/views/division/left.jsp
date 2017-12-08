<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

	<div class="col-sm-2 sidenav">
		<br> <a href="home"><img class="tohome"
			src="<c:url value='/resources/img/3333.png'/>"></a>
		<ul class="nav">
			<li class="active">
					<div class="loginfo">&nbsp;&nbsp;<div class="glyphicon glyphicon-user"></div></div>
					<span class="loginfo">권한:${loginfor.eDepartment}</span>
					<div class="loginfo">
						<a href="#" class="myinfor">${loginfor.eName}(${loginfor.eId})님</a>
						<span class="loginfo">안녕하세요!</span>
					</div>
					<form method="post" action="./logout">
						<span><input class="logout" type="submit" value="LOGOUT"></span>
					</form>
			</li>
			<li>&nbsp;</li>
			<li>&nbsp;</li>
			<li><a href="employeeList" class="loginfo"><span
					class="glyphicon glyphicon-chevron-right"></span> 직원</a></li>
			<li><a href="./frontMain" class="loginfo"><span
					class="glyphicon glyphicon-chevron-right"></span> 프론트</a></li>
			<li><a href="./roomMain" class="loginfo"><span
					class="glyphicon glyphicon-chevron-right"></span> 객실</a></li>
			<li><a href="bookingList" class="loginfo"><span
					class="glyphicon glyphicon-chevron-right"></span> 예약</a></li>
			<li><a href="extraList" class="loginfo"><span
					class="glyphicon glyphicon-chevron-right"></span> 서비스</a></li>
			<li><a href="./keepList" class="loginfo"><span
					class="glyphicon glyphicon-chevron-right"></span> 보관품</a></li>
			<li><a href="eventList" class="loginfo"><span
					class="glyphicon glyphicon-chevron-right"></span> 행사</a></li>
			<li><a href="./noticeList" class="loginfo"><span
					class="glyphicon glyphicon-chevron-right"></span> 공지사항</a></li>
			<li><a href="cateList" class="loginfo"><span
					class="glyphicon glyphicon-chevron-right"></span> 카테고리</a></li>
			<li><a href="cleanMain" class="loginfo"><span
					class="glyphicon glyphicon-chevron-right"></span> 청소</a></li>
		</ul>
		<br>
	</div>

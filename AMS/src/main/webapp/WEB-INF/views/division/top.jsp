<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-sm-11 top">
	<c:if test="${noticetop=='top'}">
		<br>
		<ul class="nav navbar-nav">
			<li><a href="">공지사항 리스트</a></li>
			<li><a href="./noticeAdd">공지사항 등록</a></li>
		</ul>
	</c:if>
	<br>

		<br>
		<ul class="nav navbar-nav">
			<li><a href="#">직원 목록</a></li>
			<li><a href="employeeAdd">직원 등록</a></li>
			<li><a href="#">Page 3333</a></li>
			<li><a href="#">Page 4444</a></li>
			<li><a href="#">Page 5555</a></li>
		</ul>
		<br>
</div>


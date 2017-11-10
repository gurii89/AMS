<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-sm-11 top">
	<c:if test="${top == 'notice'}">
		<br>
		<ul class="nav navbar-nav">
			<li><a href="./noticeList" class="level">공지사항 리스트</a></li>
			<li><a href="./noticeAdd" class="testtest">공지사항 등록</a></li>
		</ul>
	</c:if>
	<c:if test="${top == 'cate' }">
		<br>
		<ul class="nav navbar-nav">
			<li><a href="cateList">분류 목록</a></li>
			<li><a href="cateAdd">분류 등록</a></li>
		</ul>
	</c:if>
	<c:if test="${top == 'home'}">
		<br>
		<ul class="nav navbar-nav">
			<li><a href="">메인입니당</a></li>
		</ul>
	</c:if>
</div>


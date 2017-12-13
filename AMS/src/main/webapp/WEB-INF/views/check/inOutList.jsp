<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script>
			$(function(){
				var condi = $('#condi').html()
				
				// 행 선택시 예약 상세보기 이동
				$('.inOut').click(function(){
					$(location).attr('href', 'bookingDetail?booCode='+$(this).children().first().text())
				})
				
				// 검색조건 변경시 검색창 연동
				$('#cate').on('change', function(){
					input()
				})
				
				// 초기 검색창 연동
				input()
				
				// 검색조건 검색창 연동 함수
				function input(){
					var val = $('#cate').val()
					// 검색 조건 날짜 선택시 날짜 입력 가능하게
					if(val == 'chin.e_name' || val == 'chout.e_name'){
						$('#condi').html(condi)
						$('#input').val('')
					}else{
						$('#input').attr('type', 'date')						
					}
				}
			})
		</script>
	</head>
	<body>
		<div class="topb">입퇴실 목록</div>
		<c:choose>
			<c:when test="${cate != null }">
				<input type="hidden" id="cate" value="${cate }">
				<input type="hidden" id="input" value="${input }">
			</c:when>
			<c:otherwise>
				<form action="inOutList" method="post" class="form-horizontal">
					<select name="cate" id="cate" required class="input-sm">
						<option class="input-sm" value="">검색 조건 선택</option>
						<option class="input-sm" value="DATE_FORMAT(in_date, '%Y-%m-%d')">입실일</option>
						<option class="input-sm" value="chin.e_name">입실 처리자</option>
						<option class="input-sm" value="DATE_FORMAT(out_date, '%Y-%m-%d')">퇴실일</option>
						<option class="input-sm" value="chout.e_name">퇴실 처리자</option>
					</select>
					<span id="condi">
						<input type="text" name="input" id="input" value="${input }" required class="input-sm">
					</span>
					<input type="submit" value="검색" class="btn-default btn-sm">
				</form>
			</c:otherwise>
		</c:choose> 
		<table class="bs">
			<tr>
				<th>예약 번호</th>
				<th>예약 상태</th>
				<th>예약일</th>
				<th>객실 호수</th>
				<th>입실시간</th>
				<th>입실 처리자</th>
				<th>퇴실시간</th>
				<th>퇴실 처리자</th>
			</tr>
			<c:forEach items="${inOutList }" var="inOut">
				<tr class="inOut">
					<td>${inOut.booCode }</td>
					<td>${inOut.booCondition }</td>
					<td>${inOut.booDate }</td>
					<td>${inOut.roomCode }</td>
					<td>${inOut.inDate }</td>
					<td>${inOut.inId }</td>
					<td>${inOut.outDate }</td>
					<td>${inOut.outId }</td>
				</tr>
			</c:forEach>
		</table>
		<c:import url="/WEB-INF/views/division/paging.jsp" />						
	</body>
</html>
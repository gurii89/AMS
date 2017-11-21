<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script>
			$('documemt').ready(function(){
				$('#search').on('change', function(){
					var val = $('#search option:selected').val()
					if(val == 'boo_date' || val == 'boo_in'){
						$('#input').attr('type', 'date');
					}else{
						$('#input').attr('type', 'text');
						$('#input').val('')
					}
				})
			})
		</script>
	</head>
	<body>
		<div class="topb">예약 목록</div>
		<c:choose>			
			<c:when test="${cate != null }">
					<input type="hidden" id="cate" value="${cate }">
					<input type="hidden" id="input" value="${input }">
			</c:when>
			<c:otherwise>
				<form action="bookingList" method="post" class="form-horizontal">
					<select name="cate" id="search" required class="input-sm">
						<option id="opt" value="${cate }" class="input-sm">검색 조건 선택</option>							
						<option value="boo_code" class="input-sm">예약 번호</option>
						<option value="e_id" class="input-sm">등록자</option>
						<option value="boo_date" class="input-sm">예약일</option>
						<option value="boo_in" class="input-sm">체크인 예정일</option>
						<option value="boo_night" class="input-sm">숙박일</option>						
						<option value="boo_count" class="input-sm">인원</option>
						<option value="boo_path" class="input-sm">유입경로</option>
					</select>
					<input type="text" name="input" id="input" value="${input }" required class="input-sm">
					<input type="submit" value="검색" class="btn-default btn-sm">
				</form>
			</c:otherwise>
		</c:choose>	
		<table class="bs">
			<tr>
				<th>예약 번호</th>
				<th>예약일</th>
				<th>체크인 예정일</th>
				<th>숙박일</th>
				<th>인원</th>
				<th>유입경로</th>
				<th>등록자</th>
			</tr>
			<c:forEach items="${bookingList }" var="boo">
				<tr>
					<td>${boo.booCode }</td>
					<td>${boo.booDate }</td>
					<td>${boo.booIn }</td>
					<td>${boo.booNight }</td>
					<td>${boo.booCount }</td>
					<td>${boo.booPath }</td>
					<td>${boo.eId }</td>
				</tr>
			</c:forEach>
		</table>
		<c:import url="/WEB-INF/views/division/paging.jsp" />
	</body>
</html>
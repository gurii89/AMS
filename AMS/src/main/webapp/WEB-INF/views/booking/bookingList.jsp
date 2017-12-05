<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script>
			$('documemt').ready(function(){
				var condi = $('#condi').html()
				$('#cate').on('change', function(){
					$('#condi').html(condi)
					var val = $('#cate option:selected').val()
					// 날짜 검색 선택시 input tpye date로 변경
					if(val == 'boo_date' || val == 'boo_in'){
						$('#input').attr('type', 'date');
					// 숙박일 선택시 1박 초과된 건만 되도록
					}else if(val == 'boo_night'){
						$('#input').attr('type', 'hidden')
						$('#input').val('night')
					// 예약 상태 선택시 셀렉트 중 선택
					}else if(val == 'boo_condition'){
						var roomCondition = ['예약', '입실', '퇴실', '취소']
						var result = '';
						for(i=0; i<roomCondition.length; i++){
							result += '<option class="input-sm">'+roomCondition[i]+'</option>'
						}
						$('#condi').html('<select name="input" class="input-sm">'+result+'<select>')
					}else{
						$('#input').attr('type', 'text');
						$('#input').val('')
					}
				})
				
				// 예약 줄 선택시 상세보기로 이동
				$('.boo').click(function(){
					var booCode = $(this).children().first().text()
					$(location).attr('href', 'bookingDetail?booCode='+Number(booCode));
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
					<select name="cate" id="cate" required class="input-sm">
						<option id="opt" value="${cate }" class="input-sm">검색 조건 선택</option>							
						<option value="boo_code" class="input-sm">예약 번호</option>
						<option value="e_name" class="input-sm">등록자</option>
						<option value="boo_date" class="input-sm">예약일</option>
						<option value="boo_in" class="input-sm">체크인 예정일</option>
						<option value="boo_night" class="input-sm">숙박일</option>						
						<option value="boo_count" class="input-sm">인원</option>
						<option value="boo_path" class="input-sm">유입경로</option>
						<option value="boo_condition" class="input-sm">예약상태</option>
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
				<th>체크인 예정일</th>
				<th>숙박일</th>
				<th>인원</th>
				<th>유입경로</th>
				<th>등록자</th>
			</tr>
			<c:forEach items="${bookingList }" var="boo">
				<tr class="boo">
					<td>${boo.booCode }</td>
					<td>${boo.booCondition }</td>
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
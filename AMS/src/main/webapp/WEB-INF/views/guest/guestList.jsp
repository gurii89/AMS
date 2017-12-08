<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script>
			$(function(){
				$('#addBox').hide()
				
				// 예약 고객 등록시 간소화 메뉴 및 고객 등록 버튼 활성화
				if($('#booCode').val()){
					$('.addForm').hide()
					$('#addBox').show()
					// 고객 선택시 번호 체크
					$('.guest').click(function(){
						$('#addNum').html($(this).children().first().html())
						// 고객 등록
						$('#addBtn').click(function(){
							$(location).attr('href', 'bookingGuestAddPro?gCode='+$(this).prev().html()
											+'&booCode='+$('#booCode').val())
						})
					})				
				// 예약 목록 때 고객 선택시 수정 폼으로 이동
				}else{
					$('.guest').click(function(){
						$(location).attr('href', 'guestMod?gCode='+$(this).children().first().html())
					})
				}
				
				// 검색 조건 따라 검색창 변경
				$('#cate').on('change', function(){
					var val = $('#cate option:selected').val()
					// 검색조건 등록일, 생년월일 선택시 날짜검색창
					if(val == 'g_date' || val == 'g_birthdate'){
						$('#input').attr('type', 'date')
					// 검색창 기본값
					}else{
						$('#input').attr('type', 'text')
						$('#input').val('')
					}
				})
				
			})
		</script>
	</head>
	<body>
		<div class="topb">고객 목록</div>
		<c:choose>
			<c:when test="${cate != null }">
				<input type="hidden" id="cate" value="${cate }">
				<input type="hidden" id="input" value="${input }">
			</c:when>
			<c:otherwise>
				<form action="" method="post" id="guestFrm" class="form-horizontal">
					<select name="cate" id="cate" required class="input-sm">
						<option id="opt" class="input-sm" value="">검색 조건 선택</option>
						<option class="input-sm" value="g_name">고객 이름</option>
						<option class="input-sm" value="g_birthdate">생년월일</option>
						<option class="input-sm" value="g_date">등록일</option>
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
				<th>고객 번호</th>
				<th>고객명</th>
				<th>고객 성별</th>
				<th>고객 국적</th>
				<th>고객 연락처</th>
				<th class="addForm">등록자</th>
				<th>고객 생년월일</th>
				<th class="addForm">고객 직업</th>
				<th class="addForm">고객 이메일</th>
				<th class="addForm">고객 등록일</th>
			</tr>
			<c:forEach items="${guestList }" var="guest">
				<tr class="guest">
					<td>${guest.gCode }</td>
					<td>${guest.gName }</td>
					<td>${guest.gGender }</td>
					<td>${guest.gNation }</td>
					<td>${guest.gPhone }</td>
					<td class="addForm">${guest.eId }</td>
					<td>${guest.gBirthdate }</td>
					<td class="addForm">${guest.gJob }</td>
					<td class="addForm">${guest.gEmail }</td>
					<td class="addForm">${guest.gDate }</td>
				</tr>
			</c:forEach>
		</table>
		<c:import url="/WEB-INF/views/division/paging.jsp" />
		<div id="addBox">
			<table class="bs">
				<tr>
					<td>고객 번호</td>
					<td id="addNum"></td>
					<td id="addBtn">등록</td>					
				</tr>
			</table>
		</div>					
	</body>
</html>
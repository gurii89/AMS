<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script>
			$(function(){
				var sum = Number($('#usePay').text());
				$('#payTotal').text(sum)
				// 결제 금액 총합
				$.each($('.pay'), function(index, item){
					if($(item).children().eq(1).text() == '결제'){
						sum -= Number($(item).children().eq(3).text())
						$('#payTotal').text(sum)
					}
				})
				
				// 이용금액보다 결제금액이 클 경우 결제 불가
				$('#pRate').on('change', function(){
					if($(this).val() > parseInt($('#payTotal').text())){
						$('#er').text('결제금액이 잔금보다 큼')
						$(this).val('')
						.focus()
					}
				})
				
				// 결제 줄 클릭시 취소 팝업 생성 확인시 취소
				$('.pay').click(function(){
					if($(this).children().eq(1).text() == '결제'){
						var test = confirm('결제를 취소하시겠습니까?')
						if(test){
							$.get('paymentCancel?pCode='+$(this).children().first().text(), function(){
								 location.reload()
							})
						}	
					}
				})
				
				// 결제 등록
				$('#btn').click(function(){
					if($('#pRate') && $('#pMethod')){
						$('form').attr('onsubmit', 'return false');
						$.ajax({
							url:"paymentAdd",
							type:"POST",
							data:$('form').serialize(),
							success:function(){
								location.reload()
							}
						})
					}
				})
				
				// 예약 상세로 돌아가기
				$('#back').click(function(){
					$(location).attr('href', 'bookingDetail?booCode='+$('#booCode').val())
				})
			})
		</script>
	</head>
	<body>	
		<div class="topb">결제 등록</div>
		<div id="er" class="text-danger"></div>
		<table class="bs">
			<tr>
				<th>결제 번호</th>
				<th>결제 상태</th>
				<th>결제 방법</th>
				<th>결제 금액</th>
				<th>결제일</th>
				<th>예약 번호</th>
				<th>등록자</th>				
				<th>특이사항</th>
			</tr>
			<c:forEach items="${paymentList }" var="pay">
				<tr class="pay">
					<td>${pay.pCode }</td>
					<td>${pay.pCondition }</td>
					<td>${pay.pMethod }</td>
					<td>${pay.pRate }</td>
					<td>${pay.pDate }</td>
					<td>${pay.booCode }</td>
					<td>${pay.eId }</td>
					<td>${pay.pMemo }</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="3">이용 총액</td>
				<td id="usePay">${payTotal }</td>
				<td colspan="3">잔금</td>
				<td id="payTotal">0</td>
			</tr>
		</table>
		<hr>
		<form action="paymentAdd" method="post">
			<input type="hidden" id="booCode" name="booCode" value="${booCode }">
			<div class="formb">
				결제 방식 : 
				<select name="pMethod" id="pMethod" class="input-sm" required>
					<option class="input-sm" value="">방식 선택</option>
					<option class="input-sm" value="card">카드</option>
					<option class="input-sm" value="cash">현금</option>
					<option class="input-sm" value="outside">외부</option>
				</select>
			</div>
			<div class="formb">
				결제 금액
				<input type="text" id="pRate" name="pRate" class="input-sm" required>
			</div>
			<div class="formb">
				특이사항
				<input type="text" name="pMemo" class="input-sm">
			</div>
			<div>
				<input type="submit" id="btn" class="btn-default btn-sm" value="등록">
				<button id="back" class="btn-default btn-sm">돌아가기</button>
			</div>
		</form>
	</body>
</html>
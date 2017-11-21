<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	$('document').ready(function(){

		//상세정보 가져오기
		$('.de').click(function(){
			$('.visible').fadeIn();
			$.ajax({
				url:"frontDetail",
				type:"GET",
				data:"roomCode="+$(this).val(),
				success: function(data) {
					$('.dert').val(data);
				},
				fail: function(request, status, error){
				}
			})
		})
	});
</script>
</head>

<body>
	<div class="clearfix col-sm-10 top">
		<div class="topb">프론트 메인</div>
			
			<c:set target="${toproom}" var="toproo" value="${toproom}"></c:set>
			<c:forEach items="${frontRoom}" var="FrontRoom" begin="0" end="${allroomcode}">
				<c:choose>
					<c:when test="${FrontRoom.roomCodeMarkF eq toproo}">
						<span>${FrontRoom.roomCodeF}</span>	
					</c:when>
					<c:otherwise>
						<c:set var="toproo" value="${toproo-1}"></c:set>
						<br><span>${FrontRoom.roomCodeF}</span>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		<table class="main">
			<tr>
				<td><span class="fs1"><input type="button" value="501" class="de"></span></td>
				<td><span class="fs1"><input type="button" value="502" class="de"></span></td>
			</tr>	
		</table>
	</div>
	
	<div class="col-sm-2 top">
		<div class="visible">
		<div class="rdtop">객실 상세정보</div>
			<div class="well rdcon">
				<table class="frontdetal">
					<tr>
						<td>객실타입</td>
						<td><input type="text" class="dert" value="" readonly="readonly"></td>
						<td></td>
					</tr>
					<tr>
						<td>객실상태</td>
						<td>상태뽑기</td>
						<td><input type="button" value="수정" class="rdbtn"></td>
					</tr>
					<tr>
						<td>고객정보</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>고객정보</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>체크인</td>
						<td></td>
						<td></td>
					</tr>
					
				</table><br>
				<textarea rows="5" cols="25"></textarea><br>
				
				<button type="button" class="btn btn-info">저장</button>
				<button type="button" class="btn btn-primary">뭐넣지</button>
			</div>
		</div>
	</div>
</body>
</html>
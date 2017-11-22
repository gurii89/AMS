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
				data:"FrCode="+$(this).val(),
				success: function(data) {
					var rtname = JSON.parse(data)
					console.log(rtname);
					$('.dert').val(rtname.roomTypeCode);
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
		<c:forEach items="${frontRoom}" var="FrontRoom" begin="0"
			end="${allroomcode}">
			<c:choose>
				<c:when test="${FrontRoom.roomCodeMarkF eq toproo}">
					<span class="frontR"><input class="de" type="button" value="${FrontRoom.roomCodeF}"></span>
				</c:when>
				<c:otherwise>
					<c:set var="toproo" value="${toproo-1}"></c:set>
					<c:choose>
						<c:when test="${FrontRoom.roomCodeMarkF ne toproo}">
							<c:set var="for" value="false"></c:set>
							<c:forEach var="result" begin="0" end="${toproom-bottomroom}">
								<c:choose>
									<c:when test="${FrontRoom.roomCodeMarkF eq toproo}">
										<c:set var="for" value="true"></c:set>
									</c:when>
									<c:otherwise>
										<c:set var="toproo" value="${toproo-1}"></c:set>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<span class="wcon"><br></span>
							<span class="frontR"><input class="de" type="button" value="${FrontRoom.roomCodeF}"></span>
						</c:when>
						<c:otherwise>
							<span><br class="wcon"></span>
							<span class="frontR"><input class="de" type="button" value="${FrontRoom.roomCodeF}"></span>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</c:forEach>
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
						<td>체크인</td>
						<td></td>
						<td></td>
					</tr>
				</table><br>
				<textarea rows="4" cols="15"></textarea><br>
				
				<button type="button" class="btn btn-info">저장</button>
				<button type="button" class="btn btn-primary">뭐넣지</button>
			</div>
		</div>
	</div>
</body>
</html>
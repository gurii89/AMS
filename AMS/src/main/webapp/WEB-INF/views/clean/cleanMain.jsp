<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	$(document).ready(function(){
		var eId = ${loginfor.eId};

		$('.clickc').click(function(){

	            var clickc = $(this);
	            
	            var tr = clickc.parent().parent();
	            var td = tr.children();

	            //해당 객실코드
	            var Crc = td.eq(0).text();
	            //해당 객실 상태 변화 (db에 저장 x)
	            var Ccc = td.eq(3);
	            
	            $.ajax({
	            	url:"cleanStart",
					type:"GET",
					data:"Crc="+Crc+"&eId="+eId,
					success: function(data) {
						$.ajax({
			            	url:"cleanStartTime",
							type:"GET",
							data:"Crc="+Crc+"&eId="+eId,
							success: function(data) {
								var startTime = JSON.parse(data)
								console.log(startTime.cleanStart);
								$(td.eq(3)).html(startTime.cleanStart);
							},
							fail: function(request, status, error){
							}
						});
					},
					fail: function(request, status, error){
					}
				});

				$(td.eq(1)).html("청소중");
		})
	});
</script>
</head>

<body>
	<div class="clearfix col-sm-10 top">
		<div class="topb">청소 메인</div>
	
	<table class="bs">
		<tr>
			<th>객실코드</th>
			<th>상태</th>
			<th>담당자</th>
			<th>청소시작</th>
			<th>청소종료</th>
		</tr>
		<c:forEach items="${cleanrtcon}" var="cleanrtcon">				
		<tr>
			<td class="cleanInsert"><input type="text" class="hidden rc" value="${cleanrtcon.roomCode}">${cleanrtcon.roomCode}</td>
			<td>${cleanrtcon.roomConCondition}</td>
			<td>청소 직원아이디</td>
			<td><input type="button" value="청소시작" class="clickc"></td>
			<td><input type="button" value="청소종료"></td>
		</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
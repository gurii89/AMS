<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	$(document).ready(function(){
		$('.sectable').hide();
		
		$('.bs tr').click(function(){
			$('.reset').remove();
			$('.sectable').fadeIn();
			var tr = $(this);
			var td = tr.children();
			var rcc = td.eq(0).text();
			
			$.ajax({
				url:"roomOptionList",
				type:"GET",
				data:"rcc="+rcc,
				success: function(data) {
					var rtdlist = JSON.parse(data)
					console.log(rtdlist);

					var ttr = $('.sectable td').parent();
					var ttd = ttr.children();
					
					for(i=0; i<rtdlist.length; i++){
						$('.sectable').append('<tr class="reset"><td>'+rtdlist[i].roomTypeCode+'</td><td>'+rtdlist[i].cateCode+'</td><td>'+rtdlist[i].eId+'</td><td>'+rtdlist[i].roomOptDate+'</td><td>'+'<a href="./roomOptionDelete?rort='+rtdlist[i].roomTypeName+'&rocat='+rtdlist[i].cateCodeName+'">삭제</a>'+'</td></tr>')

					}
					
				

				},
				fail: function(request, status, error){
				}
			})
		})
		
		$('.opbtn').click(function(){
			alert('test alert >>>>'+$(this).val());
		})
	});
</script>
</head>

<body>	
	<div class="topb">객실 타입 목록</div> 
		<table class="bs table-hover">
			<tr>
				<th>객실 타입 코드</th>
				<th>등록인</th>
				<th>객실 타입명</th>
				<th>객실 타입 가격</th>
				<th>등록일</th>
				<th>최대 수용 인원</th>
				<th>특징보기</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<c:forEach items="${roomTypeList}" var="roomType">
	 		<tr>
	 			<td>${roomType.roomTypeCode}</td>
	 			<td>${roomType.eId}</td>
	 			<td>${roomType.roomTypeName}</td>
	 			<td>${roomType.roomTypeRate}</td>
	 			<td>${roomType.roomTypeDate}</td>
	 			<td>${roomType.roomTypeCount}</td>
	 			<td><a href="./roomOptionAdd?rtcode=${roomType.roomTypeCode}">특징추가</a></td>
	 			<td>수정</td>
	 			<td>삭제</td>
	 		</tr>
	 		</c:forEach>
	 		
	 	</table>	
	 		 <table class="bs sectable table-hover">
	 	<tr>
	 		<th>객실 타입 명</th>
	 		<th>객실 특징</th>
	 		<th>등록인</th>
	 		<th>등록일</th>
	 		<th>삭제</th>
	 	</tr>
	 </table>		 
</body>
</html>
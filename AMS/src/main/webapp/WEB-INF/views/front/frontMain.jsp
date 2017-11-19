<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	$('document').ready(function(){
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
		<table class="main">
			<tr>
				<td colspan="4"><span class="fs1" >스위트 </span></td>
				<td colspan="4">스위트</td>
				<td colspan="3">bar</td>
			</tr>
			<tr>
				<td colspan="3">트리플a</td>
				<td colspan="3">트리플a</td>
				<td colspan="3">트리플a</td>
				<td colspan="2">트윈b</td>
			</tr>
			<tr>
				<td>일반객실c</td>
				<td>일반객실c</td>
				<td>일반객실c</td>
				<td>일반객실c</td>
				<td>일반객실c</td>
				<td colspan="2">트윈a</td>
				<td colspan="2">트윈a</td>
				<td colspan="2">트윈b</td>
			</tr>
			<tr>
				<td>더블a</td>
				<td>더블a</td>
				<td colspan="2">더블b</td>
				<td colspan="2">더블b</td>
				<td colspan="2">더블b</td>
				<td colspan="3">더블c</td>
			</tr>
			<tr>
				<td><span class="fs1"><input type="button" value="501" class="de"></span></td>
				<td>일반객실a</td>
				<td>일반객실a</td>
				<td>일반객실a</td>
				<td>일반객실a</td>
				<td>일반객실a</td>
				<td>일반객실a</td>
				<td><span class="fs1"><input type="button" value="508" class="de"></span></td>
				<td>일반객실b</td>
				<td>일반객실b</td>
				<td>일반객실b</td>
			</tr>
			<tr>
				<td colspan="2">비지니스룸대</td>
				<td>비지니스룸소1</td>
				<td>비지니스룸소2</td>
				<td>비니지스룸소3</td>
				<td>비니지스룸소4</td>
				<td>일반객실a</td>
				<td>일반객실a</td>
				<td>일반객실a</td>
				<td>일반객실a</td>
				<td>일반객실a</td>
			</tr>
			<tr>
				<td colspan="2">연회장소</td>
				<td colspan="4">연회장대</td>
				<td colspan="5">식당</td>
			</tr>
			<tr>
				<td>장애인용객실</td>
				<td>장애인용객실2</td>
				<td colspan="5">프론트</td>
				<td>퐁퐁</td>
				<td>퐁퐁</td>
				<td>퐁퐁펑</td>
				<td>퐁퐁2</td>
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
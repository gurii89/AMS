<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<script>
		$(function(){
			var drop = true
			var type
			// 드롭다운 메뉴
			$('.drop').hide()
			$('.drop-top').click(function(){
				$('.drop').hide()
				// 클릭시 메뉴 보이기
				if(type != $(this).html()){
					var result = $(this).parent().next().attr('class')
					$(this).parent().siblings('.drop').each(function(index, item){
						if($(item).attr('class') == result){
							$(item).show()
						}
					})
					type = $(this).html()
				// 재클릭시 메뉴 감추기
				}else if(type == $(this).html()){
					$('.drop').hide() 
					type = ''
				}
			})
		})
	</script>
	<div class="col-sm-2 sidenav">
		<br> <a href="home"><img class="tohome"
			src="<c:url value='/resources/img/3333.png'/>"></a>
		<ul class="nav">
			<li class="active">
					<div class="loginfo">&nbsp;&nbsp;<div class="glyphicon glyphicon-user"></div></div>
					<span class="loginfo">권한:${loginfor.eDepartment}</span>
					<div class="loginfo">
						<a href="employeeDetail?eId=${loginfor.eId}" class="myinfor">${loginfor.eName}님</a>
						<span class="loginfo">안녕하세요!</span>
					</div>
					<form method="post" action="./logout">
						<span><input class="logout" type="submit" value="LOGOUT"></span>
					</form>
			</li>
			<li>&nbsp;</li>
			<li>&nbsp;</li>
			<c:if test="${loginfor.eDepartment eq 'manager' }">
				<li><a class="loginfo drop-top"><span
						class="glyphicon glyphicon-chevron-right"></span> 직원/분류</a></li>
				<li class="empEvent drop"><a href="employeeList" class="loginfo">
						<span class="glyphicon glyphicon-minus"></span> 직원 목록
				</a></li>
				<li class="empEvent drop"><a href="employeeAdd" class="loginfo">
						<span class="glyphicon glyphicon-minus"></span> 직원 등록
				</a></li>
				<li class="empEvent drop"><a href="cateList" class="loginfo">
						<span class="glyphicon glyphicon-minus"></span> 분류 목록
				</a></li>
				<li class="empEvent drop"><a href="cateAdd" class="loginfo">
						<span class="glyphicon glyphicon-minus"></span> 분류 등록
				</a></li>
			</c:if>
			
			<c:if test="${loginfor.eDepartment != 'clean' }">
			<li><a class="loginfo drop-top" href="frontMain" class="loginfo"><span
					class="glyphicon glyphicon-chevron-right"></span> 프론트</a></li>
			</c:if>
			
			<li><a class="loginfo drop-top"><span
					class="glyphicon glyphicon-chevron-right"></span> 객실/서비스</a></li>
			<c:if test="${loginfor.eDepartment != 'clean' }">
				<li class="room drop"><a href="roomTypeList" class="loginfo"><span 
					class="glyphicon glyphicon-minus"></span>객실 타입 목록</a></li>
			</c:if>
			<li class="room drop"><a href="roomList" class="loginfo"><span 
					class="glyphicon glyphicon-minus"></span>객실 목록</a></li>
			<li class="room drop"><a href="extraList" class="loginfo"><span 
					class="glyphicon glyphicon-minus"></span>서비스 목록</a></li>				
			<c:if test="${loginfor.eDepartment eq 'manager' }">
				<li class="room drop"><a href="roomTypeAdd" class="loginfo"><span 
					class="glyphicon glyphicon-minus"></span>객실 타입 등록</a></li>
				<li class="room drop"><a href="roomAdd" class="loginfo"><span 
					class="glyphicon glyphicon-minus"></span>객실 등록</a></li>
				<li class="room drop"><a href="extraAdd" class="loginfo"><span 
					class="glyphicon glyphicon-minus"></span>서비스 등록</a></li>
			</c:if>
			
			<c:if test="${loginfor.eDepartment != 'clean' }">
				<li><a class="loginfo drop-top"><span
						class="glyphicon glyphicon-chevron-right"></span> 예약</a></li>
				<c:if test="${loginfor.eDepartment eq 'front' }">
					<li class="booking drop"><a href="bookingAdd" class="loginfo"><span 
					class="glyphicon glyphicon-minus"></span>예약 등록</a></li>
				</c:if>
				<li class="booking drop"><a href="bookingList" class="loginfo"><span 
					class="glyphicon glyphicon-minus"></span>예약 목록</a></li>
				<li class="booking drop"><a href="paymentList" class="loginfo"><span 
					class="glyphicon glyphicon-minus"></span>결제 목록</a></li>
				<li class="booking drop"><a href="guestList" class="loginfo"><span 
					class="glyphicon glyphicon-minus"></span>고객 목록</a></li>
				<li class="booking drop"><a href="inOutList" class="loginfo"><span 
					class="glyphicon glyphicon-minus"></span>입퇴실 목록</a></li>
			</c:if>
			
			<li><a class="loginfo drop-top"><span
					class="glyphicon glyphicon-chevron-right"></span> 보관품</a></li>
			<li class="keep drop"><a href="keepList" class="loginfo"><span 
					class="glyphicon glyphicon-minus"></span>보관품 목록</a></li>				
			<li class="keep drop"><a href="deliveryList" class="loginfo"><span 
					class="glyphicon glyphicon-minus"></span>운송 목록</a></li>
			<c:if test="${loginfor.eDepartment eq 'front' }">
				<li class="keep drop"><a href="keepAdd" class="loginfo"><span 
					class="glyphicon glyphicon-minus"></span>보관품 등록</a></li>
				<li class="keep drop"><a href="deliveryAdd" class="loginfo"><span 
					class="glyphicon glyphicon-minus"></span>운송 등록</a></li>
			</c:if>
			
			<c:if test="${loginfor.eDepartment != 'clean' }">
				<li><a class="loginfo drop-top"><span
						class="glyphicon glyphicon-chevron-right"></span> 행사</a></li>
				<li class="event drop"><a href="eventList" class="loginfo"><span 
					class="glyphicon glyphicon-minus"></span>행사 목록</a></li>
				<c:if test="${loginfor.eDepartment eq 'manager' }">
					<li class="event drop"><a href="eventAdd" class="loginfo"><span 
					class="glyphicon glyphicon-minus"></span>행사 등록</a></li>
				</c:if>
			</c:if>
			
			<li><a class="loginfo drop-top"><span
					class="glyphicon glyphicon-chevron-right"></span> 공지사항</a></li>
			<li class="notice drop"><a href="./noticeList" class="loginfo"><span 
					class="glyphicon glyphicon-minus"></span>공지사항 리스트</a></li>
			<c:if test="${loginfor.eDepartment eq 'manager' }">
				<li class="notice drop"><a href="./noticeAdd" class="loginfo"><span 
					class="glyphicon glyphicon-minus"></span>공지사항 등록</a></li>
			</c:if>
					
			<li><a class="loginfo drop-top"><span
					class="glyphicon glyphicon-chevron-right"></span> 청소</a></li>
				<li class="clean drop"><a href="cleanMain" class="loginfo"><span 
					class="glyphicon glyphicon-minus"></span>청소메인</a></li>
				<li class="clean drop"><a href="cleanEndList" class="loginfo"><span 
					class="glyphicon glyphicon-minus"></span>청소완료목록</a></li>
		</ul>
		<br>
	</div>

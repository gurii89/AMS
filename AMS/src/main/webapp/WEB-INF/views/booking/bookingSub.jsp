<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>	
	<div class="formb">
		요금 변동폭 : 
		<select id="FX" class="input-sm">
			<c:if test="${eventList.size() == 1 }">
				<option class="input-sm" value="${eventList[0].eventFx }">조정 불가</option>
			</c:if>
			<c:if test="${eventList.size() != 1 }">
				<c:forEach items="${eventList }" var="event">
					<c:choose>
						<c:when test="${event.eventFx != '1'}">
							<option class="input-sm" value="${event.eventFx }">${event.eventFx }</option>
						</c:when>
						<c:otherwise>
							<option selected class="input-sm" value="1">기본가</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:if>
		</select>
	</div>
	<hr>
	<div id="useRoom" class="formb">
		<table id="roomTable" class="bs">
			<tr>
				<th>객실 종류</th>
				<th>금액</th>
			</tr>
		</table>
	</div>
	<hr>
	<div id="useExtra" class="formb">
		<table id="extraTable" class="bs">
			<tr>
				<th>서비스명</th>
				<th>예약일</th>
				<th>금액</th>
			</tr>
		</table>
	</div>
	<hr>
	<div class="formb">
		총 금액 : <span id="sum">0</span> 원
	</div>
	<hr>
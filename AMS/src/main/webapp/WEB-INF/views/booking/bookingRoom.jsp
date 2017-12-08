<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>	
<div class="formb">
	객실 종류 : 
	<select name="roomTypeCode" id="roomTypeCode" class="input-sm">
		<option value="" class="input-sm">객실 종류 선택</option>
		<c:forEach items="${roomTypeList }" var="RT">
			<option value="${RT.roomTypeCode }" id="${RT.roomTypeRate }" class="input-sm">${RT.roomTypeName }</option>
		</c:forEach>
	</select>
</div>
<div class="formb">
	객실 이용 금액 :
	<input type="text" name="roomRate" id="roomRate" class="input-sm" value="0" readonly>
</div>
<div class="formb">
	<input type="button" id="submitRoom" class="btn-default btn-sm" value="객실 등록">
</div>
<hr>
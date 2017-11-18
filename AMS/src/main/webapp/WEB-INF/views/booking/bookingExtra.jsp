<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>	
	<div class="formb">
		서비스 분류 :
		<select name="cateCode" id="cateCode" class="input-sm">
			<option class="input-sm" value="">서비스 분류 선택</option>
			<c:forEach items="${cateList }" var="cate">
				<option class="input-sm" value="${cate.cateCode }">${cate.cateName }</option>
			</c:forEach>
		</select>
	</div>
	<div class="formb">
		서비스 종류 :
		<select name="extraCode" id="extraCode" class="input-sm">
			<option class="input-sm" value="0">분류 먼저 선택하세요</option>
		</select>
	</div>
	<div class="formb">
		서비스 예약일 :
		<input type="date" name="extraDate" id="extraDate" class="input-sm" value="${today }">
	</div>
	<div class="formb">
		서비스 이용 금액 :
		<input type="text" name="extraRate" id="extraRate" class="input-sm" value="0" readonly>
	</div>
	<div class="formb">
		<input type="button" id="submitExtra" class="btn-default btn-sm" value="서비스 등록">
	</div>
	<hr>
	
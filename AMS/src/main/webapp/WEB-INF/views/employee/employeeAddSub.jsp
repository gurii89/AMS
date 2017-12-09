<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<div class="formb">
	직원 국적 :
	<select name="eNation" id="eNation" required class="input-sm">
		<option class="input-sm" value="">국적 선택</option>
		<c:forEach items="${cateList }" var="cate">
			<c:if test="${cate.cateSmall eq 'nation' }">
				<option class="input-sm" value="${cate.cateCode }">${cate.cateName }</option>
			</c:if>
		</c:forEach>
	</select>
</div>
<div class="formb">
	직원 외국어 :
	<select name="eLanguage" id="eLanguage" class="input-sm">
		<option value="" class="input-sm">외국어 선택</option>
		<c:forEach items="${cateList }" var="cate">
			<c:if test="${cate.cateSmall eq 'language' }">
				<option value="${cate.cateCode }" class="input-sm">${cate.cateName }</option>
			</c:if>
		</c:forEach>
	</select>
</div>
<div class="formb">
	직원 연락처 :
	<input type="text" name="ePhone" id="ePhone" required class="input-sm">
</div>
<div class="formb">
	직원 주소 :
	<input type="text" name="eAddress" id="eAddress" required class="input-sm">
</div>
<div class="formb">
	직원 이메일 :
	<input type="text" name="eEmail" id="eEmail" required class="input-sm">
</div>			
<div class="formb">
	직원 특이사항 :
	<input type="text" name="eMemo" id="eMemo" class="input-sm">
</div>
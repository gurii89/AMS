<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="<c:url value='/resources/js/paymentList.js'/>"></script>
	</head>
	<body>
		<div class="topb">결제 목록</div>
		<c:choose>
			<c:when test="${cate != null }">
				<input type="hidden" id="cate" value="${cate }">
				<input type="hidden" id="input" value="${input }">
			</c:when>
			<c:otherwise>
				<form action="paymentList" method="post" class="form-horizontal">
					<select name="cate" id="cate" required class="input-sm">
						<option id="opt" class="input-sm" value="">검색 조건 선택</option>
						<option id="opt" class="input-sm" value="boo_code">예약번호</option>
						<option id="opt" class="input-sm" value="e_name">등록자</option>
						<option id="opt" class="input-sm" value="p_date">결제일</option>
						<option id="opt" class="input-sm" value="p_condition">결제상태</option>
						<option id="opt" class="input-sm" value="p_method">결제방법</option>
					</select>
					<span id="condi">
						<input type="text" name="input" id="input" value="${input }" required class="input-sm">
					</span>
					<input type="submit" value="검색" class="btn-default btn-sm">
				</form>
			</c:otherwise>
		</c:choose> 
		<table class="bs">
			<tr>
				<th>결제 번호</th>
				<th>결제 상태</th>
				<th>결제 방법</th>
				<th>결제 금액</th>
				<th>결제일</th>
				<th>예약 번호</th>
				<th>등록자</th>				
				<th>특이사항</th>
			</tr>
			<c:forEach items="${paymentList }" var="pay">
				<tr>
					<td>${pay.pCode }</td>
					<td>${pay.pCondition }</td>
					<td>${pay.pMethod }</td>
					<td>${pay.pRate }</td>
					<td>${pay.pDate }</td>
					<td>${pay.booCode }</td>
					<td>${pay.eId }</td>
					<td>${pay.pMemo }</td>
				</tr>
			</c:forEach>
		</table>
		<c:import url="/WEB-INF/views/division/paging.jsp" />						
	</body>
</html>
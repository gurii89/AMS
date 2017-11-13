<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <h2>테스트</h2>


<c:choose>
	<c:when test="${param.testMsg eq 'test'}">
		`1
	</c:when>
	<c:otherwise>
		2
	</c:otherwise>
</c:choose>
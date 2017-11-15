<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<ul class="pager">
	    <c:if test="${currentPage > 1}">
	        <li class="previous"><a href="${page }?currentPage=${currentPage-1}">이전</a></li>
	    </c:if>
	    <c:if test="${currentPage < lastPage}">
	        <li class="next"><a href="${page }?currentPage=${currentPage+1}">다음</a></li>
	    </c:if>
	</ul>
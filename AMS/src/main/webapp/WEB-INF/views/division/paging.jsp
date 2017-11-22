<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<script>
		$('document').ready(function(){
			//이전 다음 버튼 눌렀을시 검색조건 전송되도록
			$('.paging').click(function(){
				var url = $(location).attr('pathname')+$(this).attr('href')
				var str = '&cate='+$('#cate').val()+'&input='+$('#input').val()
				$(this).attr('href', url+str)
			})			
		})
	</script>
	<ul class="pager">
	    <c:if test="${currentPage > 1}">
	        <li class="previous"><a class="paging btn-default btn-sm" href="?currentPage=${currentPage-1}">이전</a></li>
	    </c:if>
	    <c:if test="${currentPage < lastPage}">
	        <li class="next"><a class="paging btn-default btn-sm" href="?currentPage=${currentPage+1}">다음</a></li>
	    </c:if>
	</ul>
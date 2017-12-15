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
	<div class="pagebtn">&nbsp;
		<c:if test="${startPage != 1 }">
			<a class="paging btn btn-default btn-sm" href="?currentPage=${startPage-1}">이전</a>
		</c:if>
	</div>
	<div class="pagebtnNumber">
	
		<c:forEach var="perPage" begin="${startPage}" end="${lastPage}">
		<c:if test="${perPage == currentPage}">
			<span><a class="paging nowPage" href="?currentPage=${perPage}">${perPage}&nbsp;&nbsp;</a></span>
		</c:if>
		<c:if test="${perPage != currentPage}">
			<span><a class="paging otherPage" href="?currentPage=${perPage}">${perPage}&nbsp;&nbsp;</a></span>
		</c:if>
		</c:forEach>
	
	</div>
	<c:if test="${lastPage*pagePerRow < totalCount}">
		<div class="pagebtn"><a class="paging btn btn-default btn-sm" href="?currentPage=${lastPage+1}">다음</a></div>
	</c:if>
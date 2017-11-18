<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<script>
		$('document').ready(function(){
			var opt = $('#opt').val()
			
			// 검색 후 다시 페이지로 돌아왔을 때 검색조건 유지
			if(opt != ""){
				$('#opt').val('');
				$('#search').val(opt).prop("selected", true);
				
				//이전 다음 버튼 눌렀을시 검색조건 전송되도록
				$('.paging').click(function(){
					var url = $(this).attr('href')
					var str = '&cate='+$('#search').val()+'&input='+$('#input').val()
					$(this).attr('href', url+str)
				})
			}
		})
	</script>
	<ul class="pager">
	    <c:if test="${currentPage > 1}">
	        <li class="previous"><a class="paging btn-default btn-sm" href="${page }?currentPage=${currentPage-1}">이전</a></li>
	    </c:if>
	    <c:if test="${currentPage < lastPage}">
	        <li class="next"><a class="paging btn-default btn-sm" href="${page }?currentPage=${currentPage+1}">다음</a></li>
	    </c:if>
	</ul>
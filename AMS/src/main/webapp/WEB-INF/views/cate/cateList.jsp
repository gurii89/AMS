<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/css.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script>
			$('document').ready(function(){
				var opt = $('#opt').val()
				
				// 검색 후 다시 페이지로 돌아왔을 때 검색조건 유지
				if(opt != ""){
					$('#opt').val('');
					$('#search').val(opt).prop("selected", true);
					
					//이전 다음 버튼 눌렀을시 검색조건 전송되도록
					$('a').click(function(){
						var url = $(this).attr('href')
						var str = '&cate='+$('#search').val()+'&input='+$('#input').val()
						$(this).attr('href', url+str)
					})
				}
			})
		</script>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row content">     
				<c:import url="/WEB-INF/views/division/left.jsp" />
				<c:import url="/WEB-INF/views/division/top.jsp" />			
				<div class="col-sm-10 top">
					<form action="cateSearch" method="post">
						<select name="cate" id="search" required>
							<option id="opt" value="${cate }">검색 조건 선택</option>							
							<option value="cate_code">분류 번호</option>
							<option value="e_id">등록자</option>
							<option value="cate_large">대분류</option>
							<option value="cate_small">소분류</option>						
							<option value="cate_name">분류명</option>
						</select>
						<input type="text" name="input" id="input" value="${input }" required>
						<input type="submit" value="검색">
					</form>
					<table>
						<tr>
							<th>분류 번호</th>
							<th>대분류</th>
							<th>소분류</th>
							<th>분류명</th>
							<th>등록자</th>
							<th>등록일</th>
						</tr>
						<c:forEach items="${cateList }" var="cate">
							<tr>
								<td>${cate.cateCode }</td>
								<td>${cate.cateLarge }</td>
								<td>${cate.cateSmall }</td>
								<td>${cate.cateName }</td>
								<td>${cate.eId }</td>
								<td>${cate.cateDate }</td>
							</tr>
						</c:forEach>
					</table>
					<c:import url="/WEB-INF/views/division/paging.jsp" />
				</div>				 
				<c:import url="/WEB-INF/views/division/right.jsp" />
			</div>
		</div>	
	</body>
</html>
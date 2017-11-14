<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/css.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
			$('document').ready(function(){
				// 이건
			})
</script>
</head>

<body>

   <div class="container-fluid">
      <div class="row content">
      
<!-- ////////////////////////////////////왼쪽 메뉴 시작///////////////////////////////////////// -->     
<c:import url="/WEB-INF/views/division/left.jsp" />
<!-- ////////////////////////////////////왼쪽 메뉴 끝///////////////////////////////////////// -->
<!-- ////////////////////////////////////상단 메뉴 시작///////////////////////////////////////// -->
<c:import url="/WEB-INF/views/division/top.jsp" />
<!-- ////////////////////////////////////상단 메뉴 끝///////////////////////////////////////// -->	
<!-- ////////////////////////////////////가운데 메뉴 시작///////////////////////////////////////// -->			
			 <div class="col-sm-10 top">
			 <h3>보관품 리스트</h3>
			 <table border="1">
			 <tr>
			 <th>보관품번호</th>
			 <th>카테고리</th>
			 <th>등록인</th>
			 <th>보관품명</th>
			 <th>등록날짜</th>
			 <th>발견장소</th>
			 <th>기타</th>
			 <th>수정</th>
			 <th>삭제</th>
			 </tr>
			 <c:forEach items="${list}" var="keep">
			 <tr>
			 	<td>${keep.kCode}</td>
			 	<td>${keep.cateCode}</td>
			 	<td>${keep.eId}</td>
			 	<td>${keep.kName}</td>
			 	<td>${keep.kDatetime}</td>
			 	<td>${keep.kSite}</td>
			 	<td>${keep.kMemo}</td>
			 	<td><a href="./keepUpdate?kCode=${keep.kCode}">수정</a>
			 	</td>
			 	<td><a href="./keepDelete?kCode=${keep.kCode}">삭제</a>
			 	</td>
			 </c:forEach>
			 </table>
			 <ul class="pager">
				        <c:if test="${currentPage > 1}">
				            <li class="previous"><a href="cateList?currentPage=${currentPage-1}">이전</a></li>
				        </c:if>
				        <c:if test="${currentPage < lastPage}">
				            <li class="next"><a href="cateList?currentPage=${currentPage+1}">다음</a></li>
				        </c:if>
				    </ul>
				</div>				 
				<c:import url="/WEB-INF/views/division/right.jsp" />
			</div>
		</div>	
	</body>
</html>
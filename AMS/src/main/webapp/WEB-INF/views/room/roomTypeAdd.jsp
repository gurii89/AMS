<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/css.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>

   <div class="container-fluid">
      <div class="row content">
      
<!-- ////////////////////////////////////왼쪽 메뉴 시작///////////////////////////////////////// -->     
<%@ include file= "../division/left.jsp"%>
<!-- ////////////////////////////////////왼쪽 메뉴 끝///////////////////////////////////////// -->
<!-- ////////////////////////////////////상단 메뉴 시작///////////////////////////////////////// -->
<%@ include file= "../division/top.jsp"%>
<!-- ////////////////////////////////////상단 메뉴 끝///////////////////////////////////////// -->	
<!-- ////////////////////////////////////가운데 메뉴 시작///////////////////////////////////////// -->			
			 <div class="col-sm-10 top">
			
			 <h3>객실 타입 등록</h3> 
			 <form action="" method="post">
				 <p>등록인</p>
				 <input type="text" value="${loginfor.eId}" name="eId" readonly="readonly">
				 <p>객실 타입 명</p>
				 <input type="text" name="roomTypeName">
				 <p>객실 타임 가격</p>
				 <input type="text" name="roomTypeRate">
				 <p>객실 타임 최대 수용 인원</p>
				 <input type="text" name="roomTypeCount">
				 <input type="submit" value="등록">
			 </form>
			 
			 </div>
<!-- ////////////////////////////////////가운데 메뉴 끝///////////////////////////////////////// -->	
<!-- ////////////////////////////////////오른쪽 메뉴 시작///////////////////////////////////////// -->				 
<%@ include file= "../division/right.jsp"%>
<!-- ////////////////////////////////////오른쪽 메뉴 끝///////////////////////////////////////// -->	         
		</div>
	</div>
	
</body>
</html>
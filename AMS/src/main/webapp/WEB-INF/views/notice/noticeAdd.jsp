<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>   
	<div class="topb">공지사항 등록</div> 
	 <form action="./noticeAdd" method="post" class="form-horizontal">
		 <div class="formb">등록인 :
			 <input type="text" value="${loginfor.eId}" name="eId" readonly="readonly" class="input-sm">
		</div>
		<div class="formb">내용 :</div>
		<textarea name="nMemo" class="input-sm" rows="10" cols="80"></textarea>
		<br><br>
		 <input type="submit" value="등록" class="btn-default btn-sm">
	 </form>			 
</body>
</html>
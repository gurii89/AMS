<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="<c:url value='/resources/css/css.css'/>">
		<script>
			$('document').ready(function(){
				$('#frm').attr('onkeydown', 'if(event.keyCode==13) return false;')
			})
		</script>
	</head>
	<body>
	<div class="container-fluid">
		<div class="row content">
			<t:insertAttribute name="left" />
			<div class="col-sm-10 top">
				<t:insertAttribute name="content" />
			</div>
		</div>
	</div>
</body>
</html>
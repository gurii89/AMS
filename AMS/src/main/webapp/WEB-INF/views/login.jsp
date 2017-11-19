<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<c:url value='/resources/css/css.css'/>">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<br> <br> <br> <br> <br> <br> <br>
			<br> <br> <br>
			<div class="col-md-4"></div>
			<div class="col-md-2">
				<img src="<c:url value='/resources/img/3333.png'/>">
				<p class="copyright">Copyright. 2017. phoenix. all rights reserved.</p>
			</div>
			<div class="col-md-6">
				<div class="col-xs-3">
					<form method="post" action="./login">
						<label for="inputsm">ID</label>
						<input class="form-control input-sm" name="eId" type="text">
						<label for="inputsm">PW</label>
						<input class="form-control input-sm" name="ePw" type="password">
						<br>
						<input type="submit" value="LOGIN" class="btn-default btn-sm">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

</html>

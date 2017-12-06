<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<c:url value='/resources/js/homeclock.js'/>"></script>
<script>

	setInterval(function() {
		mainClock(new Date())
	    },1000);
	
	$(document).ready(function(){
		var clock = $('#clock')[0];
	});
	
</script>
</head>
<body>
	<div class="maina">${today}</div>
	<div id="clock"></div>
</body>
</html>
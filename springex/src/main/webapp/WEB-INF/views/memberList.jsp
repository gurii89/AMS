<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>memberList</h1>
	<table border="1">
		<thead>
			<tr>
				<th>NO</th>
				<th>ID</th>
				<th>NAME</th>
			</tr>
			<c:forEach var="member" items="${list}">
				<tr>
					<th>${member.memberNo}</th>
					<th>${member.memberId}</th>
					<th>${member.memberName}</th>
				</tr>
			</c:forEach>
		</thead>
	</table>
</body>
</html>
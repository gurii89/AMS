<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h1> addMember</h1>
	<form action="./addMember" method="post">
		<table border="1">
			<tr>
				<td>memberId</td>
				<td><input type="text" name="memberId"></td>
			</tr>

			<tr>
				<td>memberPw</td>
				<td><input type="text" name="memberPw"></td>
			</tr>
			
			<tr>
				<td>memberName</td>
				<td><input type="text" name="memberName"></td>
			</tr>
		</table>
		<input type="submit" value="addMember">
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>파일 업로드 폼</h1>
<form method="post" enctype ="multipart/form-data">
<div>파일제목 <input type = "text" name ="filetitle"></div>
<div>파일: <input type = "text" name ="file"></div>
<div><input type = "submit" value = "파일저장"></div>
</form>
</body>
</html>
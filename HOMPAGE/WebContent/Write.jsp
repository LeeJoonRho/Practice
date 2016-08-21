<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Write</title>
</head>
<body>
	<form action="Write_check.jsp" method="post">
		제목 : <input type="text" name="title" size=20> <br> <br>
		내용 : <br>
		<textarea name='text' cols=50 rows=20></textarea>
		<br> <input type="submit" value="글쓰기">
	</form>
</body>
</html>
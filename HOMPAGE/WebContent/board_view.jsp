<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%

	int idx = Integer.parseInt(request.getParameter("idx"));
	Connection con = null;
	Statement stmt;
	ResultSet rs = null;

	String title = "";
	String text = "";
	String name = "";
	String time = "";
	String id = "";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String dburl = "jdbc:mysql://localhost/login";
		String dbid = "root";
		String dbpassword = "1234";

		con = DriverManager.getConnection(dburl, dbid, dbpassword);

		String sqlcommand = "SELECT title, text, name, time, id from text WHERE NUM=" + idx;

		stmt = con.createStatement();

		rs = stmt.executeQuery(sqlcommand);
		if (rs.next()) {
			title = rs.getString(1);
			text = rs.getString(2);
			name = rs.getString(3);
			time = rs.getString(4);
			id = rs.getString(5);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>board view</title>
</head>
<style>
#table {
	width: 1000px;
	height: 800px;
}

p.line {
	height: 15px;
	border-left: 0.5em solid #E0CB52;
	padding: 0.5em;
}
</style>
<body>

	<div id="table">
		<div id="topboard">
			<div id="numtext">
				<font size="2">게시물번호 -</font>
				<font size="2"><%=idx%></font>
				&emsp; 
				<font size="2">작성자 -</font>
				<font size="2"><%=name%></font>
			</div>
			<hr align=left style="border: solid 0.5px #D2D2D2; width: 50%;">
			<div id="boardtitle">
				<p class="line">
					제목 &nbsp;<font size="2"><%=title%></font>
				</p>
			</div>
			<hr align=left style="border: solid 0.5px #D2D2D2; width: 50%;">
			<div id="name"></div>
		</div>
		<div id="mainboard">
			<div id="text">
				<%=text %>
			</div>
		</div>
		<br>
		<br>
		<%
		String checkid = "";
		String getname = "";

		checkid = (String) session.getAttribute("rid");
		getname = (String) session.getAttribute("rname");
		
		if(id.equals(checkid))
		{
			%>
			<form action="board.jsp" method="post">
				<input type="submit" value="수정">
			</form>
			<form action="board.jsp" method="post">
				<input type="submit" value="삭제">
			</form>
			<%
		}
		%>
		<br>
		<br>
		<form action="board.jsp" method="post">
				<input type="submit" value="게시판으로">
		</form>
	</div>
</body>
</html>
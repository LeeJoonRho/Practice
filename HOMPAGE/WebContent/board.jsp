<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board</title>
</head>
<body>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		String dburl = "jdbc:mysql://localhost/login";
		String dbid = "root";
		String dbpassword = "1234";
		int total = 0;
		Statement stmt;
		ResultSet rs;

		try {
			Connection conn = DriverManager.getConnection(dburl, dbid, dbpassword);
			stmt = conn.createStatement();

			String sqlCount = "SELECT COUNT(*) FROM text";
			rs = stmt.executeQuery(sqlCount);

			if (rs.next()) {
				total = rs.getInt(1);
			}
			rs.close();
			out.print("총 게시물 : " + total + "개");

			String sqlList = "SELECT num, title, name, time from text order by NUM DESC";
			rs = stmt.executeQuery(sqlList);
	%>
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr height="20"></tr>
		<tr height="25" align="center">
			<td>&nbsp;</td>
			<td width="200">번호</td>
			<td width="200">제목</td>
			<td width="200">작성자</td>
			<td width="164">작성일</td>
			<td>&nbsp;</td>
		</tr>
		<%
			if (total == 0) {
		%>
		<tr align="center" bgcolor="#FFFFFF" height="30">
			<td colspan="6">등록된 글이 없습니다.</td>
		</tr>
		<%
			} else {

					while (rs.next()) {
						int idx = rs.getInt(1);
						String title = rs.getString(2);
						String name = rs.getString(3);
						String time =rs.getString(4);
		%>
		<tr height="25" align="center">
			<td>&nbsp;</td>
			<td width="150"><%=idx%></td>
			<td width="150">
				<a href="board_view.jsp?idx=<%=idx%>"><%=title %></a>
			</td>
			<td width="150"><%=name%></td>
			<td width="150"><%=time%></td>
			<td>&nbsp;</td>
		</tr>
		<tr height="1" bgcolor="#D2D2D2">
			<td colspan="6"></td>
		</tr>
		<%
			}
				}
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				out.println(e.toString());
			}
		%>
		<tr height="1" bgcolor="#82B5DF">
			<td colspan="6" width="752"></td>
		</tr>
	</table>

	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td colspan="4" height="5"></td>
		</tr>
		<tr align="center">
			<td>
				<form action="Write.jsp" method="post">
					<input type="submit" value="글 쓰기">
				</form>
				<br>
				<form action="Homepage.jsp" method="post">
					<input type="submit" value="홈페이지">
				</form>
			</td>
			<td>
			</td>
		</tr>
	</table>
</body>
</html>
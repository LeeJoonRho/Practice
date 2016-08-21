<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 완료</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String message = "";
		Connection con = null;
		PreparedStatement pst = null;

		if (id == "" || password == "" || name == "") {
	%>
	<script>
		alert("아이디, 비밀번호, 이름을 정확하게 입력해 주십시오.");
	</script>
	<%
		response.sendRedirect("Homepage.jsp");
		} else {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String dburl = "jdbc:mysql://localhost/login";
				String dbid = "root";
				String dbpassword = "1234";

				con = DriverManager.getConnection(dburl, dbid, dbpassword);

				String sqlcommand = "insert into login values (?,?,?)";

				pst = con.prepareStatement(sqlcommand);
				pst.setString(1, id);
				pst.setString(2, password);
				pst.setString(3, name);

				pst.executeUpdate();

				message = "회원가입이 완료되었습니다.";

				out.println(message);
	%>
	<br>
	<br>
	<form action="Homepage.jsp">
		<input type="submit" value="로그인으로">
	</form>
	<%
		} catch (Exception e) {
				e.printStackTrace();
				message = "회원가입에 실패하였습니다.";
				out.println(message);
			}
		}
	%>

</body>
</html>
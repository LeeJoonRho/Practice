<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%
		int login_check;
		String lid = request.getParameter("id");
		String lpassword = request.getParameter("password");
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String dburl = "jdbc:mysql://localhost/login";
			String dbid = "root";
			String dbpassword = "1234";

			con = DriverManager.getConnection(dburl, dbid, dbpassword);

			String sqlcommand = "select id, password, name from login where id=? and password=?";

			pst = con.prepareStatement(sqlcommand);
			pst.setString(1, lid);
			pst.setString(2, lpassword);
			rs = pst.executeQuery();

			if (rs.next()) {
				String rid = rs.getString("id");
				String rpassword = rs.getString("password");
				String rname = rs.getString("name");
				if (lid.equals(rid) && lpassword.equals(rpassword)) {
					session.setAttribute("rid", rid);
					session.setAttribute("rname", rname);
					response.sendRedirect("Homepage.jsp");
				}

				else {
	%>
	<script>
		alert("로그인 실패");
		location.href = 'Homepage.jsp';
	</script>
	<%
		}
			}

			else {
	%>
	<script>
		alert("로그인 실패");
		location.href = 'Homepage.jsp';
	</script>
	<%
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>
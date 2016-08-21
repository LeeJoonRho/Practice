<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs;
		
		String id = (String) session.getAttribute("rid");
		String name = (String) session.getAttribute("rname");
		String title = request.getParameter("title");
		String text = request.getParameter("text");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String dburl = "jdbc:mysql://localhost/login";
			String dbid = "root";
			String dbpassword = "1234";

			con = DriverManager.getConnection(dburl, dbid, dbpassword);

			String sqlcommand = "insert into text(id,title,text,name,time) values(?,?,?,?,now())";
			
			pst=con.prepareStatement(sqlcommand);
			pst.setString(1,id);
			pst.setString(2,title);
			pst.setString(3,text);
			pst.setString(4,name);
			pst.executeUpdate();
			
			response.sendRedirect("board.jsp");
		}
		catch (Exception e) {	
			e.printStackTrace();
		}
	%>
</body>
</html>
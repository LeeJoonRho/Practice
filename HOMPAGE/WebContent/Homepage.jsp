<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Homepage</title>
<style>
#main {
	width: 1400px;
	height: 2000px;
	background-color: pink;
	margin-left: 10px;
}

#head {
	position: absolute;
	margin-top: 25px;
	margin-left: 25px;
}

#login {
	position: absolute;
	margin-top: 830px;
	margin-left: 1150px;
}

#info {
	position: absolute;
	margin-top: 830px;
	margin-left: 1175px;
}

#game {
	position: absolute;
	margin-top: 1050px;
	margin-left: 10px;
	width: 1380px;
	height: 300px;
}

#game ul {
	list-style:none;
	padding-left:0px;
	
}
#game ul li {
	float:left;
	position : abosolute;
	margin-left:10px;
}
</style>
</head>
<body>
	<div id="main">
		<div id="head">
			<a href="Homepage.jsp"> <img src="images/head01.jpg" width=1350px
				height=800px>
			</a>
		</div>
		<%
			String checkid = "";
			String getname = "";

			checkid = (String) session.getAttribute("rid");
			getname = (String) session.getAttribute("rname");
			if (checkid == null) {
		%>
		<div id="login">
			<h3>로그인</h3>
			<form action="Login.jsp" method="post">
				id : <input type="text" name="id"> <br> <br>
				password : <input type="password" name="password"> <br>
				<br> <input type="submit" value="입력완료">
			</form>
			<form action="Sign_up.jsp" method="post">
				<input type="submit" value="회원가입">
			</form>
		</div>
		<%
			} else {
		%>
		<div id="info">
			<%
				out.println(checkid);
			%>
			<br>
			<%
				out.println(getname + " 님"); //이름 출력. 한글 깨짐
			%>
			<br> <br>
			<form action="board.jsp" method="post">
				<input type="submit" value="게시판">
			</form>

			<form action="Logout.jsp" method="post">
				<input type="submit" value="로그아웃">
			</form>
		</div>
		<%
			}
		%>
		<div id="game">
			<ul>
				<li>
					<a href="#">
						<img src="images/Typingimage02.png" width=335px height=280px>
					</a>
				</li>
				<li>
					<a href="#">
						<img src="images/testimage01.jpg" width=335px height=280px>
					</a>
				</li>
				<li>
					<a href="#">
						<img src="images/testimage02.jpg" width=335px height=280px>
					</a>
				</li>
				<li>
					<a href="#">
						<img src="images/testimage03.jpg" width=335px height=280px>
					</a>
				</li>
			</ul>
		</div>
	</div>

</body>
</html>
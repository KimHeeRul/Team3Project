<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="main.css" type="text/css">

</head>
<body>
	<header style="border-bottom: 1px solid gray">
		<div class="util">

			<%
			String id = (String) session.getAttribute("id");
			if (id == null) {%>
				<input type=button value="로그인" onclick="location.href='login.jsp'">
				<input type=button value="회원가입" onclick="location.href='join.jsp'">
			<%}else{%>
				<input type=button value="로그아웃" onclick="location.href='logout.jsp'">
			<%}
			%>
			


		</div>
		<nav id=logo>
			<a href="main.jsp"><img
				src="https://jeju.redcaprentcar.com/RC/PC/img/header/logo_redcap_rental.png"></a>
		</nav>

		<nav id=nav>
			<article id=text1>
				<a href="reservation.jsp">예약하기</a>
			</article>
			<article id=text2>
				<a href="carReserveView.jsp">예약확인</a>
			</article>
			<article id=text3>
				<a href="community.jsp">커뮤니티</a>
			</article>
			<article id=text4>
				<a href="event.jsp">이벤트</a>
			</article>
		</nav>
	</header>



</body>
</html>
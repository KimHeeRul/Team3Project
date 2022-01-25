<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="favicon" href="">
<link rel="shortcut icon" href="favicon.ico">

<!-- <link rel="favicon" href="http://localhost:8089/goobneMall/index.jsp/favicon.ico?v=2"> -->


<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/goobneMall/css/header.css">
<link rel="stylesheet"
	href="/goobneMall/views/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle:wght@700&family=Hahmlet:wght@600&family=Oswald:wght@400;700&display=swap"
	rel="stylesheet">

<style>
.fonts
 {
  }

</style>
<title>Insert title here</title>
</head>
<body>

<%
//session.setAttribute("log", null);
String id =(String)session.getAttribute("log");
System.out.println("log = :" +  id);
%>
    <div id="header">
        <div class="memberInfo">
            <table align=right>
                <%-- 우상단 로그인창 부분 --%>
                <tr>
                <%if(id!=null){
                %>
                    <td align="right" width="300px"><span class="info"><b>[<%=id %>] 님</b></span></td>
                    	<td align=center style="padding-left: 10px;">
                    	<span class="info">ㅣ</span></td>
                    	<td align=center style="padding-left: 10px;">
                    <td align=center width="10"><span class="info">
                    <a href="/goobneMall/service?command=memberLogout">[logout]</a> </span></td>
                    <%}else{%>
					
					<td align=center width="10"><span class="info"> 
					<a href="/goobneMall/service?command=memberJoinForm">[signUp]</a></span></td>
					<td align=center style="padding-left: 10px;"><span
						class="info">ㅣ</span></td>
					<td align=center style="padding-left: 10px;"><span
						class="info"><a href="/goobneMall/service?command=memberLoginForm">[login]</a></span></td>
					<%} %>
					<td align=center style="padding-left: 10px;"><span
						class="info">ㅣ</span></td>
						
					
					<td align=center style="padding-left: 10px;"><span id="fonts"
						class="info" ><a
							href="/goobneMall/service?command=noticeList&page=1">[고객센터]</a></span></td>
				</tr>
			</table>
		</div>
		<div class="main">
			<table align=left>
				<%-- 굽네몰 img --%>
				<tr>
					<td style="line-height: 20px;"><a href="/goobneMall/index.jsp"><img
							style="width: 142px; height: 44px"
							src="/goobneMall/img/CssImg/goobneMall.png"></a></td>
				</tr>
			</table>

			<table align=right>
				<%-- 검색창부분 --%>
				<tr>

					<td>
						<form action="service" method="post">
							<input type="hidden" name="way" value="search">
							<input type="text" id="searchBox" name="input"
								class="form-control" placeholder="그린몰에서 착한쇼핑하자!!!"
								style="width: 433px; height: 39px;">
					</td>
					<td><input type="hidden" name="command" value="search">
				
						<button class="btn btn-default" type="submit"
							style="height: 39px;">
							<i class="glyphicon glyphicon-search"></i>
						</button>
						</form></td>


					<td class="myinfo" style="padding-left: 30px;"><a
						href="/goobneMall/service?command=cartView"> <img
							src="/goobneMall/img/CssImg/jangBagoony.png"></a></td>
					<%-- 장바구니 --%>
					<td class="myinfo" style="padding-left: 10px;"><a  href="/goobneMall/service?command=mypage"><img
							<%-- 마이페이지 --%>
							src="/goobneMall/img/CssImg/myPage.png"></a></td>

				</tr>
			</table>

		</div>
		<div class="menu">
			<table align=center>
				<%--  --%>
				<tr>
					<td align=center id="headMenu">
						<button id="menubtn" class="btn btn-light" onclick="location.href='/goobneMall/service?command=search&way=1'"><b>닭가슴살</b></button>
					</td>
					<td align=center id="headMenu" >
						<button id="menubtn" class="btn btn-light" onclick="location.href='/goobneMall/service?command=search&way=2'"><b>만두</b></button>
					</td>
					<td align=center id="headMenu">
						<button id="menubtn" class="btn btn-light" onclick="location.href='/goobneMall/service?command=search&way=3'"><b>도시락</b></button>
					</td>
					<td align=center id="headMenu">
						<button id="menubtn" class="btn btn-light" onclick="location.href='/goobneMall/service?command=search&way=4'"><b>소시지</b></button>
					</td>
					<td align=center id="headMenu" >
						<button id="menubtn" class="btn btn-light" onclick="location.href='/goobneMall/service?command=search&way=5'">
						<b>	치밥</b>
						</button>
					</td>
				</tr>
			</table>
		</div>



	</div>
</body>
</html>
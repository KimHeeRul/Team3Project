<%@page import="java.util.Calendar"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="DTO.ProductDTO"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="DTO.OrderDTO"%>
<%@page import="DAO.OrderDAO"%>
<%@page import="DTO.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/goobneMall/css/mypage.css" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<head>

<%
MemberDAO memdao = MemberDAO.getInstance();
String id = (String) session.getAttribute("log");

if (!id.equals("admin")) {
%>
<script>
	alert("잘못된 접근입니다.");
	location.href = "/goobneMall/index.jsp";
</script>
<%
} else {
%>
<style>
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />

	<div id="container" class="haveSNB">

		<br> <br>



	<div id="snb">
			<div class="snbTit mypg">
				<h2>
					<a style="color: #ffffff; text-decoration-line: none;"
						href="/goobneMall/service?command=mypage">마이페이지</a>
				</h2>
			</div>
			<ul class="snb haveSub">
				<li><span class="snbDep2"><b>나의 쇼핑정보</b></span>
					<ul style="font-size: 13px;" class="snbDep3">
						<li style="padding-top: 10px;"><a
							href="/goobneMall/service?command=orderList&type=list">주문내역조회</a></li>
						<li style="padding-top: 5px;"><a href="/goobneMall/service?command=addr" >배송지
								관리</a></li>
					</ul></li>


			<!-- 	<li><span class="snbDep2">나의 통장현황</span>
					<ul style="font-size: 13px;" class="snbDep3">
						<li style="padding-top: 5px;"><a
							href="#">쿠폰</a></li>
						<li style="padding-top: 5px;"><a
							href="#">적립금</a></li>
						<li style="padding-top: 5px;"><a
							href="#">예치금</a></li>
					</ul></li> -->
				<li><span class="snbDep2">회원정보</span>
					<ul style="font-size: 13px;" class="snbDep3">
						<li style="padding-top: 10px;"><a
							style="color: black; text-decoration-line: none;"
							href="/goobneMall/service?command=MyInfoChkPwForm">개인정보확인/수정</a></li>
						<li style="padding-top: 5px;"><a
							style="color: black; text-decoration-line: none;"
							href="/goobneMall/service?command=DeleteChkPwForm">회원탈퇴</a></li>
					</ul></li>
					<%if(id.equals("admin")){ %>
				<li><span class="snbDep2">관리자메뉴</span>
					<ul style="font-size: 13px;" class="snbDep3">
						<!-- <li style="padding-top: 10px;"><a
							style="color: black; text-decoration-line: none;"
							href="/goobneMall/service?command=orderList&type=registration">상품등록</a></li> -->
						
						<li style="padding-top: 10px;"><a
							style="color: black; text-decoration-line: none;"
							href="/goobneMall/service?command=orderList&type=MoneyCharging">예치금 충전</a></li>
					</ul></li>
					<%} %>

			</ul>
		</div>







		<!-- //snb -->

		<!-- contents -->
		<div id="contents">

			<div class="titWrap">
				<h3 class="pTit"  style="font-size: 24px;">상품 등록</h3>
			</div>



	<form  method="post" action="/goobneMall/service?command=addProduct" enctype="multipart/form-data">
				<table class="table table-striped">
					<!-- <input type="hidden" name="command" value="charging"> -->

					<tr>
						<td>상품 명</td>
						<td><input type="text" name="name"></td>
					</tr>

					<tr>
						<td>상품 금액</td>
						<td><input type="text" name="money"></td>
					</tr>
					
					<tr>
						<td>카테고리</td>
						<td><input type="text" name="cate"></td>
					</tr>
					<tr>
						<td>할인률</td>
						<td><input type="text" name="discount"></td>
					</tr>
					<tr>
						<td>팩수</td>
						<td><input type="text" name="piece"></td>
					</tr>
					<tr>
						<td>무게</td>
						<td><input type="text" name="weight"></td>
					</tr>
					<tr>
						<td>설명</td>
						<td><input type="text" name="storage"></td>
					</tr>
					<tr>
						<td>이미지</td>
						<td><input id="itemWriteForm-input1" type="file" 
						accept="image/png, image/gif, image/jpeg" name="image_path" required></td>
					</tr>  


				</table>
				<input type="submit" style="height: 25px" class="btnF"  value="등록하기">
				<div id="fileName"></div>

			</form>






			<script>
				function charging() {
					const id = $('input[name=id]').val();
					const money = $('input[name=money]').val();

					$.ajax({
						url : '/goobneMall/service?command=charging&id=' + id
								+ '&money=' + money, // 전송 URL
						type : 'POST', // GET or POST 방식
						traditional : true,
						data : {
							id : id,
							money : money
						},
						// 보내고자 하는 data 변수 설정
						success : function() {

						}
					});

				}
			</script>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>


<%
}
%>
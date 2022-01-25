<%@page import="DAO.MemberDAO"%>
<%@page import="DTO.MemberDTO"%>
<%@page import="DTO.ProductDTO"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="DTO.CartDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.CartDAO"%>
<%@page import="util.DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="/goobneMall/css/cart.css" type="text/css">

<body>



	<jsp:include page="../header.jsp" />

	<main id="cartMain" style="justify-content: center;">
		<div class="wrap" style="height: 100%">


			<div style="width: 1040px; text-align-last: center;" id="container">
				<h1 style="padding-top: 30; width: 1040px;">
					<b>주문완료</b>
				</h1>
				<hr style="width: 1040px;">
				<div>
					<img src="/goobneMall/img/CssImg/thxbuy.png">
				</div>
				<div>
					<h2>
						<b>주문이 완료되었습니다</b>
					</h2>
				</div>
				<div>
					<span><b>무통장 또는 에스크로 결제한 경우 1주일 내 미결제 시</b><br></span> <span>
						<b>자동 취소되니 이 점 유의하시기 바랍니다.</b>
					</span>
				</div>
				<div>
					<input style="width: 205px; height: 60px; margin-top: 30; margin-bottom: 30; font-size: 17px; color: #666; background: #fff; border: 1px solid #c8c8c8; font-weight: bold;color: black;"
						type="button" onclick="location.href = '/goobneMall/index.jsp';"
						value="홈으로">

				</div>
			</div>
	</main>




	<jsp:include page="../footer.jsp" />

</body>

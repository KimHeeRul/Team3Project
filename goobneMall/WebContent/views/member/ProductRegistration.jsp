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
<head>

<%
DecimalFormat formatter = new DecimalFormat("###,###");
Calendar cal = Calendar.getInstance();

MemberDAO memdao = MemberDAO.getInstance();
OrderDAO orderdao = OrderDAO.getInstance();
ProductDAO prodao = ProductDAO.getInstance();
String id = (String) session.getAttribute("log");

System.out.print(id);
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

	<br><br>



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
				<h3 class="pTit" style="font-size: 24px;">상품등록</h3>
			</div>



			<!-- 쇼핑정보 -->

			<!-- //쇼핑정보 -->

			<form method="post" action="/goobneMall/service" enctype="multipart/form-data" >
			
				<table class="table table-striped">
				<input type="hidden" name="command" value="upload">
					<tr>
						<td width="125px">카테고리</td>
						<td><select>
								<option value="1">닭가슴살</option>
								<option value="2">만두</option>
								<option value="3">도시락</option>
								<option value="4">소시지</option>
								<option value="5">치밥</option>
						</select></td>

					</tr>
					<tr>
						<td>상품명</td>
						<td><input type="text"></td>
					</tr>
					<tr>
						<td>이미지파일</td>
						<td><input type="file" id="chooseFile" name="chooseFile"
						accept="image/*" onchange="loadFile(this)"> </td>
					</tr>
					<tr>
						<td>팩 개수</td>
						<td><input type="text"></td>
					</tr>
					<tr>
						<td>무게</td>
						<td><input type="text"></td>
					</tr>
					<tr>
						<td>원가</td>
						<td><input type="text"></td>
					</tr>
					<tr>
						<td>할인률</td>
						<td><input type="text"></td>
					</tr>
					<tr>
						<td>보관 방법</td>
						<td><input type="text"></td>
					</tr>
					<tr>
						<td>재고량</td>
						<td><input type="text"></td>
					</tr>
				</table>
				<div id="fileName"></div>
				<button type="submit">dd</button>
		<input type="button" onclick="location.href='/goobneMall/service?command=upload&enctype=multipart/form-data'" value="등록하기">

			</form>



		




			<script>
			function loadFile(input) {
			    var file = input.files[0];	//선택된 파일 가져오기
			    //미리 만들어 놓은 div에 text(파일 이름) 추가
			    var name = document.getElementById('fileName');
			    name.textContent = file.name;

			  	//새로운 이미지 div 추가
			    var newImage = document.createElement("img");
			    newImage.setAttribute("class", 'img');

			    //이미지 source 가져오기
			    newImage.src = URL.createObjectURL(file);   

			    newImage.style.width = "70%";
			    newImage.style.height = "70%";
			    newImage.style.visibility = "hidden";   //버튼을 누르기 전까지는 이미지를 숨긴다
			    newImage.style.objectFit = "contain";

			    //이미지를 image-show div에 추가
			    var container = document.getElementById('image-show');
			    container.appendChild(newImage);
			};
				
			</script>
			<jsp:include page="../footer.jsp" />
</body>

<%
}
%>
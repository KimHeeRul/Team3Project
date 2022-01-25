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
<head>

<%
DecimalFormat formatter = new DecimalFormat("###,###");
Calendar cal = Calendar.getInstance();

MemberDAO memdao = MemberDAO.getInstance();
OrderDAO orderdao = OrderDAO.getInstance();
ProductDAO prodao = ProductDAO.getInstance();
String id = (String) session.getAttribute("log");
int no = Integer.parseInt(request.getParameter("no"));
ArrayList<MemberDTO> memlist = memdao.getUsers();
ArrayList<OrderDTO> orderlist = orderdao.getOrder(id);

if (id == null) {
%>
<script>
	alert("로그인 이후 이용가능합니다.")
	location.href = "/goobneMall/service?command=memberLoginForm";
</script>
<%
}
System.out.println(no);
for (int i = 0; i < orderlist.size(); i++) {
System.out.println(orderlist.get(i).getReci_name() + "[" + i + "]");
}

cal.setTime(orderlist.get(no).getOrder_date());
cal.add(Calendar.DATE, 1);
String deliveryDay = cal.get(Calendar.YEAR) + "." + cal.get(Calendar.MONTH) + 1 + "." + cal.get(Calendar.DATE);

int idx = -1;
for (int i = 0; i < memlist.size(); i++) {
if (memlist.get(i).getId().equals(id)) {
	idx = i;
	break;
}
}

MemberDTO user = null;
if (idx != -1) {
user = memlist.get(idx);
} else {
%>
<script>
	alert("잘못된 접근입니다.");
	location.href = "/goobneMall/index.jsp";
</script>
<%
}

%>
<style>
.num {
	padding-left: 5px;
}

.mp_no_table th {
	width: 150px;
	padding: 10px 15px 10px 0;
	border-top: 1px solid #ececec;
	background: #f4f4f4;
	color: #333;
	font-size: 13px;
	line-height: 22px;
	text-align: right;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />

	<div id="container" class="haveSNB">
		<br>
		<br>



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
				<h3 class="pTit" style="font-size: 24px;">주문내역조회</h3>
			</div>



			<!-- 쇼핑정보 -->

			<!-- //쇼핑정보 -->

			<div class="titWrap type02">
				<h4 class="flL tit valB">주문내역</h4>
			</div>

			<div class="prdtTbl bdLR">
				<div class="myTbl">
					<table>
						<colgroup>
							<col width="150px">
							<col width="30px">
							<col width="80px">
							<col width="*">
							<col width="120px">
							<col width="120px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">주문일자/주문번호</th>
								<th scope="col" colspan="3">구매내역</th>
								<th scope="col">총결제금액</th>
								<th scope="col">배송구분</th>
							</tr>
						</thead>

						<%ProductDTO data = prodao.getProduct(orderlist.get(no).getPro_no() + "");%>
						<tbody id="ord-std-tbody">
							<tr style="font-weight: bold; text-align-last: center;">
								<td style="font-size: 12; border-top: 1px solid #e0e0e0;"><%=orderlist.get(no).getOrder_date()%>
									<br> <fmt:formatDate
										value="<%=orderlist.get(no).getOrder_date()%>"
										pattern="(yyyyMMdd-" /> <span><%=orderlist.get(no).getOrder_no()%>)</span>
									<!--주문번호--> <br></td>


								<td
									style="border-top: 1px solid #e0e0e0; border-left: 1px solid #e0e0e0;"><a
									href="/goobneMall/service?command=product&no=<%=data.getPro_no()%>">
										<img width="80px" style="margin: 10px;" height="80px"
										src="/goobneMall/img/productImg/<%=data.getImgfile()%>">
								</a></td>
								<td
									style="text-align-last: left; border-top: 1px solid #e0e0e0; border-left: 1px solid #e0e0e0; padding-left: 15px;"
									width="300px"><a
									href="/goobneMall/service?command=product&no=<%=data.getPro_no()%>"><%=data.getTitle()%></a></td>
								<td style="border-top: 1px solid #e0e0e0;"></td>
								<%
								String allprice = formatter.format(orderlist.get(no).getPro_price() + 3000);
								%>
								<td
									style="border-top: 1px solid #e0e0e0; border-left: 1px solid #e0e0e0;">
									<%=allprice%>원
								</td>
								<td
									style="border-top: 1px solid #e0e0e0; border-left: 1px solid #e0e0e0;">
									<%
									if (orderlist.get(no).getDelivery() == 0) {
									%> <span>배송중</span> <%
 } else {
 %> <span>배송완료</span> <%
 }
 %>
								</td>
							</tr>

						</tbody>



					</table>
				</div>
			</div>


			<div class="titWrap ">
				<h4 class="tit">주문자 정보</h4>
			</div>
			<div class="prdtTbl bdLR">
				<div class="myTbl">
					<table class="mp_no_table">
						<colgroup>
							<col width="125px">
							<col width="300px">
							<col width="128px">
							<col width="300px">
						</colgroup>
						<tbody id="ord-std-tbody">
							<tr>
								<th style="border-top: 2px solid #ececec;">이름</th>
								<td style="border-bottom: 1px solid #ececec;">&nbsp;<b><%=user.getName()%></b></td>
								<th>이메일</th>
								<td style="border-bottom: 1px solid #ececec;">&nbsp;<%=user.getEmail()%></td>
							</tr>
							<tr>
								<th>휴대번호</th>
								<td style="border-bottom: 1px solid #ececec;">&nbsp;<%=user.getPhone()%></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="titWrap">
				<h4 class="tit">배송지 정보</h4>
			</div>
			<div class="prdtTbl bdLR">
				<div class="myTbl">
					<table class="mp_no_table">
						<colgroup>
							<col width="125px">
							<col width="300px">
							<col width="128px">
							<col width="300px">
						</colgroup>
						<tbody id="ord-std-tbody">
							<tr>
								<th>받는사람</th>
								<td style="border-bottom: 1px solid #ececec;">&nbsp;<%=orderlist.get(no).getReci_name()%></td>
								<th>배송(예정)일</th>
								<td style="border-bottom: 1px solid #ececec;">&nbsp;<%=deliveryDay%></td>
							</tr>
							<tr>
								<th>휴대번호</th>
								<td colspan="3" style="border-bottom: 1px solid #ececec;">&nbsp;<%=orderlist.get(no).getReci_phone()%></td>
							</tr>
							<tr>
								<th>배송지 주소</th>
								<td colspan="3" style="border-bottom: 1px solid #ececec;">&nbsp;<%="[" + orderlist.get(no).getAddrnum() + "] " + orderlist.get(no).getAddr() + " "
		+ orderlist.get(no).getDetailaddr()%></td>
							</tr>
							<tr>
								<th>배송메시지</th>
								<td>&nbsp;<%=orderlist.get(no).getMsg()%></td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>




			<script>
				
			</script>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>


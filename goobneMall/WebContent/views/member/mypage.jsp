<%@page import="DTO.AddrDTO"%>
<%@page import="DAO.AddrDAO"%>
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

MemberDAO memdao = MemberDAO.getInstance();
OrderDAO orderdao = OrderDAO.getInstance();
ProductDAO prodao = ProductDAO.getInstance();
AddrDAO addrdao = AddrDAO.getInstance();
String id = (String) session.getAttribute("log");

ArrayList<MemberDTO> memlist = memdao.getUsers();
ArrayList<OrderDTO> orderlist = orderdao.getOrder(id);
AddrDTO addrDTO = addrdao.chkNearAddr(id);


if (id == null) {
%>
<script>
	alert("로그인 이후 이용가능합니다.")
	location.href = "/goobneMall/service?command=memberLoginForm";
</script>
<%
}else{

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
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />

	<div id="container" class="haveSNB">
<br><br>
		<!-- path -->
		




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
				<h3 class="pTit" style="font-size: 24px;">나의 쇼핑정보</h3>
			</div>

			<div class="myShoppingInfo">
				<div class="NEWmy">
					<div class="myInfo" style="padding: 10px 0px 10px 10px;">
						<div class="img">
							<img
								src="http://www.goobnemall.com/static-root/cntnt/2017/07/20/201357885c914295b67611de4fee31d0.png"
								>
						</div>

						<div class="cont" style="font-size: 13px">
							<p>
								<em class="name" style="color: #f9732e; font-weight: bold;"><%=id%></em>님의
								마이페이지 입니다.
							</p>

						</div>
					</div>
					<div class="mileage" style="width: 510px;`">

						<ul style="padding-top: 15; padding-left: 30px;">

							<li style="width: 150px;">
								<table>
									<tr>
										<td rowspan="2"><img
											src="/goobneMall/img/mypage_img/mypage_coopone.png"
											style="width: 55px; height: 50px"></td>
											
										<td><span class="tit" style="font-size: 13px"><b>할인쿠폰</b></span></td>
									</tr>
									<tr>
									<%String coupon=formatter.format(user.getCoupon());%>
										<td style=""><span class="num"
											style="font-size: 12px; padding-left: 0px"><strong><%=coupon %></strong>장</span></td>

									</tr>
								</table>
							</li>
							<li style="width: 150px;">
								<table>
									<tr>
										<td rowspan="2"><img style="width: 55px; height: 50px"
											src="/goobneMall/img/mypage_img/mypage_mileage.png"></td>
										<td><span class="tit" style="font-size: 13px"><b>적립금</b></span></td>
									</tr>
									<tr>
										 <%String reserve=formatter.format(user.getReserve());%>
										<td><span class="num"
											style="font-size: 12px; padding-left: 0px;"><strong><%=reserve %></strong>원</span></td>

									</tr>
								</table>
							</li>
							<li style="width: 150px;">
								<table>
									<tr>
										<td rowspan="2"><img style="width: 55px; height: 50px"
											src="/goobneMall/img/mypage_img/mypage_keepmoney.png"></td>
										<td><span class="tit" style="font-size: 13px"><b>예치금</b></span></td>
									</tr>
									<tr>
										<%String Mileage=formatter.format(user.getMileage());%>
										<td><span class="num"
											style="font-size: 12px; padding-left: 0px;"><strong><%=Mileage%></strong>원</span></td>

									</tr>
								</table>
							</li>

						</ul>
					</div>
					
					

				</div>
				<div class="NEWmy clB">
					<div class="status flL">
						<dl>
							<dt>
								<strong style="color: #333;">주문/배송</strong>
								<n>현황</n>
							</dt>
							<dd style="width: 750px">
								<ul class="step" style="font-size: 13px;">
									<li>주문접수<strong class="num"> ></strong></li>
									<li>결제완료<strong class="num"> ></strong></li>
									<%
									int deliveryChk = 0;
									int deliveryComplete = 0;
									int list =orderdao.getdeli(orderlist,id);
								/* 	for (int i = 0; i < orderlist.size(); i++) {
										ProductDTO data = prodao.getProduct(orderlist.get(i).getPro_no() + "");
										if (orderlist.get(i).getDelivery() == 0) {
											deliveryChk++;
										}else{
											deliveryComplete++;
										}
									} */
									%>

									<li>배송중<strong class="num"><%=list%> ></strong></li>
									<li>배송완료<strong class="num"><%=orderlist.size()-list%></strong></li>
								</ul>
							</dd>
						</dl>
					
					</div>

				
				</div>
			</div>

			<!-- 쇼핑정보 -->

			<!-- //쇼핑정보 -->

			<div class="titWrap type02">
				<h4 class="flL tit valB">최근주문내역조회</h4>

			</div>

			<div class="prdtTbl bdLR">
				<div class="myTbl">
					<table>
						<caption>최근 주문내역현황</caption>
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
								<th scope="col" colspan="2">구매내역</th>
								<th scope="col">개수</th>
								<th scope="col">총결제금액</th>
								<th scope="col">배송구분</th>
							</tr>
						</thead>


						<tbody id="ord-std-tbody">
							<%
							int size=0;
							if(orderlist.size()>3){
								size=3;
							}else{
								size=orderlist.size();
							}
							
							
							
							for (int i = 0; i < size; i++) {
								ProductDTO data = prodao.getProduct(orderlist.get((orderlist.size()-1)-i).getPro_no() + "");
							%>
							<tr style="font-weight: bold; text-align-last: center;">
								<td style="font-size: 12; border-top: 1px solid #e0e0e0;"><%=orderlist.get((orderlist.size()-1)-i).getOrder_date()%>
									<br> <fmt:formatDate
										value="<%=orderlist.get((orderlist.size()-1)-i).getOrder_date()%>"
										pattern="(yyyyMMdd-" /> <span><%=orderlist.get((orderlist.size()-1)-i).getOrder_no()%>)</span>
								</td>
								<!--주문번호-->

								<td
									style="border-top: 1px solid #e0e0e0; border-left: 1px solid #e0e0e0;"><a
									href="/goobneMall/service?command=product&no=<%=data.getPro_no()%>">
										<img width="80px" style="margin: 10px;"
										height="80px"
										src="/goobneMall/img/productImg/<%=data.getImgfile()%>">
								</a></td>
								<td
									style="text-align-last: left; border-top: 1px solid #e0e0e0; border-left: 1px solid #e0e0e0; padding-left: 15px;"
									width="300px"><a href="/goobneMall/service?command=product&no=<%=data.getPro_no()%>"><%=data.getTitle()%></a></td>
						<td style="border-top: 1px solid #e0e0e0;border-left: 1px solid #e0e0e0;"><%=orderlist.get((orderlist.size()-1)-i).getPro_count() %></td>
								<%String allprice=formatter.format(orderlist.get((orderlist.size()-1)-i).getPro_price() + 3000);%>
								
								<td style="border-top: 1px solid #e0e0e0; border-left: 1px solid #e0e0e0;">	<%=allprice%>원</td>
								<td
									style="border-top: 1px solid #e0e0e0; border-left: 1px solid #e0e0e0;">
									<%
									if (orderlist.get(((orderlist.size()-1)-i)).getDelivery() == 0) {
									%> <span>배송중</span> <%
									 } else {
									 %> <span>배송완료</span> <%
									 }
									 %>
								</td>
							</tr>

							<%
							}
							%>
						</tbody>



					</table>
				</div>
			</div>


			<div class="titWrap type06">
				<h4 class="tit">나의 회원정보</h4>
			</div>
			<div class="myInfo">
				<ul>
					<li>
						<div class="mypage-info"
							style="font-size: 13px; padding-left: 80px; border-left: 0;">
							<i class="myIcon phone"><img
								src="/goobneMall/img/mypage_img/mypage_phone.png"></i>
							<p class="tit">휴대폰</p>
							<p><%=user.getPhone()%></p>

							<br>

						</div>
						<div class="edit">

							<span class="date">최종수정일 : <fmt:formatDate
									value="<%=user.getEregd8()%>" pattern="yyyy.MM.dd" /></span> <a
								style="color: black; text-decoration-line: none;"
								href="/goobneMall/service?command=MyInfoChkPwForm"  class="btnF">정보수정</a>
						</div>
					</li>
					<li>
						<div class="mypage-info"
							style="font-size: 13px; padding-left: 95px">
							<i class="myIcon email"><img
								src="/goobneMall/img/mypage_img/mypage_email.png"></i>
							<p class="tit">이메일</p>
							<p><%=user.getEmail()%></p>

							<br>

						</div>
						
						<div class="edit">
							<span class="date">최종수정일 : <fmt:formatDate
									value="<%=user.getEregd8()%>" pattern="yyyy.MM.dd" /></span> <a
								style="color: black; text-decoration-line: none;"
								href="/goobneMall/service?command=MyInfoChkPwForm"class="btnF">정보수정</a>
						</div>
					</li>
					<li>
						<div class="mypage-info" style="border-right: 0;">
							<i class="myIcon addr" style="left: 25px; font-size: 13px;"><img
								src="/goobneMall/img//mypage_img/mypage_adress.png"></i>
							<p class="tit" style="font-size: 13px;">배송지관리</p>
							<p class="cont" style="font-size: 13px;">자주 사용하는 배송지 주소를
								입력해두세요! 쇼핑이 편해집니다.</p>
						</div>
					<div class="edit">
                            <span class="date addrdate">최종수정일 : <%if(addrDTO != null){
                            %>
                            <fmt:formatDate
                                    value="<%=addrDTO.getAddrd8()%>" pattern="yyyy.MM.dd" />
                            <% 
                            }
                            %>
                                    </span> <a
                                href="/goobneMall/service?command=addr" class="btnF">배송지관리</a>
                        </div>
						
					</li>
				</ul>
			</div>

		</div>
	</div>

	


	<script>
		
	</script>
	<jsp:include page="../footer.jsp" />
</body>
<%} %>

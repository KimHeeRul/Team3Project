<%@page import="DTO.OrderPaging"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<head>

<%
DecimalFormat formatter = new DecimalFormat("###,###");

MemberDAO memdao = MemberDAO.getInstance();
OrderDAO orderdao = OrderDAO.getInstance();
ProductDAO prodao = ProductDAO.getInstance();
String id = (String) session.getAttribute("log");
if (id == null) {
%>
<script>
	alert("로그인 이후 이용가능합니다.")
	location.href = "/goobneMall/service?command=memberLoginForm";
</script>
<%
}

int totalCnt = orderdao.totalCnt(id);

int nowPage = 1;
if (request.getParameter("page") != null) {
nowPage = Integer.parseInt(request.getParameter("page"));
}

OrderPaging paging = new OrderPaging();
paging.setNowPage(nowPage);
paging.setTotalCnt(totalCnt, id);

ArrayList<OrderDTO> orderlist = orderdao.getOrder(id); // 정방향 array
ArrayList<OrderDTO> orderlist2 = orderdao.selectOrder(paging.getSql()); // 역방향 array 5개씩

System.out.print(orderlist.size() + " 1번 사이즈\n");
System.out.print(orderlist2.size() + " 2번 사이즈\n");

MemberDTO user = memdao.getUser(id);

if (orderlist != null) {
System.out.println("orderList length : " + orderlist.size());
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
						<li style="padding-top: 5px;"><a
							href="/goobneMall/service?command=addr">배송지 관리</a></li>
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
				<%
				if (id.equals("admin")) {
				%>
				<li><span class="snbDep2">관리자메뉴</span>
					<ul style="font-size: 13px;" class="snbDep3">
						<!-- <li style="padding-top: 10px;"><a
							style="color: black; text-decoration-line: none;"
							href="/goobneMall/service?command=orderList&type=registration">상품등록</a></li> -->

						<li style="padding-top: 10px;"><a
							style="color: black; text-decoration-line: none;"
							href="/goobneMall/service?command=orderList&type=MoneyCharging">예치금
								충전</a></li>
					</ul></li>
				<%
				}
				%>

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
								src="http://www.goobnemall.com/static-root/cntnt/2017/07/20/201357885c914295b67611de4fee31d0.png">
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
										<%
										String coupon = formatter.format(user.getCoupon());
										%>
										<td style=""><span class="num"
											style="font-size: 12px; padding-left: 0px"><strong><%=coupon%></strong>장</span></td>

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
										<%
										String reserve = formatter.format(user.getReserve());
										%>
										<td><span class="num"
											style="font-size: 12px; padding-left: 0px;"><strong><%=reserve%></strong>원</span></td>

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
										<%
										String Mileage = formatter.format(user.getMileage());
										%>
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
										System.out.print(i);
										ProductDTO data = prodao.getProduct(orderlist.get(i).getPro_no() + "");
										if (orderlist.get(i).getDelivery() == 0) {
											deliveryChk++;
										} else {
											
											deliveryComplete++;
										}
									} */
									%>
									<!--22.02.04 코드개선  -->
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
				<h4 class="flL tit valB">주문내역현황</h4>

			</div>

			<div class="prdtTbl bdLR">
				<div class="myTbl">
					<table>
						<caption>주문내역현황</caption>
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
							for (int i = 0; i < orderlist2.size(); i++) { // 0 1 2 3 4
								ProductDTO data = prodao.getProduct(orderlist2.get(i).getPro_no() + "");
							%>
							<tr style="font-weight: bold; text-align-last: center;">
								<td style="font-size: 12; border-top: 1px solid #e0e0e0;"><%=orderlist2.get(i).getOrder_date()%>
									<br> <fmt:formatDate
										value="<%=orderlist2.get(i).getOrder_date()%>"
										pattern="(yyyyMMdd-" /> <span><%=orderlist2.get(i).getOrder_no()%>)</span>
									<!--주문번호--> <br>
								<br> <input type="button" style="height: 25px" class="btnF"
									value="상세보기"
									onclick="location.href ='/goobneMall/service?command=orderList&type=detail&no=<%=orderlist.size() - 1 - (i + (paging.getNowPage() - 1) * 5)%>'">
									
									<!-- MAX값 - (현재 숫자 +((페이지 - 1) * 5)) --></td>


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
								<td style="border-top: 1px solid #e0e0e0;border-left: 1px solid #e0e0e0;"><%=orderlist2.get(i).getPro_count() %></td>
								<%
								String allprice = formatter.format(orderlist2.get(i).getPro_price() + 3000);
								%>
								<td
									style="border-top: 1px solid #e0e0e0; border-left: 1px solid #e0e0e0;">
									<%=allprice%>원
								</td>
								<td
									style="border-top: 1px solid #e0e0e0; border-left: 1px solid #e0e0e0;">
									<%
									if (orderlist2.get(i).getDelivery() == 0) {
									%> <span>배송중</span> <br> <input type="button"
									style="height: 25px" class="btnF" value="배송완료"
									id="<%=orderlist2.get(i).getOrder_no()%>"
									onclick="DVcomplete(this.id)"> <%
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
					<nav aria-label="Page navigation"
						style="margin: auto; text-align: center;">
						<ul class="pagination">
							<!--  <li class=disabled> -->
							<li>
								<%
								if (paging.isFirst()) {
								%> <a
								href="/goobneMall/service?command=orderList&type=list&page=1"
								aria-label="Previous">처음</a> <%
 }
 if (paging.isPrev()) {
 %> <a
								href="/goobneMall/service?command=orderList&type=list&page=<%=paging.getNowPage() - 1%>">
									<span aria-hidden="true">«</span>
							</a>
							</li>
							<%
							}
							for (int i = paging.getStartPage(); i <= paging.getEndPage(); i++) {
							if (i == paging.getNowPage()) {
							%>
							<li class="active"><a href="#"> <%=i%></a></li>
							<%
							} else {
							%>
							<li><a
								href="/goobneMall/service?command=orderList&type=list&page=<%=i%>">
									<%=i%>
							</a></li>
							<%
							}
							}
							if (paging.isNext()) {
							%>
							<li><a aria-label="Next"
								href="/goobneMall/service?command=orderList&type=list&page=<%=paging.getNowPage() + 1%>">
									» </a></li>
							<%
							}
							if (paging.isEnd()) {
							%>
							<li><a
								href="/goobneMall/service?command=orderList&type=list&page=<%=paging.getTotalPage()%>"
								aria-label="Previous"> 끝 </a></li>
							<%
							}
							%>
						</ul>
					</nav>

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
									value="<%=user.getRegd8()%>" pattern="yyyy.MM.dd" /></span> <a
								style="color: black; text-decoration-line: none;"
								href="/goobneMall/service?command=MyInfoChkPwForm" class="btnF">정보수정</a>
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
									value="<%=user.getRegd8()%>" pattern="yyyy.MM.dd" /></span> <a
								style="color: black; text-decoration-line: none;"
								href="/goobneMall/service?command=MyInfoChkPwForm" class="btnF">정보수정</a>
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

							<span class="date addrdate">최종수정일 :</span> <a
								href="/goobneMall/service?command=addr" class="btnF">배송지관리</a>
						</div>
					</li>
				</ul>
			</div>

		</div>
	</div>





	<script>
	function DVcomplete(DvID){
		const no=DvID;
		
	$.ajax({
			url : '/goobneMall/service?command=DVcomplete', // 전송 URL
			type : 'POST', // GET or POST 방식
			traditional : true,
			data : {
			no : no,
		// 보내고자 하는 data 변수 설정
			},
			success : function() {
				location.href = '/goobneMall/service?command=orderList&type=list';
			}
			});
	}
	
	</script>
	<jsp:include page="../footer.jsp" />
</body>


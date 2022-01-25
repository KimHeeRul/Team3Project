<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.AddrDAO"%>
<%@page import="DTO.AddrDTO"%>
<%@page import="DAO.AddrDAO"%>
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
<%
DecimalFormat formatter = new DecimalFormat("###,###");
DBManager.getConnection();
CartDAO dao = CartDAO.getInstance();
ProductDAO prodao = ProductDAO.getInstance();
MemberDAO memdao = MemberDAO.getInstance();
AddrDAO addrdao = AddrDAO.getInstance();

String id = (String) session.getAttribute("log");

ArrayList<CartDTO> buylist = dao.getBuy(id);
ArrayList<ProductDTO> productlist = new ArrayList<>();
ArrayList<MemberDTO> memlist = memdao.getUsers();
ArrayList<AddrDTO> addrlist = addrdao.chkOverlapId(id);

for (int i = 0; i < buylist.size(); i++) {
	productlist.add(prodao.getProduct(buylist.get(i).getPro_no() + ""));
}

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
ArrayList<CartDTO> data = dao.getCart(id);//해당 아이디의 장바구니 정보

for (int i = 0; i < buylist.size(); i++) {
if (productlist.get(i).getInventory() < buylist.get(i).getCart_count()) {
	dao.update(buylist.get(i).getCart_no(), productlist.get(i).getInventory());
%>

<script>
	alert("현재 재고가 부족합니다");
	location.href = "/goobneMall/index.jsp";
</script>
<%
}
}

int Allprice = 0;
%>

<body>

	<style>
.buy_input {
	height: 28px;
	margin-left: 15px;
	border: 1px solid #ececec;
}

.buy_a {
	vertical-align: middle;
	width: 95px;
	padding: 5px 0;
	margin-left: 10px;
	height: 18px;
	padding: 5px 4px;
	background: #bdbdbd;
	color: #fff;
	font-size: 12px;
	line-height: 18px;
	text-align: center;
}

.buy_no_table th {
	width: 150px;
	padding: 10px 15px 10px 0;
	border-top: 1px solid #ececec;
	background: #f4f4f4;
	color: #333;
	font-size: 13px;
	line-height: 22px;
	text-align: right;
}

.buy_no_table td {
	border-top: 1px solid #ececec;
	border-left: 1px solid #ececec;
	text-align: left;
	height: 47px;
}

#buy_container {
	display: grid;
}

.buy-require {
	padding-right: 10px;
}
</style>

	<jsp:include page="../header.jsp" />

	<main id="cartMain" style="justify-content: center;">
		<div class="wrap" style="height: 100%">

			<aside id="cartAside"></aside>
			<div id="container">
				<h1 style="padding-top: 30; width: 1040px;">
					<b>주문서작성/결제</b>
				</h1>
				<hr style="width: 1040px;">
				<h2>
					<b>주문자 정보</b>
				</h2>

				<form id="myform" action="service" style="width: 1040px"
					method="post">
					<table class="buy_no_table">
						<tr>
							<th style="border-top: 2px solid #ececec;"><img
								class="buy-require" alt=""
								src="/goobneMall/img/join_img/joinChkImg.png">이름</th>
							<td
								style="width: 900px; height: 45px; border-top: 2px solid #ececec;"><input
								class="buy_input" type="text" id="order_name" name="order_name"
								value="<%=user.getName()%>" readonly="readonly"></td>
						</tr>
						<tr>
							<th><img class="buy-require" alt=""
								src="/goobneMall/img/join_img/joinChkImg.png">휴대번호</th>
							<td><input class="buy_input" type="text" id="order_phone"
								name="order_phone" value="<%=user.getPhone()%>"
								readonly="readonly"></td>
						</tr>
						<tr>
							<th style="border-bottom: 2px solid #ececec;"><img
								class="buy-require" alt=""
								src="/goobneMall/img/join_img/joinChkImg.png">이메일</th>
							<td style="border-bottom: 2px solid #ececec;"><input
								class="buy_input" type="text" id="order_email"
								name="order_email" value="<%=user.getEmail()%>"
								readonly="readonly"></td>
						</tr>
					</table>
					<h2>
						<b>배송지 정보 입력</b>
					</h2>
					<table class="buy_no_table">
						<tr>
							<th style="border-top: 2px solid #ececec;"><img
								class="buy-require" alt=""
								src="/goobneMall/img/join_img/joinChkImg.png">배송지</th>
							<td
								style="width: 900px; height: 45px; border-top: 2px solid #ececec;">
								<select style="width: 121px; height: 28px;" class="buy_input"
								id="optList" onchange="chageSelect()">
									<option value="new" selected="selected">새주소입력</option>
									<%
									if (addrlist != null) {
										for (int i = 0; i < addrlist.size(); i++) {
									%>
									<option value="<%=i%>"><%=addrlist.get(i).getAddrname()%></option>
									<%
									}
									%>
									<%
									for (int i = 0; i < addrlist.size(); i++) {
									%>
									<input type="hidden" name="order_name" id="order_name<%=i%>"
									value="<%=addrlist.get(i).getName()%>">
									<input type="hidden" name="order_phone" id="order_phone<%=i%>"
									value="<%=addrlist.get(i).getPhone()%>">

									<input type="hidden" name="home_phone" id="home_phone<%=i%>"
									value="<%=addrlist.get(i).getHphone()%>">


									<input type="hidden" name="addrnum" id="addrNum<%=i%>"
									value="<%=addrlist.get(i).getAddrNum()%>">
									<input type="hidden" name="addr" id="addr<%=i%>"
									value="<%=addrlist.get(i).getAddr()%>">
									<input type="hidden" name="detailaddr" id="detailaddr<%=i%>"
									value="<%=addrlist.get(i).getDetailAddr()%>">
									<%
									System.out.print(addrlist.get(i).getAddrNum());
									}
									}
									%>


							</select>
							</td>
						</tr>
						<tr>
							<th><img class="buy-require" alt=""
								src="/goobneMall/img/join_img/joinChkImg.png">받는사람</th>
							<td><input class="buy_input" type="text"
								id="reci_name_input" name="reci_name" value=""
								placeholder="이름 입력" required></td>
						</tr>
						<tr>
							<th><img class="buy-require" alt=""
								src="/goobneMall/img/join_img/joinChkImg.png">휴대번호</th>
							<td class="buyShotBtnTd">
								<div style="display: flex;">
									<select class="buy_input_" id="reci_phone0"
										name="reci_phoneZero" onclick="reci_phone0Change()"
										style="height: 28px; margin-left: 15px; border: 1px solid #ececec; display: block">
										<option value="010" selected>010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
										<option value="070">070</option>
									</select> <input class="buy_input" type="text" id="reci_phone1"
										name="reci_phoneFst" value="" maxlength="3" readonly>
									<span>-</span> <input class="buy_input" type="text"
										id="reci_phone2" name="reci_phoneScd" value="" maxlength="4">
									<span>-</span> <input class="buy_input" type="text"
										id="reci_phone3" name="reci_phoneTrd" value="" maxlength="4">
								</div>
							</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td class="buyShotBtnTd">
								<div style="display: flex;">
									<select class="buy_input" id="input_home_phone0"
										name="home_phoneZero" onchange="homePhone0Change()"
										style="height: 28px; padding: 4px 0; padding-left: 5px; border: 1px solid #ececec; display: block;">
										<option value="선택" selected>선택</option>
										<option value="02">서울 (02)</option>
										<option value="031">경기 (031)</option>
										<option value="032">인천 (032)</option>
										<option value="033">강원 (033)</option>
										<option value="041">충남 (041)</option>
										<option value="042">대전 (042)</option>
										<option value="043">충북 (043)</option>
										<option value="051">부산 (051)</option>
										<option value="052">울산 (052)</option>
										<option value="053">대구 (053)</option>
										<option value="054">경북 (054)</option>
										<option value="055">경남 (055)</option>
										<option value="061">전남 (061)</option>
										<option value="062">광주 (062)</option>
										<option value="063">전북 (063)</option>
										<option value="064">제주 (064)</option>
										<option value="070">인터넷전화 (070)</option>
										<option value="050">평생전화 (050)</option>
									</select> <input class="buy_input" type="text" id="input_home_phone1"
										name="home_phoneFst" value="" maxlength="3" readonly>
									<span>-</span> <input class="buy_input" type="text"
										id="input_home_phone2" name="home_phoneScd" value=""
										maxlength="4"> <span>-</span> <input class="buy_input"
										type="text" id="input_home_phone3" name="home_phoneTrd"
										value="" maxlength="4">
								</div>
							</td>
						</tr>
						<tr>
							<th><img class="buy-require" alt=""
								src="/goobneMall/img/join_img/joinChkImg.png">주소</th>
							<td class="addr_input_content">
								<div
									style="text-align: left; width: 100%; margin-bottom: 15px; vertical-align: middle;">
									<input type="text" class="buy_input" style="margin-top: 10px"
										id="sample6_postcode" name="addrnum" placeholder="우편번호">
									<input type="button" class="buy_a" id="find_postCode_Buy"
										style="padding: 0; height: 28; margin-bottom: 3;"
										onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
								</div>
								<div
									style="text-align: left; width: 100%; vertical-align: middle;">
									<input type="text" class="buy_input"
										style="width: 60%; margin-bottom: 15px;" id="sample6_address"
										placeholder="주소" name="addr"> <input type="text"
										class="buy_input"
										style="width: 60%; margin-right: 10px; margin-bottom: 10px;"
										id="sample6_detailAddress" name="detailaddr"
										placeholder="상세주소">
									<!-- <input
										type="text" class="form-control" style="width: 30%;"
										id="sample6_extraAddress" placeholder="참고항목"> -->
								</div> <script
									src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
								<script>
									function sample6_execDaumPostcode() {
										new daum.Postcode(
												{
													oncomplete : function(data) {
														// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

														// 각 주소의 노출 규칙에 따라 주소를 조합한다.
														// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
														var addr = ''; // 주소 변수
														var extraAddr = ''; // 참고항목 변수

														//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
														if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
															addr = data.roadAddress;
														} else { // 사용자가 지번 주소를 선택했을 경우(J)
															addr = data.jibunAddress;
														}

														// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
														if (data.userSelectedType === 'R') {
															// 법정동명이 있을 경우 추가한다. (법정리는 제외)
															// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
															if (data.bname !== ''
																	&& /[동|로|가]$/g
																			.test(data.bname)) {
																extraAddr += data.bname;
															}
															// 건물명이 있고, 공동주택일 경우 추가한다.
															if (data.buildingName !== ''
																	&& data.apartment === 'Y') {
																extraAddr += (extraAddr !== '' ? ', '
																		+ data.buildingName
																		: data.buildingName);
															}
															// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
															if (extraAddr !== '') {
																extraAddr = ' ('
																		+ extraAddr
																		+ ')';
															}
															// 조합된 참고항목을 해당 필드에 넣는다.
															// document.getElementById("sample6_extraAddress").value = extraAddr;

														} else {
															// document.getElementById("sample6_extraAddress").value = '';
														}

														// 우편번호와 주소 정보를 해당 필드에 넣는다.
														document
																.getElementById('sample6_postcode').value = data.zonecode;
														document
																.getElementById("sample6_address").value = addr;
														// 커서를 상세주소 필드로 이동한다.
														document
																.getElementById(
																		"sample6_detailAddress")
																.focus();
													}
												}).open();
									}
								</script>


							</td>
						</tr>


						<tr>
							<th style="border-bottom: 2px solid #ececec;"><img
								class="buy-require" alt=""
								src="/goobneMall/img/join_img/joinChkImg.png">배송메시지</th>
							<td style="border-bottom: 2px solid #ececec;"><input
								class="buy_input" type="text" id="msg" name="msg"
								placeholder="ex)오시기전에 연락주세요" style="width: 40%;"></td>
						</tr>
					</table>


					<h2>
						<b>주문상품정보</b>
					</h2>

					<table class="buy_no_table" style="width: 1040px">
						<thead>
							<tr>
								<th
									style="text-align: center; padding: 0; height: 45px; border-left: 0px"
									colspan="2">상품</th>
								<th style="text-align: center; padding: 0;">개수</th>
								<th style="text-align: center; padding: 0;">팩당 금액</th>
								<th style="text-align: center; padding: 0;">상품금액</th>
							</tr>
						</thead>

						<%
						for (int i = 0; i < buylist.size(); i++) {
							Allprice += productlist.get(i).getPrice() * buylist.get(i).getCart_count();
						%>
						<tbody id="tbody">
							<input type="hidden" name="product"
								value="<%=productlist.get(i).getPro_no()%>">
							<input type="hidden" name="qnt"
								value="<%=buylist.get(i).getCart_count()%>">
							<input type="hidden" name="cartno"
								value="<%=buylist.get(i).getCart_no()%>">
							<tr>
								<td
									style="padding: 20px; width: 100px; border-bottom: 2px solid #ececec; border-left: 0;"><a
									href="/goobneMall/service?command=product&no=<%=productlist.get(i).getPro_no()%>"><img
										width="80px" height="80px"
										src="/goobneMall/img/productImg/<%=productlist.get(i).getImgfile()%>">
								</a></td>
								<td
									style="width: 740px; vertical-align: top; border-bottom: 2px solid #ececec; text-align: left; padding: 20;"><b><%=productlist.get(i).getTitle()%></b></td>
								<td style="border-bottom: 2px solid #ececec; text-align: center"><%=buylist.get(i).getCart_count()%></td>
								<%
								String packprice = formatter.format(productlist.get(i).getPrice());
								%>
								<td style="border-bottom: 2px solid #ececec; text-align: center"><%=packprice%></td>
								<%
								String allprice = formatter.format(productlist.get(i).getPrice() * buylist.get(i).getCart_count());
								%>
								<td style="border-bottom: 2px solid #ececec; text-align: center"><%=allprice%>원</td>
							</tr>
						</tbody>
						<%
						}
						%>

					</table>

					<hr style="width: 1040px">
					<hr style="width: 1040px">
					<h2>
						<b>최종 결제정보</b>
					</h2>
					<table style="font-weight: bold;" class="buy_no_table">
						<tr>
							<td
								style="width: 150px; padding: 10px 15px 10px 0; border-top: 2px solid #ececec; background: #f4f4f4; color: #333; font-size: 13px; line-height: 22px; text-align: right;"
								class="buy_no_table th">총상품금액</td>
							<%
							String AllPrice = formatter.format(Allprice);
							%>
							<td colspan="2"
								style="width: 900px; padding-left: 15px; height: 45px; border-top: 2px solid #ececec;"
								class="buy_no_table td"><span id="total"><%=AllPrice%><span
									id="buy_reserve"></span></span>원</td>
						</tr>
						<tr>
							<td
								style="width: 150px; padding: 10px 15px 10px 0; border-top: 2px solid #ececec; background: #f4f4f4; color: #333; font-size: 13px; line-height: 22px; text-align: right;">적립금</td>
							<%
							int reserve = user.getReserve();
							String coupon = formatter.format(user.getCoupon());
							%>
							<td style="color: red; width: 100px; padding-left: 5px;">-<span
								id="mileage" style="padding-left: 5px;">0</span></td>
							<td
								style="width: 900px; padding-left: 15px; height: 45px; border-left: 0px; border-top: 1px solid #ececec;"><span><input
									type="text"
									style="width: 80px; height: 25px; padding-left: 8px;"
									name="reserve" value="0"></span><span> <input
									type="button"
									style="height: 25px; margin-left: 10px; border: 1px solid #c8c8c8; background: #fff; color: black; font-size: 12px; width: 70px;"
									onclick="reserveBtn(form)" value="사용하기"></span><span
								style="margin-left: 10; color: #999; font-size: 12px;">현재
									남은 마일리지 : <span><%=user.getReserve()%>원</span>
							</span></td>
						</tr>
						<tr>
							<td
								style="width: 150px; padding: 10px 15px 10px 0; border-top: 2px solid #ececec; background: #f4f4f4; color: #333; font-size: 13px; line-height: 22px; text-align: right;"">쿠폰</td>

							<td style="color: red; width: 100px; padding-left: 5px;" name="">-<span
								id="coupon" style="padding-left: 5px">0</span></td>

							<td
								style="width: 900px; padding-left: 14px; height: 45px; border-left: 0px; border-top: 1px solid #ececec;">남은
								쿠폰개수:<span style="padding-left: 10px; color: #f9732e;"><%=coupon%>개</span>
								<input type="hidden" name="couponLast"
								value="<%=user.getCoupon()%>"> <%
 if (user.getCoupon() == 0) {%>
 <input style="display: none;" type="checkbox" class="sample"
								id="checkValue" onclick="couponChk()">
	 <% 
 } else {
 %> <input style="margin-left: 10;" type="checkbox" class="sample"
								id="checkValue" onclick="couponChk()"> <%
 }
 %>
							</td>
						</tr>
						<tr>
							<td
								style="width: 150px; padding: 10px 15px 10px 0; border-top: 1px solid #ececec; background: #f4f4f4; color: #333; font-size: 13px; line-height: 22px; text-align: right;"
								class="buy_no_table th">배송비</td>

							<td colspan="2"
								style="width: 900px; padding-left: 15px; height: 45px; border-top: 2px solid #ececec;"
								class="buy_no_table td"><span id="delivery">3,000</span>원</td>
						</tr>
						<tr>
							<td
								style="width: 150px; border-bottom: 2px solid #ececec; padding: 10px 15px 10px 0; border-top: 1px solid #ececec; background: #f4f4f4; color: #333; font-size: 13px; line-height: 22px; text-align: right;"
								class="buy_no_table th">최종 결제금액</td>
							<%
							String AllPrice2 = formatter.format(Allprice + 3000);
							%>
							<td colspan="2"
								style="width: 900px; border-bottom: 2px solid #ececec; padding-left: 15px; height: 45px; border-top: 2px solid #ececec;"
								class="buy_no_table td"><span id="delitotal"><%=AllPrice2%></span>원</td>
						</tr>
					</table>
					<input type="hidden" name="command" value="buy"> <input
						type="hidden" name="Allprice" value="<%=Allprice + 3000%>">
					<input type="hidden" name="myMoney" value="<%=user.getMileage()%>">
					<input type="hidden" name="getreserve"
						value="<%=user.getReserve()%>"> 
						
						<input type="hidden"
						name="couponValue" value="0">

					<div
						style="text-align-last: center; padding-top: 30px; padding-bottom: 50px;">

						<button
							style="width: 205px; height: 60px; font-size: 17px; color: #fff; border: 1px solid #ff634e; background: #ff634e;"
							type="button" id="subbtn" onclick="buyBtn(form)">구매하기</button>
					</div>
				</form>


			</div>
		</div>
	</main>


	<script>
		init();

		function init() {
			$("#optList").val("new").prop("selected", true);

			// 이름 초기화
			$("#reci_name_input").val("");

			// 핸드폰 번호 초기화
			$("#reci_phone0").val("010").prop("selected", true);
			const inputN = $("#reci_phone0").val();
			$('#reci_phone1').val(inputN);
			$('#reci_phone2').val("");
			$('#reci_phone3').val("");

			// 홈폰 번호 초기화
			$("#input_home_phone0").val("선택").prop("selected", true);
			const inputN2 = $("#input_home_phone0").val();
			$('#input_home_phone1').val(inputN2);
			$('#input_home_phone2').val("");
			$('#input_home_phone3').val("");

			// 주소 관련 초기화
			$("#find_postCode_Buy").css("display", "inline"); // 우편번호 찾기 보이기

			$('#sample6_postcode').val("");
			$('#sample6_address').val("");
			$('#sample6_detailAddress').val("");

			console.log('-----------------------------------------------');
			console.log($('#sample6_postcode').val());
			console.log($('#sample6_address').val());
			console.log($('#sample6_detailAddress').val());
			console.log('-----------------------------------------------');

			// readonly 설정
			$("#reci_name_input").removeAttr("readonly");

			$('#reci_phone0').css("display", "block");
			$('#reci_phone2').removeAttr("readonly");
			$('#reci_phone3').removeAttr("readonly");

			$('#input_home_phone0').css("display", "block");
			$('#input_home_phone2').removeAttr("readonly");
			$('#input_home_phone3').removeAttr("readonly");

			$('#sample6_postcode').removeAttr("readonly");
			$('#sample6_address').removeAttr("readonly");
			$('#sample6_detailAddress').removeAttr("readonly");
		}

		function buyBtn(form) { // 폼 서밋 버튼
			// 이름 확인
			const name = $("#reci_name_input").val();

			if (name === "") {
				alert("이름을 입력해 주십시오.");
				$("#reci_name_input").focus();
			} else { // 이름 입력됐을 때
				// 핸드폰 번호 확인
				const reg1 = /^(\d{3,4})$/;
				const reg2 = /^(\d{4,4})$/;
				const reciP1 = $('#reci_phone2').val();
				const reciP2 = $('#reci_phone3').val();
				if (reciP1 === "") {
					alert("번호를 입력해주세요.");
					$('#reci_phone2').focus();
				} else if (!reg1.test(reciP1)) {
					alert("숫자 3~4자리만 입력 가능합니다.");
					$('#reci_phone2').focus();
				} else if (reciP2 === "") {
					alert("번호를 입력해주세요.");
					$('#reci_phone3').focus();
				} else if (!reg2.test(reciP2)) {
					alert("숫자 4자리만 입력 가능합니다.");
					$('#reci_phone3').focus();
				} else {
					// 홈폰 번호 확인
					const homeP0 = $('#input_home_phone1').val();
					const homeP1 = $('#input_home_phone2').val();
					const homeP2 = $('#input_home_phone3').val();
					if (homeP0 != "선택" && homeP0 != "" ) {
						if (homeP1 === "") {
							alert("전화번호를 입력해주세요.");
							$('#input_home_phone2').focus();
						} else if (!reg1.test(homeP1)) {
							alert("숫자 3~4자리만 입력 가능합니다.");
							$('#input_home_phone2').focus();
						} else if (homeP2 === "") {
							alert("전화번호를 입력해주세요.");
							$('#input_home_phone3').focus();
						} else if (!reg2.test(homeP2)) {
							alert("숫자 4자리만 입력 가능합니다.");
							$('#input_home_phone3').focus();
						} else {
							// 주소 관련 확인
							const postCode = $('#sample6_postcode').val();
							const adress = $('#sample6_address').val();
							const Dadress = $('#sample6_detailAddress').val();

							const reg4 = /^(\d{5})$/; // 신주소 우편번호

							if (adress === "" || !reg4.test(postCode)) {
								alert("우편번호 찾기로 주소를 입력해주세요.");
							} else if (adress != "" && reg4.test(postCode)) {
var reserve = parseInt($('input[name=reserve]').val());
							
								
								var price = parseInt($('input[name=Allprice]').val());
								var mymoney = parseInt($('input[name=myMoney]')
										.val());
								var chk = document.getElementById('checkValue').checked;
								

								if(chk==1){
									price=(price-3000)*9/10+3000;
									if (price <= mymoney+reserve) {
										form.submit();
									}else{
										alert("소지한 예치금이 부족합니다.")
										location.href = '/goobneMall/service?command=cartView';
									}
								}else{
									if (price <= mymoney+reserve) {
										form.submit();
									}else{
										alert("소지한 예치금이 부족합니다.")
										location.href = '/goobneMall/service?command=cartView';
									}
								}
							}
						}
					} else { // 지역번호 선택일 때
						if (homeP1 === "" && homeP2 === "") { // 아무것도 입력되지 않았을 때
							// 주소 관련 확인
							const postCode = $('#sample6_postcode').val();
							const adress = $('#sample6_address').val();
							const Dadress = $('#sample6_detailAddress').val();

							const reg4 = /^(\d{5})$/; // 신주소 우편번호

							if (adress === "" || !reg4.test(postCode)) {
								alert("우편번호 찾기로 주소를 입력해주세요.");
							} else if (adress != "" && reg4.test(postCode)) {
							
								var reserve = parseInt($('input[name=reserve]').val());
							
								
								var price = parseInt($('input[name=Allprice]').val());
								var mymoney =  parseInt($('input[name=myMoney]')
										.val());
								var chk = parseInt($('input[name=couponValue]').val());
								
								console.log(price);
								console.log(mymoney);
								console.log(reserve);
								if(chk==1){
									price=(price-3000)*9/10+3000;
									if (price <= mymoney+reserve) {
										form.submit();
									}else{
										alert("소지한 예치금이 부족합니다.")
										location.href = '/goobneMall/service?command=cartView';
									}
								}else{
									if (price <= mymoney+reserve) {
										form.submit();
									}else{
										alert("소지한 예치금이 부족합니다.")
										location.href = '/goobneMall/service?command=cartView';
									}
								}
							
							}
						} else if (homeP1 != "" || homeP2 != "") { // 하나라도 입력됐을 때
							alert("지역번호 선택 후 전화번호를 입력해주세요.");
							$('#input_home_phone0').focus();
						}
					}
				}
			}
		}

		/* 	 	var addrnum = $("input[name='addrnum']").val();
		 var addr = $("#optList option:selected").val();
		 var detailaddr = $("#optList option:selected").val();
		
		 for (var i = 1; i < 2; i++) {
		 $("#optList").append("<option value='"+i+"'>화이트</option>");
		 $("#optList").append("<option value='"+i+"'>화이트</option>");
		
		 detailaddr =$("input[name='detailaddr"+0+"]").val();
		 console.log(detailaddr);
		 } 
		 */
		function chageSelect() { // 배송지 선택시 실행
			const sel = $("select[id=optList]").val();


			if (sel != "new") {

							// 이름 관련 처리
				const order_name = $("input[id=order_name" + sel + "]").val();
				$("#reci_name_input").attr("readonly", true);
				document.getElementById("reci_name_input").value = order_name;

				// 핸드폰 번호 받기
				const order_phone = $("input[id=order_phone" + sel + "]").val();

				// 핸드폰 셀렉창 숨기기
				$('#reci_phone0').css("display", "none");
				// 홈폰 셀렉창 숨기기
				$('#input_home_phone0').css("display", "none");

				// 핸드폰 번호 '-' 삭제
				const order_phone_split = order_phone.split("-");

				const order_phone1 = order_phone_split[0]; // 핸드폰 앞자리
				const order_phone2 = order_phone_split[1]; // 핸드폰 중간
				const order_phone3 = order_phone_split[2]; // 핸드폰 마지막 번호

				console.log(order_phone_split);
				console.log(order_phone1);
				console.log(order_phone2);
				console.log(order_phone3);

				// 핸드폰 번호 입력
				$('#reci_phone1').val(order_phone1);
				$('#reci_phone2').val(order_phone2);
				$('#reci_phone3').val(order_phone3);

				// readonly 설정
				$('#reci_phone2').attr("readonly", true);
				$('#reci_phone3').attr("readonly", true);

				// 홈폰 번호 받기
				const home_phone = $("input[id=home_phone" + sel + "]").val();
				
				// readonly 설정
				$('#input_home_phone2').attr("readonly", true);
				$('#input_home_phone3').attr("readonly", true);

				if (home_phone != "null") { // 홈폰 번호 있을 시에

					// 홈폰 번호 '-' 삭제

					const home_phone_split = home_phone.split("-");

					const home_phone1 = home_phone_split[0];
					const home_phone2 = home_phone_split[1];
					const home_phone3 = home_phone_split[2];

					console.log(home_phone_split);
					console.log(home_phone1);
					console.log(home_phone2);
					console.log(home_phone3);

					// 홈폰 번호 입력
					$('#input_home_phone1').val(home_phone1);
					$('#input_home_phone2').val(home_phone2);
					$('#input_home_phone3').val(home_phone3);
					// document.getElementById("home_phone").value = home_phone;

				} 
				else { // 홈폰
					$('#input_home_phone1').val("");
					$('#input_home_phone2').val("");
					$('#input_home_phone3').val("");
				}

				// 주소 관련 처리

				// 주소 관련 값 입력 받기
				const addrnum = $("input[id=addrNum" + sel + "]").val(); // 우편번호
				const addr = $("input[id=addr" + sel + "]").val(); // 주소
				const detailaddr = $("input[id=detailaddr" + sel + "]").val(); // 상세 주소

				// 주소 관련 입력
				$("#find_postCode_Buy").css("display", "none");
				
				
				document.getElementById("sample6_postcode").value = addrnum;
				document.getElementById("sample6_address").value = addr;
				document.getElementById("sample6_detailAddress").value = detailaddr;
				$('#sample6_postcode').attr("readonly", true);
				$('#sample6_address').attr("readonly", true);
				$('#sample6_detailAddress').attr("readonly", true);

			}else { // 신규 배송지 선택 시

				// 이름 초기화
				$("#reci_name_input").val("");

				// 핸드폰 번호 초기화
				$("#reci_phone0").val("010").prop("selected", true);
				const inputN = $("#reci_phone0").val();
				$('#reci_phone1').val(inputN);
				$('#reci_phone2').val("");
				$('#reci_phone3').val("");

				// 홈폰 번호 초기화
				$("#input_home_phone0").val("선택").prop("selected", true);
				const inputN2 = $("#input_home_phone0").val();
				$('#input_home_phone1').val(inputN2);
				$('#input_home_phone2').val("");
				$('#input_home_phone3').val("");

				// 주소 관련 초기화
				$("#find_postCode_Buy").css("display", "inline");

				$('#sample6_postcode').val("");
				$('#sample6_address').val("");
				$('#sample6_detailAddress').val("");

				console.log('-----------------------------------------------');
				console.log($('#sample6_postcode').val());
				console.log($('#sample6_address').val());
				console.log($('#sample6_detailAddress').val());
				console.log('-----------------------------------------------');

				// readonly 설정
				$("#reci_name_input").removeAttr("readonly");

				$('#reci_phone0').css("display", "block");
				$('#reci_phone2').removeAttr("readonly");
				$('#reci_phone3').removeAttr("readonly");

				$('#input_home_phone0').css("display", "block");
				$('#input_home_phone2').removeAttr("readonly");
				$('#input_home_phone3').removeAttr("readonly");

				$('#sample6_postcode').removeAttr("readonly");
				$('#sample6_address').removeAttr("readonly");
				$('#sample6_detailAddress').removeAttr("readonly");
			}
		}

		function homePhone0Change() {
			const value = $("#input_home_phone0").val();
			$("#input_home_phone1").val(value);
		}

		function reci_phone0Change() {
			const value = $("#reci_phone0").val();
			$("#reci_phone1").val(value);
		}

		function reserveBtn(form) {
			var price = parseInt($('input[name=Allprice]').val());
			var reserve = parseInt($('input[name=reserve]').val());
			var getreserve = parseInt($('input[name=getreserve]').val());
			if( parseInt($('input[name=couponValue]').val())==0){
				chk=false;
			}
			var chk = document.getElementById('checkValue').checked;
			var beforePrice = parseInt($('input[name=Allprice]').val())-3000;
			
			
			var mymoney = parseInt($('input[name=myMoney]')
					.val());
			
			console.log(price);
			console.log(mymoney);
			console.log(reserve);
			console.log(mymoney+reserve);
			
			
		
			if(isNaN(reserve)){
				reserve=0;
			}
			

			
			const coupon =Math.ceil((price-3000)*10/100);
			
			if(chk==true){
				$('input[name=couponValue]').val("1");
				
				
				
				price=(price-3000)*9/10;
				
				
				
				
				
				
				const Priceform = beforePrice.toString().replace(
						/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				const reserveform = reserve.toString().replace(
						/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				const finalprice = (price*10/9+3000-coupon - reserve).toString().replace(
						/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				const couponForm = coupon.toString().replace(
						/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				
		
				if (reserve <= price && reserve>=0 && reserve<= getreserve) {
					if (reserve <= getreserve) {

						if (reserve > 0 || price > reserve) {
							document.getElementById('total').innerText = Priceform;
							document.getElementById('delitotal').innerText = finalprice;
							document.getElementById('coupon').innerText = couponForm;
							document.getElementById('mileage').innerText = reserve.toString().replace(
									/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
						} else if (price < reserve) {
							 finalprice = (3000).toString().replace(
										/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
							document.getElementById('total').innerText = Priceform;
							document.getElementById('delitotal').innerText = finalprice;
							document.getElementById('coupon').innerText = couponForm;
							document.getElementById('mileage').innerText = (getreserve - price).toString().replace(
									/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
							$("input[name=reserve]").val(getreserve - price);
						}

					} else {
						
						alert("적립금이 부족합니다.");
						$("input[name=reserve]").val("");
					}

				} else if(reserve<0){
					alert("오류입니다");
					$("input[name=reserve]").val("");
				} 
				else if(reserve > getreserve){
					alert("현재 가진 적립금을 초과했습니다.");
					$("input[name=reserve]").val("");
				}
				
				else {
					alert("적립금이 상품 가격을 초과합니다.");
					$("input[name=reserve]").val(price);

				}
			}else{
				$('input[name=couponValue]').val("0");
				price=(price-3000);
				
				const Priceform = beforePrice.toString().replace(
						/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				const reserveform = reserve.toString().replace(
						/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				const finalprice = (price+3000 - reserve).toString().replace(
						/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				if (reserve <= price&&reserve>=0 &&reserve<= getreserve) {
					if (reserve <= getreserve ) {

						if (reserve > 0 || price > reserve) {
							document.getElementById('total').innerText = Priceform;
							document.getElementById('delitotal').innerText = finalprice;
							document.getElementById('coupon').innerText = "0";
							document.getElementById('mileage').innerText = reserve.toString().replace(
									/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
						} else if (price < reserve) {
							 finalprice = (3000).toString().replace(
										/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
							document.getElementById('total').innerText = Priceform;
							document.getElementById('delitotal').innerText = finalprice;
							document.getElementById('coupon').innerText = "0";
							document.getElementById('mileage').innerText = (getreserve - price).toString().replace(
									/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
							$("input[name=reserve]").val(getreserve - price);
						}

					} else {
						
						alert("적립금이 부족합니다.");
						$("input[name=reserve]").val("");
					}
					

				} else if(reserve<0){
					alert("오류입니다");
					$("input[name=reserve]").val("");
				}else if(reserve > getreserve){
					alert("현재 가진 적립금을 초과했습니다.");
					$("input[name=reserve]").val("");
				}
				else {
					alert("적립금이 상품 가격을 초과합니다.");

					$("input[name=reserve]").val(price);

				}
			}

			
		}
		function couponChk() {
			var price = parseInt($('input[name=Allprice]').val());
			var reserve = parseInt($('input[name=reserve]').val());
			var getreserve = $('input[name=getreserve]').val();
			var chk = document.getElementById('checkValue').checked;
			var beforePrice = parseInt($('input[name=Allprice]').val())-3000;
			
			console.log(getreserve);
			console.log(reserve);
			
			
			if(isNaN(reserve)){
				reserve=0;
			}
			

			const coupon =Math.ceil((price-3000)*10/100);
			
			
			if(chk==true){
				$('input[name=couponValue]').val("1");
				
				
				
				price=(price-3000)*9/10;
				
				
				
				
				
				
				const Priceform = beforePrice.toString().replace(
						/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				const reserveform = reserve.toString().replace(
						/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				const finalprice = (price*10/9+3000-coupon - reserve).toString().replace(
						/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				const couponForm = coupon.toString().replace(
						/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				
		
				if (reserve <= price && reserve>=0 &&reserve<= getreserve) {
					if (reserve <= getreserve ) {

						if (reserve > 0 || price > reserve) {
							document.getElementById('total').innerText = Priceform;
							document.getElementById('delitotal').innerText = finalprice;
							document.getElementById('coupon').innerText = couponForm;
							document.getElementById('mileage').innerText = reserve.toString().replace(
									/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
						} else if (price < reserve) {
							 finalprice = (3000).toString().replace(
										/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
							document.getElementById('total').innerText = Priceform;
							document.getElementById('delitotal').innerText = finalprice;
							document.getElementById('coupon').innerText = couponForm;
							document.getElementById('mileage').innerText = (getreserve - price).toString().replace(
									/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
							$("input[name=reserve]").val(getreserve - price);
						}

					} else {
						
						alert("적립금이 부족합니다.");
						$("input[name=reserve]").val("");
					}

				} else if(reserve > getreserve){
					alert("현재 가진 적립금을 초과했습니다.");
					$("input[name=reserve]").val("");
				} else if(reserve<0){
					alert("오류입니다");
					$("input[name=reserve]").val("");
				} 
				
				else {
					alert("적립금이 상품 가격을 초과합니다.");
					$("input[name=reserve]").val(price);

				}
			}else{
				$('input[name=couponValue]').val("0");
				price=(price-3000);
				
				const Priceform = beforePrice.toString().replace(
						/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				const reserveform = reserve.toString().replace(
						/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				const finalprice = (price+3000 - reserve).toString().replace(
						/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				if (reserve <= price&&reserve>=0 &&reserve<= getreserve) {
					if (reserve <= getreserve ) {

						if (reserve > 0 || price > reserve) {
							document.getElementById('total').innerText = Priceform;
							document.getElementById('delitotal').innerText = finalprice;
							document.getElementById('coupon').innerText = "0";
							document.getElementById('mileage').innerText = reserve.toString().replace(
									/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
						} else if (price < reserve) {
							 finalprice = (3000).toString().replace(
										/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
							document.getElementById('total').innerText = Priceform;
							document.getElementById('delitotal').innerText = finalprice;
							document.getElementById('coupon').innerText = "0";
							document.getElementById('mileage').innerText = (getreserve - price).toString().replace(
									/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
							$("input[name=reserve]").val(getreserve - price);
						}

					} else {
						
						alert("적립금이 부족합니다.");
						$("input[name=reserve]").val("");
					}

				}else if(reserve > getreserve){
					alert("현재 가진 적립금을 초과했습니다.");
					$("input[name=reserve]").val("");
				} else if(reserve<0){
					alert("오류입니다");
					$("input[name=reserve]").val("");
				}  else {
					alert("적립금이 상품 가격을 초과합니다.");
					$("input[name=reserve]").val(price);

				}
			}

		}
	</script>

	<jsp:include page="../footer.jsp" />

</body>

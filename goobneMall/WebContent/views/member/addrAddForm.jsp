<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/goobneMall/css/mypage.css" rel="stylesheet">
<link href="/goobneMall/css/addr.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/goobneMall/js/addrAddFunction.js?v=<%=System.currentTimeMillis() %>"></script>
<style>
.addr_table td.info {
	width: 100px;
}

.addr_table td.addr_input_content {
	text-align: left;
}

.addr_input_content input.form-control {
	padding-left: 10px;
}
</style>
<%
String id = (String) session.getAttribute("log");
if (id == null) {
%>
<script>
	alert("로그인 이후 이용가능합니다.")
	location.href = "/goobneMall/service?command=memberLoginForm";
</script>
<%
}
%>

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


	<div id="my_address">
		<h3 style="margin-bottom: 15px;">배송지 등록</h3>
		
		<hr style="margin-top: 47px; margin-bottom: -10px;">

		<div>
			<div class="modal-body">
			<div style="display: flex; align-items:center; height:30px;  justify-content: space-between;">
				<span style="display:inline-block;  font-size: 12px">상품주문시 입력하는 배송지 정보를 사전에 등록하면 보다 간편하게
					주문서를 작성할 수 있습니다.</span>
				<div>
					<img src="/goobneMall/img/join_img/joinChkImg.png">
					<span style="margin-left: 5px; color: #999; vertical-align:middle;  font-size: 12px; font-weight: 1000;">항목은 필수입력 값입니다</span>
				</div>
			</div>

				<form action="/goobneMall/service" id="addrAddForm">
					<input type="hidden" name="command" value="addrAddAction">
					<table class="addr_table">
						<tr>
							<td class="info">
								<div style="display: flex; text-align:left; align-items: center;">
									<img src="/goobneMall/img/join_img/joinChkImg.png" style="width: 7px; height: 7px">
									<span style="margin-left: 10px;">배송지명</span>
								</div>
							</td>
							<td class="addr_input_content">
							<input type="text" id="addrname" name="addrname" class="form-control"
								style="width: 45%;" maxlength="20" placeholder="배송지명"></td>
						</tr>
						<tr>
							<td class="info">
								<div style="display: flex; text-align:left; align-items: center;">
									<img src="/goobneMall/img/join_img/joinChkImg.png" style="width: 7px; height: 7px">
									<span style="margin-left: 10px;">이름</span>
								</div>
							</td>
							<td class="addr_input_content"><input type="text"
								style="width: 25%;" id="name" name="addrInput_name" maxlength="20"
								class="form-control" placeholder="이름"></td>
						</tr>
						<tr>
							<td class="info">
								<div style="display: flex; text-align:left; align-items: center;">
									<img src="/goobneMall/img/join_img/joinChkImg.png" style="width: 7px; height: 7px">
									<span style="margin-left: 10px;">주소</span>
								</div>
							</td>
							<td class="addr_input_content">
								<div
									style="text-align: left; width: 100%; margin-bottom: 15px; vertical-align: middle;">
									<input type="text" class="form-control"style="display: inline-block; width: 30%; margin-right: 15px;"
										id="sample6_postcode" name="input_addrNum" placeholder="우편번호"> 
									<input type="button" class="addr_add_btn"
										style="position: relative; top: -2px; height: 29px; padding-top: 0;"
										onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
								</div>
								<div
									style="text-align: left; width: 100%; vertical-align: middle;">
									<input type="text" class="form-control"
										style="width: 60%; margin-bottom: 15px;" id="sample6_address"
										placeholder="주소" name="input_nomalAddr">
									<input type="text"
										class="form-control" style="width: 60%; margin-right: 10px;"
										id="sample6_detailAddress" name="input_detailAddr" placeholder="상세주소"> 
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
							<td class="info">
								<div style="display: flex; text-align:left; align-items: center;">
									<img src="/goobneMall/img/join_img/joinChkImg.png" style="width: 7px; height: 7px">
									<span style="margin-left: 10px;">휴대번호</span>
								</div>
							</td>
							<td style="text-align: left;"><select id="addrAddSelPhone"
								name="addrAdd_PhoneFst"
								style="width: 7%; height: 28px; padding: 4px 0; border: 1px solid #ccc;">
									<option value="010" selected>010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
									<option value="070">070</option>
							</select> <span>-</span> <input type="text" id="phone"
								name="addrAdd_PhoneScd" class="form-control" style="width: 15%"
								maxlength="4"> <span>-</span> <input type="text"
								id="phone" name="addrAdd_PhoneTrd" class="form-control"
								style="width: 15%" maxlength="4"></td>
						</tr>
						<tr>
							<td class="info">
								<div style="display: flex; text-align:left; align-items: center;">
									<span style="margin-left: 17px;">전화번호</span>
								</div>
							</td>
							<td style="text-align: left;">
							<select id="addrAddHPhone"
								name="addrAdd_HPhoneFst"
								style="width: 15%; height: 28px; padding: 4px 0; border: 1px solid #ccc;">
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
							</select> 
							<span>-</span> 
							<input type="text" id="phone"
								name="addrAdd_HPhoneScd" class="form-control" style="width: 15%"
								maxlength="4"> 
								<span>-</span> 
							<input type="text"
								id="phone" name="addrAdd_HPhoneTrd" class="form-control"
								style="width: 15%" maxlength="4">
						</tr>
					</table>
				</form>
			</div>
			<div class="modal_footer" style="margin-top: 15px;">
				<div class="modal-footer-btn">
					<button type="button" class="btn" data-dismiss="modal"
						style="color: white;"
						onclick="location.href='/goobneMall/service?command=addr'">취소</button>
					<button type="button" id="modalSubmit" class="btn"
						data-dismiss="modal" style="color: white;" onclick="addrAddformChk()">확인</button>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp" />

<script type="text/javascript">

</script>
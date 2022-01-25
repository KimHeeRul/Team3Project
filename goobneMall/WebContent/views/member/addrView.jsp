<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/goobneMall/css/mypage.css" rel="stylesheet">
<link href="/goobneMall/css/addr.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="/goobneMall/js/addrAddFunction.js?v=<%=System.currentTimeMillis() %>"></script>
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
	<!-- path -->
	<ul class="path">
		<li><a href="/">홈</a></li>
		<li class="current"><a>마이페이지</a></li>
	</ul>
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
		<h3 style="margin-bottom: 15px;">배송지 상세 정보</h3>
		<hr style="margin-top: 47px; margin-bottom: -10px;">
		<div>
			<div class="modal-body">
				<div
					style="display: flex; align-items: center; height: 30px; justify-content: space-between;">
					<span style="display: inline-block; font-size: 12px">상품주문시
						입력하는 배송지 정보를 사전에 등록하면 보다 간편하게 주문서를 작성할 수 있습니다.</span>
				</div>

				<input type="hidden" name="command" value="addrAddAction">
				<table class="addr_table">
					<tr>
						<td class="info">
							<div
								style="display: flex; text-align: left; align-items: center;">
								<span style="margin-left: 10px;">배송지명</span>
							</div>
						</td>
						<td class="addr_input_content">
						<span>
							<c:out value="${requestScope.addrViewObject.getAddrname()}"/>
						</span>
						</td>
					</tr>
					<tr>
						<td class="info">
							<div
								style="display: flex; text-align: left; align-items: center;">
								<span style="margin-left: 10px;">이름</span>
							</div>
						</td>
						<td class="addr_input_content">
						<span>
							<c:out value="${requestScope.addrViewObject.getName()}"/>
						</span>
						</td>
					</tr>
					<tr>
						<td class="info">
							<div
								style="display: flex; text-align: left; align-items: center;">
								<span style="margin-left: 10px;">주소</span>
							</div>
						</td>
						<td class="addr_input_content">
							<div
								style="text-align: left; width: 100%; margin-bottom: 15px; vertical-align: middle;">
								<span>
									우편번호 : <c:out value="${requestScope.addrViewObject.getAddrNum()}"/>
								</span>
							</div>
							<div
								style="text-align: left; width: 100%; vertical-align: middle;">
							<div style="margin-bottom: 15px;">
									<span>
									주소 : <c:out value="${requestScope.addrViewObject.getAddr()}"/>
								</span>
							</div>
									<span style="margin-bottom: 10px;">
									상세 주소 : <c:out value="${requestScope.addrViewObject.getDetailAddr()}"/>
								</span>
								<!-- <input
										type="text" class="form-control" style="width: 30%;"
										id="sample6_extraAddress" placeholder="참고항목"> -->
							</div>
						</td>
					</tr>
					<tr>
						<td class="info">
							<div
								style="display: flex; text-align: left; align-items: center;">
								<span style="margin-left: 10px;">휴대번호</span>
							</div>
						</td>
						<td style="text-align: left;">
							<span>
									<c:out value="${requestScope.addrViewObject.getPhone()}"/>
							</span>
						</td>
					</tr>
					<tr>
						<td class="info">
							<div
								style="display: flex; text-align: left; align-items: center;">
								<span style="margin-left: 10px;">전화번호</span>
							</div>
						</td>
						<td style="text-align: left;">
						<span>
								<c:out value="${requestScope.addrViewObject.getHphone()}"/>
						</span>
						</td>
					</tr>
				</table>
			</div>
			<div class="modal_footer" style="margin-top: 15px;">
				<div class="modal-footer-btn">
					<button type="button" id="modalSubmit" class="btn"
						data-dismiss="modal" style="color: white;"
						onclick="location.href='/goobneMall/service?command=addr'">목록으로</button>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp" />

<script type="text/javascript">

</script>
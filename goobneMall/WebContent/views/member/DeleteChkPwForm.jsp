<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/goobneMall/css/mypage.css" rel="stylesheet">
<link href="/goobneMall/css/addr.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
		<h3 style="margin-bottom: 15px;">회원탈퇴</h3>
		
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

				<form id="addrAddForm" class="DeleteChkPwForm" onsubmit="return false;">
					<table class="addr_table">
						<tr>
							<td class="info">
								<div style="display: flex; text-align:left; align-items: center;">
									<span style="margin-left: 10px;">아이디</span>
								</div>
							</td>
							<td class="addr_input_content">
								<div style="display: inline-block; line-height : 100%; vertical-align: middle;">
								<span style="line-height : 28px;">
									<c:out value="${requestScope.DeleteChkObject.getId()}"/>
								</span>
								</div>
							</td>
						</tr>
						<tr>
							<td class="info">
								<div style="display: flex; text-align:left; align-items: center;">
									<img alt="" src="/goobneMall/img/join_img/joinChkImg.png">
									<span style="margin-left: 10px;">비밀번호</span>
								</div>
							</td>
							<td class="addr_input_content">
							<input type="password"
								style="width: 25%;" id="name" name="deleteInput_pwd" maxlength="20"
								class="form-control" placeholder="비밀번호" onkeydown="">
								<span style="color: #999999; margin-left: 10px;">
									회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.
								</span>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="modal_footer" style="margin-top: 15px;">
				<div class="modal-footer-btn">
					<button type="button" class="btn" data-dismiss="modal"
						style="color: white;"
						onclick="location.href='/goobneMall/service?command=mypage'">취소</button>
					<button type="button" id="modalSubmit" class="btn"
						data-dismiss="modal" style="color: white;" onclick="DeletePwChk()">탈퇴</button>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp" />

<script type="text/javascript">
	function DeletePwChk() {
		const rightPwd = '<c:out value="${requestScope.DeleteChkObject.getPwd()}"/>';
		const delChk = <c:out value="${requestScope.DeleteChk}"/>;
		const pwd = $("input[name=deleteInput_pwd]").val();
		console.log(delChk);
		if(rightPwd === pwd){
			if(delChk){
				alert("회원 탈퇴가 완료 되었습니다.");			
				 location.href='/goobneMall/service?command=DeleteMember';
			}
			else {
				alert("배송중인 상품이 남아 있어, 탈퇴할 수 없습니다.");			
				location.href='/goobneMall/service?command=mypage';
			}
		}
		else {
			alert("비밀번호를 확인해주세요");
		}
	}
	
	$(".DeleteChkPwForm").keypress(function (e) {
        if (e.keyCode === 13) {
        	DeletePwChk();
        }
    });
</script>
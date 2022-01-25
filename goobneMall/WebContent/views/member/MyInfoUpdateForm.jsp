<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/goobneMall/css/addr.css" rel="stylesheet">
<link href="/goobneMall/css/MyInfo.css" rel="stylesheet">
<link href="/goobneMall/css/mypage.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
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
		<h3 style="margin-bottom: 15px;">개인정보확인/수정</h3>
		<hr style="margin-top: 47px; margin-bottom: -10px;">
		<div>
			<div class="modal-body">
				<div style="display: flex; align-items: center; height: 30px;">
					<div style="text-align: right; width: 100%">
						<img src="/goobneMall/img/join_img/joinChkImg.png"> <span
							style="margin-left: 5px; color: #999; vertical-align: middle; font-size: 12px; font-weight: 1000;">항목은
							필수입력 값입니다</span>
					</div>
				</div>

				<form action="/goobneMall/service" method="post" class="myInfoForm">
					<!-- form 안에서 button 태그를 type 없이 사용하면 submit 된다. -->
					<input type="hidden" name="command" value="MyInfoUpdate">
					<table class="addr_table">
						<tr>
							<th><span style="margin-left: 22px;">아이디</span></th>
							<td id="MyInfoUpTdLeft"><span style="margin-left: 15px;">
									<c:out value="${requestScope.MyInfoUpdateObject.getId()}" />
							</span></td>
						</tr>
						<tr>
							<th><img alt=""
								src="/goobneMall/img/join_img/joinChkImg.png"> 
								<span>현재 비밀번호</span></th>
							<td id="MyInfoUpTdLeft">
								<input class="MyInfoNowPwChkBox" type="checkbox" style="display: none"> 
								<div style=" display: flex; line-height: 28px">
								<input class="MyInfoInput" name="MyInfoUp_pw1" type="password" maxlength="15"> 
								<span class="MyInfoUpNoteRed" style="display: none; vertical-align: middle;">비밀번호가 일치하지 않습니다.</span>
								</div>
							</td>
						</tr>

						<tr>
							<th>
								<img alt="" src="/goobneMall/img/join_img/joinChkImg.png"> <span>새 비밀번호</span>
							</th>
							<td id="MyInfoUpTdLeft">
								<input class="MyInfoInput" name="MyInfoUp_pw2" type="password" maxlength="15"> 
								<span class="MyInfoUpNote">영문, 숫자, 특수문자 혼용하여 6~15자리 사용 가능합니다.</span>
							</td>
						</tr>

						<tr>
							<th><img alt=""
								src="/goobneMall/img/join_img/joinChkImg.png"> <span>새
									비밀번호 확인</span></th>
							<td id="MyInfoUpTdLeft">
								<input class="MyInfoInput" name="MyInfoUp_pw3" type="password" maxlength="15">
								<input class="MyInfoNewPwChkBox" type="checkbox" style="display: none">
							</td>
						</tr>
						<tr>
							<th><span style="margin-left: 22px;">이름</span></th>
							<td id="MyInfoUpTdLeft"><span style="margin-left: 15px;">
									<c:out value="${requestScope.MyInfoUpdateObject.getName()}" />
							</span></td>
						</tr>

						<tr>
							<th><span style="margin-left: 22px;">성별</span></th>
							<td id="MyInfoUpTdLeft"><span style="margin-left: 15px;">
									<c:out value="${requestScope.MyInfoUpdateObject.getGender()}"></c:out>
							</span></td>
						</tr>

						<tr>
							<th>
								<img alt="" src="/goobneMall/img/join_img/joinChkImg.png"> <span>이메일</span>
							</th>
							<td id="MyInfoUpTdLeft">
								<input class="MyInfoInput" name="MyInfoInput_frsEmail" type="text" maxlength="40" onchange="emailChkReset()" onchange="emailChkReset()">
									<span>@</span> 
								<input class="MyInfoInput" name="MyInfoInput_scdEmail" type="text" maxlength="40" onchange="emailChkReset()" onchange="emailChkReset()">
								<select name="MyInfo_sel_email" onchange="selEmailChange()">
									<option value="직접입력" selected>직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="paran.com">paran.com</option>
									<option value="empal.com">empal.com</option>
									<option value="nate.com">nate.com</option>
									<option value="yahoo.co.kr">yahoo.co.kr</option>
									<option value="dreamwiz.com">dreamwiz.com</option>
									<option value="freechal.com">freechal.com</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="hanafos.com">hanafos.com</option>
									<option value="korea.com">korea.com</option>
									<option value="chollian.com">chollian.com</option>
								</select>
								<input class="MyInfoEmailChkBox" type="checkbox" style="display: none" checked>
								<button class="MyInfoEmailBtn" type="button" onclick="MyInfoEmailChk()" >중복확인</button>
							</td>
						</tr>

						<tr class="MyInfoDoubleTr">
							<th>
								<input class="MyInfoPhoneChkBox" type="checkbox" style="display: none" checked>
								<img alt="" src="/goobneMall/img/join_img/joinChkImg.png">
								<span>휴대폰번호</span>
							</th>
							<td>
								<div id="joinDoubleDiv1" style="margin-bottom: 0;">
									<input class="MyInfoPhoneChkBox" type="checkbox" style="display: none" checked>
									<select id="joinSelPhone" name="MyInfoInput_PhoneFst" style="margin-left: 15px;" onchange="selPhoneChkReset()">
										<option value="010" selected>010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
										<option value="070">070</option>
									</select> 
									<span>-</span> 
									<input class="joinInputNum" name="MyInfoInput_PhoneScd" type="text" maxlength="4" onchange="selPhoneChkReset()">
									<span>-</span>
									<input class="joinInputNum" name="MyInfoInput_PhoneTrd" type="text" maxlength="4" onchange="selPhoneChkReset()">
									<input name="MyInfoInput_HiddenPN" type="hidden" value="">
									
									<button type="button" onclick="createRNum()">인증번호 받기</button>
								</div>
								<div class="MyInfoHiddenDIV" style="display: none; margin-left: 15px; margin-top: 15px;">
									<input class="joinInputNum" name="MyInfoInput_PNChk" type="text"  maxlength="4">
									<button type="button" onclick="phoneRNChk()">인증번호 확인</button>
								</div>
							</td>
						</tr>
					</table>
					<div class="modal_footer"
						style="margin-top: 30px; margin-bottom: 30px;">
						<div class="modal-footer-btn">
							<button type="button" class="btn" data-dismiss="modal"
								style="color: white;"
								onclick="location.href='/goobneMall/service?command=mypage'">취소</button>
							<button type="button" id="modalSubmit" class="btn"
								data-dismiss="modal" style="color: white;" onclick="MyInfoUpdatePassChk()">확인</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp" />


<script type="text/javascript">
	const tempEmails = '<c:out value="${requestScope.MyInfoUpdateEmailsObject}"/>';
	const subStrEmails = tempEmails.substr(1,tempEmails.length - 2);
	const emails = subStrEmails.split(", ");

	const originEmail = '<c:out value="${requestScope.MyInfoUpdateObject.getEmail()}"/>';
	const originEmailSplit = originEmail.split('@');
	const originEmailFst = originEmailSplit[0];
	const originEmailScd = originEmailSplit[1];

	const originPhone = '<c:out value="${requestScope.MyInfoUpdateObject.getPhone()}"/>';
	const originPhoneSplit = originPhone.split('-');
	const originPhoneFst = originPhoneSplit[0];
	const originPhoneScd = originPhoneSplit[1];
	const originPhoneTrd = originPhoneSplit[2];

	function init() {
	
	// 이메일 넣기
	$("input[name=MyInfoInput_frsEmail]").val(originEmailFst);
	$("input[name=MyInfoInput_scdEmail]").val(originEmailScd);
	$("input[name=joinInput_scdEmail]").val();
	console.log(originEmailFst);
	console.log(originEmailScd);
	
	// 핸드폰 번호 넣기
	$("select[name=MyInfoInput_PhoneFst]").val(originPhoneFst).prop("selected", true);
	$("input[name=MyInfoInput_PhoneScd]").val(originPhoneScd);
	$("input[name=MyInfoInput_PhoneTrd]").val(originPhoneTrd);

	console.log(originPhoneFst);
	console.log(originPhoneScd);
	console.log(originPhoneTrd);
}

init();





function emailOLChk() {
	const emailFrs = $("input[name=MyInfoInput_frsEmail]").val();
	const emailScd = $("input[name=MyInfoInput_scdEmail]").val();
	const email = emailFrs +"@"+emailScd;	

	if(emails.includes(email)){ // 이메일이 중복일 때
		alert(email+"는 이미 사용중인 Email입니다.");
	}
	else { // 이메일이 중복이 아닐 때
		alert(email+"는 사용가능한 Email입니다.");
		$('input[name=joinChkEmail]').prop('checked',true);
	}
}

// 현재 비밀번호 체크
function nowPwChk() {
	// 값 초기화
	$(".MyInfoNowPwChkBox").prop('checked',false);
	$(".MyInfoUpNoteRed").css("display",'none');
	
	const pw = '<c:out value="${requestScope.MyInfoUpdateObject.getPwd()}"/>';
	const inputPw = $("input[name=MyInfoUp_pw1]").val();
								
	if(pw === inputPw){ // 비밀번호 맞게 입력 했을 때
		$(".MyInfoNowPwChkBox").prop('checked',true);
		return true;
	}
	else {
		$(".MyInfoUpNoteRed").css("display",'block');
		$("input[name=MyInfoUp_pw1]").focus();
		return false;
	}
}


// 새 비밀번호 체크
function newPwChk() {
	// 값 초기화
	$(".MyInfoNewPwChkBox").prop('checked',false);
	
	const pw = '<c:out value="${requestScope.MyInfoUpdateObject.getPwd()}"/>';
	const inputPw2 = $("input[name=MyInfoUp_pw2]").val();
	const inputPw3 = $("input[name=MyInfoUp_pw3]").val();
	const pwReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,15}$/;
	
	console.log("새 비밀번호 레지 테스트" + pwReg.test(inputPw2));
	console.log("새 비밀번호 확인 레지 테스트" + pwReg.test(inputPw3));
	
	if(pw != inputPw2 && inputPw2 === inputPw3 && pwReg.test(inputPw2) && pwReg.test(inputPw3)){ // 1. 현재 비밀번호와 달라야함, 2) 재확인과 같아야함 3)비밀번호 정규식에 맞게 입력
		$(".MyInfoNewPwChkBox").prop('checked',true);
		return true;
	}
	
	if(inputPw2 === ""){ // 비밀번호가 입력 안됐을 때
		alert("비밀번호를 입력해 주세요");
		$("input[name=MyInfoUp_pw2]").focus();
	}
	else if(!pwReg.test(inputPw2)){ // 비번 형식 틀렸을 때
		alert("비밀번호는 영문, 숫자, 특수문자 혼용하여 6~15자리 사용 가능합니다.");
		$("input[name=MyInfoUp_pw2]").focus();
	}
	else if(inputPw2 === pw){ // 입력한 비밀번호가 현재 비밀번호와 같을 때
		alert("사용중인 비밀번호와 다른 비밀번호를 입력해주세요.");
		$("input[name=MyInfoUp_pw2]").focus();
	}
	else if(inputPw3 === ""){ // 비밀번호가 입력돼고 재확인 비밀번호가 입력 안됐을 때
		alert("비밀번호를 입력해 주세요");
		$("input[name=MyInfoUp_pw3]").focus();
	}
	else if(!pwReg.test(inputPw3)){ // 비번, 재비번 다 입력, 비번 형식 맞고 재비번 형식 틀렸을 때
		alert("비밀번호는 영문, 숫자, 특수문자 혼용하여 6~15자리 사용 가능합니다.");
		$("input[name=MyInfoUp_pw3]").focus();
	}
	else if (inputPw2 != inputPw3){
		alert("재확인 비밀번호를 확인하세요.");
		$("input[name=MyInfoUp_pw3]").focus();
	}
	return false;
}

function emailChkReset() {
	const myInfoEmailPassChk = $('.MyInfoEmailChkBox').prop('checked',false);
}

function selEmailChange() {
	emailChkReset();
	const select = $("select[name=MyInfo_sel_email]").val();
	if(select === "직접입력"){
		// 이메일 뒷 부분 초기화
		$("input[name=MyInfoInput_scdEmail]").val("");
		$("input[name=MyInfoInput_scdEmail]").focus();
        // readonly 삭제
        $("input[name=MyInfoInput_scdEmail]").removeAttr("readonly");
	}
	else {
		// 이메일 뒷 부분 셀렉한 값으로 변경
		$("input[name=MyInfoInput_scdEmail]").val(select);
		// 텍스트 박스 readonly 처리
        $("input[name=MyInfoInput_scdEmail]").attr("readonly",true);
	}
}

function MyInfoEmailChk() {
	$('.MyInfoEmailChkBox').prop('checked',false);
	const reg = /[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	const frs = 	$("input[name=MyInfoInput_frsEmail]").val();
	const scd = $("input[name=MyInfoInput_scdEmail]").val();
	if(frs === originEmailFst && scd == originEmailScd){
		alert("현재 이메일과 동일합니다. 수정하시려면 이메일을 변경해주세요")
		$('.MyInfoEmailChkBox').prop('checked',true);
	}
	else if(frs === "") {
		alert("이메일을 입력해주세요");
		$("input[name=MyInfoInput_frsEmail]").focus();
	}
	else if(scd === ""){
		alert("이메일을 입력해주세요");
		$("input[name=MyInfoInput_scdEmail]").focus();
	}
	else if(!reg.test(scd)){
		alert("이메일 형식을 지켜주세요");
		$("input[name=MyInfoInput_scdEmail]").focus();
	}
	else {
		alert("사용 가능한 이메일 입니다.")
		$('.MyInfoEmailChkBox').prop('checked',true);
	}
}

function selPhoneChkReset() {
	$('.MyInfoPhoneChkBox').prop('checked',false);
}

function resetPhone(){
	// 폰 체크값 초기화
	$(".MyInfoPhoneChkBox").prop('checked',false);
	// 인증번호 값 초기화
	$("input[name=MyInfoInput_HiddenPN]").val("");	
}

function phoneOLChk() {
	const phone1 = $("select[name=MyInfoInput_PhoneFst]").val();
	const phone2 = $("input[name=MyInfoInput_PhoneScd]").val();
	const phone3 = $("input[name=MyInfoInput_PhoneTrd]").val();
	if(originPhoneFst=== phone1 && originPhoneScd=== phone2 && originPhoneTrd=== phone3){
		alert("현재 핸드폰 번호와 동일합니다. 번호 수정 후 인증해주세요");
		$('.MyInfoPhoneChkBox').prop('checked',true);
		return true;
	}
		return false;
}


function chkPhoneVal1(){
	resetPhone();
	const reg1 = /^(\d{3,4})$/;
	const scdN = $("input[name=MyInfoInput_PhoneScd]").val();
	if(!reg1.test(scdN)){
		$("input[name=MyInfoInput_PhoneScd]").val("");
		$("input[name=MyInfoInput_PhoneScd]").focus();
		alert("3~4자리 숫자만 입력 가능합니다.")
	}
	else {
			return true;
	}
	return false;
}
function chkPhoneVal2(){
	resetPhone();
	const reg2 = /^(\d{4,4})$/;
	const trdN = $("input[name=MyInfoInput_PhoneTrd]").val();
	if(!reg2.test(trdN)){
		$("input[name=MyInfoInput_PhoneTrd]").val("");
		$("input[name=MyInfoInput_PhoneTrd]").focus();
		alert("4자리 숫자만 입력 가능합니다.")
	}
	else {
		return true;
	}
	return false;
}

function createRNum(){
	// 현재 핸드폰 번호인지 체크
	if(!phoneOLChk()){
		// 초기화
		resetPhone();
	
		if (chkPhoneVal1()) { // 중간 번호 정규식에 부합
			// 펑션 기능 때문에 분리
			if (chkPhoneVal2()) { // 마지막 번호 정규식에 부합
				const min = 1000;
				const max = 9999;
				const rN = Math.floor(Math.random() * (max - min + 1)) + min;
				$("input[name=MyInfoInput_HiddenPN]").val(rN);
				
				$(".MyInfoDoubleTr").css('height','118px');
				$(".MyInfoHiddenDIV").css('display','block');
				
				// 4자리 수 인증번호 생성
				// console.log($("input[name=MyInfoInput_HiddenPN]").val());
				alert("인증번호는 " + $("input[name=MyInfoInput_HiddenPN]").val() + "입니다.");
			}
		}
	}
}

function phoneRNChk(){
	// 폰체크 초기화 하고 시작
	$(".MyInfoPhoneChkBox").prop('checked',false);
	
	const rN = $("input[name=MyInfoInput_HiddenPN]").val();
	const chkN = $("input[name=MyInfoInput_PNChk]").val();
	
	if(rN != "" && rN === chkN){
		// 폰 체크 값 true
		console.log($("input[name=MyInfoInput_HiddenPN]").val());
		$(".MyInfoPhoneChkBox").prop('checked',true);
		alert("인증번호 확인되었습니다.");
	}
	else {
		console.log($("input[name=MyInfoInput_HiddenPN]").val());
		alert("인증번호를 다시 확인해 주세요.");
	}
		console.log($(".MyInfoPhoneChkBox").is(':checked'));
}


function MyInfoUpdatePassChk() {
	// 확인 누르면 작동 그전에는 펑션 작동 안함
	if(nowPwChk()){  // 현재 비밀번호 확인
		// 현재 비밀번호 통과 후
		if(newPwChk()){ // 새 비밀번호 확인
			const chk = $('.MyInfoEmailChkBox').is(':checked');
			if(!chk){
				alert("이메일 중복체크가 필요합니다.");
			}
			else {
				const phoneChk = $('.MyInfoPhoneChkBox').is(':checked');
				if(!phoneChk){
					alert("휴대폰 인증이 필요합니다.")
				}
			}
		}; 
	};
	
	const form = $(".myInfoForm");
	const nowPwPassChk = $('.MyInfoNowPwChkBox').is(':checked');
	const newPwPassChk = $('.MyInfoNewPwChkBox').is(':checked');
	const myInfoEmailPassChk = $('.MyInfoEmailChkBox').is(':checked');
	const myInfoPhonePassChk = $('.MyInfoPhoneChkBox').is(':checked');
	
	console.log(nowPwPassChk);
	console.log(newPwPassChk);
	console.log(myInfoEmailPassChk);
	console.log(myInfoPhonePassChk);

	if(nowPwPassChk && newPwPassChk && myInfoEmailPassChk && myInfoPhonePassChk){
		form.submit();
	}
}
</script>


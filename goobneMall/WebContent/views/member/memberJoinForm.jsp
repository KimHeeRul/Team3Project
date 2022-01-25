<%@page import="DAO.MemberDAO"%>
<%@page import="DTO.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="/goobneMall/js/memberJoinFunction.js?v=<%=System.currentTimeMillis()%>"></script>
<style type="text/css">
	@import url("/goobneMall/css/memberJoinCss.css");
</style>

</head>
<body>
	<%
	MemberDAO dao = MemberDAO.getInstance();
		ArrayList<MemberDTO> users = dao.getUsers();
		
		
		String log = (String)session.getAttribute("log");
		if(log == null){
	%>
	<!--top-->
	<jsp:include page="/views/header.jsp" />
	<!--top-->
	
	<div class="joinBody" style="margin-top: 15px;">
		<ul class ="joinNavUl">
		<li><a href="/goobneMall/index.jsp">홈</a></li>
		<li>></li>
		<li><a href="/goobneMall/service?command=memberJoinForm">회원가입</a></li>
		</ul>
		
		<div class="joinTitle">
			<h2 id="title">회원가입</h2>
			<br>
			<div style="display: flex; justify-content: space-between;">
			<strong  id="sub">기본정보입력</strong>
			<div>
			<img src="/goobneMall/img/join_img/joinChkImg.png">
			<span style="margin-left: 5px; color: #999;; font-size: 12px; font-weight: 1000;">항목은 필수입력 값입니다</span>
			</div>
			</div>
		</div>
		
		<form action="/goobneMall/service" method="post"  class="joinForm">
		<!-- form 안에서 button 태그를 type 없이 사용하면 submit 된다. -->
		<input type="hidden" name="command" value="memberJoin">
			<table>
				<tr>
					<th>
						<img alt="" src="/goobneMall/img/join_img/joinChkImg.png">
						<span>아이디</span>
					</th>
					<td id="joinTdLeft">
						<input name="joinChkId" type="checkbox" style="display: none">
						<input class="joinInput" name="joinInput_id" onchange="resetChkId()" type="text" maxlength="20">
						<button type="button" onclick="chkOverlapId()" style="margin-left: 10px;">중복확인</button>
						<span class="joinNote">4~20자의 영,숫자 혼용하여 사용 가능합니다.</span>
					</td>
				</tr>
				
				<script type="text/javascript"> 
					function chkOverlapId(){ // 중복체크 눌렀을 때 실행
						const regEngNum =/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,20}$/;
						// 대소문자, 숫자 최소 한개 포함하고 대소문자 숫자 혼용 4~20자 정규식
						let id = $("input[name=joinInput_id]").val();
						if(id === ""){ // 아이디 작성 안했을 때
								$("input[name=joinInput_id]").focus(); // 아이디 인풋으로 커서 이동
								alert("아이디를 입력해주세요.");
						}
						else{ // 아이디 작성했을 때
							// console.log("입력된 아이디는"+id);
							if(!regEngNum.test(id)){ // 아이디가 정규식과 다를 때
								$("input[name=joinInput_id]").val("");
								$("input[name=joinInput_id]").focus(); // 아이디 인풋으로 커서 이동
								alert("4~20자의 영,숫자 혼용하여 사용 가능합니다.");
							}
							else { // 아이디가 정규식에 부합할 때
								const ids =[];
								<%for(int i = 0; i < users.size(); i ++){
									String id = users.get(i).getId();
								%>
									ids.push("<%=id%>");
								<%
								}
								%>
								// console.log(ids);
								if(ids.includes(id)){ // 아이디가 중복일 때
									$("input[name=joinInput_id]").val(""); // 아이디 초기화
									$("input[name=joinInput_id]").focus(); // 아이디 인풋으로 커서 이동
									alert(id+"는 이미 사용중인 아이디 입니다.");
								}
								else { // 아이디가 중복이 아닐 때
									// 조건 만족시 display:none 되어 있는 체크박스 체크
									// console.log($("input[name=joinChkId]").is(':checked'));
									$("input[name=joinChkId]").prop('checked',true);
									alert(id+"는 사용 가능한 아이디 입니다.");
									// console.log($("input[name=joinChkId]").is(':checked'));
								}
							}
						}
					}
				</script>
				
				<tr>
					<th>
						<img alt="" src="/goobneMall/img/join_img/joinChkImg.png">
						<span>비밀번호</span>
					</th>
					<td id="joinTdLeft">
						<input class="joinInput" name="joinInput_pw1" onchange="chkPw()" type="password" maxlength="15">
						<span class="joinNote">영문, 숫자, 특수문자 혼용하여 6~15자리 사용 가능합니다.</span>
					</td>
				</tr>
				
				<tr>
					<th>
						<img alt="" src="/goobneMall/img/join_img/joinChkImg.png">
						<span>비밀번호 확인</span>
					</th>
					<td id="joinTdLeft">
						<input name="joinChkPw" type="checkbox" style="display: none">
						<input class="joinInput" name="joinInput_pw2" onchange="chkPwRe()" type="password" maxlength="15">
					</td>
				</tr>
				
				<tr>
					<th>
						<img alt="" src="/goobneMall/img/join_img/joinChkImg.png">
						<span>이름</span>
					</th>
					<td id="joinTdLeft">
						<input name="joinChkName" type="checkbox" style="display: none">
						<input class="joinInput" name="joinInput_name" onchange="chkNamePass()" type="text">
					</td>
				</tr>
				
				<tr>
					<th>
						<img alt="" src="/goobneMall/img/join_img/joinChkImg.png">
						<span>성별</span>
					</th>
					<td id="joinTdLeft">
						<span style="margin-left: 15px;"></span>
						<label style="font-weight: 400;" >
						<input type="radio" name="joinGender" id="joinG1" value="남성">
						<span>남성</span>
						</label>
						<label style="font-weight: 400;">
						<input type="radio" name="joinGender" id="joinG2" value="여성">
						<span>여성</span>
						</label>
					</td>
				</tr>
				
				<tr>
					<th>
						<img alt="" src="/goobneMall/img/join_img/joinChkImg.png">
						<span>이메일</span>
					</th>
					<td id="joinTdLeft">
						<input name="joinChkEmail" type="checkbox" style="display: none">
						<input class="joinInput" name="joinInput_frsEmail" onchange="resetChkEmail()" type="text" maxlength="40" >
						<span style="margin-left: 15px;">@</span>
						<input class="joinInput" name="joinInput_scdEmail" onchange="resetChkEmail()" type="text" maxlength="40">
						 <select name="join_sel_email" onchange="emailFn()">
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
						<button type="button" onclick="emailChk()"  style="margin-left: 10px;">중복확인</button>
					</td>
				</tr>
				
				<script type="text/javascript">
					function emailOLChk() {
						const emails =[];
						<%for(int i = 0; i < users.size(); i ++){
							String email = users.get(i).getEmail();
						%>
							emails.push("<%=email%>");
						<%
						}
						%>
						const emailFrs = $("input[name=joinInput_frsEmail]").val();
						const emailScd = $("input[name=joinInput_scdEmail]").val();
						const email = emailFrs +"@"+emailScd;
				
						if(emails.includes(email)){ // 이메일이 중복일 때
							alert(email+"는 이미 사용중인 Email입니다.");
						}
						else { // 이메일이 중복이 아닐 때
							alert(email+"는 사용가능한 Email입니다.");
							$('input[name=joinChkEmail]').prop('checked',true);
						}
					}
				</script>	
				
				<tr id ="joinTrDouble">
					<th id ="joinThDouble">
						<input name="joinChkPhone" type="checkbox" style="display: none">
						<img alt="" src="/goobneMall/img/join_img/joinChkImg.png">
						<span>휴대폰번호</span>
					</th>
					<td id="joinTdLeftDouble">
						<div id = "joinDoubleDiv1">
						<select id = "joinSelPhone" name="joinInput_PhoneFst" onchange="resetPhone()" style="margin-left: 15px">
							<option value="010" selected>010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
							<option value="070">070</option>
					</select>
						<span>-</span>
						<input class="joinInputNum" name="joinInput_PhoneScd" type="text" maxlength="4"  onchange="chkPhoneVal1()">
						<span>-</span>
						<input class="joinInputNum" name="joinInput_PhoneTrd" type="text"  maxlength="4"  onchange="chkPhoneVal2()">
						<input name="joinHiddenPN" type="hidden" value="">
						<button type="button" onclick="createRNum()"  style="margin-left: 10px;" >인증번호 받기</button>
						<span class="joinNoteRed">정확한 연락처가 아닐경우 주문, 결제, 배송 안내를 받지 못할 수 있습니다.</span>
						</div>
						<div id = "joinDoubleDiv2">
						<input class="joinInput" name="joinInput_PNChk" type="text"  maxlength="4">
						<button type="button" onclick="phoneRNChk()"  style="margin-left: 10px;">인증번호 확인</button>
						</div>
					</td>
				</tr>
			</table>
			
			<div class="joinAgree">
				<div style="display: flex;">
					<input name="joinChkAgree" type="checkbox" style="display: none">
					<label>
					<input type="checkbox" id="AgreeChk" class="joinAgree_all" onclick="checkAll()">
					<span style="display: inline-block; vertical-align: 7px; margin-left:5px; font-size:17px; font-weight: 600;">이용약관 전체동의</span>
					</label>
				</div>
				<div class="joinAgreeBox">
					<div class="joinAgreeLine">
						<label style="padding-bottom: 5px;">
						<input type="checkbox" id="AgreeChk" name="required">
						<span id ="AgreeChkLarge" style="display: inline-block; vertical-align: 2px;">그린몰 서비스 이용약관</span>
						<span id ="AgreeChkSmall" style="display: inline-block; vertical-align: 2px;">(필수)</span>
						</label>
						<button type="button" class="joinAgreeBox_btn">내용보기</button>
					</div>
					<div style="clear: both;"></div>
					<div class="joinAgreeLine">
						<label style="padding-bottom: 5px;">
						<input type="checkbox" id="AgreeChk" name="required">
						<span id ="AgreeChkLarge" style="display: inline-block; vertical-align: 2px;">개인정보 수집 이용안내</span>
						<span  id ="AgreeChkSmall" style="display: inline-block; vertical-align: 2px;">(필수)</span>
						</label>
						<button type="button" class="joinAgreeBox_btn">내용보기</button>
					</div>
					<div style="clear: both;"></div>
					<div class="joinAgreeLine">
						<label style="padding-bottom: 5px;">
						<input type="checkbox" id="AgreeChk" name="option">
						<span id ="AgreeChkLarge" style="display: inline-block; vertical-align: 2px;">아케팅 수신동의</span>
						<span  id ="AgreeChkSmall" style="display: inline-block; vertical-align: 2px;">(선택)</span><br>
						</label>
					</div>
					<div style="clear: both;"></div>
				</div>
			</div>
			
			<div class="JoinBottom">
				<input class="join_bottom_btn" id="join_cancel" type="button" onclick="location.href='/goobneMall/index.jsp'" value="취소">
				<input class="join_bottom_btn" id="join_agree"  type="button" onclick="joinSubmit()" value="회원가입">
			</div>
		</form>
	</div>

	<!--bottom-->
	<jsp:include page="/views/footer.jsp" />
	<!--bottom-->

	<%
		}
		else {
			response.sendRedirect("/goobneMall/index.jsp");
		}
	%>
</body>
</html>
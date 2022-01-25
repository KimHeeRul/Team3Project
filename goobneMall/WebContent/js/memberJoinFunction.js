function joinSubmit(){
	const form = $("form");
	const idChk = $("input[name=joinChkId]").is(':checked');
	const pwChk = $("input[name=joinChkPw]").is(':checked');
	const nameChk = $("input[name=joinChkName]").is(':checked');
	const genderChk = $('input:radio[name=joinGender]').is(':checked');
	// gender는 radio 라서 둘 중 하나만 체크 되면 통과 따라서 따로 function 필요 없음
	const emailChk = $('input[name=joinChkEmail]').is(':checked');
	const phoneChk = $('input[name=joinChkPhone]').is(':checked');
	checkAgree();
	const agreeChk = $('input[name=joinChkAgree]').is(':checked');
	
	console.log("======================");
	console.log("idChk : " + idChk);
	console.log("pwChk : " + pwChk);
	console.log("nameChk : " + nameChk);
	console.log("genderChk : " + genderChk);
	console.log("emailChk : " + emailChk);
	console.log("phoneChk : " + phoneChk);
	console.log("agreeChk : " + agreeChk);
	console.log("======================");
	
	if(idChk && pwChk && nameChk && genderChk && emailChk && phoneChk && agreeChk){
		form.submit();
	}
	else {
		if(!idChk){
			$("input[name=joinInput_id]").focus();
			alert("아이디 중복확인이 필요합니다.");
		}
		else if(!pwChk){
			const pwReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,15}$/;
			const pw = $("input[name=joinInput_pw1]").val();
			const pwRe = $("input[name=joinInput_pw2]").val();
			if(pw === "" || !pwReg.test(pw)){
				$("input[name=joinInput_pw1]").focus();
			}
			else if(pw != pwRe) {
				$("input[name=joinInput_pw2]").focus();
			}
			alert("패스워드 확인이 필요합니다.");
		}
		else if(!nameChk){
			alert("이름을 입력해 주세요.");
		}
		else if(!genderChk){
			alert("성별을 입력해 주세요.");
		}
		else if(!emailChk){
			const frs = $("input[name=joinInput_frsEmail]").val();
			const scd = $("input[name=joinInput_scdEmail]").val();
			const reg2 = /[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			if(frs === ""){
				$("input[name=joinInput_frsEmail]").focus();
				alert("이메일 확인이 필요합니다.");
			}
			else{
				if(scd === ""){
					$("input[name=joinInput_scdEmail]").focus();
					alert("이메일 확인이 필요합니다.");
				}
				else if(!reg2.test(scd)){
					$("input[name=joinInput_scdEmail]").focus();
					alert("이메일 확인이 필요합니다.");
				}
				else {
					alert("이메일 중복확인이 필요합니다.");
				}
			}
		}
		else if(!phoneChk){
			const reg1 = /^(\d{3,4})$/;
			const scdN = $("input[name=joinInput_PhoneScd]").val();
			const reg2 = /^(\d{4,4})$/;
			const trdN = $("input[name=joinInput_PhoneTrd]").val();
			
			if(scdN === ""){
				$("input[name=joinInput_PhoneScd]").focus();
				alert("핸드폰 번호 확인이 필요합니다.");
			}
			else {
				if(!reg1.test(scdN)){
					$("input[name=joinInput_PhoneScd]").val("");
					$("input[name=joinInput_PhoneScd]").focus();
					alert("핸드폰 번호 확인이 필요합니다.");
				}
				else {
					if(trdN === ""){
						$("input[name=joinInput_PhoneTrd]").focus();
						alert("핸드폰 번호 확인이 필요합니다.");
					}
					else {
						if(!reg2.test(trdN)){
							$("input[name=joinInput_PhoneTrd]").val("");
							$("input[name=joinInput_PhoneTrd]").focus();
							alert("핸드폰 번호 확인이 필요합니다.");
						}
						else {
							alert("핸드폰 인증이 필요합니다. 인증번호 확인해주세요");
						}
					}
				}
			}
		}
		else if(!agreeChk){
			alert("필수 동의 사항 체크가 필요합니다.");
		}
	}
}

function resetChkId(){ // id 내용 변경시 중복체크 확인 값 초기화
	// console.log($("input[name=joinChkId]").is(':checked'));
	$("input[name=joinChkId]").prop('checked',false);
	// console.log($("input[name=joinChkId]").is(':checked'));
}

function resetChkPw(){
	// 비밀번호 통과 체크 변수 초기화
	// console.log($("input[name=joinChkPw]").is(':checked'));
	$("input[name=joinChkPw]").prop('checked',false); // 비밀번호 통과 체크 초기화
	//	console.log($("input[name=joinChkPw]").is(':checked'));
}

function chkPw(){ // 비밀번호 체크, 비밀번호값 바뀔때 마다 실행
	 resetChkPw(); // 비밀번호 통과 체크 초기화
	//	console.log($("input[name=joinChkPw]").is(':checked'));
	const pwReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,15}$/;
	const pw = $("input[name=joinInput_pw1]").val();
	if(pw === ""){ // 비밀번호 작성 안 했을 때
		$("input[name=joinInput_pw1]").focus(); // 비밀번호 인풋으로 커서 이동
		alert("비밀번호를 입력해주세요");
	}
	else { // 비밀번호 작성했을 때
		if(!pwReg.test(pw)){ // 비밀번호가 정규식과 다를 때
			$("input[name=joinInput_pw1]").val(""); // 비밀번호 초기화
			$("input[name=joinInput_pw1]").focus(); // 비밀번호 인풋으로 커서 이동
			alert("영문, 숫자, 특수문자 혼용하여 6~15자리 사용 가능합니다.");
		}
	}	
}
function chkPwRe(){ // 비밀번호 체크, 비밀번호값 바뀔때 마다 실행
	 resetChkPw(); // 비밀번호 통과 체크 초기화
	//	console.log($("input[name=joinChkPw]").is(':checked'));
	const pwReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,15}$/;
	const pw = $("input[name=joinInput_pw1]").val();
	const pwRe = $("input[name=joinInput_pw2]").val();
	if(pwRe === "" || pw != pwRe ){ // 비밀번호와 재확인이 다르거나 재확인입력 안했을 때,
		$("input[name=joinInput_pw2]").val("");
		$("input[name=joinInput_pw2]").focus(); // 비밀번호 인풋으로 커서 이동
		alert("비밀번호를 재확인해주세요");
	}
	else {
		chkPwPass();
	}
}

function passPw(){
	$("input[name=joinChkPw]").prop('checked',true); // 비밀번호 통과
}

function chkPwPass(){ // 비밀번호 통과 체크
 	resetChkPw(); // 비밀번호 통과 체크 초기화
	const pwReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,15}$/;
	const pw = $("input[name=joinInput_pw1]").val();
	const pwRe = $("input[name=joinInput_pw2]").val();
	
	if(pw === pwRe && pwReg.test(pw)){
		passPw();
	}
}

function chkNamePass(){
	$("input[name=joinChkName]").prop('checked',false); // 이름 통과 체크 변수 초기화
	const name = $("input[name=joinInput_name]").val();

	if(name != ""){ // 이름 입력 되었을 때만
		$("input[name=joinChkName]").prop('checked',true); // 이름 통과
	}
}

function resetChkEmail(){
	$('input[name=joinChkEmail]').prop('checked',false);
}

function emailFn(){
	const select = $("select[name=join_sel_email]").val();
	if(select === "직접입력"){
		// 이메일 뒷 부분 초기화
		$("input[name=joinInput_scdEmail]").val("");
		$("input[name=joinInput_scdEmail]").focus();
        // readonly 삭제
        $("input[name=joinInput_scdEmail]").removeAttr("readonly");
	}
	else {
		// 이메일 뒷 부분 셀렉한 값으로 변경
		$("input[name=joinInput_scdEmail]").val(select);
		// 텍스트 박스 readonly 처리
        $("input[name=joinInput_scdEmail]").attr("readonly",true);
	}
}

function emailChk(){
	// 전체 정규식
	// '^[a-zA-Z0-9+-_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$'
	const reg1 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*$/i;
	const reg2 = /[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	const emailFrs = $("input[name=joinInput_frsEmail]").val();
	const emailScd = $("input[name=joinInput_scdEmail]").val();
	
	console.log(reg2.test(emailScd));
	
	if(emailFrs != "" && emailScd != "" && reg1.test(emailFrs) && reg2.test(emailScd)){
		emailOLChk();
	}
	else{
		if(!reg2.test(emailScd)){
			alert("이메일 입력값을 확인하세요");
		}
	}
}

function resetPhone(){
	// 폰 체크값 초기화
	$("input[name=joinChkPhone]").prop('checked',false);
	// 인증번호 값 초기화
	$("input[name=joinHiddenPN]").val("");	
}

function chkPhoneVal1(){
	resetPhone();
	const reg1 = /^(\d{3,4})$/;
	const scdN = $("input[name=joinInput_PhoneScd]").val();
	if(!reg1.test(scdN)){
		$("input[name=joinInput_PhoneScd]").val("");
		$("input[name=joinInput_PhoneScd]").focus();
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
	const trdN = $("input[name=joinInput_PhoneTrd]").val();
	if(!reg2.test(trdN)){
		$("input[name=joinInput_PhoneTrd]").val("");
		$("input[name=joinInput_PhoneTrd]").focus();
		alert("4자리 숫자만 입력 가능합니다.")
	}
	else {
		return true;
	}
	return false;
}

function createRNum(){
	$("input[name=joinHiddenPN]").val("");
	// 인증번호 값 초기화
	if (chkPhoneVal1()) { // 중간 번호 정규식에 부합
		// 펑션 기능 때문에 분리
		if (chkPhoneVal2()) { // 마지막 번호 정규식에 부합
			const min = 1000;
			const max = 9999;
			const rN = Math.floor(Math.random() * (max - min + 1)) + min;
			$("input[name=joinHiddenPN]").val(rN);
			// 4자리 수 인증번호 생성
			console.log($("input[name=joinHiddenPN]").val());
			alert("인증번호는 " + $("input[name=joinHiddenPN]").val() + "입니다.");
		}
	}
}

function phoneRNChk(){
	// 폰체크 초기화 하고 시작
	$("input[name=joinChkPhone]").prop('checked',false);
	
	const rN = $("input[name=joinHiddenPN]").val();
	const chkN = $("input[name=joinInput_PNChk]").val();
	
	if(rN != "" && rN === chkN){
		// 폰 체크 값 true
			console.log($("input[name=joinHiddenPN]").val());
		$("input[name=joinChkPhone]").prop('checked',true);
		alert("인증번호 확인되었습니다.");
	}
	else {
		console.log($("input[name=joinHiddenPN]").val());
		alert("인증번호를 다시 확인해 주세요.");
	}
}


function checkAll(){
    $('input#AgreeChk').prop("checked", $('.joinAgree_all').prop("checked"));
}

function checkAgree(){
	// 체크 박스 초기화 후
	$("input[name=joinChkAgree]").prop('checked',false);
	
	const required = $("#AgreeChk[name=required]");
	let check = required.length;
	let cnt = 0;
	for(let i = 0; i<required.length; i++){
		if(required[i].checked === true){
			cnt ++;
		}
	}
	
	if(cnt === check){
		$("input[name=joinChkAgree]").prop('checked',true);
	}
}
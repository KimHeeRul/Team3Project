function addrAddformChk() {
	const form = $("#addrAddForm");

	const addrName = $("input[name=addrname]").val();
	const name = $("input[name=addrInput_name]").val();

	const addrNum = $("input[name=input_addrNum]").val();
	const addr = $("input[name=input_nomalAddr]").val();
	const detailAddr = $("input[name=input_detailAddr]").val();

	const PhoneFst = $("select[name=addrAdd_PhoneFst]").val();
	const PhoneScd = $("input[name=addrAdd_PhoneScd]").val();
	const PhoneTrd = $("input[name=addrAdd_PhoneTrd]").val();

	const HPhoneFst = $("select[name=addrAdd_HPhoneFst]").val();
	const HPhoneScd = $("input[name=addrAdd_HPhoneScd]").val();
	const HPhoneTrd = $("input[name=addrAdd_HPhoneTrd]").val();

	const reg1 = /^(\d{3,4})$/;
	const reg2 = /^(\d{4,4})$/;
	
	const reg3 = /^(\d{3}-\d{3})$/;
	const reg4 = /^(\d{5})$/;

	console.log(addrName);
	console.log(name);

	console.log(addrNum);
	console.log(addr);
	console.log(detailAddr);

	console.log(PhoneFst);
	console.log(PhoneScd);
	console.log(PhoneTrd);

	console.log(HPhoneFst);
	console.log(HPhoneScd);
	console.log(HPhoneTrd);

	if(addrName === ""){
		alert("배송지명을 입력해주세요");
		$("input[name=addrname]").focus();
	}
	else if(name === ""){
		alert("주문 수령자 이름을 입력해주세요");
		$("input[name=addrInput_name]").focus();
	}
	else if(!reg3.test(addrNum) && ! reg4.test(addrNum)){
		alert("우편 번호를 확인해주세요");
		$("input[name=input_addrNum]").focus();
	}
	else if(addr === ""){
		alert("우편 번호 찾기로 주소를 입력해주세요");
		$("input[name=input_nomalAddr]").focus();
	}
	else if(detailAddr === ""){
		alert("상세 주소를 입력해주세요");
		$("input[name=input_detailAddr]").focus();
	}
	else if(!reg1.test(PhoneScd)){
		alert(" 핸드폰 번호를 확인해주세요");
		$("input[name=addrAdd_PhoneScd]").focus();
	}
	else if(!reg2.test(PhoneTrd)){
		alert(" 핸드폰 번호를 확인해주세요");
		$("input[name=addrAdd_PhoneTrd]").focus();
	}
	else if(HPhoneFst != "선택"){ // 지역번호 입력 되었을 때
		if(!reg1.test(HPhoneScd)){
			alert(" 전화번호를 확인해주세요");
			$("input[name=addrAdd_HPhoneScd]").focus();
		}
		else if (!reg1.test(HPhoneTrd)){
			alert(" 전화번호를 확인해주세요");
			$("input[name=addrAdd_HPhoneTrd]").focus();
		}
		else {
			form.submit();
		}
	}
	else if (HPhoneFst === "선택"){ // 전화번호 선택일 때
		if(HPhoneScd != "" || HPhoneTrd != ""){
			alert("지역번호를 선택해주세요");
			$("select[name=addrAdd_HPhoneFst]").focus();
		}
		else if (HPhoneScd === "" && HPhoneTrd === ""){
			form.submit();
		}
	}
}
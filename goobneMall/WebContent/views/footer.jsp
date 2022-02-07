<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<style>

a {
	color: black;
	text-decoration:none
}
a:hover{
color: black;
	text-decoration:none
}


</style>

<body>
	<div class="footer02" style="display: flex; justify-content: center; width: 1040px; margin: 0 auto;">
		<div class="contactUs" style="margin-right: 40px;">
			<p class="txt" style="font-size: 60px; height: 30px;">1234-0000</p>

			<div class="footerMenu" style="margin-top: 50px;">
				<span style="font-size: 14px;"><strong class="footerBold">오전
						9시 30분 ~ 오후 5시 30분</strong><br>점심 오후12시~ 오후1시 / 토, 일 공휴일 휴무</span>
				

					<ul >
						<!-- <button id="menubtn" class="btn btn-light">자주하는 질문</button> -->
						

						<button style="width: 300px;" id="menubtn" class="btn btn-light" onclick="location.href='/goobneMall/service?command=noticeList&page=1'">공지사항</button>
						
					</ul>
				
			</div>
		</div>
		<div class="footerMenu2" style="font-size: 14px;">
			<ul
				style="display: flex; justify-content: space-between; list-style: none; margin-block-start: 1em; margin-left: 50px; margin-top: px; margin-block-end: 1em; margin-inline-start: 0px; margin-inline-end: 0px; padding-inline-start: 0px;">
				<li><a href="/goobneMall/service?command=noticeList&page=1">고객센터</a></li>
				<li><a href="/goobneMall/service?command=noticeList&page=1">이용안내</a></li>
				<li><a href="/goobneMall/service?command=noticeList&page=1">개인정보처리방침</a></li>
				<li><a href="/goobneMall/service?command=noticeList&page=1">이메일무단수집거부</a></li>
				<!-- <li><a href="#none" onclick="footerBusinessPopup();">사업자정보확인</a></li> -->
			</ul>
			<div class="footerInfo" style="font-size: 13px;">
                <span><b>김동현</b> 010-0000-0000 | 담당파트 : 상품주문 장바구니, 주문내역 조회 등
                            <a href="https://github.com/KimHeeRul/">GitHub</a>
                </span><br>
                <span><b>김상환</b> 010-5176-0690 | 담당파트 : 멤버 전반, 배송지 전반, 게시판 전반 등
                            <a href="https://github.com/ksw110077/">GitHub</a> 
                </span><br>
                <span><b>정윤환</b> 010-7932-3540 | 담당파트 : 적립금, 할인쿠폰, UI 디자인 등
                            <a href="">GitHub</a> 
                </span><br>
            </div>
			<div class="copyright">
				<br>Copyright ⓒ 그린몰 2022 All Right Reserved.
			</div>
		</div>
	</div>

</body>
</html>
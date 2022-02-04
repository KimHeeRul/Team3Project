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
			<p class="txt" style="font-size: 60px; height: 30px;">1688-9247</p>

			<div class="footerMenu" style="margin-top: 50px;">
				<span style="font-size: 14px;"><strong class="footerBold">오전
						9시 30분 ~ 오후 5시 30분</strong><br>점심 오후12시~ 오후1시 / 토, 일 공휴일 휴무</span>
				

					<ul >
						<button id="menubtn" class="btn btn-light">자주하는 질문</button>
						

						<button id="menubtn" class="btn btn-light" onclick="location.href='/goobneMall/service?command=noticeList&page=1'">공지사항</button>
						
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
				<li><a href="#none" onclick="footerBusinessPopup();">사업자정보확인</a></li>
			</ul>
			<div class="footerInfo" style="font-size: 13px;">
				<span style="color: #ef5033">그린몰 대표이메일 : greenmall@green.com</span>
				<br> <span>대표이사 :</span> 김그린 <span>상호 : </span>주식회사 그린몰 <span>주소
					: </span>서울특별시 강남구 강남대로 428 그린빌딩 <br> <span>사업자등록번호 :</span>
				123-45-678910 <span>통신판매업신고번호 :</span> : 제 0000-서울-0000호 <br> <span>전화
					:</span> 0000-0000 <span>팩스 :</span> 02-0000-0000 <span>개인정보보호책임자 :</span>이그린
				<span>Email :</span> greenmall@green.com
				
			</div>
			<div class="copyright">
				<br>Copyright ⓒ 그린몰 2022 All Right Reserved.
			</div>
		</div>
	</div>

</body>
</html>
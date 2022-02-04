<%@page import="java.text.DecimalFormat"%>
<%@page import="DTO.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
	<style>
/* 브라우저 마진과 패딩 리셋 */
* {
	margin: 0;
	padding: 0;
}

ol, ul {
	list-style: none;
}

/* 메인 배너 관련 스타일 시작 -----------------------------------------------------------------------------------------*/
/* INPUT 가리기 */
/* 숫자 빼고 id 적용 가능*/
.main_banner [id*="slide"] {
	display: none;
}

.main_banner .slidewrap {
	/*width:1040px;*/
	width: 1920px;
	padding-left: 0;
	margin: 0 auto;
	overflow: hidden;
	position: relative;
}

.main_banner .slidelist {
	text-align:  center;
	white-space: nowrap;
	padding-left: 0;
	font-size: 0;
}

.main_banner .slidelist>li {
	display: inline-block;
	vertical-align: middle;
	width: 100%;
	transition: all .5s;
}

.main_banner .slidelist>li>a {
	width: 1040px;
	display: block;
	position: relative;
}

/* 좌우로 넘기는 LABEL버튼에 대한 스타일 */
.main_banner .slide-control {
	position: absolute;
	top: 0;
	left: 0;
	z-index: 10;
	width: 100%;
	height: 100%;
}

.main_banner .slide-control label {
	position: absolute;
	z-index: 1;
	top: 85%;
	padding: 20px;
	cursor: pointer;
}

.main_banner .slide-control .left {
	right: 400px;
	background: url('/goobneMall/img/main_img/best_banner_arrow_left.png')
		center center/100% no-repeat;
}

.main_banner .slide-control .right {
	right: 300px;
	background:
		url('/goobneMall/img/main_img/best_banner_arrow_right.png') center
		center/100% no-repeat;
}

.main_banner .slide-control [class*="control"] {
	display: none;
}

.main_banner [id="slide01"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(0%);
}

.main_banner [id="slide02"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(-100%);
}

.main_banner [id="slide03"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(-200%);
}

.main_banner [id="slide04"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(-300%);
}

.main_banner [id="slide05"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(-400%);
}

.main_banner [id="slide06"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(-500%);
}

.main_banner [id="slide07"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(-600%);
}

/*  INPUT이 체크되면 변화값이 좌우 슬라이드 버튼을 담고 있는 div 까지 전달되는 스타일 */
.main_banner [id="slide01"]:checked ~ .slidewrap .control01 {
	display: block;
}

.main_banner [id="slide02"]:checked ~ .slidewrap .control02 {
	display: block;
}

.main_banner [id="slide03"]:checked ~ .slidewrap .control03 {
	display: block;
}

.main_banner [id="slide04"]:checked ~ .slidewrap .control04 {
	display: block;
}

.main_banner [id="slide05"]:checked ~ .slidewrap .control05 {
	display: block;
}

.main_banner [id="slide06"]:checked ~ .slidewrap .control06 {
	display: block;
}

.main_banner [id="slide07"]:checked ~ .slidewrap .control07 {
	display: block;
}
/* 메인 배너 관련  끝 -----------------------------------------------------------------------------------------*/

/* 메인 상품 관련*/
.main_product {
	text-align: center;
	width: 1040px;
	height: auto;
	margin: 0 auto;
	display: block;
}

.main_pro_li {
	float: left;
	width: 24%;
	height: auto;
	/*
	padding: 5px;
	*/
	margin: 5px;
}

.main_pro_li>a {
	display: block;
}

.main_pro_Aimg {
	margin: 0;
	width: 100%;
}

.main_pro_Aimg a img {
	width: 100%;
	border-radius: 10px;
}

/* 메인 상품 가격 info 관련 스타일*/
a {
	text-decoration: none; /* 링크 밑줄 없애기*/
}

.main_product_title {
	margin-top: 50px;
	margin-bottom: 30px; color : #272222;
	font-size: 26px;
	line-height: 1.5;
	color: #272222;
}

.itemInfo {
	height: 50px;
	font-weight: 550 ;
	font-size: 17px;
	color: #272222;
	line-height: 1.3;
	height: 100%;
	overflow: hidden;
	display: inline-block;
	letter-spacing: -0.2px; /*자간 간격*/
}


.itemInfo a:link { /*링크 걸린 a 태그*/
	color: #272222;
}

.itemInfo a:visited {  /*방문했던 a 태그*/
	color: #272222;
}

.itemInfo a:active {  /*활성중인 a 태그*/
	color: #272222;
}

.itemInfo a:hover { /* a태그에 마우스 hover 시*/
	color: #272222;
}

.itemInfo_title{
	margin-top: 15px;
	height: 45px;
}

.itemInfo_wrap {
	text-align: left;
}

.itemPrice>.discount {
	color: #ff634e;
	font-size: 16px;
}

.itemPrice>.discount>strong {
	font-size: 22px;
	font-weight: 500;
}

.itemPrice>.price {
	color: #333;
	font-size: 13px;
	line-height: 0.7;
}

.itemPrice>.price>strong {
	font-size: 22px;
	font-weight: 500;
	letter-spacing: -0.4px;
}

.itemPrice>.primecost {
	color: #999;
	font-size: 14px;
	margin-left: 2px;
	text-decoration: line-through; /* 가운데 선*/
}

.itemPrice>.primecost>strong {
	font-weight: normal;
}

.itemPrice>.single {
	background: #f6f6f6;
	border-radius: 20px; /* 곡선 */
	padding: 2px 8px; display : inline-block; /* 텍스트 속성 태그에 크기 관련 값 줄 때*/
	font-size: 14px;
	margin: 2px 0;
	color: #272222;
	display: inline-block;
}

</style>
	<!-- ------------------------------------------------------------- 스타일 나중에 합쳐야함 -->
	<div style="">
	<div class="main_banner" style="margin-left: -880px; left: 440px; position: relative;">
		<input type="radio" name="main_slide_radio" id="slide01" checked>
		<input type="radio" name="main_slide_radio" id="slide02"> <input
			type="radio" name="main_slide_radio" id="slide03"> <input
			type="radio" name="main_slide_radio" id="slide04"> <input
			type="radio" name="main_slide_radio" id="slide05"> <input
			type="radio" name="main_slide_radio" id="slide06"> <input
			type="radio" name="main_slide_radio" id="slide07">
		<div class="slidewrap">
			<ul class="slidelist">
				<li><a href=""> <img 
						src="/goobneMall/img/main_img/main_banner_0001.jpg">
				</a></li>
				<li><a href=""> <img
						src="/goobneMall/img/main_img/main_banner_0002.jpg">
				</a></li>
				<li><a href=""> <img
						src="/goobneMall/img/main_img/main_banner_0003.jpg">
				</a></li>
				<li><a href=""> <img
						src="/goobneMall/img/main_img/main_banner_0004.jpg">
				</a></li>
				<li><a href=""> <img
						src="/goobneMall/img/main_img/main_banner_0005.jpg">
				</a></li>
				<li><a href=""> <img
						src="/goobneMall/img/main_img/main_banner_0006.jpg">
				</a></li>
				<li><a href=""> <img
						src="/goobneMall/img/main_img/main_banner_0007.jpg">
				</a></li>
			</ul>
			<div class="slide-control">
				<div class="control01">
					<label for="slide07" class="left"></label> <label for="slide02"
						class="right"></label>
				</div>
				<div class="control02">
					<label for="slide01" class="left"></label> <label for="slide03"
						class="right"></label>
				</div>
				<div class="control03">
					<label for="slide02" class="left"></label> <label for="slide04"
						class="right"></label>
				</div>
				<div class="control04">
					<label for="slide03" class="left"></label> <label for="slide05"
						class="right"></label>
				</div>
				<div class="control05">
					<label for="slide04" class="left"></label> <label for="slide06"
						class="right"></label>
				</div>
				<div class="control06">
					<label for="slide05" class="left"></label> <label for="slide07"
						class="right"></label>
				</div>
				<div class="control07">
					<label for="slide06" class="left"></label> <label for="slide01"
						class="right"></label>
				</div>
			</div>
		</div>
	</div>
	
	
</div>
<%
DecimalFormat formatter = new DecimalFormat("###,###");
ProductDAO prodao = ProductDAO.getInstance();
 ArrayList<ProductDTO> 	data=prodao.getProductRank(1);
 ArrayList<ProductDTO> 	data2=prodao.getProductRank(2);
 ArrayList<ProductDTO> 	data3=prodao.getProductRank(3);
%>

	<div class="main_product">
	
	
		<div class="main_hotDeal">
			<!--  1* 4 -->
			<h2 class="main_product_title"><b>오늘의 그린몰 핫딜</b></h2> <!-- 할인율 높은거 -->
			<div class="hotDeal_Banner">
				<ul class="main_pro_ul">
				
						<%for(int i =0 ; i<4;i++) {
				%>
					
						<li class="main_pro_li">
						<div class="main_pro_Aimg">
							<a href="/goobneMall/service?command=product&no=<%=data.get(i).getPro_no()%>" title="<%=data.get(i).getTitle() %>" style="border-radius: 30px;">
								<img alt="<%=data.get(i).getTitle() %>"
								src="/goobneMall/img/productImg/<%=data.get(i).getImgfile()%>">
							</a>
						</div>
						<div class="itemInfo_wrap">
							<div class="itemInfo">
							 	<p class="itemInfo_title">
									<a href="/goobneMall/service?command=product&no=<%=data.get(i).getPro_no()%>"><%=data.get(i).getTitle() %></a>
								</p>
							</div>
								<div class="itemPrice">
								<span class="discount"><strong><%=data.get(i).getDiscount() %></strong>%</span> 
								<%String Price=formatter.format(data.get(i).getPrice());%>
								<span class="price"><strong><%=Price %></strong>원</span>
								<%String primecost=formatter.format(data.get(i).getBeforePrice());%>
								<span class="primecost"><strong><%=primecost%></strong></span><br>
								<%String single=formatter.format(data.get(i).getPrice() / Integer.parseInt(data.get(i).getPiece()));%>
								<span class="single">1팩당 <%=single%>원</span>
							</div>
						</div>
					</li>
						<%} %>				
				</ul>
			</div>
			<div style="clear: both;"></div>
		</div>
		
		
		
		<div class="main_hotDeal">
			<!--  2* 4 -->
			<h2 class="main_product_title"><b>그린몰이 처음이라면, 인기 제품만 PICK!</b></h2> <!--판매랭킹1~4 -->
			<div class="hotDeal_Banner">
				<ul class="main_pro_ul">
				
						<%for(int i =0 ; i<4;i++) {
				%>
					
						<li class="main_pro_li">
						<div class="main_pro_Aimg">
							<a href="/goobneMall/service?command=product&no=<%=data2.get(i).getPro_no()%>" title="<%=data2.get(i).getTitle() %>" style="border-radius: 30px;">
								<img alt="<%=data2.get(i).getTitle() %>"
								src="/goobneMall/img/productImg/<%=data2.get(i).getImgfile()%>">
							</a>
						</div>
						<div class="itemInfo_wrap">
							<div class="itemInfo">
							 	<p class="itemInfo_title">
									<a href="#"><%=data2.get(i).getTitle() %></a>
								</p>
							</div>
							<div class="itemPrice">
								<span class="discount"><strong><%=data2.get(i).getDiscount() %></strong>%</span> 
								<%String Price=formatter.format(data2.get(i).getPrice());%>
								<span class="price"><strong><%=Price %></strong>원</span>
								<%String primecost=formatter.format(data2.get(i).getBeforePrice());%>
								<span class="primecost"><strong><%=primecost%></strong></span><br>
								<%String single=formatter.format(data2.get(i).getPrice() / Integer.parseInt(data2.get(i).getPiece()));%>
								<span class="single">1팩당 <%=single%>원</span>
							</div>
						</div>
					</li>
						<%} %>				
					
				</ul>
			</div>
			<div style="clear: both;"></div>
		</div>


		<div class="main_hotDeal">
			<!--  3* 4 -->
			<h2 class="main_product_title"><b>신제품</b></h2>
			<div class="hotDeal_Banner">
				<ul class="main_pro_ul">
					
						<%for(int i =0 ; i<4;i++) {
				%>
					
						<li class="main_pro_li">
						<div class="main_pro_Aimg">
							<a href="/goobneMall/service?command=product&no=<%=data3.get(i).getPro_no()%>" title="<%=data3.get(i).getTitle() %>" style="border-radius: 30px;">
								<img alt="<%=data3.get(i).getTitle() %>"
								src="/goobneMall/img/productImg/<%=data3.get(i).getImgfile()%>">
							</a>
						</div>
						<div class="itemInfo_wrap">
							<div class="itemInfo">
							 	<p class="itemInfo_title">
									<a href="#"><%=data3.get(i).getTitle() %></a>
								</p>
							</div>
								<div class="itemPrice">
								<span class="discount"><strong><%=data3.get(i).getDiscount() %></strong>%</span> 
								<%String Price=formatter.format(data3.get(i).getPrice());%>
								<span class="price"><strong><%=Price %></strong>원</span>
								<%String primecost=formatter.format(data3.get(i).getBeforePrice());%>
								<span class="primecost"><strong><%=primecost%></strong></span><br>
								<%String single=formatter.format(data3.get(i).getPrice() / Integer.parseInt(data3.get(i).getPiece()));%>
								<span class="single">1팩당 <%=single%>원</span>
							</div>
						</div>
					</li>
						<%} %>				
				</ul>
			</div>
			<div style="clear: both;"></div>
		</div>
		
		
		<hr style="height: 1px">
		<div class="main_profile" style="">
			<!--  3* 4 -->
			<h2 class="main_product_title"><b>프로필</b></h2>
			<div class="hotDeal_Banner">
				<ul class="main_pro_ul">
					
						<%
						String[] name={"김동현","정윤환","김상환"};
						String[] Pnumber={"010-8987-5887","정윤환","010-5176-0690"};
						String[] email={"rlaehd97@naver.com","정윤환","ksw110077@gmail.com"};
						String[] link={"http://rlaehd97.dothome.co.kr/","#","#"};
						for(int i =0 ; i<3;i++) {
				%>
					
						<li class="main_pro_li">
						<div class="main_pro_Aimg" >
							<a href="<%=link[i]%>" title="<%=name[i]%>" style="border-radius: 30px;">
								<img alt="프로필" style="width: 250px;height: 330px; text-align: center;" 
								src="/goobneMall/img/profile/<%=i%>.jpg">
							</a>
						</div>
						<div class="Info_wrap">
							<br>
							<div class="itemInfo">
									<a href="<%=link[i]%>"><%=name[i] %></a>
							</div>
							
								<div class="info">
								<span><b>휴대전화:<%=Pnumber[i] %></b></span> <br>
								 <span><b>이메일:<%=email[i] %></b></span><br>
							</div>
						</div>
					</li>
						<%} %>				
				</ul>
			</div>
			<div style="clear: both;"></div>
		</div>
		
	
	
		
	</div>
</body>
</html>
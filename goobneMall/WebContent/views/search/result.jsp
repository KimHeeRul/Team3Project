<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.ProductDTO"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="util.DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
DecimalFormat formatter = new DecimalFormat("###,###");
String keyword = (String) request.getAttribute("keyword");
String way = (String) request.getAttribute("way");
DBManager.getConnection();
ProductDAO dao = ProductDAO.getInstance();


ArrayList<ProductDTO> datas=new ArrayList<ProductDTO>();
 if(way.equals("search")){
	 datas=dao.getSearch(keyword);
}else if(way.equals("1")){
	keyword ="닭가슴살";
	 datas=dao.getSearchCate(keyword);
}else if(way.equals("2")){
	keyword ="만두";
	 datas=dao.getSearchCate(keyword);
}else if(way.equals("3")){
	keyword ="도시락";
	 datas=dao.getSearchCate(keyword);
}else if(way.equals("4")){
	keyword ="소시지";
	 datas=dao.getSearchCate(keyword);
}else if(way.equals("5")){
	keyword ="치밥";
	 datas=dao.getSearchCate(keyword);
}
  

// ArrayList<ProductDTO> datas = dao.getProducts();
// ProductDTO data = dao.getProduct(pro_no);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>/* 메인 상품 관련*/
.result_product {
	text-align: left;
	width: 1040px;
	height: auto;
	margin: 0 auto;
	display: block;
}

.single {
	font-size: 600px;
}

.result_pro_li {
	float: left;
	width: 24%;
	height: auto;
	/*
	padding: 5px;
	*/
	margin: 5px;
}

.result_pro_li>a {
	display: block;
}

.result_pro_Aimg {
	margin: 0;
	width: 100%;
}

.result_pro_Aimg a img {
	width: 100%;
	border-radius: 10px;
}

/* 메인 상품 가격 info 관련 스타일*/
a {
	text-decoration: none; /* 링크 밑줄 없애기*/
}

.link {
	border-bottom: 1px solid #000;
	border-bottom-color: #f3e6d5;
}

.result_product_title {
	margin-top: 50px;
	margin-bottom: 30px;
	color: vb;
	font-size: 22px;
	line-height: 1.5;
	color: #272222;
}

.result_datas {
	margin-top: 50px;
	margin-bottom: 30px;
	color: #ff634e;
	font-size: 15px;
	line-height: 1.5;
	color: #ff634e;
}

.result_datass {
	margin-top: 50px;
	margin-bottom: 30px;
	font-size: 15px;
	line-height: 1.5;
}

.result_product_titled {
	color: #272222;
	font-size: 26px;
	line-height: 1.5;
	color: #272222;
	text-align: center;
}

.result_title {
	height: 42px;
}

.itemInfo {
	font-weight: 550;
	font-size: 17px;
	color: #272222;
	line-height: 1.3;
	height: 75px;
	overflow: hidden;
	display: inline-block;
	letter-spacing: -0.2px; /*자간 간격*/
}

.itemInfo a:link { /*링크 걸린 a 태그*/
	color: #272222;
}

.itemInfo a:visited { /*방문했던 a 태그*/
	color: #272222;
}

.itemInfo a:active { /*활성중인 a 태그*/
	color: #272222;
}

.itemInfo a:hover { /* a태그에 마우스 hover 시*/
	color: #272222;
}

.itemInfo_title {
	margin-top: 15px;
	height: 45px;
}

.itemInfo_wrap {
	text-align: left;
}

.result_title {
	height: 42px;
}

.itemPrice>.discount {
	color: #ff634e;
	font-size: 8px;
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
	padding: 2px 8px;
	display: inline-block; /* 텍스트 속성 태그에 크기 관련 값 줄 때*/
	font-size: 14px;
	margin: 2px 0;
	color: #272222;
	display: inline-block;
}
</style>
<body>
	<!--top-->
	<jsp:include page="../header.jsp" />
	<!--top-->

	<div class="wrap">
		<aside id="productAside"></aside>
		<div class="result_product">
			<div class="search_search result">
				<!--  1* 4 -->

				<h2 class="result_product_title"><b><%=keyword%>에 대한 검색결과</b>
				</h2>
				<%if(datas.size()!=0&&!keyword.equals("")){%>
				<div class="link">
					<h2 class="result_datass">
						<b>상품검색결과 총 </b><span class="result_datas"> <b><%=datas.size()%> 건</b>
						</span>
					</h2>
				</div>



				<%
				for (int i = 0; i < datas.size(); i++) {
					System.out.print(datas.get(i).getTitle());
				%>

				<div class="result_board" style="list-style: none;">
					<li class="result_pro_li">
						<div class="result_pro_Aimg">
							<a
								href="/goobneMall/service?command=product&no=<%=datas.get(i).getPro_no()%>"
								title="그린 작심삼일 치트킷"
								style="border-radius: 30px; padding-bottom: 20px;"> <img
								alt="그린 작심삼일 치트킷"
								src="/goobneMall/img/productImg/<%=datas.get(i).getImgfile()%>">

							</a>
						</div>
						<div class="itemInfo_wrap">
							<div class="itemInfo">
								<br>
								<div class="result_title">
									<span class="itemInfo_title"> <a class="result_title"
										href="/goobneMall/service?command=product&no=<%=datas.get(i).getPro_no()%>"><%=datas.get(i).getTitle()%></a></span>
								</div>

								<br>
							</div>
								<div class="itemPrice">
								<span class="discount"><strong><%=datas.get(i).getDiscount() %></strong>%</span> 
								<%String Price=formatter.format(datas.get(i).getPrice());%>
								<span class="price"><strong><%=Price %></strong>원</span>
								<%String primecost=formatter.format(datas.get(i).getBeforePrice());%>
								<span class="primecost"><strong><%=primecost%></strong></span><br>
								<%String single=formatter.format(datas.get(i).getPrice() / Integer.parseInt(datas.get(i).getPiece()));%>
								<span class="single">1팩당 <%=single%>원</span>
							</div>
						</div>
					</li>

				</div>
				<%
				}
				%>
				<%
				} else {
				%>
				<div align=center>
					<span class="result_product_titled" style="align: center;"><b>상품
						검색결과가 없습니다.</b></span>
				</div>
				<%
				}
				%>
				<div style="clear: both;"></div>
			</div>
		</div>


		<aside id=productAside2></aside>

		<!--bottom-->
		<jsp:include page="../footer.jsp" />
		<!--bottom-->
</body>
</html>
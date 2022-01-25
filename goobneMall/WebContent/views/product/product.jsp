<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="DTO.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="util.DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
DecimalFormat formatter = new DecimalFormat("###,###");
String pro_no = request.getParameter("no");
//String pro_no ="1";
String id = (String) session.getAttribute("log");

if (id == null) {
	id = "";
}
DBManager.getConnection();
ProductDAO dao = ProductDAO.getInstance();
//ArrayList<ProductDTO> datas = dao.getProducts();
ProductDTO data = dao.getProduct(pro_no);



%>

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/goobneMall/css/product.css"
	type="text/css">
<style>
.wrap {
	display: grid;
	height: 100%;
	justify-items: center;
}

.product_td1 {
	width: 110px;
	height: 41px;
	border-top: 1px solid #e0e0e0;
	font-size: 11px;
	font-weight: bold;
	color: #666666;
}

.product_td2 {
	width: 410px;
	height: 41px;
	border-top: 1px solid #e0e0e0;
	font-size: 13px;
	color: #666666;
}
</style>
</head>
<body>

	<!--top-->
	<jsp:include page="../header.jsp" />
	<!--top-->
	<div class="wrap">
		<main style="width: 1040px; height: 700px; margin-right: 18px"
			id="productMain">

			<aside id="productAside"></aside>
			<div style="width: 1040px;" id="container">
				<ul class="path">
					<li><a href="#none">홈 >&nbsp;</a></li>
					<li class=""><a href="#none">특별기획전 >&nbsp;</a></li>
					<li class=""><a href="#none">오늘의특가 >&nbsp;</a></li>
					<li class=""><a href="#none">오늘의특가</a></li>
				</ul>
				<div class="prdt">
					<div>
						<img width="430" height="610"
							src="/goobneMall/img/productImg/<%=data.getImgfile()%>">
					</div>

					<div style="margin: 0px; height: 544px;" id="prdtSumRight">
						<hr style="height: 2px; margin: 0; background-color: gray;">
						<span style="font-size: 2em; font-weight: bold; color: black;"><%=data.getTitle()%></span><br>

						<table style="margin-bottom: 20px;">
							<tr>
								<td class="product_td1" style="border-top: 2px solid #666;">판매가</td>
								<td class="product_td2" style="border-top: 2px solid #666;">
									<%String primecost=formatter.format(data.getBeforePrice());%>
								<span style="text-decoration: line-through; font-size: 11px; color: #999;"><%=primecost%>원</span>
									<%String Price=formatter.format(data.getPrice());%>
								<span style="padding-left: 10px; font-size: 17px;color: black;"><b><%=Price%><span
											style="font-size: 13px">원</span></b></span></td>
								<input type="hidden" name="price" value="<%=data.getPrice() %>">
											 
							</tr>
							<tr>
								<td class="product_td1">배송비</td>
								<td class="product_td2">3,000원</td>
							</tr>
							<tr>
								<td class="product_td1">제조사/원산지</td>
								<td class="product_td2">상세설명참고</td>
							</tr>
							<tr>
								<td class="product_td1">보관방법</td>
								<td class="product_td2" style="color: red"><%=data.getStorage()%></td>
							</tr>
						</table>
						<div class="OrderWrap"
							style="    border: 1px solid #d7d7d7; color: #666666; font-size: 13px; height: 343px; padding: 20px;">
							
							<form method="post" action="/goobneMall/service">
								<input type="hidden" name="command" value=""> 
								<div style="height: 25px; padding-left: 13px;" class="itemQuant">
									<input name="inven" type="hidden" value=<%=data.getInventory()%>>
									<%if(data.getInventory()>0){%>
								<span style="font-weight: bold;">수량선택</span>&nbsp;
								<input style="width: 20px; align: right; height: 30px; color: #666666; border: 1px solid #666666; background: #ffffff;"
											type="button" value="▲" onclick="qntSet('p',this);"
											id="btnPlus"> 
											
								<input type="text" style="width: 30px; height: 30px; text-align: center;"
											name="qnt" value="1" >
											<input type="text" style="display:none;">
								<input name="inven" type="hidden" value=<%=data.getInventory()%>>
							<input style="width: 20px; height: 30px; color: #666666; border: 1px solid #666666; background: #ffffff;"
											type="button" value="▼" id="btnMinus"
											onclick="qntSet('m',this);">
										
								<%System.out.print(data.getInventory()); 
								}else{%>
								<span style="font-weight: bold;">수량선택</span>&nbsp;
								<input style="width: 20px; align: right; height: 30px; color: #666666; border: 1px solid #666666; background: #ffffff;"
											type="button" value="▲" onclick="qntSet('p',this);"
											id="btnPlus" disabled="disabled"> 
								<input type="text" style="width: 30px; height: 30px; text-align: center;"
											name="qnt" value="0" >
											
								<input name="inven" type="hidden" value=<%=data.getInventory()%>>
							<input style="width: 20px; height: 30px; color: #666666; border: 1px solid #666666; background: #ffffff;"
											type="button" value="▼" id="btnMinus"
											onclick="qntSet('m',this);" disabled="disabled">
								<%} %>

								</div>
								<div
									style="margin-bottom: 10px; height: 40px; margin-top: 10px; border: 1px solid #eaeaea; padding-top: 10px; padding-left: 15px;">
									<span><%=data.getTitle()%></span>
								</div>
								<div
									style="position: relative; padding: 10px 15px; background: #efefef; height: 60px;">
									<span>배송예정일</span>
									<div style="text-align: right;">
										<script>
											function printTime() {

												var clock = document
														.getElementById("clock"); // 출력할 장소 선택

												var now = new Date(); // 현재시간

												var nowTime = (now.getMonth() + 1)
														+ "월"
														+ (now.getDate() + 1)
														+ "일";

												clock.innerHTML = nowTime; // 현재시간을 출력

												// setTimeout(“실행할함수”,시간) 시간은1초의 경우 1000

											}

											window.onload = function() { // 페이지가 로딩되면 실행

												printTime();

											}
										</script>
										<span id="clock"></span>
									</div>

								</div>
								<div style=" margin-top: 10px;   text-align: right;">
									<span style="font-size:15px;color:#333333"><b>총주문상품금액</b></span>
									<%String price=formatter.format(data.getPrice());
									if(data.getInventory()>0){
									%> 
									<span id="allPriceText" style="color: #ff4949;padding-left: 10px; font-size: 27px; font-weight: bold;"><%=price %></span>
									<span style="color: #333; font-size: 12px;">원</span>
									<%}else{%>
									<span id="allPriceText" style="color: #ff4949;padding-left: 10px; font-size: 27px; font-weight: bold;">품절</span>
									
									<%} %>
								</div>
								<div style="text-align: -webkit-center;" class="btn2">
									<input type="hidden" id="pro_no" name="prono"
										value="<%=data.getPro_no()%>"> 
									<input type="hidden" id="pro_no" name="inven"
										value="<%=data.getInventory()%>"> 
										
										<input
										type="hidden" name="img" value=<%=data.getImgfile()%>">
									<input type="hidden" id="id" name="id" style="" value="<%=id%>">
									<%if(data.getInventory()>0){%>
									<input
										style="border: 0px; margin-right: 20px; font-size: 17px;"
										type="button" id="addCartListBtn" onclick="addcart(form)"
										value="장바구니 담기    >"> <input
										style="border: 0px; padding-left: 8px; font-size: 17px;"
										type="button" id="OrderBtn" value="구매하기       >"
										onclick="order(form)">
										<%}else{%>
										<input style="border: 0px; margin-right: 20px; font-size: 17px;"
										type="button" id="addCartListBtn" onclick="addcart(form)"
										value="품절    >" disabled="disabled"> 
										<input style="border: 0px; padding-left: 8px; font-size: 17px;"
										type="button" id="OrderBtn" value="품절       >"
										onclick="order(form)" disabled="disabled">
										<% }%>
										
								</div>


								<script type="text/javascript">
									function addcart(form) {
										const id=$('input[name=id]').val();
										const qnt=$('input[name=qnt]').val();
										const prono=$('input[name=prono]').val();
										const img=$('input[name=img]').val();
										
										
										if (id == "") {
											alert("로그인을 먼저 해주세요")
											location.href = "/goobneMall/service?command=memberLoginForm";
										} else {
											$.ajax({
												url : '/goobneMall/service?command=addCart', // 전송 URL
												type : 'POST', // GET or POST 방식
												traditional : true,
												data : {
													id : id,
													qnt : qnt,
													prono : prono,
													img : img},
											// 보내고자 하는 data 변수 설정
												success : function() {
													var result = confirm("장바구니에 추가되었습니다.\n장바구니로 이동 하시겠습니까?");
													if (result) {
														location.href = '/goobneMall/service?command=cartView';
													} else {
														$('#check').val("no");
													}

												
												}
												});
											
											

											/* 	var email = $('input[name=id]').val();
												console.log(email);
												var unit_pcs= $('select[name=unit_pcs]').val();
												console.log(unit_pcs);
												
												var pro_no= $('input[name=pro_no]').val();
												var check= $('input[name=check]').val();
														
												location.href ="/goobneMall/service?command=addCart&id="+email+"&unit_pcs="+unit_pcs+
														"&pro_no="+pro_no+"&check="+check;
											 */
										/* 	$("input[name=command]").val(
													'addCart');
											form.submit();
 */
											
											
										}
									}

									function order(form) {

										var idcheck = $('input[name=id]').val();
										if (idcheck == "") {
											alert("로그인을 먼저 해주세요")
											location.href = "/goobneMall/service?command=memberLoginForm";
										} else {
											var inven = Number($("input[name=inven]").val());
											
											$("input[name=command]").val(
													'order');

											form.submit();
										}
									}
									function qntSet(type, ths) {
										var $input = $(ths).parent("div").find("input[name='qnt']");
										var tCount = Number($input.val());
										var $inven=$(ths).parent("div").find(
										"input[name='inven']");
										var tCount = Number($input.val());
										
										if (type == 'p') {
											if (tCount < Number($inven.val()))
												$input.val(Number(tCount) + 1);
											const qnt = parseInt($("input[name=qnt]").val());
											const price =parseInt($("input[name=price]").val());
												const PriceForm = (qnt*price).toString()
												.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
												
																
											 document.getElementById('allPriceText').innerText
											    =PriceForm; 
										} else {
											if (tCount > 1)
												$input.val(Number(tCount) - 1);
											const qnt = parseInt($("input[name=qnt]").val());
											const price =parseInt($("input[name=price]").val());
												const PriceForm = (qnt*price).toString()
												.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
												
																
											 document.getElementById('allPriceText').innerText
											    =PriceForm; 
										}

									}
									
									
								</script>

							</form>


						</div>

					</div>



				</div>


			</div>
			<aside id=productAside2></aside>

		</main>
	</div>
	<!--bottom-->
	<jsp:include page="../footer.jsp" />
	<!--bottom-->
	
	
	

</body>
</html>
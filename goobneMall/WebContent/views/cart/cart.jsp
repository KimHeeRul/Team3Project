<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.ProductDTO"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="DTO.CartDTO"%>
<%@page import="util.DBManager"%>
<%@page import="DAO.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
DecimalFormat formatter = new DecimalFormat("###,###");
request.setCharacterEncoding("UTF-8");
//session.setAttribute("log", "11");
String id = (String) session.getAttribute("log");
//session.invalidate(); 세션초기화
System.out.print(id);

DBManager.getConnection();
CartDAO dao = CartDAO.getInstance();

ArrayList<CartDTO> data = dao.getCart(id);//해당 아이디의 장바구니 정보

ProductDAO prodao = ProductDAO.getInstance();

int Allprcie = 0;




if (id == null) {
%>
<script>
	alert("로그인 이후 이용가능합니다.")
	location.href = "/goobneMall/service?command=memberLoginForm";
</script>
<%
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.wrap{
margin:10px
height:100%;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="/goobneMall/css/cart.css" type="text/css">
</head>
<body>
	<input type="hidden" id="id" value="<%=id%>">
	<input type="hidden" id="dataSize" value="<%=data.size()%>">
	<!--top-->
	<jsp:include page="../header.jsp" />
	<!--top-->
	<main id="cartMain" style="justify-content: center;">
		<div class="wrap">

			<aside id="cartAside"></aside>
			<div id="container" style=" ">
				<h2 style="font-size: 25px; color: #333333">
					<b>장바구니</b>
				</h2>
				<div>
					<table class="cart_table"
						style="width: 1040px; height: 150px; text-align: center;">
						<thead>
							<tr style="font-weight: bold;">
								<td class="cart_td_top" style="width: 30px; height: 42px;"><input
									type="checkbox" class="all" name="cheakall" id="cheakall"
									value=<%=Allprcie - 3000%>></td>
								<td ailgn=center style="width: 760px;" colspan="2"
									class="cart_td_top">상품
								</th>
								<td class="cart_td_top">상품금액</td>
								<td class="cart_td_top">선택</td>
							</tr>
						</thead>
						<tbody>


							<%
							if (data.size() != 0) {
								for (int i = 0; i < data.size(); i++) {
									if (data != null) {

								String no = data.get(i).getPro_no() + "";
								ProductDTO prodata = prodao.getProduct(no);
								Allprcie += prodata.getPrice() * data.get(i).getCart_count();
							%>
							<input name="AllPrice" type="hidden" value=<%=Allprcie%>>
							
							<tr style="font-weight: bold;">
								<td style="vertical-align: middle;">
								<%if(prodata.getInventory()>0){%>								
								<input class="agree"
									name="Chk_list" data-cartNum="<%=data.get(i).getCart_no()%>"
									type="checkbox"
									value="<%=data.get(i).getCart_count() * prodata.getPrice()%>"
									id="<%=data.get(i).getCart_no()%>"
									onclick="CheckboxValue(event)" >
								<%}else{%>	
									<input class="agreenon" name="Chk_list" 
									data-cartNum="<%=data.get(i).getCart_no()%>"
									type="checkbox" disabled="disabled"
									value="<%=data.get(i).getCart_count() * prodata.getPrice()%>"
									id="<%=data.get(i).getCart_no()%>"
									onclick="CheckboxValue(event)" >

								<%} %>
									</td>

								<td valign=bottom style="width: 99px; vertical-align: middle;"><a
									href="/goobneMall/service?command=product&no=<%=no%>"><img
										width="80px" height="80px"
										src="/goobneMall/img/productImg/<%=data.get(i).getImgfile() %>">
								</a></td>
								<td align=right
									style="width: 530px; border-right: solid 1px #e0e0e0; padding: 30px; padding-bottom: 20px; font-size: 17px; vertical-align: middle;">
									<form action="/goobneMall/service">
										<div align=left>

											<a href="/goobneMall/service?command=product&no=<%=data.get(i).getPro_no()%>"><%=prodata.getTitle()%></a>
										</div>
										<%if(prodata.getInventory()>0){%>
										<input style="width: 20px; align: right; height: 30px; color: #666666; border: 1px solid #666666; background: #ffffff;"
											type="button" value="▲" onclick="qntSet('p',this);"
											id="btnPlus"> 
											<input type="text" style="width: 30px; height: 30px; text-align: center;"
											name="qnt" value="<%=data.get(i).getCart_count()%>">
										
										<input name="inven" type="hidden" value=<%=prodata.getInventory()%>>
										
										<input style="width: 20px; height: 30px; color: #666666; border: 1px solid #666666; background: #ffffff;"
											type="button" value="▼" id="btnMinus"
											onclick="qntSet('m',this);"> <input type="hidden"
											name="no" value=<%=data.get(i).getCart_no()%>>
											 <input type="hidden" name="command" value="ChageQnt"> 
											 
											 <input class="cart_change" type="submit" value="변경">

											<%
										}else{%>
												<input style="width: 20px; align: right; height: 30px; color: #666666; border: 1px solid #666666; background: #ffffff;"
											type="button" value="▲" onclick="qntSet('p',this);"
											id="btnPlus"disabled="disabled"> 
											<input type="text" style="width: 30px; height: 30px; text-align: center;"
											name="qnt" value="0" >
										
										<input name="inven" type="hidden" value=<%=prodata.getInventory()%>>
										
										<input style="width: 20px; height: 30px; color: #666666; border: 1px solid #666666; background: #ffffff;"
											type="button" value="▼" id="btnMinus"
											onclick="qntSet('m',this);" disabled="disabled" > <input type="hidden"
											name="no" value=<%=data.get(i).getCart_no()%>>
											 <input type="hidden" name="command" value="ChageQnt"> 
											 
											 <input class="cart_change" type="submit" value="품절"  disabled="disabled">
												
											<% }%>
									</form>
								</td>


									<%String allprice=formatter.format(data.get(i).getCart_count() * prodata.getPrice());%>
								<td style="font-size: 13px; border-right: solid 1px #e0e0e0; vertical-align: middle;"><%=allprice%>원</td>


								<td style="vertical-align: middle;">
									<form action="/goobneMall/service">
										<p>
											<input type="hidden" name="command" value="order"> <input
												type="hidden" name="cartno"
												value=<%=data.get(i).getCart_no()%>> <input
												type="hidden" name="prono"
												value=<%=data.get(i).getPro_no()%>> <input
												type="hidden" name="id" value=<%=id%>>
													<%if(prodata.getInventory()>0){%>
												 <input type="submit" value="주문하기" class="cart_order">
												 <%}else{ %>
												 <input type="submit" value="주문하기" class="cart_order"  disabled="disabled">
												 <%} %>
												 
												 
										</p>
									</form>

									<form action="/goobneMall/service">
										<input type="hidden" name="no"
											value=<%=data.get(i).getCart_no()%>> <input
											type="hidden" name="command" value="delCart"> <input
											type="submit" value="삭제하기" class="cart_order">
									</form>
								</td>
							</tr>
							<%
							}
							}
							} else {
							%>
							<tr>
								<td colspan="5" style="vertical-align: middle;"><span>상품이없습니다.</span></td>
							</tr>
							<%
							}
							%>
						</tbody>
						<script type="text/javascript">
						function qntSet(type, ths) {
							var $input = $(ths).parent("form").find(
									"input[name='qnt']");
							var $inven=$(ths).parent("form").find(
							"input[name='inven']");
							var tCount = Number($input.val());
							if (type == 'p') {
								if (tCount < Number($inven.val()))
									$input.val(Number(tCount) + 1);

							} else {
								if (tCount > 1)
									$input.val(Number(tCount) - 1);
							}

						}
					
					</script>
						<tfoot>

							<tr>
								<td style="font-size: 13px; text-align: right;"
									class="cart_td_bottom" colspan="9"><span id="checkPrice">
										총 상품금액 0원 + 배송비 0원 = 총 주문금액 0원 </span></td>
							</tr>

						</tfoot>
					</table>


					<div style="height: 60px">
						<br>
						<button type="button" class="cart_del" id="del">선택상품삭제</button>
						<button type="button" class="cart_del" id="allDel"
							onclick="location.href ='/goobneMall/service?command=allDel&id=<%=id%>'">전체상품삭제</button>
					</div>
					<div style="width:1040px; text-align:center;  margin-bottom: 70px; " >

						<br> <br>
						<div style="display: inline-block; width: 100%;">
						<button type="button" id="cart_shopping"
							onclick="location.href='/goobneMall/index.jsp'">
							<b>쇼핑 계속하기</b>
						</button>
						<button type="button" id="buy" class="cart_buy">
							<b>선택상품주문</b>
						</button>
						<button type="button" id="allBuy" class="cart_all"
							onclick="allBuy()">
							<b>전체상품주문</b>
						</button>
						</div>
					</div>
				</div>

				<script type="text/javascript">
				
				var id = $('#id').val()
					$('#del').click(function() {
							if ($("input:checkbox[name='Chk_list']:checked").length === 0) {
								alert("삭제할 항목을 선택해 주세요");
								return;
							}

							var checkArr = new Array();
							$("input:checkbox[name='Chk_list']:checked").each(
											function() {
												/* var tr_value=$(this).attr('id');
												console.log(tr_value); */
												checkArr.push($(this).attr("data-cartNum"));
						});
							$.ajax({
								url : '/goobneMall/service?command=selectDel', // 전송 URL
								type : 'POST', // GET or POST 방식
								traditional : true,
								data : {
								checkArr : checkArr
							// 보내고자 하는 data 변수 설정
								},
								success : function() {
									location.href = '/goobneMall/service?command=cartView';
								}
								});
						});
					
					
					$('#buy').click(function() {
						if ($("input:checkbox[name='Chk_list']:checked").length === 0) {
							alert("주문할 항목을 선택해 주세요");
							return;
						}
						var checkArr = new Array();
						$("input:checkbox[name='Chk_list']:checked").each(
										function() {
											checkArr.push($(this).attr("data-cartNum"));
						});
						$.ajax({
							url : '/goobneMall/service?command=selectBuy&id='+id, // 전송 URL
							type : 'POST', // GET or POST 방식
							traditional : true,
							data : {
							checkArr : checkArr
							},
							success : function() {
								location.href = '/goobneMall/service?command=moveOrder'
							}
							});
						
					});
					function  allBuy() {
						const id = $("input[id=id]").val();
						const dataSize = $("input[id=dataSize]").val();
						if (dataSize!=0) {
							location.href = '/goobneMall/service?command=allBuy&id='+id;
						}else{
							alert("장바구니가 비어있습니다.")
						}
						
						
					}
					
					
					function  CheckboxValue(event) {
						const query = 'input[name="Chk_list"]:checked';
						const selectedEls = 
						      document.querySelectorAll(query);
						
						var delivery= 0;	
						var Price=0;
						  selectedEls.forEach((el) => {
							  Price += parseInt(el.value);
							  delivery= 3000;
							  });
						  
							const PriceForm = Price.toString()
							.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
							const deliveryForm = delivery.toString()
							.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
							const AllPriceForm = (Price+delivery).toString()
							.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
						 
						 document.getElementById('checkPrice').innerText
						    = "총 상품금액 "+PriceForm+"원 + 배송비 "+deliveryForm+"원 = 총 주문금액 "+AllPriceForm+"원"; 
						
					}
					
					
				</script>



			</div>
			<aside id=cartAside2></aside>

		</div>
	</main>
	<!--bottom-->
	<jsp:include page="../footer.jsp" />
	<!--bottom-->

	<script>
	
		$(document).ready(function() { //페이지로드가 완료되면 
			$('.all').click(function(e) {//all클래스 클릭됐을때
				
				$('.agree').prop('checked', this.checked); //agree클래스의 checked를 all의 checked로 변경
				const val='input[name="AllPrice"]';
				const selectedEls = 
				      document.querySelectorAll(val);
				var delivery= 0;	
				var Price=0;
				  selectedEls.forEach((el) => {
					  Price = parseInt(el.value);
					  });
					  delivery= 3000;
				if(e.target.checked) {
					
					const PriceForm = Price.toString()
					.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
					const deliveryForm = delivery.toString()
					.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
					const AllPriceForm = (Price+delivery).toString()
					.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
					
				 document.getElementById('checkPrice').innerText
				    = "총 상품금액 "+PriceForm+"원 + 배송비 "+deliveryForm+"원 = 총 주문금액 "+AllPriceForm+"원"; 
				}else{
					 document.getElementById('checkPrice').innerText
					    = "총 상품금액 "+0+"원 + 배송비 "+0+"원 = 총 주문금액 "+0+"원"; 
				}
			
			});
		});
		
		
		$(".agree").click(function() {
			//$(".all").prop("checked", false);
			let checkCount = 0;
			document.querySelectorAll(".agree").forEach(function(v, i) {
				if(v.checked === false){
					checkCount++;
				}
			});
			if(checkCount>0) {
				document.getElementById("cheakall").checked = false;
			} else if(checkCount === 0) {
				document.getElementById("cheakall").checked = true;
			}
		});
		
		
	</script>

</body>
</html>
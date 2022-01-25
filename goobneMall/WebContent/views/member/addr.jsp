<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="/goobneMall/css/mypage.css" rel="stylesheet">
<link href="/goobneMall/css/addr.css" rel="stylesheet">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

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
  <h3>배송지 관리</h3>
  <div class="addr_top">
    <button data-toggle="modal" data-target="#mymodal" class="addr_add_btn" onclick="location.href='/goobneMall/service?command=addrAdd'">배송지 등록</button>
    <span>배송지 정보를 사전에 등록관리하여 상품 주문 시 보다 간편하게 주문서를 작성할 수 있습니다.</span>
  </div>
  <input type="hidden" name="pageNum" value="1">

    <div>
    <input type="hidden" name="pageNum" value="1">
  
    <table class="addr_table">
      <thead>
        <tr>
          <th style="text-align: center;">배송지명</th>
          <th style="text-align: center;">이름</th>
          <th style="text-align: center;">주소</th>
          <th style="text-align: center;">연락처</th>
          <th style="text-align: center;">수정</th>
          <th style="text-align: center;">삭제</th>
        </tr>
      </thead>
      <tbody id="tbody">
        <c:forEach var = "addr" items="${requestScope.addrList}">
	        <tr style="">
    	    	<td>${addr.getAddrname()}</td>
       	  		<td>${addr.getName()}</td>
       	  		<td>
       	  		<div  style="text-align: center;">
	       	  		<a href="/goobneMall/service?command=addrView&addr_no=${addr.getAddr_no()}">
		       	  		<span>주소 : ${addr.getAddr()}</span>
    	   	  		</a>
       	  		</div>
	       	  	</td>
       	  		<td>핸드폰 : ${addr.getPhone()}</td>
       	  		<td><button type="button" style="outline:none; background-color: white;" onclick="location.href='/goobneMall/service?command=addrUpdateForm&addr_no=${addr.getAddr_no()}'" >수정</button></td>
       	  		<td><button type="button" style="outline:none; background-color: white;" onclick="location.href='/goobneMall/service?command=addrDel&addr_no=${addr.getAddr_no()}'">삭제</button></td>
       		</tr>
        </c:forEach>
      </tbody>
    </table>
    </div>
</div>




<div class="modal fade" id="mymodal" role="dialog">
  <div class="modal-dialog  modal-lg">

    <div class="container">
      <div class="modal-content">
      <div class="modal-body">
          <h4 class="modal-title">배송지 등록</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>


        
          <p style="font-size: 12px">상품주문시 입력하는 배송지 정보를 사전에 등록하면 보다 간편하게
            주문서를 작성할 수 있습니다.</p>
          <table class="addr_table">
            <tr>
              <td class="info">배송지명</td>
              <td><input type="text" id="addrname" name="addrname" class="form-control" maxlength="20"></td>
            </tr>
            <tr>
              <td class="info">이름</td>
              <td><input type="text" id="name" name="name" maxlength="20" class="form-control"></td>
            </tr>
            <tr>
              <td class="info">주소</td>
              <td>
              <div class="addr_top">
	              <input type="text" id="addrnum" name="addrnum" class="form-control" maxlength="20" style="width: 100px;" readonly>
	              <button type="button" id="execPostCode">우편번호검색</button>
	            </div>
                <input type="text" id="addr" name="addr" maxlength="20" class="form-control" readonly><input
                type="text" id="detailAddr" maxlength="20" name="detailAddr" class="form-control"></td>
            </tr>
            <tr>
              <td class="info">휴대번호</td>
              <td><input type="text" id="phone" name="phone" class="form-control"></td>
            </tr>
            <tr>
              <td class="info">전화번호</td>
              <td><input type="text" id="hphone" name="hphone" class="form-control"></td>
            </tr>
          </table>

        </div>
        <div class="modal_footer"><div class="modal-footer-btn">
          <button type="button" class="btn" data-dismiss="modal">취소</button>
          <button type="button" id="modalSubmit" class="btn"
            data-dismiss="modal">확인</button></div>
        </div>
      </div>

    </div>

  </div>

</div>


	<div class="modal fade" id="modModal" role="dialog">
	  <div class="modal-dialog  modal-lg">
	
	    <div class="container">
	      <div class="modal-content">
	        <div class="modal-body">
	          <h4 class="modal-title">배송지 수정</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <p style="font-size: 12px">상품주문시 입력하는 배송지 정보를 사전에 등록하면 보다 간편하게 주문서를 작성할 수 있습니다.</p>
		        <div class=" space"></div>
		      </div>
		        <div class="modal_footer">
              <div class="modal-footer-btn">
                <button type="button" class="btn" data-dismiss="modal">취소</button>
                <button type="button" id="modSubmit" class="btn" data-dismiss="modal">확인</button>
              </div>
            </div>
		    </div>
	    </div>
	
	  </div>
	
	</div>

</div>
	<jsp:include  page="../footer.jsp" />
<script>
var action = '';
var url = '';
var type = '';
var bno = 0;



 
$(function() {
 
    // 새 글 쓰기 버튼 클릭
    $("#AddRegist").click(function(){
        action='create';
        type = 'POST'
        $("#modal-title").text("배송지 등록");
        $("#mymodal").modal();
    });

      

        
        
   
  
    
        
    $(document).on("click", "#modalSubmit", function() {
      let addrname = $("#addrname").val();
      let addrnum = $("#addrnum").val();
      let addr = $("#addr").val();
      let name = $("#name").val();
      let phone = $("#phone").val();
      let hphone = $("#hphone").val();
      let detailAddr =$("#detailAddr").val();
      let email = '<c:out value="${sesInfo.email}"/>';
      
      let modData = {addrname:addrname,addrnum:addrnum,
          addr:addr,name:name,phone:phone,hphone:hphone,detailAddr:detailAddr};
         $.ajax({
                url: "/member/addr/"+email,
                type: "put",
                data: JSON.stringify(modData),
                contentType: "application/json; charset=utf-8"
              }).done(function(result){
                alert(result);
                listUp();
              });
    });

    
    function selectbaseAddr(addr_no){   
      let email='<c:out value="${sesInfo.email}"/>';
      console.log("asd");
       $.ajax({
               url: "/member/selectbaseAddr/"+addr_no+"/"+email,
               type: "get",
             }).done(function(result){
               alert(result);
               listUp();
             });
     }  
    
    
    function modifySubmit(addrname,addrnum,addr,name,phone,hphone,detailAddr,addr_no){
       let modData = {addrname:addrname,addrnum:addrnum,
                addr:addr,name:name,phone:phone,hphone:hphone,detailAddr:detailAddr,addr_no:addr_no};
      $.ajax({
        url: "/member/"+addr_no,
        type: "put",
        data: JSON.stringify(modData),
        contentType: "application/json; charset=utf-8"
      }).done(function(result){
        alert(result);
        listUp();
      });
    }

    
    
        listUp();
        function listUp() {
          let email='<c:out value="${sesInfo.email}"/>';
          $.getJSON("/member/addr/"+email+".json",
              function(aList){
              printList(aList);
            }).fail(function(){
              alert(" 리스트 출력 실패");
            });
        }
        
        function printList(aList) {
          let  ulTag="";
            if(aList.length!=0){
          for (let avo of aList) {
                ulTag+= '<tr><td><input type="hidden" class="addr_no" value="'+avo.addr_no+'">'
			                +'<span class="addrname">'+avo.addrname+'</span>'
			                +'<div class="print_addr_btn"><button class="addrmodify addr_list_btn" data-toggle="modal" data-target="#modModal" data-addr_no="'+avo.addr_no+'">수정</button>'
			                +'<button class="addrremove addr_list_btn" data-addr_no="'+avo.addr_no+'">삭제</button></td><div>'
			                +'<td><span class="name">'+avo.name+'</span></td>'
			                +'<td><ul class="addr_list_ul"><li>[<span class="addrnum">'+avo.addrnum+'</span>] <span class="addr">'+avo.addr+'</span>'
			                +'<span class="detailAddr">'+avo.detailAddr+'</span><li>'
			                +'휴대번호:<span class="phone">'+avo.phone+'</span>'
			                +'/전화번호:<span class="hphone">'+avo.hphone+'</span></td>'
			                +'<td><button type="button" class="baseaddr addr_list_btn" data-addr_no="'+avo.addr_no+'">선택</button></td></tr>';
                
                console.log("pn1o:"+avo.addr_no);
                //pno 증가
        }
        }else{
            ulTag = '<tr><td colspan="4" class="no_addr">등록된 배송지 정보가 없습니다</td></tr>';
        }
          $("#tbody").html(ulTag); // printReviewPaging(reviewTotal,page,sign);ㄹ
        }
        
        
        
        
        
        
        
      /*   
        function printList(email,page){
          let pageNo = page > 1 ? page : 1;
          $.getJSON("/addr/addrlist/"+email+"/"+pageNo+".json",function(rdto){
            printListReview(rdto.rlist,rdto.reviewCnt,pageNo);
          }).fail(function(){
            alert("리뷰 리스트 출력 실패!")
          });                                           
        } */
        //페이징 주소
                
        
       $(document).on("click","#execPostCode",function() {
          new daum.Postcode({
            oncomplete : function(data) {

              var fullRoadAddr = data.roadAddress; 
              var extraRoadAddr = ''; 

              if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                extraRoadAddr += data.bname;
              }
              if (data.buildingName !== '' && data.apartment === 'Y') {
                extraRoadAddr += (extraRoadAddr !== '' ? ', '
                    + data.buildingName : data.buildingName);
              }
              if (extraRoadAddr !== '') {
                extraRoadAddr = ' (' + extraRoadAddr + ')';
              }
              if (fullRoadAddr !== '') {
                fullRoadAddr += extraRoadAddr;

              // 우편번호와 주소 정보를 해당 필드에 넣는다.
              $("[name=addrnum]").val(data.zonecode);
               $("[name=addr]").val(fullRoadAddr);
              document.getElementById('addrnum').value = data.zonecode; 
              document.getElementById('addr').value = fullRoadAddr;
              
          

            }
            }
          }).open();
      });

       $(document).on("click",".addrremove",function(){
           let addr_no = $(this).data("addr_no");
           console.log("pn2o:"+addr_no);
           removeAddr(addr_no);
           //addr_no 값 어케 받아오지 
         });
       function removeAddr(addr_no){
             $.ajax({
                 url: "/member/addrremove/"+addr_no,
               type: "delete"
             }).done(function(result){
               alert(result);
                 listUp(); 
                 //여기에 뭐넣어야지 ? 새로고침안됨
             });
           }
       
       $(document).on("click", "#modSubmit", function() {
            let addrname = $("#addrname2").val();
            let addrnum = $("#addrnum2").val();
            let addr = $("#addr2").val();
            let name = $("#name2").val();
            let phone = $("#phone2").val();
            let hphone = $("#hphone2").val();
            let detailAddr =$("#detailAddr2").val();
            let addr_no =$("#addr_no2").val();
             console.log("dds:"+addr_no);
            modifySubmit(addrname,addrnum,addr,name,phone,hphone,detailAddr,addr_no);
          });
         
          
          
         $(document).on("click",".addrmodify",function(){
            let parents = $(this).closest("tr");
            let addrname = $(parents).find(".addrname").text();
            let addrnum = $(parents).find(".addrnum").text();
            let addr = $(parents).find(".addr").text();
            let detailAddr = $(parents).find(".detailAddr").text();
            let name = $(parents).find(".name").text();
            let phone = $(parents).find(".phone").text();
            let hphone = $(parents).find(".hphone").text();
          
            let addr_no = $(parents).find(".addr_no").val();
            console.log("dd:"+hphone);
            console.log("dd:"+addr_no);
            addrModal(addrname,addrnum,addr,name,phone,hphone,detailAddr,addr_no);
          });   

          
          $(document).on("click",".baseaddr",function(){
                   let addr_no = $(this).data("addr_no");//같은 tr이라 가져와짐
                   console.log("pn2eo:"+addr_no);
                   selectbaseAddr(addr_no);
                
          
          
          });
          
       

         
          
          
          
          
          
          
});


function updateAddr() {
	
}

function deleteAddr() {
	
}



</script>


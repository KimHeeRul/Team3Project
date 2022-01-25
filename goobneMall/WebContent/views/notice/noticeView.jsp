<%@page import="DTO.NoticeDTO"%>
<%@page import="DAO.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.notice_form {
	display: grid;
	height: 100%;
	justify-items: center;
}

.notic_btnn {
	display: inline-block;
	width: 205px;
	height: 60px;
	padding: 15px 5px;
	border: 1px solid #ff634e;
	background: #ff634e;
	color: #fff;
	font-size: 17px;
	line-height: 28px;
	font-weight: 400;
	letter-spacing: -0.5px;
	text-align: center;
	margin-top: 50px;
	margin-left: 20px;
	margin-right: 20px;
	margin-bottom: 50px;
}

.notice_td_n {
	width: 130px;
	height: 47px;
	background: #f4f4f4;
	color: #333;
	text-align: center;
	color: #333;
	font-weight: bold;
}

.notice_input {
	margin-left: 20px;
	width: 587px;
	height: 28px;
	border: 1px solid #d7d7d7;
}

.notice_checkimg {
	padding-left: 10px;
}

.notic_td_n {
	border-top: 1px solid #e0e0e0;
	border-left: 1px solid #e0e0e0;
	padding: 15px;
	font-weight: bold;
}

#notic_ftd_n {
	border-top: 1px solid #e0e0e0;
}
</style>
</head>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<%
	// notice nowPage 끝
	
	
	String log = (String) session.getAttribute("log");
	
	int nowPage = Integer.parseInt(request.getParameter("page"));
	System.out.println("View 페이지 목록으로 사용 할때 페이지 : " + nowPage);

	if (nowPage < 1) {
		nowPage = 1;
	}

	NoticeDAO dao = NoticeDAO.getInstance();
	int n_no; // noticeUpdate에서 받아온 파라미터 사용할 때
	NoticeDTO notice = null;

	if (request.getParameter("n_no") != null) {
		n_no = Integer.parseInt(request.getParameter("n_no"));
		notice = dao.selectNotice(n_no);
	}
	else {
		String sql = "SELECT * FROM notice ORDER BY n_no DESC limit  0, 1";
		notice = dao.selectOneNotice(sql);
	}
	
	
	%>
	<!--top-->
	<jsp:include page="/views/header.jsp" />
	<!--top-->
	<form class="notice_form" id="notice_U_F" method="post"
		action="/goobneMall/service">
		<b style="font-size: 30px; width: 1040px; padding-top: 40px;">공지사항</b>
		<div>
			<table style="width: 1040px; font-size: 13px; margin-top: 20px;">
				<tr>

					<td id="notic_ftd_n" class="notice_td_n"><span>분류</span></td>
					<td class="notic_td_n"><%=notice.getDivision()%> <span
						style="float: right;">조회수 : <%=notice.getReadcount()%></span> <script>
			let select = "<%=notice.getDivision()%>
					";
					$("select[name=division]").val(select).prop("selected",
							true);
				</script></td>
				</tr>
				<tr>
					<td id="notic_ftd_n" class="notice_td_n"><input type="hidden"
						name="command" value="noticeUpdate"> <input type="hidden"
						name="n_no" value=""> <input type="hidden" name="page"
						value=""><span>제목</span></td>
					<td
						style=" overflow: hidden; width: 800px;"
						class="notic_td_n"><%=notice.getTitle()%></td>

				</tr>
				<tr>
					<td id="notic_ftd_n" class="notice_td_n"
						style="height: 340px; border-bottom: 2px solid #e0e0e0;"><span>내용
							
					</span></td>
					<td
						style="word-break: break-all; border-bottom: 2px solid #e0e0e0;"
						class="notic_td_n"><%=notice.getContent()%></td>
				</tr>

			</table>
		</div>

	</form>



	<div>
		<form class="notice_form" action="/goobneMall/service" id="notice_V_F">
			<div>
				<%
					if (log != null && log.equals("admin")) {
				%>
				<input class="notic_btnn" type="button" name="ViewToUpBtn"
					onclick="ViewToUp()" value="수정하기">
				<input
					style="color: #fff; background: #494949; border: 1px solid #494949;"
					class="notic_btnn" type="button" name="ViewToDelBtn"
					onclick="ViewToDel()" value="삭제하기">
					<%
					}
					%>					
					 <input type="hidden"
					name="command" value="noriceList"> <input type="hidden"
					name="page" value="<%=nowPage%>"> <input type="hidden"
					name="n_no" value="<%=notice.getN_no()%>"> <input
					style="color: #666; background: #fff; border: 1px solid #c8c8c8;"
					class="notic_btnn" type="button" name="ViewToListBtn"
					onclick="ViewToList()" value="목록으로">
			</div>
		</form>

	</div>

	<script type="text/javascript">
		const form = $("#notice_V_F");

		function ViewToList() {
			console.log("ToList 실행")
			$("input[name=command]").val("noticeList");
			form.submit();
		}
		function ViewToUp() {
			console.log("ToUp 실행")
			$("input[name=command]").val("noticeUpdateFrom");
			form.submit();
		}
		function ViewToDel() {
			console.log("ToDel 실행")
			$("input[name=command]").val("noticeDelete");
			form.submit();
		}
	</script>
	<!--bottom-->
	<jsp:include page="/views/footer.jsp" />
	<!--bottom-->
</body>
</html>
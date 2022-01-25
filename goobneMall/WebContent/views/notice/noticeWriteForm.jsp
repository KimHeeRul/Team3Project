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

.notic_btn {
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
}

#notic_ftd_n {
	border-top: 1px solid #e0e0e0;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
	<%
	int beforePage = Integer.parseInt(request.getParameter("page"));
	String log = (String) session.getAttribute("log");
	if(log == null){
	%>
		<script type="text/javascript">
			alert("잘못된 접근입니다.");
			location.href = '/goobneMall/service?command=noticeList&page=<%=beforePage%>';
		</script>	
	<%
	}
	%>
	<!--top-->
	<jsp:include page="/views/header.jsp" />
	<!--top-->
	<form class="notice_form" id="notice_W_F" method="post"
		action="service">
		<b style="font-size: 30px; width: 1040px; padding-top: 40px;">공지사항 작성</b>
		<table style="width: 1040px; font-size: 13px; margin-top: 20px;">
			<tr>

				<td id="notic_ftd_n" class="notice_td_n"><span>분류<img
						class="notice_checkimg" alt=""
						src="/goobneMall/img/join_img/joinChkImg.png"></span></td>
				<td class="notic_td_n"><select style="width: 305px"
					class="notice_input" name="division">
						<option value="일반">일반</option>
						<option value="시스템">시스템</option>
						<option value="이벤트">이벤트</option>
				</select></td>
			</tr>
			<tr>
				<td id="notic_ftd_n" class="notice_td_n"><input type="hidden"
					name="command" value="noticeWrite"> <input type="hidden"
					name="page" value="<%=beforePage%>"><span>제목<img
						class="notice_checkimg" alt=""
						src="/goobneMall/img/join_img/joinChkImg.png"></span></td>
				<td class="notic_td_n"><input class="notice_input" type="text"
					name="title"></td>

			</tr>
			<tr>
				<td id="notic_ftd_n" class="notice_td_n"
					style="height: 340px; border-bottom: 2px solid #e0e0e0;"><span>내용
						<img class="notice_checkimg" alt=""
						src="/goobneMall/img/join_img/joinChkImg.png">
				</span></td>
				<td style="border-bottom: 2px solid #e0e0e0;" class="notic_td_n"><textarea
						class="notice_input" name="content"
						style="resize: none; width: 800px; height: 300px; margin-left: 20px"></textarea></td>
			</tr>

		</table>
		<div>
			<input class="notic_btn" type="button" onclick="nullChk()"
				value="작성완료"><input
				style="color: #666; background: #fff; border: 1px solid #c8c8c8;"
				class="notic_btn" type="button" onclick="moveList()" value="취소">
		</div>
	</form>

	<script type="text/javascript">
		const form = $("#notice_W_F");
		function nullChk() {
			const title = $("input[name=title]").val();
			const division = $("select[name=division]").val();
			const notice_file = $("input[name=notice_file]").val();
			const content = $("textarea[name=content]").val();

			if (title == "" || content == "") {
				alert("필수 내용을 입력해주십시오");
			} else {
				console.log("WriteAction으로 이동");
				console.log(title);
				console.log(division);
				console.log(notice_file);
				console.log(content);
				form.submit();
			}
		}

		$("#notice_W_F").keypress(function(e) {
			if (e.keyCode === 13) {
				wirte();
			}
		});
		function moveList() {
			console.log("List로 이동");
			$("input[name=command]").val('noticeList');
			form.submit();
		}
	</script>
	<!--bottom-->
	<jsp:include page="/views/footer.jsp" />
	<!--bottom-->
</body>
</html>
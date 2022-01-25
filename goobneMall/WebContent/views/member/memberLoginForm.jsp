<%@page import="org.apache.catalina.connector.Response"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<!-- 
		타이틀 이미지 바꾸는법
	 <link rel="shortcut icon" type="image⁄x-icon" href="/goobneMall/img/join_img/joinChkImg.png">
	 -->
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap');
		
		.login_shadow{
			font-family: 'Nanum Gothic', sans-serif;
			font-weight: normal;
		}
		
		.login_shadow:-webkit-autofill {
   			-webkit-box-shadow: 0 0 0 1000px white inset;
		}
	</style>
</head>
<body>
<c:choose>
	<c:when test="${param.alert != null}">
		<script type="text/javascript">
			alert("로그인 실패 했습니다. 정보를 확인해주세요");
		</script>
	</c:when>
</c:choose>
<!--top-->
	<jsp:include page="/views/header.jsp" />
	<!--top-->
<div style="margin-top: 10px; min-height: 0px;" class="loginHiddenSpace"></div>
	<div>
	<div class="loginOutBody" style="text-align: center; width: 1040px; margin: 0 auto;">
		<div class="loginBody" style="display:inline-block; width: 500px; height: 500px; /*border: 1px solid;*/ text-align: center;">
				<form id="login_form" method="post" action="/goobneMall/service">
					<input type="hidden" name="command" value="memberLogin">
						<a href="/goobneMall/index.jsp">
						<img style="padding-top: 30px;" src="/goobneMall/img/CssImg/goobneMall.png"></a>
						<div style="margin-top: 20px;">
							<div>
								<label style="width:300px; margin:0; padding:0; margin-top: 15px; display: inline-block; text-align: left;">
								<!--  로그인 : 버튼 백그라운드색 : 주황 #ff634e ,회색 #f3f3f3-->
									<span style="display: inline; float:left; height: 50px; background-color: #f3f3f3; border: 1px solid #bababa">
									<img src="/goobneMall/img/login_img/login_man.png">
									</span>
									<span style="display: inline-block; height: 50px; vertical-align: middle;">
									<input style="display: inline-block; line-height:48px; width: 245px; border: 1px solid #bababa; border-left: 0; padding-left: 15px; outline: none;" type="text" name="login_id" class="login_shadow" maxlength="20">
									</span>
								</label>
							</div>
							<div>
							<label style="width:300px; margin:0; padding:0; margin-top: 15px; display: inline-block; text-align: left;">
								<!--  로그인 : 버튼 백그라운드색 : #ff634e -->
									<span style="display: inline; float:left; height: 50px; background-color: #f3f3f3; border: 1px solid #bababa">
									<img src="/goobneMall/img/login_img/login_key.png">
									</span>
									<span style="display: inline-block; height: 50px; vertical-align: middle;">
									<input style="display: inline-block; line-height:48px; width: 245px; border: 1px solid #bababa; border-left: 0; padding-left: 15px; outline: none;" type="password" name="login_pw" maxlength="20">
									</span>
								</label>
							</div>
						</div>
						<input type="button" style="width: 300px; height: 50px; margin-top: 18px; background-color: #ff634e; border:0; color: white;" onclick="Login()" value="로그인">
						<hr>
						<input type="button" style="width: 300px; height: 50px; background-color: #eeeeee57 ; border: 0 ;" onclick="LoginToJoin()" value="회원가입">
				</form>
			</div>
		</div>
	</div>
	<div style="min-height: 0px;" class="loginHiddenSpace"></div>
	<script type="text/javascript">
		function Login() {
			$("input[name=command]").val("memberLogin");
			let form = $("#login_form");

			console.log($("input[name=command]").val());

			const id = $("input[name=login_id]").val();
			const pw = $("input[name=login_pw]").val();

			if (id === "") {// 아이디 null;
				alert("아이디를 입력해주세요");
				$("input[name=login_id]").focus();
			} else if (pw === "") { // 아이디 입력, 비밀번호 null
				alert("비밀번호를 입력해주세요");
				$("input[name=login_pw]").focus();
			} else {
				form.submit();
			}
		}
		
		$("#login_form").keypress(function(e) {
			if (e.keyCode === 13) {
				Login();
			}
		});

		function LoginToJoin() { // 회원가입 이동
			let form = $("#login_form");
			$("input[name=command]").val("memberJoinForm");
			form.submit();
		}
	</script>
	<!--bottom-->
	<jsp:include page="/views/footer.jsp" />
	<!--bottom-->
</body>
</html>
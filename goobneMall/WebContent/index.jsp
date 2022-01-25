<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린몰</title>

</head>
<body>
	<!--top-->
	<jsp:include page="views/header.jsp" />
	<!--top-->
	<main>
		<jsp:include page="views/main.jsp" />
	</main>


	<!--bottom-->
	<jsp:include page="views/footer.jsp" />
	<!--bottom-->
</body>

<!--JSTL &EL Tag-->
<!--jar:jstl+standard-> lib폴더에 추가-->
<!--jstl태그의 종류:core,fmt,sql,xml,functions -->
<%


%>
<%-- <c:import url="/header.jsp"></c:import>
<c:redirect url="/header.jsp"></c:redirect>
<c:out value="hello"> </c:out>
<c:set var="id" value="${param.id}"/> <!--파라미터id가 널이면   -->
<c:if test="${empty id}">
	<p>참입니다</p>
</c:if>
<c:choose>
	<c:when test="${true }">
	<h1>test1 : true</h1>
	</c:when>
	<c:otherwise>
	<h1>모든 조건이 맞지 않습니다.</h1>
	</c:otherwise>
</c:choose>
<%
pageContext.setAttribute("test", "page datas");//1개 페이지 안에서만 존재

ArrayList<Integer> datas=new ArrayList<>();
datas.add(1);
datas.add(2);
datas.add(3);
request.setAttribute("datas",datas);//

session.setAttribute("test","session data");//브라우저가 닫히기전까지존재
application.setAttribute("test","aplication data");//프로그램이 실행되는동안 존재

%>

<c:out value="${pageScope.test }"></c:out>
<c:out value="${requestScope.datas}"></c:out>
<c:out value="${sessionScope.test}"></c:out>
<c:out value="${applicationScope.test}"></c:out>


<c:forEach var="num" items="${datas}">
<h3>${num}</h3>
</c:forEach>

<c:forEach var="i" begin="1" end="10">
<span>${i}</span>
</c:forEach>

<c:url var="path" value="http://www.naver.com"/>
<a href="${path }"></a> --%>

</html>


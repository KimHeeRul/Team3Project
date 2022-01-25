<%@page import="DAO.NoticeDAO"%>
<%@page import="DTO.NoticePaging"%>
<%@page import="DTO.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/goobneMall/views/bootstrap/css/bootstrap.css">
</head>
<body>
	<style>
.cate_path {
	list-style: none;
	margin: 0;
	padding: 0;
}

.path {
	margin: 0 0 0 0;
	padding: 0 0 0 0;
	border: 0;
	float: left;
}

main#noticeMain {
	grid-area: main;
	display: grid;
	/* grid-template:
    auto/1fr 1fr 1fr; */
	grid-template-columns: 1fr auto 1fr;
	grid-template-areas: "aside container aside2"
}

#noticeAside {
	grid-area: aside;
	display: grid;
}

#noticeAside2 {
	grid-area: aside;
	display: grid;
}

#container {
	grid-area: container;
}
</style>
	<%
	String log = (String) session.getAttribute("log");

	// noticeList랑 paging으로 처리
	NoticeDAO dao = NoticeDAO.getInstance();
	
	int totalCnt = dao.totalCnt();
	
	// Notice Paging System
    int nowPage = 1;
    if(request.getParameter("page")!=null){
    	nowPage = Integer.parseInt(request.getParameter("page"));
    }
	
	NoticePaging paging = new NoticePaging();
    paging.setNowPage(nowPage);
    paging.setTotalCnt(totalCnt);
        
    ArrayList<NoticeDTO> noticeList = dao.selectNotice(paging.getSql());
	
	
	%>
	<!--top-->
	<jsp:include page="/views/header.jsp" />
	<!--top-->
	<main id="noticeMain" style="margin-top: 15px;">
		<aside id="noticeAside"></aside>
		<div id="container" style="margin: auto">
			<div id="contents">
				<div class="noticeList_title">
					<span style="font-weight: bold; font-size: 2em">공지사항</span>
				</div>
				<table class="table table-striped"
					style="min-width: 1040px; font-size: 13px; border-top: 1px solid; border-bottom: 1px solid #f1f1f1;">
					<colgroup>
						<col width="70px">
						<col width="85px">
						<col width="*">
						<col width="90px">
						<col width="70px">
					</colgroup>
					<thead>
						<tr
							style="color: #333333; text-align-last: center; background: #fafafa;">
							<th scope="col">번호</th>
							<th scope="col">구분</th>
							<th scope="col">제목</th>
							<th scope="col">작성일</th>
							<th scope="col">조회</th>
						</tr>
					</thead>
					<tbody id="noticeList_tBody">
					   <%
                        if(noticeList != null){
						for (int i = 0; i < noticeList.size(); i++) {
							NoticeDTO notice = noticeList.get(i);
						%>
						<tr>
							<td style="text-align: center;"><%=notice.getN_no()%></td>
							<td style="text-align: center;"><span class="type"><%=notice.getDivision()%></span></td>
							<td class="tit"><a href="#none" class="w450"
								title="<%=notice.getTitle()%>"
								onclick="location.href='/goobneMall/service?command=noticeView&page=<%=paging.getNowPage()%>&n_no=<%=notice.getN_no()%>'"><%=notice.getTitle()%></a></td>
							<td style="text-align: center;"><%=notice.getRegd8()%></td>
							<td style="text-align: center;"><%=notice.getReadcount()%></td>
						</tr>
						<%
						}
                        }
						%>
					</tbody>
				</table>
				<div class="pagingOption" style="display: flex;">


					<nav aria-label="Page navigation" style="margin: auto">
						<ul class="pagination">
							<!--  <li class=disabled> -->
							<li>
								<%
								if (paging.isFirst()) {
								%> <a href="/goobneMall/service?command=noticeList&page=1" aria-label="Previous">처음</a>
								<%
								}
								if (paging.isPrev()) {
								%> <a
								href="/goobneMall/service?command=noticeList&page=<%=paging.getNowPage() - 1%>">
									<span aria-hidden="true">«</span>
							</a>
							</li>
							<%
							}
							for (int i = paging.getStartPage(); i <= paging.getEndPage(); i++) {
							if (i == paging.getNowPage()) {
							%>
							<li class="active"><a href="#"> <%=i%></a></li>
							<%
							} else {
							%>
							<li><a href="/goobneMall/service?command=noticeList&page=<%=i%>"> <%=i%>
							</a></li>
							<%
							}
							}
							if (paging.isNext()) {
							%>
							<li><a aria-label="Next"
								href="/goobneMall/service?command=noticeList&page=<%=paging.getNowPage() + 1%>">
									» </a></li>
							<%
							}
							if (paging.isEnd()) {
							%>
							<li>
							<a href="/goobneMall/service?command=noticeList&page=<%=paging.getTotalPage()%>" aria-label="Previous"> 끝 </a>
							</li>
							<%
							}
							%>
						</ul>
					</nav>

					<form id="noticeList_form" action="/goobneMall/service">
						<input name="command" type="hidden" value="noticeWriteForm">
						<input name="page" type="hidden" value="<%=paging.getNowPage()%>">
						
						<%
							if(log != null && log.equals("admin")){
						%>
						<input type="submit" class="btn btn-primary" value="글쓰기">
						<%
							}
						%>
					</form>
				</div>
				<form id="noticeList_form" action="">
					<!-- 	<div class="notice_search">검색</div> -->
				</form>
			</div>

		</div>
		<script type="text/javascript">
			_$tag_____________________$tag___
		</script>
	</main>
	<!--bottom-->
	<jsp:include page="/views/footer.jsp" />
	<!--bottom-->

</body>
</html>
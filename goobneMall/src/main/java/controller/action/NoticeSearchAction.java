package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.NoticeDAO;
import DTO.NoticeDTO;
import DTO.NoticePaging;

public class NoticeSearchAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "views/notice/noticeList.jsp";
		
		NoticeDAO dao = NoticeDAO.getInstance();

		int totalCnt = dao.totalCnt();
		System.out.println("total 게시물 : " + totalCnt);
		
		// Notice Paging System
        int nowPage = 1;
        if(request.getParameter("page")!=null){
        	nowPage = Integer.parseInt(request.getParameter("page"));
        }
        
        NoticePaging paging = new NoticePaging();
        paging.setNowPage(nowPage);
        paging.setTotalCnt(totalCnt);
        
        ArrayList<NoticeDTO> noticeList = dao.selectNotice(paging.getSql());

		request.setAttribute("paging", paging);
		request.setAttribute("noticeList", noticeList);
		request.getRequestDispatcher(url).forward(request, response);
	}
}

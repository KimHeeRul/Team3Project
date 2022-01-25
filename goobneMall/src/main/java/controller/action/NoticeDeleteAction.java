package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.NoticeDAO;
import DTO.NoticeDTO;
import DTO.NoticePaging;

public class NoticeDeleteAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "views/notice/noticeList.jsp";
		
		NoticeDAO dao = NoticeDAO.getInstance();

		// 넘어오는 파라미터 값
		// command, page, n_no
		int n_no = Integer.parseInt(request.getParameter("n_no"));
		dao.deleteNotice(n_no);
		
		// Notice Paging System
        int nowPage = 1;
        if(request.getParameter("page")!=null){
        	nowPage = Integer.parseInt(request.getParameter("page"));
        }
		
		response.sendRedirect("views/notice/noticeList.jsp?page="+nowPage);
	}
}

package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.NoticeDAO;
import DTO.NoticeDTO;
import DTO.NoticePaging;

public class NoticeViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "views/notice/noticeView.jsp";
		System.out.println("ViewAction 실행");
		
		NoticeDAO dao = NoticeDAO.getInstance();
		int n_no = 0;
		String strN_no = request.getParameter("n_no");

		if(strN_no != null) {
			n_no = Integer.parseInt(strN_no);
			dao.updateNReadCount(n_no);
			NoticeDTO notice = dao.selectNotice(n_no);
			request.setAttribute("notice", notice);
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}

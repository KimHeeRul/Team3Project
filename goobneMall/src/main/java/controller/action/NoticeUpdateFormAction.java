package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.NoticeDAO;
import DTO.NoticeDTO;

public class NoticeUpdateFormAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "views/notice/noticeUpdateForm.jsp";
		// noticeView.jsp 에서 넘어온 파라미터
		// page 값, commad 값, n_no 값
		// noticeUpdateForm 으로 포워드
		
		NoticeDAO dao = NoticeDAO.getInstance();
		int n_no = Integer.parseInt(request.getParameter("n_no"));
		NoticeDTO notice = dao.selectNotice(n_no);
		request.setAttribute("notice", notice);
		
		request.getRequestDispatcher(url).forward(request, response);
	}
}

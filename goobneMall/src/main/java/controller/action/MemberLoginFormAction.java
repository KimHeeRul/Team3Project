package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.NoticeDAO;
import DTO.NoticeDTO;

public class MemberLoginFormAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				String url = "views/member/memberLoginForm.jsp";
				request.getRequestDispatcher(url).forward(request, response);
	}
}

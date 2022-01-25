package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AddrDAO;
import DAO.MemberDAO;
import DTO.AddrDTO;
import DTO.MemberDTO;

public class MyInfoUpdateFormAction  implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("log");
		
		MemberDAO dao = MemberDAO.getInstance();
		
		ArrayList<String> email = dao.getUsersEmail();
		
		MemberDTO member = dao.getUser(id);
		
		
		request.setAttribute("MyInfoUpdateObject", member);
		request.setAttribute("MyInfoUpdateEmailsObject", email);
		
		String url = "views/member/MyInfoUpdateForm.jsp";
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}

package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AddrDAO;
import DAO.MemberDAO;
import DAO.OrderDAO;
import DTO.AddrDTO;
import DTO.MemberDTO;
import DTO.OrderDTO;

public class DeleteMemberAction  implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("log");
		
		MemberDAO dao = MemberDAO.getInstance();
		
		dao.delMember(id);
		
		session.removeAttribute("log");
		response.sendRedirect("/goobneMall/index.jsp");
	}

}

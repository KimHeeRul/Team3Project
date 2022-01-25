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

public class DeleteChkPwFormAction  implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("log");
		
		OrderDAO orderdao = OrderDAO.getInstance();
		MemberDAO dao = MemberDAO.getInstance();
		
		boolean deletePass = orderdao.chkOrder(id);
		MemberDTO member = dao.getUser(id);
		

		String url = "views/member/DeleteChkPwForm.jsp";
		
		request.setAttribute("DeleteChkObject", member);
		request.setAttribute("DeleteChk", deletePass);
		request.getRequestDispatcher(url).forward(request, response);
	}

}

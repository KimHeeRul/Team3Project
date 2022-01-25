package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AddrDAO;
import DAO.CartDAO;
import DTO.AddrDTO;
import DTO.CartDTO;

public class AddrViewAction implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("log");
		String addr_no = request.getParameter("addr_no");
		
		int addr_no_int = Integer.parseInt(addr_no);
		
		AddrDAO dao = AddrDAO.getInstance();
		
		AddrDTO addrDTO = dao.chkOverlapNo(addr_no_int);
		
		String url = "views/member/addrView.jsp";
		
		request.setAttribute("addrViewObject", addrDTO);
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}
}

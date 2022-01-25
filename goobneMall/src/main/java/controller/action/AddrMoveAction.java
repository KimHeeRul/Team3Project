package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AddrDAO;
import DAO.CartDAO;
import DTO.CartDTO;

public class AddrMoveAction implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "views/member/addr.jsp";
		
		HttpSession session = request.getSession();
		
		AddrDAO dao = AddrDAO.getInstance();
		String id = (String) session.getAttribute("log");
		
		if (id != null) {
			request.setAttribute("addrList", dao.chkOverlapId(id));
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}

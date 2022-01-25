package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AddrDAO;

public class AddrDelAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("log");
		String addr_no = request.getParameter("addr_no");
		
		int addr_no_int = Integer.parseInt(addr_no);
		
		AddrDAO dao = AddrDAO.getInstance();
		
		dao.delAddr(addr_no_int);
		
		String url = "/service?command=addr";
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}

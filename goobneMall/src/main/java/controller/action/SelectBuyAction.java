package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CartDAO;

public class SelectBuyAction implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] list=  request.getParameterValues("checkArr");
		String id =request.getParameter("id");
		String url = "/views/buy/buy.jsp";


		CartDAO dao = CartDAO.getInstance();
		dao.deltbl_buy(id);
		
		for (int i = 0; i < list.length; i++) {
//			dao.setBuy(list[i]);
			System.out.println(list[i]+"11");
			dao.setBuy(Integer.parseInt(list[i]));
		}
		
//		request.setAttribute("list", list);
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}
}

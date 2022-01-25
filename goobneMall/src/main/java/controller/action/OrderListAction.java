package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CartDAO;

public class OrderListAction implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type=request.getParameter("type");
		
		if (type.equals("list")) {
			String url = "/views/member/orderList.jsp";	
			request.getRequestDispatcher(url).forward(request, response);
		}else if (type.equals("detail")) {
			String url = "/views/member/orderDetails.jsp";
			request.getRequestDispatcher(url).forward(request, response);
		}else if (type.equals("registration")) {
			String url = "/views/member/ProductRegistration.jsp";
			request.getRequestDispatcher(url).forward(request, response);
		}else if (type.equals("MoneyCharging")) {
			String url = "/views/member/MoneyCharging.jsp";
			request.getRequestDispatcher(url).forward(request, response);
		}
		
	}
}

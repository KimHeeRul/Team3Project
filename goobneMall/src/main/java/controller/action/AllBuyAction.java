package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.If;

import DAO.CartDAO;
import DTO.CartDTO;

public class AllBuyAction implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id =request.getParameter("id");
		String url = "/views/buy/buy.jsp";
		String qnt = request.getParameter("qnt");
		
		CartDAO dao = CartDAO.getInstance();
		dao.deltbl_buy(id);
		
		ArrayList<CartDTO> data=dao.getCart(id);
	
		for (int i = 0; i < data.size(); i++) {
			if(data.get(i).getCart_count()!=0) {
			dao.setBuy(data.get(i).getCart_no());
			}
		}
		
//		request.setAttribute("list", list);
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}
}

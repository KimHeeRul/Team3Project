package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CartDAO;

public class CartAction implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		int unit_pcs = Integer.parseInt(request.getParameter("qnt"));
		int pro_no = Integer.parseInt(request.getParameter("prono"));
		String imgfile = request.getParameter("img");
		
//		String url = "/goobneMall/service?command=product&no=" + pro_no;
//		String url="/views/product/product.jsp";
		
		CartDAO dao = CartDAO.getInstance();
		dao.setCart(id, unit_pcs, pro_no,imgfile);

		/*
		 * if (check.equals("yes")) { url = "/goobneMall/service?command=cartView";
		 * response.sendRedirect(url); } else { response.sendRedirect(url); //
		 * request.getRequestDispatcher(url).forward(request, response); }
		 */

	}

}

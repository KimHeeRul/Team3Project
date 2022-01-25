package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CartDAO;
import DAO.OrderDAO;
import DTO.CartDTO;
import DTO.OrderDTO;

public class DVcompleteAction implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		String url = "views/member/addrAddForm.jsp";

		int no = Integer.parseInt(request.getParameter("no"));
		OrderDAO orderdao = OrderDAO.getInstance();
		orderdao.updateDV(no, 1);// 배송완료
//		request.getRequestDispatcher(url).forward(request, response);

	}
}

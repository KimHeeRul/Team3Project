package controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CartDAO;
import DAO.ProductDAO;
import DTO.CartDTO;

public class allDelAction implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//대표 서블릿 ServiceServlet에서 넘겨받은  request,response객체를 활용해서->실제
//처리할 내용을 작성

// 중복확인 검증후->dao에서 query처리 ->저장

// 성공->main
// 실패->join
		
		
		String url = "/goobneMall/service?command=cartView";
		String id=request.getParameter("id");
		
		
		CartDAO dao = CartDAO.getInstance();
		ArrayList<CartDTO> carts= dao.getCart(id);
		for (int i = 0; i < carts.size(); i++) {
			dao.delCart(carts.get(i).getCart_no());
		}
		response.sendRedirect(url);
		
//		request.getRequestDispatcher(url).forward(request, response);
	}

}

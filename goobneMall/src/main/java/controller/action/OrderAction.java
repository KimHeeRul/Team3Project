package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CartDAO;
import DTO.CartDTO;

public class OrderAction implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//대표 서블릿 ServiceServlet에서 넘겨받은  request,response객체를 활용해서->실제
//처리할 내용을 작성

// 중복확인 검증후->dao에서 query처리 ->저장

// 성공->main
// 실패->join

		
		String cartno = request.getParameter("cartno");
		String prono = request.getParameter("prono");
		
		
	
		
		String id =request.getParameter("id");
		
		
		CartDAO dao = CartDAO.getInstance();
		dao.deltbl_buy(id);
		
		String url = "views/buy/buy.jsp";

		if (cartno==null) {
			String qnt = request.getParameter("qnt");
			dao.setBuy2(id, Integer.parseInt(qnt), Integer.parseInt(prono));
		}else {
			dao.setBuy(Integer.parseInt(cartno));
		}
		
		request.getRequestDispatcher(url).forward(request, response);

	}

}

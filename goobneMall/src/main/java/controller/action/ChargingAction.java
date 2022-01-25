package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AddrDAO;
import DAO.CartDAO;
import DAO.MemberDAO;
import DTO.AddrDTO;
import DTO.CartDTO;

public class ChargingAction implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		int money = Integer.parseInt(request.getParameter("money"));
		
		
		MemberDAO dao=MemberDAO.getInstance();

		boolean check= dao.chkOverlapId(id);
		if (check) {
		dao.moneyCharging(id, money);
		System.out.println("충전성공");
		}else {
			System.out.println("충전실패 아이디 재확인바람");
		}
		
//		String url = "/goobneMall/service?command=orderList&type=MoneyCharging";
		
//		request.getRequestDispatcher(url).forward(request, response);
		
	}
}

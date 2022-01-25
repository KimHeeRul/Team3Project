package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AddrDAO;
import DAO.CartDAO;
import DTO.AddrDTO;
import DTO.CartDTO;

public class AddrAddAction implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("log");
		String addrName = request.getParameter("addrname");
		String name = request.getParameter("addrInput_name");

		String addrNum = request.getParameter("input_addrNum");
		String addr = request.getParameter("input_nomalAddr");
		String detailAddr = request.getParameter("input_detailAddr");
		
		String PhoneFst = request.getParameter("addrAdd_PhoneFst");
		String PhoneScd = request.getParameter("addrAdd_PhoneScd");
		String PhoneTrd = request.getParameter("addrAdd_PhoneTrd");
		
		String HPhoneFst = request.getParameter("addrAdd_HPhoneFst");
		String HPhoneScd = request.getParameter("addrAdd_HPhoneScd");
		String HPhoneTrd = request.getParameter("addrAdd_HPhoneTrd");
		
		String phone =PhoneFst + "-" + PhoneScd + "-" + PhoneTrd;
		AddrDAO dao = AddrDAO.getInstance();
		AddrDTO addrDTO = null;
		
		if(HPhoneFst.equals("선택")) {
			addrDTO = new AddrDTO(id, addrName, name, addrNum, addr, detailAddr, phone, null);
			dao.addAddrHNull(addrDTO);
		}
		else {
			String HPhone =HPhoneFst + "-" + HPhoneScd + "-" + HPhoneTrd;
			addrDTO = new AddrDTO(id, addrName, name, addrNum, addr, detailAddr, phone, HPhone);
			dao.addAddr(addrDTO);
		}
		
		String url = "views/member/addr.jsp";
		
		response.sendRedirect("/goobneMall/service?command=addr");
		
//		request.getRequestDispatcher(url).forward(request, response);
		
	}
}

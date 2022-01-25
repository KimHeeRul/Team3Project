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

public class AddrUpdateAction implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("log");
		String addrName = request.getParameter("addrname");
		String name = request.getParameter("addrInput_name");

		String addrNum = request.getParameter("input_addrNum");
		String addr = request.getParameter("input_nomalAddr");
		String detailAddr = request.getParameter("input_detailAddr");
		
		String PhoneFst = request.getParameter("addrUpdate_PhoneFst");
		String PhoneScd = request.getParameter("addrUpdate_PhoneScd");
		String PhoneTrd = request.getParameter("addrUpdate_PhoneTrd");
		
		String HPhoneFst = request.getParameter("addrUpdate_HPhoneFst");
		String HPhoneScd = request.getParameter("addrUpdate_HPhoneScd");
		String HPhoneTrd = request.getParameter("addrUpdate_HPhoneTrd");
		
		int addr_no = Integer.parseInt(request.getParameter("addr_no"));
		
		System.out.println(request.getParameter("addr_no"));
		
		String phone =PhoneFst + "-" + PhoneScd + "-" + PhoneTrd;
		AddrDAO dao = AddrDAO.getInstance();
		AddrDTO addrDTO = null;
		
		if(HPhoneFst.equals("선택")) {
			addrDTO = new AddrDTO(addr_no, id, addrName, name, addrNum, addr, detailAddr, phone, null);
		}
		else {
			String HPhone =HPhoneFst + "-" + HPhoneScd + "-" + HPhoneTrd;
			addrDTO = new AddrDTO(addr_no, id, addrName, name, addrNum, addr, detailAddr, phone, HPhone);
		}
		
		dao.updateAddr(addrDTO);
		
		String url = "views/member/addr.jsp";
		
		response.sendRedirect("/goobneMall/service?command=addr");
		
//		request.getRequestDispatcher(url).forward(request, response);
		
	}
}

package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AddrDAO;
import DAO.MemberDAO;
import DTO.AddrDTO;
import DTO.MemberDTO;

public class MyInfoUpdateAction  implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		MemberDAO dao = MemberDAO.getInstance();
		
		String id = (String)session.getAttribute("log");
		
		String fstEmail = (String)request.getParameter("MyInfoInput_frsEmail");
		String scdEmail = (String)request.getParameter("MyInfoInput_scdEmail");
		
		String email = fstEmail + "@" + scdEmail;

		String newPw = (String)request.getParameter("MyInfoUp_pw2");
		
		String fstPhone = (String)request.getParameter("MyInfoInput_PhoneFst");
		String scdPhone = (String)request.getParameter("MyInfoInput_PhoneScd");
		String trdPhone = (String)request.getParameter("MyInfoInput_PhoneTrd");
		
		String phone = fstPhone +"-"+scdPhone +"-"+trdPhone;
		
		MemberDTO member = new MemberDTO(id, email, newPw, phone);
		
		dao.updateMember(member);
		
		response.sendRedirect("/goobneMall/service?command=mypage");
	}

}

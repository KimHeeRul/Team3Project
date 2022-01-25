package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import DAO.MemberDAO;
import DAO.NoticeDAO;
import DTO.MemberDTO;
import DTO.NoticeDTO;

public class MemberJoinAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				MemberDAO dao = MemberDAO.getInstance();
				// join에서 넘어온 파라미터
				
				// id : joinInput_id
				String id = request.getParameter("joinInput_id");
				
				// email :  1 : joinInput_frsEmail / 2: joinInput_scdEmail
				// 합쳐야함
				String joinInput_frsEmail = request.getParameter("joinInput_frsEmail");
				String joinInput_scdEmail = request.getParameter("joinInput_scdEmail");
				String email = joinInput_frsEmail+"@"+joinInput_scdEmail;

				// pw === pwRe :  joinInput_pw1 또는 joinInput_pw2
				// 같은값이여야만 submit 아무거나 골라도 됨
				String pw = request.getParameter("joinInput_pw1");
				
				// name : joinChkName
				String name = request.getParameter("joinInput_name");
				
				System.out.println("조인 네임 : " + name);
				
				// gender : joinGender
				String gender = request.getParameter("joinGender");
				
				// phone : 1: joinInput_PhoneFst / 2: joinInput_PhoneScd / 3: joinInput_PhoneTrd
				// 합쳐야함
				String joinInput_PhoneFst = request.getParameter("joinInput_PhoneFst");
				String joinInput_PhoneScd = request.getParameter("joinInput_PhoneScd");
				String joinInput_PhoneTrd = request.getParameter("joinInput_PhoneTrd");
				String phone = joinInput_PhoneFst+"-"+joinInput_PhoneScd+"-"+joinInput_PhoneTrd;
				
				MemberDTO member = new MemberDTO(id, email, pw, name, gender, phone);
				
				dao.addUser(member);
				
				HttpSession session = request.getSession();
				session.setAttribute("log", id);
				
				response.sendRedirect("/goobneMall/index.jsp");
	}
}

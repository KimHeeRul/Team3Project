package controller.action;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.apache.catalina.connector.Response;

import com.mysql.cj.Session;

import DAO.MemberDAO;
import DAO.NoticeDAO;
import DTO.MemberDTO;
import DTO.NoticeDTO;

public class MemberLoginAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		String url = "";
		
		 String url = "/goobneMall/index.jsp";
		
		// 파라미터 명
		// login_id
		// login_pw
		
		MemberDAO dao = MemberDAO.getInstance();
		String id = request.getParameter("login_id");
		String pw = request.getParameter("login_pw");
		
		if(dao.loginChk(id, pw)) {
			HttpSession session = request.getSession();
			session.setAttribute("log", id);
			url = "index.jsp";
			response.sendRedirect(url);
//			request.getRequestDispatcher(url).forward(request, response);
		}
		else {
			url = "views/member/memberLoginForm.jsp?alert=Y";
			request.getRequestDispatcher(url).forward(request, response);
		}
		
	}
}

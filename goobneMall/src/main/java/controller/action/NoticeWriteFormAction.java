package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NoticeWriteFormAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "views/notice/noticeWriteForm.jsp";
		// 받아오고 전달할 parameter 값 (Attribute 아님)
		// commad : noticeWriteForm
		// page : 현재 페이지값
		request.getRequestDispatcher(url).forward(request, response);
	}
}
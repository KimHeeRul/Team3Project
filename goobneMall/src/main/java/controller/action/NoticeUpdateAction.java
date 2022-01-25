package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.NoticeDAO;
import DTO.NoticeDTO;
import DTO.NoticePaging;

public class NoticeUpdateAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 받아온 request
		// page 값, command 값, n_no 값
		
		System.out.println("업데이트 액션 실행");

		
		// Notice Paging System
        int nowPage = 1;
        if(request.getParameter("page")!=null){
        	nowPage = Integer.parseInt(request.getParameter("page"));
        }
		
		int n_no = Integer.parseInt(request.getParameter("n_no"));
				
		String division = (String) request.getParameter("division");
		String title = (String) request.getParameter("title");
		String content = (String) request.getParameter("content");
		String notice_file = (String) request.getParameter("notice_file");
		content = content.replace("\r\n", "<br>"); //개행문자 치환
		
		System.out.println("Update Action Run ================");
		System.out.println("division :" + division  );
		System.out.println("title :" + title  );
		System.out.println("content :" + content  );
		System.out.println("notice_file :" + notice_file + "\n\n");
		
		NoticeDAO dao = NoticeDAO.getInstance();
		NoticeDTO notice = new NoticeDTO(division, title, content, notice_file);
		if(dao.updateNotice(notice, n_no)) {
			response.sendRedirect("views/notice/noticeView.jsp?page="+nowPage+"&n_no="+n_no);
		}
		else {
	        response.sendRedirect("views/notice/noticeList.jsp?page="+nowPage);
		}
	}
}

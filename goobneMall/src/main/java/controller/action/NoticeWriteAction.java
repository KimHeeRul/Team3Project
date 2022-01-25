package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.NoticeDAO;
import DTO.NoticeDTO;
import DTO.NoticePaging;

public class NoticeWriteAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "views/notice/noticeView.jsp";
		String division = (String) request.getParameter("division");
		String title = (String) request.getParameter("title");
		String content = (String) request.getParameter("content");
		String notice_file = (String) request.getParameter("notice_file");
		content = content.replace("\r\n", "<br>"); //개행문자 치환
		
		System.out.println("Write Action Run ================");
		System.out.println("division :" + division  );
		System.out.println("title :" + title  );
		System.out.println("content :" + content  );
		System.out.println("notice_file :" + notice_file + "\n\n");
		
		NoticeDAO dao = NoticeDAO.getInstance();
		NoticeDTO notice = new NoticeDTO(division, title, content, notice_file);
		
	    int nowPage = 1;
        if(request.getParameter("page")!=null){
        	nowPage = Integer.parseInt(request.getParameter("page"));
        }
        
        
		if(dao.addNotice(notice)) { // 추가 성공
		String sql = "SELECT * FROM notice ORDER BY n_no DESC limit  0, 1";
		notice = dao.selectOneNotice(sql);
		dao.updateNReadCount(notice); // 조회수 업데이트
		
		response.sendRedirect("views/notice/noticeView.jsp?page="+nowPage);
		}
		else {
			response.sendRedirect("views/notice/noticeList.jsp?page="+nowPage);
		}
	}
}

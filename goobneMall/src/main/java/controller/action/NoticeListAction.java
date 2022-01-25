package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.NoticeDAO;
import DTO.NoticeDTO;
import DTO.NoticePaging;

public class NoticeListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
        int nowPage = 1;
        if(request.getParameter("page")!=null){
        	nowPage = Integer.parseInt(request.getParameter("page"));
        }
        
        response.sendRedirect("views/notice/noticeList.jsp?page="+nowPage);
	}
}

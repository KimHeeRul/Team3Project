package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchAction implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//대표 서블릿 ServiceServlet에서 넘겨받은  request,response객체를 활용해서->실제
//처리할 내용을 작성

// 중복확인 검증후->dao에서 query처리 ->저장

// 성공->main
// 실패->join

		String keyword = request.getParameter("input");
		String way = request.getParameter("way");
		String url="views/search/result.jsp";

//		response.sendRedirect(url);
		request.setAttribute("keyword", keyword);
		request.setAttribute("way", way);
		request.getRequestDispatcher(url).forward(request, response);

	}

}

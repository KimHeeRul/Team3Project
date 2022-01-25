
package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CartDAO;

public class SelectDelAction implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] list=  request.getParameterValues("checkArr");

		
		CartDAO dao = CartDAO.getInstance();
		for (int i = 0; i < list.length; i++) {
			dao.delCart(Integer.parseInt(list[i]));
		}
		
		
	}

}

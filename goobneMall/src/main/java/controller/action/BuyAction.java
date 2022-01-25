package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.If;

import DAO.CartDAO;
import DAO.MemberDAO;
import DAO.OrderDAO;
import DAO.ProductDAO;
import DTO.MemberDTO;
import DTO.OrderDTO;
import DTO.ProductDTO;

public class BuyAction implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "views/buy/THXbuy.jsp";
		OrderDAO dao = OrderDAO.getInstance();
		ProductDAO prodao = ProductDAO.getInstance();
		MemberDAO memDAO = MemberDAO.getInstance();
		CartDAO cartDAO = CartDAO.getInstance();

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("log");
		String order_name = request.getParameter("order_name");
		String order_phone = request.getParameter("order_phone");
		String order_email = request.getParameter("order_email");
		String reci_name = request.getParameter("reci_name");
////////////////////////////
		String reci_p_1 = request.getParameter("reci_phoneFst");
		String reci_p_2 = request.getParameter("reci_phoneScd");
		String reci_p_3 = request.getParameter("reci_phoneTrd");

		String home_p_1 = request.getParameter("home_phoneFst");
		String home_p_2 = request.getParameter("home_phoneScd");
		String home_p_3 = request.getParameter("home_phoneTrd");

		String reci_phone = reci_p_1 + "-" + reci_p_2 + "-" + reci_p_3;
		String home_phone = home_p_1 + "-" + home_p_2 + "-" + home_p_3;
/////////////////////////
		String addrnum = request.getParameter("addrnum");
		String addr = request.getParameter("addr");
		String detailaddr = request.getParameter("detailaddr");

		String msg = request.getParameter("msg");
		String Allprice = request.getParameter("Allprice");
		String reserve = request.getParameter("reserve");
		String coupon = request.getParameter("couponValue");
		
		
		
		System.out.println("coupon:::"+coupon);

		String[] productsNo = request.getParameterValues("product");
		String[] qnts = request.getParameterValues("qnt");
		String[] cartnos = request.getParameterValues("cartno");

		ArrayList<MemberDTO> memlist = memDAO.getUsers();
		if (id == null) {
			url = "/goobneMall/index.jsp";// 잘못된 접근
			response.sendRedirect(url);
		}

		int idx = -1;
		for (int i = 0; i < memlist.size(); i++) {
			if (memlist.get(i).getId().equals(id)) {
				idx = i;
				break;
			}
		}

		MemberDTO user = null;
		if (idx != -1) {
			user = memlist.get(idx);
		} else {
			url = "/goobneMall/index.jsp";// 잘못된 접근
			response.sendRedirect(url);

		}
		int checkinven = -1;
		for (int i = 0; i < productsNo.length; i++) {
			int prono = Integer.parseInt(productsNo[i]);
			int qnt = Integer.parseInt(qnts[i]);
			if (prodao.getProduct(prono + "").getInventory() < qnt) {
				cartDAO.update(Integer.parseInt(cartnos[i]), prodao.getProduct(prono + "").getInventory());

				PrintWriter out = response.getWriter();
				response.setContentType("text/html; charset=utf-8");
				out.println("<script language='javascript'>");
				out.println("alert('현재 상품의 재고가 부족합니다.');");
				out.println("location.href = '/goobneMall/index.jsp'");
				out.println("</script>");
				out.flush();
				checkinven++;
			}
		}

		if (checkinven == -1) {

			for (int i = 0; i < productsNo.length; i++) {
				int prono = Integer.parseInt(productsNo[i]);
				int qnt = Integer.parseInt(qnts[i]);
				int cartno = 0;
				if (cartnos[i] != null) {
					cartno = Integer.parseInt(cartnos[i]);
				}
				int price=0;
					if(Integer.parseInt(coupon)==1){
						price=(Integer.parseInt(Allprice)-3000)/10;
						System.out.print(price+"ff");
					}
				
				ProductDTO productData = prodao.getProduct(prono + "");
				OrderDTO dto = new OrderDTO(id, order_email, prono, productData.getPrice()-Integer.parseInt(reserve)-price , qnt, order_name,
						order_phone, order_email, reci_name, reci_phone, home_phone, addrnum, addr, detailaddr, msg, 0);
				
				dao.addOrder(dto);
				prodao.SaleVolumeUpdate(prono, qnt);
				prodao.inventoryUpdate(prono, qnt);

				if (cartnos[i] != null) {
					cartDAO.delCart(cartno);
				}
			}

			if (Integer.parseInt(coupon) == 0) {
				if (reserve == "" || Integer.parseInt(reserve) == 0) {
					memDAO.moneyUpdate(id, Integer.parseInt(Allprice));
					memDAO.reserveadd(id, Integer.parseInt(Allprice));
					request.getRequestDispatcher(url).forward(request, response);
				} else {
					memDAO.moneyresertUpdate(id, Integer.parseInt(Allprice), Integer.parseInt(reserve));
					request.getRequestDispatcher(url).forward(request, response);
					memDAO.reserveUpdate(id, Integer.parseInt(reserve));
				
				}
			} else {
				int price=(Integer.parseInt(Allprice)-3000)*9/10;
				price+=3000;
				int value=1;
				memDAO.couponeUpdate(id, value);
				if (reserve == "" || Integer.parseInt(reserve) == 0) {
					memDAO.moneyUpdate(id, price);
					memDAO.reserveadd(id, price);
					request.getRequestDispatcher(url).forward(request, response);
				} else {
					memDAO.moneyresertUpdate(id, price, Integer.parseInt(reserve));
					request.getRequestDispatcher(url).forward(request, response);
					memDAO.reserveUpdate(id, Integer.parseInt(reserve));
				}
			}

		} else {
			url = "/goobneMall/service?command=cartView";
			request.getRequestDispatcher(url);
		}

	}

}

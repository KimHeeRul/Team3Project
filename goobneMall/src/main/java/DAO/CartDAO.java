package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;

import DTO.CartDTO;
import DTO.ProductDTO;
import util.DBManager;

public class CartDAO {
	private CartDAO() {
	}

	private static CartDAO instance = new CartDAO();

	public static CartDAO getInstance() {
		return instance;
	}

	private Connection conn = null; // DB에 연결
	private PreparedStatement pstmt = null; // sql쿼리를 excute해
	private ResultSet rs = null; // 쿼리실행 결과물을 받는 역할

	private ArrayList<CartDTO> carts = null;

	public ArrayList<CartDTO> getcartlist() {
		carts = new ArrayList<CartDTO>();

		try {
			conn = DBManager.getConnection();
			String sql = "select* from cart";
			pstmt = conn.prepareStatement(sql);// 연동된 DB에 쿼리를 날릴준비
			rs = pstmt.executeQuery();// 쿼리를 날려서 ResultSet을 반환 받음
			while (rs.next()) {
				int cart_no = rs.getInt(1);// rs는 1부터 시작함
				String id = rs.getString(2);
				int cart_count = rs.getInt(3);
				int pro_no = rs.getInt(4);
				String imgfile =rs.getString(5);
				CartDTO cart = new CartDTO(cart_no, id, cart_count, pro_no,imgfile);
				carts.add(cart);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return carts;
	}

	public ArrayList<CartDTO> getCart(String idval) { // id 값 받아서 장바구니 넘기기
		carts = new ArrayList<CartDTO>();

		try {
			conn = DBManager.getConnection();
			String sql = "select* from cart where id='"+idval+"'";
			pstmt = conn.prepareStatement(sql);// 연동된 DB에 쿼리를 날릴준비
			rs = pstmt.executeQuery();// 쿼리를 날려서 ResultSet을 반환 받음
			while (rs.next()) {
				int cart_no = rs.getInt(1);// rs는 1부터 시작함
				String id = rs.getString(2);
				int cart_count = rs.getInt(3);
				int pro_no = rs.getInt(4);
				String imgfile =rs.getString(5);
				CartDTO cart = new CartDTO(cart_no, id, cart_count, pro_no,imgfile);
				carts.add(cart);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return carts;
	}
	public CartDTO getProduct(int cartno) { // 카트넘버 값 받아서 장바구니 넘기기
		CartDTO cart=null;
		
		try {
			conn = DBManager.getConnection();
			String sql = "select* from cart where cart_no="+cartno;
			pstmt = conn.prepareStatement(sql);// 연동된 DB에 쿼리를 날릴준비
			rs = pstmt.executeQuery();// 쿼리를 날려서 ResultSet을 반환 받음
			while (rs.next()) {
				int cart_no = rs.getInt(1);// rs는 1부터 시작함
				String id = rs.getString(2);
				int cart_count = rs.getInt(3);
				int pro_no = rs.getInt(4);
				String imgfile =rs.getString(5);
				cart = new CartDTO(cart_no, id, cart_count, pro_no,imgfile);
				return cart;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cart;
}
	
	public void setBuy(int cartno) {
		CartDTO data = getProduct(cartno);
			try {
				conn = DBManager.getConnection();
				String sql = "insert into tbl_buy(cart_no,id,cart_count,pro_no) values(?,?,?,?)";// sql
				pstmt = conn.prepareStatement(sql);// 연동된 DB에 쿼리를 날릴준비
				pstmt.setString(1, data.getCart_no()+"");
				pstmt.setString(2, data.getId());
				pstmt.setInt(3, data.getCart_count());
				pstmt.setInt(4, data.getPro_no());
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
	public void setBuy2(String id,int qnt,int prono) {
			try {
				conn = DBManager.getConnection();
				String sql = "insert into tbl_buy(cart_no,id,cart_count,pro_no) values(?,?,?,?)";// sql
				pstmt = conn.prepareStatement(sql);// 연동된 DB에 쿼리를 날릴준비
				pstmt.setString(1, "0");
				pstmt.setString(2, id);
				pstmt.setInt(3, qnt);
				pstmt.setInt(4, prono);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
	

	public ArrayList<CartDTO> getBuy(String idval) { // id 값 받아서 장바구니 넘기기
		carts = new ArrayList<CartDTO>();

		try {
			conn = DBManager.getConnection();
			String sql = "select* from tbl_buy where id='"+idval+"'";
			pstmt = conn.prepareStatement(sql);// 연동된 DB에 쿼리를 날릴준비
			rs = pstmt.executeQuery();// 쿼리를 날려서 ResultSet을 반환 받음
			while (rs.next()) {
				int buy_no = rs.getInt(1);// rs는 1부터 시작함
				int cart_no = rs.getInt(2);// rs는 1부터 시작함
				String id = rs.getString(3);
				int cart_count = rs.getInt(4);
				int pro_no = rs.getInt(5);
				CartDTO cart = new CartDTO(buy_no, cart_no, id, cart_count, pro_no);
				carts.add(cart);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return carts;
	}
	
	public void setCart(String id, int cart_count, int pro_no,String imgfile) {
		ArrayList<CartDTO> check = getCart(id);
		int idx = -1;
		int idx2 = -1;
		for (int i = 0; i < check.size(); i++) {
			if (check.get(i).getPro_no() == pro_no) {
				idx =check.get(i).getCart_no();
				idx2=i;
			}
		}
		if (idx == -1) {
			try {
				conn = DBManager.getConnection();
				String sql = "insert into cart(id,cart_count,pro_no,imgfile) values(?,?,?,?)";// sql
				pstmt = conn.prepareStatement(sql);// 연동된 DB에 쿼리를 날릴준비
				pstmt.setString(1, id);
				pstmt.setInt(2, cart_count);
				pstmt.setInt(3, pro_no);
				pstmt.setString(4, imgfile);
				pstmt.executeUpdate();
				System.out.println("추가성공");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.print(idx+"1");
			System.out.print( check.get(idx2).getCart_count()+cart_count+"2");
			update(idx, check.get(idx2).getCart_count()+cart_count);

		}
	}
	
	

	public void delCart(int cart_no) {

		try {
			conn = DBManager.getConnection();
			String sql = "delete from cart where cart_no='" + cart_no + "';";

			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deltbl_buy(String id) {
		try {	
			conn = DBManager.getConnection();
			String sql = "delete from tbl_buy where id='" + id + "'";
			System.out.println(id);
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
	public void update(int no, int qnt) {
		try {
			conn = DBManager.getConnection();
			String sql = "update cart set cart_count=? where cart_no=" + no;
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnt);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

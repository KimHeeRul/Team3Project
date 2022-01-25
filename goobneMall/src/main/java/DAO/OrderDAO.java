package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.MemberDTO;
import DTO.NoticeDTO;
import DTO.OrderDTO;
import DTO.ProductDTO;
import util.DBManager;

public class OrderDAO {
	private Connection conn = null; // DB에 연결
	private PreparedStatement pstmt = null; // sql쿼리를 excute해
	private ResultSet rs = null; // 쿼리실행 결과물을 받는 역할

	// 싱글톤 패턴 처리
	private OrderDAO() {}
	private static OrderDAO instance = new OrderDAO();
	public static OrderDAO getInstance() {
		return instance;
	}

	
	// 맴버 리스트
	private ArrayList<OrderDTO> orders = null;

	
	
	public ArrayList<OrderDTO> getOrder(String idval) {
		orders = new ArrayList<OrderDTO>();

		try {
			conn = DBManager.getConnection();
			String sql = "select* from pro_order where id='" + idval+"'";
			pstmt = conn.prepareStatement(sql);// 연동된 DB에 쿼리를 날릴준비
			rs = pstmt.executeQuery();// 쿼리를 날려서 ResultSet을 반환 받음
			while (rs.next()) {
				int order_no = rs.getInt(1);// rs는 1부터 시작함
				String id = rs.getString(2);
				String email = rs.getString(3);
				int pro_no = rs.getInt(4);
				int pro_price = rs.getInt(5);
				int pro_count = rs.getInt(6);
				String order_name = rs.getString(7);
				String order_phone = rs.getString(8);
				String order_email = rs.getString(9);
				String reci_name = rs.getString(10);
				String reci_phone = rs.getString(11);
				String home_phone = rs.getString(12);
				String addrnum = rs.getString(13);
				String addr = rs.getString(14);
				String detailaddr = rs.getString(15);
				String msg = rs.getString(16);
				Date order_date = this.rs.getDate(17);
				int delivery = rs.getInt(18);
				OrderDTO order = new OrderDTO(order_no, id, email, pro_no, pro_price, pro_count, order_name, order_phone, order_email, reci_name, reci_phone, home_phone, addrnum, addr, detailaddr, msg, order_date, delivery);
				orders.add(order);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return orders;
	}

	
	/////////////////////////////////////////////////////주문
	public boolean addOrder(OrderDTO order) {
		try {
			this.conn = DBManager.getConnection();
			String sql = "insert into pro_order(id,email,pro_no,pro_price,pro_count,order_name,order_phone,order_email"
					+ ",reci_name,reci_phone,home_phone,addrnum,addr,detailaddr,msg,delivery) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, order.getId());
			this.pstmt.setString(2, order.getEmail());
			this.pstmt.setInt(3, order.getPro_no());
			this.pstmt.setInt(4, order.getPro_price());
			this.pstmt.setInt(5, order.getPro_count());
			this.pstmt.setString(6, order.getOrder_name());
			this.pstmt.setString(7, order.getOrder_phone());
			this.pstmt.setString(8, order.getOrder_email());
			this.pstmt.setString(9, order.getReci_name());
			this.pstmt.setString(10, order.getReci_phone());
			this.pstmt.setString(11, order.getHome_phone());
			this.pstmt.setString(12, order.getAddrnum());
			this.pstmt.setString(13, order.getAddr());
			this.pstmt.setString(14, order.getDetailaddr());
			this.pstmt.setString(15, order.getMsg());
			this.pstmt.setInt(16, order.getDelivery());
			this.pstmt.executeUpdate();
			System.out.println("구입성공");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	public void updateDV(int no,int set) {
		try {
			conn = DBManager.getConnection();
			String sql = "update pro_order set delivery=? where order_no=" + no;
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, set);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 회원 탈퇴를 위한 order 체크
	
	public boolean chkOrder(String id) {
		try {
			this.conn = DBManager.getConnection();
			String sql = "select* from pro_order where id=? AND delivery = 0";
			this.pstmt = this.conn.prepareStatement(sql);// 연동된 DB에 쿼리를 날릴준비
			this.pstmt.setString(1, id);
			this.rs = this.pstmt.executeQuery();// 쿼리를 날려서 ResultSet을 반환 받음
			while (this.rs.next()) {
				System.out.println("회원탈퇴 체크 되는지 확인");
				return false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
	// Order Total Count
	public int totalCnt(String id) {
		int totalCnt = 0;
		try {
			this.conn = DBManager.getConnection();
			String sql = String.format("select count(*) as totalCount from pro_order Where id = \"%s\"",id);
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery(sql);
			while (this.rs.next()) {
				totalCnt = this.rs.getInt(1);
			}
			System.out.println("total Counting 성공");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return totalCnt;
	}

	// Paging에 사용될 sql 값에 따른 호출 메서드
	public ArrayList<OrderDTO> selectOrder(String sql) {
		this.orders = new ArrayList<OrderDTO>();
		try {
			this.conn = DBManager.getConnection();
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery(sql);

			while (rs.next()) {
				int order_no = rs.getInt(1);// rs는 1부터 시작함
				String id = rs.getString(2);
				String email = rs.getString(3);
				int pro_no = rs.getInt(4);
				int pro_price = rs.getInt(5);
				int pro_count = rs.getInt(6);
				String order_name = rs.getString(7);
				String order_phone = rs.getString(8);
				String order_email = rs.getString(9);
				String reci_name = rs.getString(10);
				String reci_phone = rs.getString(11);
				String home_phone = rs.getString(12);
				String addrnum = rs.getString(13);
				String addr = rs.getString(14);
				String detailaddr = rs.getString(15);
				String msg = rs.getString(16);
				Date order_date = this.rs.getDate(17);
				int delivery = rs.getInt(18);
				OrderDTO order = new OrderDTO(order_no, id, email, pro_no, pro_price, pro_count, order_name, order_phone, order_email, reci_name, reci_phone, home_phone, addrnum, addr, detailaddr, msg, order_date, delivery);
				this.orders.add(order);
			}
			System.out.println("sql pro_order read 성공");
			return this.orders;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
		
}

package DAO;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;

import com.mysql.cj.log.Log;

import DTO.AddrDTO;
import util.*;

public class AddrDAO {
	private Connection conn = null; // DB에 연결
	private PreparedStatement pstmt = null; // sql쿼리를 excute해
	private ResultSet rs = null; // 쿼리실행 결과물을 받는 역할

	// 싱글톤 패턴 처리
	private AddrDAO() {}
	private static AddrDAO instance = new AddrDAO();
	public static AddrDAO getInstance() {
		return instance;
	}

	
	// 맴버 리스트
	ArrayList<AddrDTO> addrs = new ArrayList<AddrDTO>();
	
	
	// CRUD
	
	// CREATE
	
	// default 값 제외한 add
	public boolean addAddr(AddrDTO user) {
		try {
			this.conn = DBManager.getConnection();
			String sql = "insert into address(id,addrname,name,addrNum,addr,detailAddr,phone,hphone) values(?,?,?,?,?,?,?,?)";// sql
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, user.getId());
			this.pstmt.setString(2, user.getAddrname());
			this.pstmt.setString(3, user.getName());
			this.	pstmt.setString(4, user.getAddrNum());
			this.pstmt.setString(5, user.getAddr());
			this.pstmt.setString(6, user.getDetailAddr());
			this.pstmt.setString(7, user.getPhone());
			this.pstmt.setString(8, user.getHphone());
			this.pstmt.executeUpdate();
			System.out.println("addr 등록 성공");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean addAddrHNull(AddrDTO user) {
		try {
			this.conn = DBManager.getConnection();
			String sql = "insert into address(id,addrname,name,addrNum,addr,detailAddr,phone) values(?,?,?,?,?,?,?)";// sql
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, user.getId());
			this.pstmt.setString(2, user.getAddrname());
			this.pstmt.setString(3, user.getName());
			this.	pstmt.setString(4, user.getAddrNum());
			this.pstmt.setString(5, user.getAddr());
			this.pstmt.setString(6, user.getDetailAddr());
			this.pstmt.setString(7, user.getPhone());
			this.pstmt.executeUpdate();
			System.out.println("addr HNull등록 성공");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	
	// READ
	
	
	// 전체 addr 목록 가져오기
	public ArrayList<AddrDTO> getAddress() {
		System.out.println("getAddress Start -----------------------------");
		this.addrs = new ArrayList<AddrDTO>();
		try {
			this.conn = DBManager.getConnection();
			String sql = "select * from address"; // 멤버 table에 있는 데이터 전부 선택
			this.pstmt = this.conn.prepareStatement(sql);// 연동된 DB에 쿼리를 날릴준비
			this.rs = this.pstmt.executeQuery();// 쿼리를 날려서 ResultSet을 반환 받음
			while (rs.next()) { // 파일 처리에서 쓰던 readLine 과 유사
				System.out.println("getAddress 데이터 있음 -----------------------------");
				// rs는 1부터 시작함
				int addr_no = this.rs.getInt(1);
				String id = this.rs.getString(2);
				String addrname = this.rs.getString(3);
				String name = this.rs.getString(4);
				String addrNum = this.rs.getString(5);
				String addr = this.rs.getString(6);
				String detailAddr = this.rs.getString(7);
				String phone = this.rs.getString(8);
				String hphone = this.rs.getString(9);
				Date addrd8 = this.rs.getDate(10);
				
				AddrDTO addrDTO = new AddrDTO(addr_no, id, addrname, name, addrNum, addr, detailAddr, phone, hphone, addrd8);
				this.addrs.add(addrDTO);
			}
			return this.addrs;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}


	// ID에 맞는 addr 값 가져오기
	public ArrayList<AddrDTO> chkOverlapId(String id) {
		
		getAddress();
		
		ArrayList<AddrDTO> resultAddr = new ArrayList<AddrDTO>();
		
		System.out.println("addrs.length" + addrs.size());
		System.out.println("checkAddr");
		for (AddrDTO addr : this.addrs) {
			if (id.equals(addr.getId())) {
				System.out.println("checkAddr 데이터 있음");
				resultAddr.add(addr);
			}
		}
		
		if(resultAddr.size() == 0) {
			System.out.println("checkAddr 데이터 없음");
			return null;
		}
		else {
			return resultAddr;
		}
	}
	
	// ID에 맞는 addr 값 1개 가져오기
	public AddrDTO chkNearAddr(String input_id) {
		try {
			this.conn = DBManager.getConnection();
			String sql = "SELECT * FROM address WHERE id =? ORDER BY addrd8 DESC limit  0, 1";
			this.pstmt = this.conn.prepareStatement(sql);// 연동된 DB에 쿼리를 날릴준비
			this.pstmt.setString(1, input_id);
			this.rs = this.pstmt.executeQuery();// 쿼리를 날려서 ResultSet을 반환 받음

			while (rs.next()) { // 파일 처리에서 쓰던 readLine 과 유사
				// rs는 1부터 시작함
				int addr_no = this.rs.getInt(1);
				String id = this.rs.getString(2);
				String addrname = this.rs.getString(3);
				String name = this.rs.getString(4);
				String addrNum = this.rs.getString(5);
				String addr = this.rs.getString(6);
				String detailAddr = this.rs.getString(7);
				String phone = this.rs.getString(8);
				String hphone = this.rs.getString(9);
				Date addrd8 = this.rs.getDate(10);
				
				AddrDTO addrDTO = new AddrDTO(addr_no, id, addrname, name, addrNum, addr, detailAddr, phone, hphone, addrd8);
				
				return addrDTO;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	
	// addr_no에 맞는 addr 값 가져오기
	public AddrDTO chkOverlapNo(int addr_no) {
		
		getAddress();
		
		AddrDTO resultAddr = null;
		
		for (AddrDTO addr : this.addrs) {
			if (addr.getAddr_no() == addr_no) {
				System.out.println("checkAddr 데이터 있음");
				resultAddr = addr;
				return resultAddr;
			}
		}
		
		System.out.println("checkAddr 데이터 없음");
		return null;
	}
	
	// UPDATE
	
	// default 값 제외한 add
		public boolean updateAddr(AddrDTO user) {
			try {
				this.conn = DBManager.getConnection();
				String sql = "UPDATE address SET addrname = ?, name = ?, addrNum = ?, addr = ?, detailAddr = ?, phone = ?, hphone = ?, addrd8 = now() WHERE addr_no=?";
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, user.getAddrname());
				this.pstmt.setString(2, user.getName());
				this.	pstmt.setString(3, user.getAddrNum());
				this.pstmt.setString(4, user.getAddr());
				this.pstmt.setString(5, user.getDetailAddr());
				this.pstmt.setString(6, user.getPhone());
				this.pstmt.setString(7, user.getHphone());
				this.pstmt.setInt(8, user.getAddr_no());
				this.pstmt.executeUpdate();
				System.out.println("addr 수정 성공");
				return true;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return false;
		}

	
	
	// DELETE
	
	// ID 만 확인하고 전체 삭제
	public boolean delAddr(String id) {
			try {
				this.conn = DBManager.getConnection();
				String sql = "delete from address where id=?";
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, id);
				this.pstmt.executeUpdate();
				System.out.println("배송지 전체 삭제 완료");
				return true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		return false;
	}
	
	// addr_no 확인 하고 삭제
	
	public boolean delAddr(int addr_no) {
			try {
				this.conn = DBManager.getConnection();
				String sql = "DELETE from address where addr_no=?";
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setInt(1, addr_no);
				this.pstmt.executeUpdate();
				System.out.println("배송지 선택 삭제 완료");
				return true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		return false;
	}
	
}

package DAO;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;

import DTO.MemberDTO;
import DTO.ProductDTO;
import util.*;

public class MemberDAO {
	private Connection conn = null; // DB에 연결
	private PreparedStatement pstmt = null; // sql쿼리를 excute해
	private ResultSet rs = null; // 쿼리실행 결과물을 받는 역할

	// 싱글톤 패턴 처리
	private MemberDAO() {}
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		System.out.println("1");
		return instance;
	}

	
	// 맴버 리스트
	ArrayList<MemberDTO> users = new ArrayList<MemberDTO>();
	
	
	// CRUD
	
	// CREATE
	
	// default 값 제외한 add
	public boolean addUser(MemberDTO user) {
		try {
			this.conn = DBManager.getConnection();
			String sql = "insert into member(id,email,pwd,name,phone,gender) values(?,?,?,?,?,?)";// sql
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, user.getId());
			this.pstmt.setString(2, user.getEmail());
			this.pstmt.setString(3, user.getPwd());
			this.pstmt.setString(4, user.getName());
			this.pstmt.setString(5, user.getPhone());
			this.pstmt.setString(6, user.getGender());
			this.pstmt.executeUpdate();
			System.out.println("회원가입성공");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	
	// READ
	
	
	// 전체 맴버 목록 가져오기
		public ArrayList<MemberDTO> getUsers() {
			this.users = new ArrayList<MemberDTO>();
			System.out.println("user startline");
			try {
				this.conn = DBManager.getConnection();
				String sql = "select * from member"; // 멤버 table에 있는 데이터 전부 선택
				this.pstmt = this.conn.prepareStatement(sql);// 연동된 DB에 쿼리를 날릴준비
				this.rs = this.pstmt.executeQuery();// 쿼리를 날려서 ResultSet을 반환 받음
				while (rs.next()) { // 파일 처리에서 쓰던 readLine 과 유사
					// rs는 1부터 시작함
					System.out.println("user tryinside");
					String id = this.rs.getString(1);
					String email = this.rs.getString(2);
					String pwd = this.rs.getString(3);
					String name = this.rs.getString(4);
					String phone = this.rs.getString(5);
					String address = this.rs.getString(6);
					int mileage = this.rs.getInt(7);
					int coupon = this.rs.getInt(8);
					int reserve = this.rs.getInt(9);
					
					String gender = this.rs.getString(10);
					Date regd8 = this.rs.getDate(11);
					Date eregd8 = this.rs.getDate(12);

					MemberDTO user = new MemberDTO(id, email, pwd, name, phone, address, mileage, coupon, reserve, gender,
							regd8, eregd8);
					this.users.add(user);
				}
				System.out.println("user nope tryinside");
				return this.users;

			} catch (Exception e) {

				e.printStackTrace();
			}
			System.out.println("user null");
			return null;
		}
	
		// ID 값으로 멤버 받아오기
		public MemberDTO getUser(String input_id) {
			try {
				this.conn = DBManager.getConnection();
				String sql = "select * from member Where id = ?"; // 멤버 table에 있는 데이터 전부 선택
				this.pstmt = this.conn.prepareStatement(sql);// 연동된 DB에 쿼리를 날릴준비
				this.pstmt.setString(1, input_id);
				this.rs = this.pstmt.executeQuery();// 쿼리를 날려서 ResultSet을 반환 받음
				while (rs.next()) { // 파일 처리에서 쓰던 readLine 과 유사
					// rs는 1부터 시작함
					String id = this.rs.getString(1);
					String email = this.rs.getString(2);
					String pwd = this.rs.getString(3);
					String name = this.rs.getString(4);
					String phone = this.rs.getString(5);
					String address = this.rs.getString(6);
					int mileage = this.rs.getInt(7);
					int coupon = this.rs.getInt(8);
					int reserve = this.rs.getInt(9);
					String gender = this.rs.getString(10);
					Date regd8 = this.rs.getDate(11);
					Date eregd8 = this.rs.getDate(12);

					MemberDTO user = new MemberDTO(id, email, pwd, name, phone, address, mileage,coupon,reserve, gender, regd8, eregd8);
					System.out.println("id로 맴버 받아오기 성공");
					return user;
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return null;
		}

	// ID 중복 체크
	public boolean chkOverlapId(String id) {
		System.out.println("checkJoin");
		getUsers();
		for (MemberDTO user : this.users) {
			if (id.equals(user.getId())) {
				System.out.println("같은 ID의 데이터 있음");
				return true;
			}
		}
		System.out.println("중복아님");
		return false;
	}
	
	// 로그인을 위한 ID, PW 체크
	public boolean loginChk(String id, String pw) {
		
		try {
			int cnt = 0;
			this.conn = DBManager.getConnection();
			String sql = "SELECT * FROM  member where id =? AND pwd = ?";
			this.pstmt = this.conn.prepareStatement(sql);// 연동된 DB에 쿼리를 날릴준비
			this.pstmt.setString(1, id);
			this.pstmt.setString(2, pw);
			this.rs = this.pstmt.executeQuery();// 쿼리를 날려서 ResultSet을 반환 받음
			
			while (rs.next()) { // 파일 처리에서 쓰던 readLine 과 유사
				cnt ++;
			}

			if(cnt == 1) {
				return true;
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	
	
	
	// 이메일 중복 확인을 위한 ArrayList 만들기
	public ArrayList<String> getUsersEmail() {
		
		ArrayList<String> memberEmail = new ArrayList<String>();
		
		try {
			this.conn = DBManager.getConnection();
			String sql = "select email from member"; // 멤버 table에 있는 데이터 전부 선택
			this.pstmt = this.conn.prepareStatement(sql);// 연동된 DB에 쿼리를 날릴준비
			this.rs = this.pstmt.executeQuery();// 쿼리를 날려서 ResultSet을 반환 받음
			while (rs.next()) { // 파일 처리에서 쓰던 readLine 과 유사
				// rs는 1부터 시작함
				String email = this.rs.getString(1);

				memberEmail.add(email);
			}
			return memberEmail;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	
	
	// UPDATE
	
	// 마이페이지 개인정보 수정을 위한 UPDATE 처리  220119 업데이트
	
	
	public void updateMember(MemberDTO member) {
		try {
			this.conn = DBManager.getConnection();
			String sql = "update member set email=?, pwd=?, phone =?, eregd8 = now()  where id = ?";
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, member.getEmail());
			this.pstmt.setString(2, member.getPwd());
			this.pstmt.setString(3, member.getPhone());
			this.pstmt.setString(4, member.getId());
			this.pstmt.executeUpdate();
			System.out.println("개인정보 수정 완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	// DELETE
	
	// ID 만 확인하고 삭제
	public boolean delMember(String id) {
			try {
				this.conn = DBManager.getConnection();
				String sql = "delete from member where id=?";
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, id);
				this.pstmt.executeUpdate();
				System.out.println("회원탈퇴 완료");
				return true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		return false;
	}
	
	// ID, PW 둘 다 확인 하고 삭제
	
	public boolean delMember(String id, String pw) {
			try {
				this.conn = DBManager.getConnection();
				String sql = "DELETE from member where id=? AND pwd=?";
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, id);
				this.pstmt.setString(2, pw);
				this.pstmt.executeUpdate();
				System.out.println("회원탈퇴 완료");
				return true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		return false;
	}
	//////////////////////////////////멤버dao 추가
	
	//////////////////////////////////멤버dao 추가
	
	public void moneyresertUpdate(String id, int price,int reserve) {

		try {
			conn = DBManager.getConnection();
			String sql = "SELECT * FROM  member where id='" + id + "'";
			pstmt = conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery();
			int mileage = 0;

			while (rs.next()) {
				mileage = this.rs.getInt(7);
	
			}
			String sql2 = "update member set mileage=? where id='" + id + "'";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, mileage - price + reserve);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void moneyUpdate(String id, int price) {

		try {
			conn = DBManager.getConnection();
			String sql = "SELECT * FROM  member where id='" + id + "'";
			pstmt = conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery();
			int mileage = 0;

			while (rs.next()) {
				mileage = this.rs.getInt(7);
	
			}
			String sql2 = "update member set mileage=? where id='" + id + "'";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, mileage - price);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void reserveUpdate(String id, int price) {

		try {
			conn = DBManager.getConnection();
			String sql = "SELECT * FROM  member where id='" + id + "'";
			pstmt = conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery();
			int reserve = 0;

			while (rs.next()) {
				reserve = this.rs.getInt(9);
	
			}
			String sql2 = "update member set reserve=? where id='" + id + "'";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, reserve - price);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void reserveadd(String id, int allprice) {
		try {
			conn = DBManager.getConnection();
			String sql = "SELECT * FROM  member where id='" + id + "'";
			pstmt = conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery();
			int reserve = 0;
			
			int addreserve = allprice/10;
			System.out.println("sddreserve"+addreserve);
			while (rs.next()) {
				reserve = this.rs.getInt(9);
	
			}
			String sql2 = "update member set reserve=? where id='" + id + "'";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, reserve + addreserve);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void couponeUpdate(String id, int value) {
		try {
			conn = DBManager.getConnection();
			String sql = "SELECT * FROM  member where id='" + id + "'";
			pstmt = conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery();
			int coupon = 0;
			

			while (rs.next()) {
				coupon = this.rs.getInt(8);
	
			}
			String sql2 = "update member set coupon=? where id='" + id + "'";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, coupon - value);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	
////////////////////////////////01.20
	public void moneyCharging(String id, int money) {

		try {
			conn = DBManager.getConnection();
			String sql = "SELECT * FROM  member where id='" + id + "'";
			pstmt = conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery();
			int mileage = 0;

			while (rs.next()) {
				mileage = this.rs.getInt(7);
	
			}
			String sql2 = "update member set mileage=? where id='" + id + "'";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, mileage + money);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
}

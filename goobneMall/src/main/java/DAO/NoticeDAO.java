package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DTO.NoticeDTO;
import DTO.NoticePaging;
import util.DBManager;

public class NoticeDAO {
	// singleton pattern

	private NoticeDAO() {
	}

	private static NoticeDAO instance = new NoticeDAO();

	public static NoticeDAO getInstance() {
		return instance;
	}

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	ArrayList<NoticeDTO> notices = new ArrayList<NoticeDTO>();
	NoticePaging paging = new NoticePaging();
	
	// CRUD

	// Create

	public boolean addNotice(NoticeDTO notice) {
		System.out.println("dao notice Add 메소드 인");
		try {
			this.conn = DBManager.getConnection();
			String sql = "insert into notice(division, title, content, notice_file) values(?,?,?,?)";
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, notice.getDivision());
			this.pstmt.setString(2, notice.getTitle());
			this.pstmt.setString(3, notice.getContent());
			this.pstmt.setString(4, notice.getNotice_file());
			this.pstmt.executeUpdate();
			System.out.println("\n공지작성 완료\n");
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}

	
	
	
	// Read
	
	// Notice DB 전부 호출 
	public ArrayList<NoticeDTO> selectAllNotice() {
		this.notices = new ArrayList<NoticeDTO>();
		try {
			this.conn = DBManager.getConnection();
			String sql = "select * from notice";
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery(sql);

			while (this.rs.next()) {
				int n_no = this.rs.getInt(1);
				String division = this.rs.getString(2);
				String title = this.rs.getString(3);
				String content = this.rs.getString(4);
				Date regd8 = this.rs.getDate(5);
				String notice_file = this.rs.getString(6);
				int readcount = this.rs.getInt(7);
				NoticeDTO notice = new NoticeDTO(n_no, division, title, content, regd8, notice_file, readcount);
				this.notices.add(notice);
			}
			System.out.println("notice read 성공");
			return this.notices;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	
	
	// Notice View 에서 사용될 n_no에 따른 호출 메서드
	public NoticeDTO selectNotice(int in_n_no) {
		try {
			NoticeDTO notice;
			this.conn = DBManager.getConnection();
			String sql = "select * from notice where n_no="+in_n_no;
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery(sql);
			System.out.println("n_no 쿼리 날리기");
			while (this.rs.next()) {
				int n_no = this.rs.getInt(1);
				String division = this.rs.getString(2);
				String title = this.rs.getString(3);
				String content = this.rs.getString(4);
				Date regd8 = this.rs.getDate(5);
				String notice_file = this.rs.getString(6);
				int readcount = this.rs.getInt(7);
				notice = new NoticeDTO(n_no, division, title, content, regd8, notice_file, readcount);
				System.out.println("n_no notice read 성공");
				return notice;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	
	// WriteAction 에서 sql 받아서 notice 한개 리턴
	public NoticeDTO selectOneNotice(String sql) {
		NoticeDTO notice = null;
		try {
			this.conn = DBManager.getConnection();
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery(sql);
			
			while (this.rs.next()) {
				int n_no = this.rs.getInt(1);
				String division = this.rs.getString(2);
				String title = this.rs.getString(3);
				String content = this.rs.getString(4);
				Date regd8 = this.rs.getDate(5);
				String notice_file = this.rs.getString(6);
				int readcount = this.rs.getInt(7);
				notice = new NoticeDTO(n_no, division, title, content, regd8, notice_file, readcount);
			}
			return notice;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	// Paging에 사용될 sql 값에 따른 호출 메서드
	public ArrayList<NoticeDTO> selectNotice(String sql) {
		this.notices = new ArrayList<NoticeDTO>();
		try {
			this.conn = DBManager.getConnection();
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery(sql);
			
			while (this.rs.next()) {
				int n_no = this.rs.getInt(1);
				String division = this.rs.getString(2);
				String title = this.rs.getString(3);
				String content = this.rs.getString(4);
				Date regd8 = this.rs.getDate(5);
				String notice_file = this.rs.getString(6);
				int readcount = this.rs.getInt(7);
				NoticeDTO notice = new NoticeDTO(n_no, division, title, content, regd8, notice_file, readcount);
				this.notices.add(notice);
			}
			System.out.println("sql notice read 성공");
			return this.notices;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

	
	// Notice Total Count
	public int totalCnt() {
		int totalCnt = 0;
		try {
			this.conn = DBManager.getConnection();
			String sql = "select count(*) as totalCount from notice";
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery(sql);
			while(this.rs.next()) {
				totalCnt = this.rs.getInt(1);
			}
			System.out.println("total Counting 성공");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return totalCnt;
	}
	
	
	
	
	// Update

	// 제목, 내용, 분류, 파일 수정된 notice와 n_no로 업데이트
	public boolean updateNotice(NoticeDTO notice, int n_no) {
		try {
			this.conn = DBManager.getConnection();
			String sql = "UPDATE notice SET division = ?, title = ?, content = ?, notice_file = ? WHERE n_no=?";
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, notice.getDivision());
			this.pstmt.setString(2, notice.getTitle());
			this.pstmt.setString(3, notice.getContent());
			this.pstmt.setString(4, notice.getNotice_file());
			this.pstmt.setInt(5, n_no);
			this.pstmt.executeUpdate();
			System.out.println("notice 객체 업데이트 완료");
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}

	public boolean updateNReadCount(NoticeDTO notice) {
		try {
			this.conn = DBManager.getConnection();
			String sql = "UPDATE notice SET readcount = readcount+1 WHERE n_no=?";
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, notice.getN_no());
			this.pstmt.executeUpdate();
			System.out.println("notice 조회수 업데이트 완료");
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean updateNReadCount(int n_no) {
		try {
			this.conn = DBManager.getConnection();
			String sql = "UPDATE notice SET readcount = readcount+1 WHERE n_no=?";
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, n_no);
			this.pstmt.executeUpdate();
			System.out.println("n_no 조회수 업데이트 완료");
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}

	
	
	
	// Delete
	
	// n_no 받아서 삭제
	public boolean deleteNotice(int n_no) {
		try {
			this.conn = DBManager.getConnection();
			String sql = "DELETE FROM notice WHERE n_no=?";
			this.pstmt = conn.prepareStatement(sql);
			this.pstmt.setInt(1, n_no);
			this.pstmt.executeUpdate();
			System.out.println("삭제 성공");
			return true;
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}

	
	
	
	
	//  Reverse Sort
	
	public ArrayList<NoticeDTO> reverseSort() {
		ArrayList<NoticeDTO> reverse = new ArrayList<NoticeDTO>(); // 역방향 정렬 객체
		
		selectAllNotice();
		
		for(int i = this.notices.size() -1; i >= 0; i--) {
			reverse.add(this.notices.get(i));
		}
		
		return reverse;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}

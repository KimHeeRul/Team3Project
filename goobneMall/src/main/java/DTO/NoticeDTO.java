package DTO;

import java.sql.Date;
import java.sql.Timestamp;

public class NoticeDTO {
	private int n_no, readcount;
	private String division, title, content, notice_file;
	private Date regd8;
	
	private NoticeDTO() {}
	
	public NoticeDTO(int n_no, String division, String title, String content, Date regd8, String notice_file, int readcount) {
		this.n_no = n_no;
		this.division =division;
		this.title = title;
		this.content = content;
		this.regd8 = regd8;
		this.notice_file = notice_file;
		this.readcount = readcount;
	}
	
	public NoticeDTO(String division, String title, String content, String notice_file) {
		this.division =division;
		this.title = title;
		this.content = content;
		this.notice_file = notice_file;
	}
	
	public int getN_no() {
		return n_no;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegd8() {
		return regd8;
	}
	public String getNotice_file() {
		return notice_file;
	}
	public void setNotice_file(String notice_file) {
		this.notice_file = notice_file;
	}
	
	
}

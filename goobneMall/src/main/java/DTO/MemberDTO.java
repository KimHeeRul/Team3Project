package DTO;

import java.sql.Date;

public class MemberDTO {
	private String id; // primary Key
	private String email; // 필수 값 아님
	private String pwd; // 나머지는 다 not null
	private String name;
	private String phone;
	private String address;
	private int mileage; // 마일리지
	private int coupon; // 쿠폰
	private int reserve;// 예치금
	private String gender;
	private Date regd8; // 생성 날짜
	private Date eregd8; // 정보 수정 날짜

	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	// 전체 맴버 생성자
	public MemberDTO(String id, String email, String pwd, String name, String phone, String address, int mileage,
			int coupon, int reserve, String gender, Date regd8, Date eregd8) {
		// TODO Auto-generated constructor stub
		this.id = id;
		this.email = email;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.mileage = mileage;
		this.coupon = coupon;
		this.reserve = reserve;
		this.gender = gender;
		this.regd8 = regd8;
		this.eregd8 = eregd8;
	}

	// DEFAULT 값이 있는 생성날짜 뺀 생성자
	public MemberDTO(String id, String email, String pwd, String name, String phone, String address, int mileage,
			int coupon, int reserve, String gender, Date eregd8) {
		// TODO Auto-generated constructor stub
		this.id = id;
		this.email = email;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.mileage = mileage;
		this.coupon = coupon;
		this.reserve = reserve;
		this.gender = gender;
		this.eregd8 = eregd8;
	}

	// DEFAULT 값이 있는 생성날짜 뺀 생성자
	public MemberDTO(String id, String email, String pwd, String name, String gender, String phone) {
		// TODO Auto-generated constructor stub
		this.id = id;
		this.email = email;
		this.pwd = pwd;
		this.name = name;
		this.gender = gender;
		this.phone = phone;
	}

	// 개인정보 수정시 필요한 생성자 220119 업데이트
	public MemberDTO(String id, String email, String pwd, String phone) {
		// TODO Auto-generated constructor stub
		this.id = id;
		this.email = email;
		this.pwd = pwd;
		this.phone = phone;
	}
	
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getEregd8() {
		return eregd8;
	}

	public void setEregd8(Date eregd8) {
		this.eregd8 = eregd8;
	}

	public String getId() {
		return id;
	}

	public Date getRegd8() {
		return regd8;
	}
	public int getCoupon() {
		return coupon;
	}

	public void setCoupon(int coupon) {
		this.coupon = coupon;
	}

	public int getReserve() {
		return reserve;
	}

	public void setReserve(int reserve) {
		this.reserve = reserve;
	}
	
}

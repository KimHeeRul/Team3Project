package DTO;

import java.sql.Date;

public class AddrDTO {
	private int addr_no;
	private String id, addrname, name, addrNum, addr, detailAddr, phone, hphone;
	private Date addrd8;
	
	// DBMS에서 전체로 가져올 때
	public AddrDTO(int addr_no, String id, String addname, String name, String addrNum, String addr, String detailAddr,String phone, String hphone, Date addrd8) {
		// TODO Auto-generated constructor stub
		this.addr_no = addr_no;
		this.id =id;
		this.addrname=addname;
		this.name=name;
		this.addrNum=addrNum;
		this.addr=addr;
		this.detailAddr = detailAddr;
		this.phone=phone;
		this.hphone = hphone;
		this.addrd8 =addrd8;
	}
	
	// 배송지 업데이트 따른 생성
	public AddrDTO(int addr_no, String id, String addname, String name, String addrNum, String addr, String detailAddr,String phone, String hphone) {
		// TODO Auto-generated constructor stub
		this.addr_no = addr_no;
		this.id =id;
		this.addrname=addname;
		this.name=name;
		this.addrNum=addrNum;
		this.addr=addr;
		this.detailAddr = detailAddr;
		this.phone=phone;
		this.hphone = hphone;
	}
	
	// date 받고 객체로 넘길 때
		public AddrDTO(String id, String addname, String name, String addrNum, String addr, String detailAddr,String phone, String hphone, Date addrd8) {
			// TODO Auto-generated constructor stub
			this.id =id;
			this.addrname=addname;
			this.name=name;
			this.addrNum=addrNum;
			this.addr=addr;
			this.detailAddr = detailAddr;
			this.phone=phone;
			this.hphone = hphone;
			this.addrd8 =addrd8;
		}
	
	// 배송지 추가 시 생성
	// date 는 쿼리에서 처리
	public AddrDTO(String id, String addname, String name, String addrNum, String addr, String detailAddr,String phone, String hphone) {
		// TODO Auto-generated constructor stub
		this.id =id;
		this.addrname=addname;
		this.name=name;
		this.addrNum=addrNum;
		this.addr=addr;
		this.detailAddr = detailAddr;
		this.phone=phone;
		this.hphone = hphone;
	}

	public int getAddr_no() {
		return addr_no;
	}
	public void setAddr_no(int addr_no) {
		this.addr_no = addr_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAddrname() {
		return addrname;
	}
	public void setAddrname(String addrname) {
		this.addrname = addrname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddrNum() {
		return addrNum;
	}
	public void setAddrNum(String addrNum) {
		this.addrNum = addrNum;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDetailAddr() {
		return detailAddr;
	}
	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getHphone() {
		return hphone;
	}
	public void setHphone(String hphone) {
		this.hphone = hphone;
	}
	public Date getAddrd8() {
		return addrd8;
	}
	public void setAddrd8(Date addrd8) {
		this.addrd8 = addrd8;
	}
}

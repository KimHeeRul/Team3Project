package DTO;

import java.sql.Date;

public class OrderDTO {
	private String id, email, order_name, order_phone, order_email, reci_name, reci_phone, home_phone, addrnum, addr,
			detailaddr, msg;
	private int order_no, pro_no, pro_price, pro_count, delivery;
	private Date order_date;
	
	public OrderDTO(int order_no, String id, String email, int pro_no, int pro_price, int pro_count, String order_name,
			String order_phone, String order_email, String reci_name, String reci_phone, String home_phone,
			String addrnum, String addr, String detailaddr, String msg,Date order_date, int delivery) {
		this.order_no = order_no;
		this.id = id;
		this.email = email;
		this.pro_no = pro_no;
		this.pro_price = pro_price;
		this.pro_count = pro_count;
		this.order_name = order_name;
		this.order_phone = order_phone;
		this.order_email = order_email;
		this.reci_name = reci_name;
		this.reci_phone = reci_phone;
		this.home_phone = home_phone;
		this.addrnum = addrnum;
		this.addr = addr;
		this.detailaddr = detailaddr;
		this.msg = msg;
		this.order_date=order_date;
		this.delivery = delivery;
	}
	public OrderDTO( String id, String email, int pro_no, int pro_price, int pro_count, String order_name,
			String order_phone, String order_email, String reci_name, String reci_phone, String home_phone,
			String addrnum, String addr, String detailaddr, String msg, int delivery) {
		
		this.id = id;
		this.email = email;
		this.pro_no = pro_no;
		this.pro_price = pro_price;
		this.pro_count = pro_count;
		this.order_name = order_name;
		this.order_phone = order_phone;
		this.order_email = order_email;
		this.reci_name = reci_name;
		this.reci_phone = reci_phone;
		this.home_phone = home_phone;
		this.addrnum = addrnum;
		this.addr = addr;
		this.detailaddr = detailaddr;
		this.msg = msg;
		this.delivery = delivery; //배송상태 0-준비 /1-완료
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getOrder_name() {
		return order_name;
	}

	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}

	public String getOrder_phone() {
		return order_phone;
	}

	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}

	public String getOrder_email() {
		return order_email;
	}

	public void setOrder_email(String order_email) {
		this.order_email = order_email;
	}

	public String getReci_name() {
		return reci_name;
	}

	public void setReci_name(String reci_name) {
		this.reci_name = reci_name;
	}

	public String getReci_phone() {
		return reci_phone;
	}

	public void setReci_phone(String reci_phone) {
		this.reci_phone = reci_phone;
	}

	public String getHome_phone() {
		return home_phone;
	}

	public void setHome_phone(String home_phone) {
		this.home_phone = home_phone;
	}

	public String getAddrnum() {
		return addrnum;
	}

	public void setAddrnum(String addrnum) {
		this.addrnum = addrnum;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getDetailaddr() {
		return detailaddr;
	}

	public void setDetailaddr(String detailaddr) {
		this.detailaddr = detailaddr;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public int getPro_no() {
		return pro_no;
	}

	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}

	public int getPro_price() {
		return pro_price;
	}

	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}

	public int getPro_count() {
		return pro_count;
	}

	public void setPro_count(int pro_count) {
		this.pro_count = pro_count;
	}

	public int getDelivery() {
		return delivery;
	}

	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}

}

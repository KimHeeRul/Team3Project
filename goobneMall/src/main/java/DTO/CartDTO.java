package DTO;

public class CartDTO {
	private String id,imgfile;
	private int cart_no,cart_count, pro_no,buy_no;
	
	public CartDTO(int cart_no,String id,int cart_count,int pro_no,String imgfile) {
		this.cart_no=cart_no;
		this.id=id;
		this.cart_count=cart_count;
		this.pro_no=pro_no;
		this.imgfile=imgfile;
	}

	public CartDTO(int buy_no,int cart_no,String id,int cart_count,int pro_no) {
		this.buy_no=buy_no;
		this.cart_no=cart_no;
		this.id=id;
		this.cart_count=cart_count;
		this.pro_no=pro_no;
	}


	public String getImgfile() {
		return imgfile;
	}

	public void setImgfile(String imgfile) {
		this.imgfile = imgfile;
	}

	public int getBuy_no() {
		return buy_no;
	}

	public void setBuy_no(int buy_no) {
		this.buy_no = buy_no;
	}

	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}

	public int getCart_count() {
		return cart_count;
	}

	public void setCart_count(int cart_count) {
		this.cart_count = cart_count;
	}

	public int getPro_no() {
		return pro_no;
	}

	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	
	
}

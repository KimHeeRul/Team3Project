package DTO;

public class ProductDTO {

	private int pro_no, weight,price,SalesVolume,Discount,beforePrice,inventory; // 상품번호,상품 무게
	private String category, title, imgfile, piece, storage;// 카테고리,이름,이미지주소,평점,보관방법

	public ProductDTO(int pro_no, String category, String title, String imgfile, String piece, int weight,
		int beforePrice,int Discount, int price,String storage,int SalesVolume,int inventory) {
		this.pro_no = pro_no;
		this.category = category;
		this.title = title;
		this.imgfile = imgfile;
		this.piece = piece;
		this.weight = weight;
		this.beforePrice=beforePrice;
		this.Discount=Discount;
		this.price=price;
		this.storage = storage;
		this.SalesVolume=SalesVolume;
		this.inventory=inventory;
	}
	public ProductDTO(String category, String title, String imgfile, String piece, int weight,
			int beforePrice,int Discount, int price,String storage,int SalesVolume,int inventory) {
			this.category = category;
			this.title = title;
			this.imgfile = imgfile;
			this.piece = piece;
			this.weight = weight;
			this.beforePrice=beforePrice;
			this.Discount=Discount;
			this.price=price;
			this.storage = storage;
			this.SalesVolume=SalesVolume;
			this.inventory=inventory;
		}

	public int getInventory() {
		return inventory;
	}

	public void setInventory(int inventory) {
		this.inventory = inventory;
	}

	public String getPiece() {
		return piece;
	}

	public void setPiece(String piece) {
		this.piece = piece;
	}

	public int getBeforePrice() {
		return beforePrice;
	}

	public void setBeforePrice(int beforePrice) {
		this.beforePrice = beforePrice;
	}

	public int getDiscount() {
		return Discount;
	}

	public void setDiscount(int discount) {
		Discount = discount;
	}

	public int getSalesVolume() {
		return SalesVolume;
	}

	public void setSalesVolume(int salesVolume) {
		SalesVolume = salesVolume;
	}

	public int getPro_no() {
		return pro_no;
	}

	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImgfile() {
		return imgfile;
	}

	public void setImgfile(String imgfile) {
		this.imgfile = imgfile;
	}


	public String getStorage() {
		return storage;
	}

	public void setStorage(String storage) {
		this.storage = storage;
	}
	
	

}

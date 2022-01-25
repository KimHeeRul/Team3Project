package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.ProductDTO;
import util.DBManager;

public class ProductDAO {
	private ProductDAO() {
	}

	private static ProductDAO instance = new ProductDAO();

	public static ProductDAO getInstance() {
		return instance;
	}

	private Connection conn = null; // DB에 연결
	private PreparedStatement pstmt = null; // sql쿼리를 excute해
	private ResultSet rs = null; // 쿼리실행 결과물을 받는 역할

	private ArrayList<ProductDTO> products = null;

	public ArrayList<ProductDTO> getProducts() {
		products = new ArrayList<ProductDTO>();

		try {
			conn = DBManager.getConnection();
			String sql = "select* from product";
			pstmt = conn.prepareStatement(sql);// 연동된 DB에 쿼리를 날릴준비
			rs = pstmt.executeQuery();// 쿼리를 날려서 ResultSet을 반환 받음
			while (rs.next()) {
				int pro_no = rs.getInt(1);// rs는 1부터 시작함
				String category = rs.getString(2);
				String title = rs.getString(3);
				String imgfile = rs.getString(4);
				String piece = rs.getString(5);
				int weight = rs.getInt(6);
				int beforePrice = rs.getInt(7);
				int Discount = rs.getInt(8);
				int price = beforePrice-(beforePrice*Discount/100);
				String storage = rs.getString(10);
				int SalesVolume = rs.getInt(11);
				int inventory = rs.getInt(12);
				ProductDTO product = new ProductDTO(pro_no, category, title, imgfile, piece, weight, beforePrice, Discount, price, storage, SalesVolume,inventory);
				products.add(product);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}

	public ProductDTO getProduct(String no) {
		ProductDTO product = null;

		try {
			conn = DBManager.getConnection();
			String sql = "select* from product where pro_no=" + no;
			pstmt = conn.prepareStatement(sql);// 연동된 DB에 쿼리를 날릴준비
			rs = pstmt.executeQuery();// 쿼리를 날려서 ResultSet을 반환 받음
			while (rs.next()) {
				int pro_no = rs.getInt(1);// rs는 1부터 시작함
				String category = rs.getString(2);
				String title = rs.getString(3);
				String imgfile = rs.getString(4);
				String piece = rs.getString(5);
				int weight = rs.getInt(6);
				int beforePrice = rs.getInt(7);
				int Discount = rs.getInt(8);
				int price = beforePrice-(beforePrice*Discount/100);
				String storage = rs.getString(10);
				int SalesVolume = rs.getInt(11);
				int inventory = rs.getInt(12);
				product = new ProductDTO(pro_no, category, title, imgfile, piece, weight, beforePrice, Discount, price, storage, SalesVolume,inventory);
				return product;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return product;
	}

	public ArrayList<ProductDTO> getSearch(String text) {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select* from product where title ";
		try {
			conn = DBManager.getConnection();
			if (!(text == null)) {
				sql += "LIKE '%" + text.trim() + "%'";
			} else {
				return list;
			}
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int pro_no = rs.getInt(1);// rs는 1부터 시작함
				String category = rs.getString(2);
				String title = rs.getString(3);
				String imgfile = rs.getString(4);
				String piece = rs.getString(5);
				int weight = rs.getInt(6);
				int beforePrice = rs.getInt(7);
				int Discount = rs.getInt(8);
				int price = beforePrice-(beforePrice*Discount/100);
				String storage = rs.getString(10);
				int SalesVolume = rs.getInt(11);
				int inventory = rs.getInt(12);
				ProductDTO data = new ProductDTO(pro_no, category, title, imgfile, piece, weight, beforePrice, Discount, price, storage, SalesVolume,inventory);
				list.add(data);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<ProductDTO> getSearchCate(String text) {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select* from product where category ";
		try {
			conn = DBManager.getConnection();
			if (!(text == null)) {
				sql += "LIKE '%" + text.trim() + "%'";
			} else {
				return list;
			}
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int pro_no = rs.getInt(1);// rs는 1부터 시작함
				String category = rs.getString(2);
				String title = rs.getString(3);
				String imgfile = rs.getString(4);
				String piece = rs.getString(5);
				int weight = rs.getInt(6);
				int beforePrice = rs.getInt(7);
				int Discount = rs.getInt(8);
				int price = beforePrice-(beforePrice*Discount/100);
				String storage = rs.getString(10);
				int SalesVolume = rs.getInt(11);
				int inventory = rs.getInt(12);
				ProductDTO data = new ProductDTO(pro_no, category, title, imgfile, piece, weight, beforePrice, Discount, price, storage, SalesVolume,inventory); 
				list.add(data);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void SaleVolumeUpdate(int prono, int qnt) {
		ProductDTO temp = getProduct(prono + "");
		int SalesVolume = temp.getSalesVolume();
		try {
			conn = DBManager.getConnection();
			String sql = "update product set SalesVolume=? where pro_no=" + prono;
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, SalesVolume + qnt);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void inventoryUpdate(int prono, int qnt) {
		ProductDTO temp = getProduct(prono + "");
		int inventory = temp.getInventory();
		try {
			conn = DBManager.getConnection();
			String sql = "update product set inventory=? where pro_no=" + prono;
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inventory - qnt);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<ProductDTO> getProductRank(int num) {// 내림차순 정렬
		products = new ArrayList<ProductDTO>();
		try {
			conn = DBManager.getConnection();
			String sql = "";
			if (num == 1) {
				sql = "select* from product ORDER BY Discount DESC";//할인율 높은순
			} else if (num == 2) {
				sql = "select* from product ORDER BY SalesVolume DESC";//판매량 높은순
			} else if (num == 3) {
				sql = "select* from product ORDER BY pro_no DESC";//신제품
			}
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int pro_no = rs.getInt(1);
				String category = rs.getString(2);
				String title = rs.getString(3);
				String imgfile = rs.getString(4);
				String piece = rs.getString(5);
				int weight = rs.getInt(6);
				int beforePrice = rs.getInt(7);
				int Discount = rs.getInt(8);
				int price = beforePrice-(beforePrice*Discount/100);
				String storage = rs.getString(10);
				int SalesVolume = rs.getInt(11);
				int inventory = rs.getInt(12);
				ProductDTO product = new ProductDTO(pro_no, category, title,
				imgfile, piece, weight, beforePrice, Discount, price, storage,
				SalesVolume,inventory);
				products.add(product);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}

}

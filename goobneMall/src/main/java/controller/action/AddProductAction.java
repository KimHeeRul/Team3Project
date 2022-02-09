package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.ProductDAO;
import DTO.ProductDTO;

public class AddProductAction implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		

		ProductDAO dao = ProductDAO.getInstance();

		String path = request.getRealPath("upload");
		// 업로드 파일 크기 5mb 제한
		int uploadFileSizeLimit = 5 * 1024 * 1024;
		String enType = "UTF-8";
		MultipartRequest multi = new MultipartRequest(request, path, uploadFileSizeLimit, enType, new DefaultFileRenamePolicy());
		String title = multi.getParameter("name");
		
		int beforePrice = Integer.parseInt(multi.getParameter("money"));
		
		String category = multi.getParameter("cate");
		int Discount = Integer.parseInt(multi.getParameter("discount"));
		String piece = multi.getParameter("piece");
		
		int weight = Integer.parseInt(multi.getParameter("weight"));
		
		String storage = multi.getParameter("storage");
		String image_path = multi.getFilesystemName("image_path");

		ProductDTO item = new ProductDTO(category, title, image_path, piece, weight, beforePrice, Discount, 0, storage, 0, 100);
		dao.addProduct(item);
	}
}

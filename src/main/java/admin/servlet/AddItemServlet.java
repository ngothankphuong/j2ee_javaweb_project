package admin.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.SanPhamDAO;
import dbconnect.DBConnect;
import phone_store.entity.SanPham;


@WebServlet("/add_item")
@MultipartConfig
public class AddItemServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		String tenSanPham = new String(req.getParameter("ten_san_pham").getBytes("ISO-8859-1"), "UTF-8");
		String cauHinh = new String(req.getParameter("cau_hinh").getBytes("ISO-8859-1"), "UTF-8");
		String hang = new String(req.getParameter("hang").getBytes("ISO-8859-1"), "UTF-8");
		String loaiSanPham = new String(req.getParameter("loai_san_pham").getBytes("ISO-8859-1"), "UTF-8");
		String trangThai = new String(req.getParameter("trang_thai").getBytes("ISO-8859-1"), "UTF-8");
		String gia = new String(req.getParameter("gia").getBytes("ISO-8859-1"), "UTF-8");
		Part part = req.getPart("san_pham_img");		
		String hinh_anh = part.getSubmittedFileName();
		
		
		HttpSession session = req.getSession();
		
		if(loaiSanPham.equals("selected")==false || trangThai.equals("selected")==false) {
			
			SanPham sp = new SanPham(tenSanPham, cauHinh, hang, loaiSanPham, trangThai, gia, hinh_anh);
			
			SanPhamDAO dao = new SanPhamDAO(DBConnect.getConn());
			
			boolean f = dao.addSanPham(sp);
			
			String path = getServletContext().getRealPath("")+"sanpham";
			//System.out.println(path);
			File directory = new File(path);
            if (!directory.exists()) {
                directory.mkdirs(); // Create the directory if it doesn't exist
            }
            
            // Save the image to the "sanpham" folder
            String filePath = path + File.separator + hinh_anh;
            part.write(filePath);
			
//			File fi = new File(path);
//			part.write(path + File.separator + hinh_anh);
			if(f) {
				session.setAttribute("addsuccMsg", "Thêm sản phẩm thành công");
				resp.sendRedirect("admin/add_item.jsp");
			} else {
				session.setAttribute("addfaileMsg", "Thêm sản phẩm không thành công");
				resp.sendRedirect("admin/add_item.jsp");
			}
			
		} else {
			session.setAttribute("addfaileMsg", "Vui lòng nhập đầy đủ thông tin !!!");
			resp.sendRedirect("admin/add_item.jsp");
		}
		
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	
}

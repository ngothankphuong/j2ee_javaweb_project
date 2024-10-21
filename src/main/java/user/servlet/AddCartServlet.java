package user.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

import dao.CartDAO;
import dao.SanPhamDAO;
import dbconnect.DBConnect;
import phone_store.entity.Cart;
import phone_store.entity.SanPham;

@WebServlet("/addCart")
public class AddCartServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			PrintWriter out = resp.getWriter();
			int spID = Integer.parseInt(req.getParameter("IdSanPham"));
			int userID = Integer.parseInt(req.getParameter("UserID"));

			CartDAO cdao = new CartDAO(DBConnect.getConn());
			List<Cart> listC = cdao.check(spID, userID);
			
			if (listC.isEmpty()) {
				SanPhamDAO dao = new SanPhamDAO(DBConnect.getConn());
				SanPham sp = dao.getSanPhamByID(spID);

				Cart c = new Cart();
				c.setSpID(spID);
				c.setUserID(userID);
				c.setTen_san_pham(sp.getTenSanPham());
				c.setCau_hinh(sp.getCauHinh());
				c.setHang(sp.getHang());
				c.setGia(sp.getGia());
				c.setSo_luong(1);

				boolean f = cdao.addCart(c);
				
//				return true -> thông báo thêm sản phẩm thành công
				out.print(f);

			} else {

				int valueSp = cdao.getValue(spID, userID);
				
				int cartID = cdao.getCartID(spID, userID);
				boolean f = cdao.plusCart(cartID, userID, valueSp);
				out.print(f);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

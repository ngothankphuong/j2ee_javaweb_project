package user.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.CartDAO;
import dbconnect.DBConnect;

@WebServlet("/plus")
public class PlusCartServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String value = req.getParameter("value");
			String userID = req.getParameter("userID");
			String cartID = req.getParameter("cartID");
			String tongGia = req.getParameter("tongGia");

			int value1 = Integer.parseInt(value);
			int userID1 = Integer.parseInt(userID);
			int cartID1 = Integer.parseInt(cartID);
			int tongGia1 = Integer.parseInt(tongGia);

			CartDAO dao = new CartDAO(DBConnect.getConn());

			boolean f = dao.plusCart(cartID1, userID1, value1);
			if (f) {

				PrintWriter out = resp.getWriter();

				int quantity = dao.getQuantity(cartID1);

				String priceSP = dao.getPrice(cartID1);
				int price = Integer.parseInt(priceSP);
				
				tongGia1 = tongGia1 + price;

				Map<String, Integer> data = new HashMap<>();
				data.put("quantity", quantity);
				data.put("price", tongGia1);
				String jsonResponse = new Gson().toJson(data);

				out.print(jsonResponse);
			} else {
				System.out.println("Tang that bai");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

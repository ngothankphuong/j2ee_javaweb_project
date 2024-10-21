package admin.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.OrderDAO;
import dbconnect.DBConnect;
import phone_store.entity.Order;

@WebServlet("/viewOrderConfirm")
public class ViewOrderConfirm extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String isCheck = req.getParameter("isCheck");
			
			OrderDAO dao = new OrderDAO(DBConnect.getConn());
			List<Order> listO = new ArrayList<Order>();
			listO = dao.getOrderByStatus("confirm");
			System.out.println(listO);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
}

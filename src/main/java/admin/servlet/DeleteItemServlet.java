package admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.SanPhamDAO;
import dbconnect.DBConnect;
import phone_store.entity.SanPham;

@WebServlet("/deleteItem")
public class DeleteItemServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int spID = Integer.parseInt(req.getParameter("spID"));
		//System.out.println(spID);
		try {
			SanPhamDAO dao = new SanPhamDAO(DBConnect.getConn());
			PrintWriter out = resp.getWriter();
			SanPham sp  = new SanPham();
			sp = dao.getSanPhamByID(spID);
			out.println(sp.getTenSanPham());
			boolean f = dao.deleteSP(spID);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="taglib.jsp"%>
<%@include file="allCss.jsp"%>
<meta charset="ISO-8859-1">
<title>Tất cả đơn hàng, đã xác nhận</title>
</head>
<body>

	<%@include file="navbar.jsp"%>

	<%
	OrderDAO dao = new OrderDAO(DBConnect.getConn());
	List<Order> listO = new ArrayList<Order>();
	listO = dao.getOrderByStatus("confirm");
	%>


	<div class="container">
		<div class="row p-1">
			<div class="card-deck">
				<!-- check box -->
				<a style="text-decoration: none"
					class="text-white btn btn-sm btn-secondary text-center" href="all_order.jsp">Đã
					xác nhận <i class="fa-solid fa-square-check"></i>
				</a>

				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">Mã đơn hàng</th>
							<th scope="col">Tên sản phẩm</th>
							<th scope="col">Cấu hình</th>
							<th scope="col">Hãng</th>
							<th scope="col">Số lượng</th>
							<th scope="col">Giá</th>
							<th scope="col">Tên người nhận</th>
							<th scope="col">Email</th>
							<th scope="col">Số điện thoại</th>
							<th scope="col">Địa chỉ nhận hàng</th>
							<th scope="col">PTTT</th>
							<th scope="col">Trạng thái</th>
							<th scope="col">Hành động</th>

						</tr>
					</thead>
					<tbody class="b-tb">
						<%
						for (Order o : listO) {
						%>
						<tr>
							<td><%=o.getOrID()%></td>
							<td><%=o.getSpName()%></td>
							<td><%=o.getSpCauhinh()%></td>
							<td><%=o.getSpHang()%></td>
							<td><%=o.getSo_luong()%></td>
							<td><%=o.getSpGia()%></td>
							<td><%=o.getUserName()%></td>
							<td><%=o.getUserEmail()%></td>
							<td><%=o.getUserPhone()%></td>
							<td><%=o.getUserAddress()%></td>
							<td><%=o.getPayment()%></td>
							<%
							if (o.getStatus().equals("confirm")) {
							%>
							<td class="text-center "><span class="badge badge-success"><%=o.getStatus()%></span></td>
							<td>
								<p onclick="deleteOrder(this)"
									class="text-white btn btn-sm btn-danger">Delete</p>
							</td>
							<%
							} else {
							%>
							<td class="text-center "><span class="badge badge-danger"><%=o.getStatus()%></span></td>
							<td>
								<p onclick="confirmOrder(this)"
									class="text-white btn btn-sm btn-success">Confirm</p>
							</td>
							<%
							}
							%>

						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
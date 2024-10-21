<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="taglib.jsp"%>
<%@include file="allCss.jsp"%>
<link rel="stylesheet" type="text/css" href="style.css">
<meta charset="ISO-8859-1">
<title>Tất cả sản phẩm</title>

</head>
<body>



	<c:if test="${empty userObjAdmin}">
		<c:redirect url="../login.jsp" />
	</c:if>


	<!-- thong bao update san pham thanh cong -->
	<c:if test="${not empty updateSucc }">
		<div class="alert alert-success alert-dismissible fade show"
			role="alert">
			<strong>${updateSucc } </strong>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<c:remove var="updateSucc" scope="session" />
	</c:if>

	<c:if test="${not empty updateFaile }">
		<div class="alert alert-danger alert-dismissible fade show"
			role="alert">
			<strong>${updateFaile } </strong>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<c:remove var="updateFaile" scope="session" />
	</c:if>

	<%@include file="navbar.jsp"%>

	<div class="container">
		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Hình Ảnh</th>
					<th scope="col">Tên Sản Phẩm</th>
					<th scope="col">Cấu Hình</th>
					<th scope="col">Hãng</th>
					<th scope="col">Loại Sản Phẩm</th>
					<th scope="col">Giá</th>
					<th scope="col">Trạng Thái</th>
					<th scope="col">Hành Động</th>
				</tr>
			</thead>
			<tbody>
				<!-- Render list book tu Object book -->
				<%
				SanPhamDAO dao = new SanPhamDAO(DBConnect.getConn());
				List<SanPham> listSP = dao.getAllSP();
				for (SanPham sp : listSP) {
				%>
				<tr>
					<th scope="row"><%=sp.getId()%></th>
					<td><img src="../sanpham/<%=sp.getHinhAnh()%>"
						style="width: 80px; height: 100px" /></td>
					<td><%=sp.getTenSanPham()%></td>
					<td><%=sp.getCauHinh()%></td>
					<td><%=sp.getHang()%></td>
					<td><%=sp.getLoaiSanPham()%></td>
					<td><%=sp.getGia()%></td>
					<td><%=sp.getTrangThai()%></td>
					<td><a href="edit_item.jsp?spID=<%=sp.getId()%>"
						class="btn btn-sm btn-primary">Sửa <i
							class="fa-solid fa-pen-to-square"></i></a> <a
						data-spID="<%=sp.getId()%>" class="btn btn-sm btn-danger btn-del">Xóa
							<i class="fa-solid fa-trash"></i>
					</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<%@include file="back_top.jsp"%>





	<script>
	
		var BtnDel = document.querySelectorAll('.btn-del');
		//console.log(BtnDel);
		BtnDel.forEach(function (button) {
			button.addEventListener('click', function(){
				var spID = button.getAttribute('data-spID');
				//console.log(spID);
				$.ajax({
					type:"POST",
					url: "../deleteItem",
					data :{
						spID
					},
					success : function(response){
						let lineItem = button.parentNode.parentNode;
						setTimeout(function() {
							alert("Đã xóa " + response);
						}, 70); 
						lineItem.innerHTML = "";
					},
					error: function(error) {
						console.log(error);
					}
				})
			})
		})
	</script>

</body>
</html>
<%@page import="bean.aoquanbean"%>
<%@page import="bean.themaoquanbean"%>
<%@page import="bean.dangnhapbean"%>
<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ADMIN </title>
<link rel="icon" type="./assets/image/png"
	href="https://theme.hstatic.net/1000401164/1000509982/14/favicon.png?v=592">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="./assets/css/style2.css">
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header"></div>
			<ul class="nav navbar-nav">
				<li><a class="navbar-brand" href="HomeController">Home</a></li>
				<li><a class="navbar-brand" href="loaiController">TYPE</a></li>
				<li><a class="navbar-brand" href="aoquanController">CLOTHES</a></li>
				<li><a href="xacnhanchitietController">CONFIRM DETAILS</a></li>
				<li>
					<%
					if (session.getAttribute("admin") == null) {
					%> <a href="dangnhapAdminController"> <span
						class="glyphicon glyphicon-log-in"></span>Login
				</a>
				</li>
				<%
				} else {
				%>
				<a href="#"> <span class="glyphicon glyphicon-log-in"></span>
					Tên Tài Khoản: <%
 dangnhapbean dn = (dangnhapbean) session.getAttribute("admin");
 out.print(dn.getTenDangNhap());
 %>
				</a>
				</li>
				<%
				}
				%>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="loginController"><span
						class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			</ul>
		</div>
	</nav>
	<form action="themaoquanAdminController" method="post"
		enctype="multipart/form-data">
		<!-- Trigger the modal with a button -->
		<button style="float: right;" type="button" name="butthem"
			class="btn btn-info btn-lg" data-toggle="modal"
			data-target="#myModalthem">Thêm Áo</button>
		<!-- 	Modal -->
		<div class="modal fade" id="myModalthem" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content -->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Thêm</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="usr">Mã ÁO </label> <input type="text" name="txtmaao"
								class="form-control" id="usr">
						</div>
						<div class="form-group">
							<label for="pwd">TÊN ÁO</label> <input type="text"
								name="txttenao" class="form-control" id="pwd">
						</div>
						<div class="form-group">
							<label for="usr">SỐ LƯỢNG </label> <input type="text"
								name="txtsoluong" class="form-control" id="usr">
						</div>
						<div class="form-group">
							<label for="usr">GIÁ</label> <input type="text" name="txtgia"
								class="form-control" id="usr">
						</div>
						<div class="form-group">
							<label for="pwd">MÃ LOẠI</label> <input type="text"
								name="txtmaloai" class="form-control" id="pwd">
						</div>
						<div class="form-group">
							<label for="usr">Ảnh</label> <input type="file" name="txtanh"
								class="form-control" id="usr">
						</div>
						<input type="submit" value="thêm">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<form action="SuaaoquanController" method="post"
		enctype="multipart/form-data">
		<!-- Trigger the modal with a button -->
		<button style="float: right;" type="button" name="butthem"
			class="btn btn-info btn-lg" data-toggle="modal"
			data-target="#myModal">Sửa Áo</button>
		<!-- 	Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content -->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Sửa</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="usr">Mã ÁO </label> <input type="text" name="txtmaao"
								class="form-control" id="usr">
						</div>
						<div class="form-group">
							<label for="pwd">TÊN ÁO</label> <input type="text"
								name="txttenao" class="form-control" id="pwd">
						</div>
						<div class="form-group">
							<label for="usr">SỐ LƯỢNG </label> <input type="text"
								name="txtsoluong" class="form-control" id="usr">
						</div>
						<div class="form-group">
							<label for="usr">GIÁ</label> <input type="text" name="txtgia"
								class="form-control" id="usr">
						</div>
						<div class="form-group">
							<label for="pwd">MÃ LOẠI</label> <input type="text"
								name="txtmaloai" class="form-control" id="pwd">
						</div>
						<div class="form-group">
							<label for="usr">Ảnh</label> <input type="file" name="txtanh"
								class="form-control" id="usr">
						</div>
						<input name="butsua" type="submit" value="sửa">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<table border="1" width=100% align="center" cellspacing="0">
		<thead>
			<tr>
				<th scope="col">MÃ ÁO</th>
				<th scope="col">TÊN ÁO</th>
				<th scope="col">SỐ LƯỢNG</th>
				<th scope="col">GIÁ</th>
				<th scope="col">MÃ LOẠI</th>
				<th scope="col">ẢNH</th>
				<th scope="col">CHỈNH SỬA</th>
			</tr>
		</thead>
		<tbody>
			<%
			ArrayList<aoquanbean> dsaoquan = (ArrayList<aoquanbean>) request.getAttribute("dsaoquan");
			int n = dsaoquan.size();
			for (int i = 0; i < n; i++) {
				aoquanbean s = dsaoquan.get(i);
			%>
			<form action="suaxoaAoController" method="post">
				<tr>
					<td><%=s.getMaao()%></td>
					<td><%=s.getTenao()%></td>
					<td><%=s.getSoluong()%></td>
					<td><%=s.getGia()%></td>
					<td><%=s.getMaloai()%></td>
					<td><img style="height: 200px; width: 200px" alt=""
						src="<%=s.getAnh()%>"></td>

					<td>

						<button type="submit" name="butxoa" value="<%=s.getMaao()%>"
							class="btn btn-sm btn-danger">Delete</button>
					</td>
				</tr>
			</form>

			<%
			}
			%>

		</tbody>
	</table>
</body>
</html>
<%@page import="bean.dangkybean"%>
<%@page import="bean.dangnhapbean"%>
<%@page import="bean.khachhangbean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="bo.loaibo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.loaibean"%>
<%@page import="dao.loaidao"%>
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
				%> <a
				href="dangnhapAdminController"> <span
					class="glyphicon glyphicon-log-in"></span>Login
			</a>
			</li>
			<%
			} else {
			%>
			<a href="#"> <span class="glyphicon glyphicon-log-in"></span> Tên
				Tài Khoản: <%
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
<form action="themloaiController" method="post">
	<!-- Trigger the modal with a button -->
	<button style="float: right;" type="button" name="butthem"
		class="btn btn-info btn-lg" data-toggle="modal"
		data-target="#myModalthem">ThêmLoại</button>
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
						<label for="usr">MÃ LOẠI </label> <input type="text"
							name="txtmaloai" class="form-control" id="usr">
					</div>
					<div class="form-group">
						<label for="pwd">TÊN LOẠI</label> <input type="text"
							name="txttenloai" class="form-control" id="pwd">
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
<form action="suaxoaAdminController" method="post">
	<table border="1" width=100% align="center" class="table">
		<thead>
			<tr>
				<th scope="col">STT</th>
				<th scope="col">CHỌN</th>
				<th scope="col">MÃ LOẠI</th>
				<th scope="col">TÊN LOẠI</th>
				<th scope="col">CHỈNH SỬA</th>

			</tr>
		</thead>
		<tbody>
			<%
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			ArrayList<loaibean> dsloai = (ArrayList<loaibean>) request.getAttribute("dsloai");
			int i = 1;
			for (loaibean l : dsloai) {
			%>

			<tr>
				<td><%=i%></td>
				<td><input type="checkbox" name="check"
					value="<%=l.getMaloai()%>"></td>
				<td><%=l.getMaloai()%></td>
					<td><%=l.getTenloai()%></td>

				<td>
					<button type="button" name="butsua" class="btn btn-info btn-lg"
						data-toggle="modal" data-target="#myModal">Sửa Loại</button> <!-- 	Modal -->
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
										<label for="usr">MÃ LOẠI </label> <input type="text"
											name="txtmaloai" class="form-control" id="usr">
									</div>
									<div class="form-group">
										<label for="pwd">TÊN LOẠI</label> <input type="text"
											name="txttenloai" class="form-control" id="pwd">
									</div>
									<input type="submit" name="butsua" value="sửa">
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
					<button type="submit" name="butxoa" value="<%=l.getMaloai()%>"
						class="btn btn-sm btn-danger">Delete</button>
				</td>
			</tr>
			<%
			i++;
			%>
			<%
			}
			%>

		</tbody>
	</table>
	<button type="submit" name="butcheck" class="btn btn-default">Xóa
		chọn</button>
</form>
</body>
</html>


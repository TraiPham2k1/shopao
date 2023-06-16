<%@page import="bean.xacnhanhoadonbean"%>
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
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


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
					%> <a
					href="ktdnAdminController"> <span
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


	<table border="1" width="1000" align="center" class="table">
		<thead>
			<tr>
				<th scope="col">STT</th>
				<th scope="col">MÃ HÓA ĐƠN</th>
				<th scope="col">ĐÃ MUA HÓA ĐƠN</th>
				<th scope="col">TỔNG MUA</th>
				<th scope="col">TỔNG TIỀN</th>

			</tr>
		</thead>
		<%-- <%
		ArrayList<xacnhanhoadonbean> ds = (ArrayList<xacnhanhoadonbean>) request.getAttribute("dshd");
		int i = 1;
		for (xacnhanhoadonbean xn : ds) {
		%>
		<tr>
			<td><%=i%></td>
			<td><%=xn.getMaHoaDon()%></td>
			<td><%=(xn.isDamuaHD() ? "Da thanh toan" : "Dang dat mua")%></td>
			<td><%=xn.getTongmua()%></td>
			<td><%=xn.getTongtien()%></td>
			<td><a
				href="xacnhanthanhtoanHDController?maHD=<%=xn.getMaHoaDon()%>&damuaHD=<%=xn.isDamuaHD()%>">Xác
					nhận thanh toán HD </td>
			<%
			i++;
			}
			%> --%>
		
	</table>
</body>
</html>


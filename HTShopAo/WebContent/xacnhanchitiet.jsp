<%@page import="bean.xacnhanchitietbean"%>
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


</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      
    </div>
    <ul class="nav navbar-nav">
				<li><a class="navbar-brand" href="HomeController">Home</a></li>
			<li><a class="navbar-brand" href="loaiController">TYPE</a></li>
			<li><a class="navbar-brand" href="aoquanController">CLOTHES</a></li>
			<li><a href="xacnhanchitietController">CONFIRM DETAILS</a></li>
				<li>
      <%if(session.getAttribute("admin")==null){ %>
      <a href="ktdnAdminController">
      <span class="glyphicon glyphicon-log-in"></span>Login
       </a></li>
       <%} else{  %>
       <a href="#">
          <span class="glyphicon glyphicon-log-in"></span>
	       Tên Tài Khoản: <%
	       dangnhapbean dn=(dangnhapbean)session.getAttribute("admin");
	       out.print(dn.getTenDangNhap());
	       %>
       </a></li>
       <%} %>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="loginController"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
    </ul>
  </div>
</nav>


	<table border="1" width="1000" align="center" class="table">
		<thead>
			<tr>
				<th scope="col">STT</th>
				<th scope="col">MÃ CHI TIẾT HÓA ĐƠN</th>
				<th scope="col">Mã KHÁCH HÀNG</th>
				<th scope="col">Tên ÁO</th>
				<th scope="col">Số Lượng Mua</th>
				<th scope="col">GIÁ</th>
				<th scope="col">Thành Tiền</th>
				<th scope="col">NGÀY MUA</th>
				<th scope="col">Đã MUA</th>
				<th scope="col">Xác NHẬN</th>
			</tr>
		</thead>
		<%
		ArrayList<xacnhanchitietbean> ds = (ArrayList<xacnhanchitietbean>) request.getAttribute("dskh");
		int i = 1;
		for (xacnhanchitietbean xn : ds) {
		%>
		<tr>
			<td><%=i%></td>
			<td><%=xn.getMaChiTietHD()%></td>
			<td><%=xn.getMakh()%></td>
			<td><%=xn.getTenao()%></td>
			<td><%=xn.getSoLuongMua()%></td>
			<td><%=xn.getGia()%></td>
			<td><%=xn.getThanhTien()%></td>
			<td><%=xn.getNgayMua()%></td>
			<td><%=(xn.isDamua()?"Da thanh toan" : "Dang dat mua")%></td>
			<td><a href="xacnhanchuyentienController?machitiethd=<%=xn.getMaChiTietHD()%>&damua=<%=xn.isDamua()%>">Xác nhận đã chuyển tiền </td>
			<%
			i++;
			}
			%>
		
	</table>
</body>
</html>


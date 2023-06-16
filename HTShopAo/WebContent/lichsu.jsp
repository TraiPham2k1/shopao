<%@page import="bean.khachhangbean"%>
<%@page import="bean.lichsubean"%>
<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Meta Tag -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name='copyright' content=''>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Title Tag  -->
<title>MANDO BRAND &#174; &ndash; Thời trang MANDO</title>
<!-- Favicon -->
<link rel="icon" type="./assets/image/png"
	href="https://theme.hstatic.net/1000401164/1000509982/14/favicon.png?v=592">
<!-- Web Font -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap"
	rel="stylesheet">

<!-- StyleSheet -->

<!-- Bootstrap -->
<link rel="stylesheet" href="./assets/css/bootstrap.css">
<!-- Magnific Popup -->
<link rel="stylesheet" href="./assets/css/magnific-popup.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="./assets/css/font-awesome.css">
<!-- Fancybox -->
<link rel="stylesheet" href="./assets/css/jquery.fancybox.min.css">
<!-- Themify Icons -->
<link rel="stylesheet" href="./assets/css/themify-icons.css">
<!-- Nice Select CSS -->
<link rel="stylesheet" href="./assets/css/niceselect.css">
<!-- Animate CSS -->
<link rel="stylesheet" href="./assets/css/animate.css">
<!-- Flex Slider CSS -->
<link rel="stylesheet" href="./assets/css/flex-slider.min.css">
<!-- Owl Carousel -->
<link rel="stylesheet" href="./assets/css/owl-carousel.css">
<!-- Slicknav -->
<link rel="stylesheet" href="./assets/css/slicknav.min.css">

<!-- Eshop StyleSheet -->
<link rel="stylesheet" href="./assets/css/reset.css">
<link rel="stylesheet" href="./assets/css/style2.css">
<link rel="stylesheet" href="./assets/css/responsive.css">
</head>
<body>
	<!-- Header -->
	<header class="header shop">
		<!-- Topbar -->
		<div class="topbar">
			<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-title">
						<img alt=""
							src="//theme.hstatic.net/1000401164/1000509982/14/logo.png?v=592">
					</div>
				</div>
			</div>
				<div class="row">
					<div class="col-lg-4 col-md-12 col-12">
						<!-- Top Left -->
						<div class="top-left">
							<ul class="list-main">
								<li><i class="ti-headphone-alt"></i> +060 (800) 801-582</li>
								<li><i class="ti-email"></i> support@shophub.com</li>
							</ul>
						</div>
						<!--/ End Top Left -->
					</div>
					<div class="col-lg-8 col-md-12 col-12">
						<!-- Top Right -->
						<div class="right-content">
							<ul class="list-main">
								<li><i class="ti-location-pin"></i> Store location</li>
								<li><i class="ti-alarm-clock"></i> <a href="#">Daily
										deal</a></li>
								<li><i class="ti-power-off"></i><a href="loginController">Login</a></li>
								<%
								if (session.getAttribute("kh") == null) {
								%><li><i class="ti-user"></i> <a href="dangnhapController">
										<spanclass="glyphiconglyphicon-log-in"> </span>My account
										
								</a></li>
								<%
								} else {
								%>
								<a href="HomeController"> <span
									class="glyphicon glyphicon-log-in"></span> My account:<%
 khachhangbean kh = (khachhangbean) session.getAttribute("kh");
 out.print(kh.getHoten());
 %>
								</a>
								<%
								}
								%>
								<li><i class="ti-user"></i>> <a
									href="dangnhapAdminController"> <span
										class="glyphicon glyphicon-log-in"></span>Admin account
								</a></li>
							</ul>
						</div>
					</div>
					<!-- End Top Right -->
				</div>
			</div>
		</div>
		<!-- End Topbar -->
		<div class="middle-inner">
			<div class="container">
				<div class="row">
					<div class="col-lg-2 col-md-2 col-12">
						<!-- Logo -->
						<div class="logo">
							<a href="HomeController"><img src="./assets/images/mando.png"
								alt="logo"></a>
						</div>
						<!--/ End Logo -->
						<!-- Search Form -->
						<div class="search-top">
							<div class="top-search">
								<a href="#0"><i class="ti-search"></i></a>
							</div>
							<!-- Search Form -->
							<div class="search-top">
								<form class="search-form">
									<input type="text" placeholder="Search here..." name="search">
									<button value="search" type="submit">
										<i class="ti-search"></i>
									</button>
								</form>
							</div>
							<!--/ End Search Form -->
						</div>
						<!--/ End Search Form -->
						<div class="mobile-nav"></div>
					</div>
					<div class="col-lg-8 col-md-7 col-12">
						<div class="search-bar-top">
							<div class="search-bar">
								<form action="HomeController">
									<input name="txttk" placeholder="Search Products Here....."
										type="search">
									<button type="submit" class="btnn">
										<i class="ti-search"></i>
									</button>
								</form>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-12">
						<div class="right-bar">
							<!-- Search Form -->
							<div class="sinlge-bar">
								<a href="#" class="single-icon"><i class="fa fa-heart-o"
									aria-hidden="true"></i></a>
							</div>
							<div class="sinlge-bar">
								<a href="#" class="single-icon"><i
									class="fa fa-user-circle-o" aria-hidden="true"></i></a>
							</div>
							<div class="sinlge-bar shopping">
										<%
										if (session.getAttribute("i") == null)
											session.setAttribute("i", 0);
										%>
										<a href="#" class="single-icon"><i class="ti-bag"></i> <span
											class="total-count"><%=session.getAttribute("i")%></span></a>
										<!-- Shopping Item -->
										<div class="shopping-item">
											<div class="dropdown-cart-header">
												<span>2 Items</span> <a href="#">View Cart</a>
											</div>
											<ul class="shopping-list">
												<li><a href="#" class="remove" title="Remove this item"><i
														class="fa fa-remove"></i></a> <a class="cart-img" href="#"><img
														src="https://via.placeholder.com/70x70" alt="#"></a>
													<h4>
														<a href="#">Woman Ring</a>
													</h4>
													<p class="quantity">
														1x - <span class="amount">$99.00</span>
													</p></li>
												<li><a href="#" class="remove" title="Remove this item"><i
														class="fa fa-remove"></i></a> <a class="cart-img" href="#"><img
														src="https://via.placeholder.com/70x70" alt="#"></a>
													<h4>
														<a href="#">Woman Necklace</a>
													</h4>
													<p class="quantity">
														1x - <span class="amount">$35.00</span>
													</p></li>
											</ul>
											<div class="bottom">
												<div class="total">
													<span>Total</span> <span class="total-amount">$134.00</span>
												</div>
												<a href="CheckoutController" class="btn animate">Checkout</a>
											</div>
										</div>
										<!--/ End Shopping Item -->
									</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Header Inner -->
		<div class="header-inner">
			<div class="container">
				<div class="cat-nav-head">
					<div class="row">

						<div class="col-lg-9 col-12">
							<div class="menu-area">
								<!--Menu -->
								<nav class="navbar navbar-expand-lg">
									<div class="navbar-collapse">
										<div class="nav-inner">
											<ul class="nav main-menu menu navbar-nav">
												<li class="active"><a href="HomeController">Home</a></li>
												<li><a href="lichsuController">History</a></li>
												<li><a href="#">Shop<i class="ti-angle-down"></i><span
														class="new">New</span></a>
													<ul class="dropdown">
														
														<li><a href="ShopController">Shop Grid</a></li>
														<li><a href="htgioController">Cart</a></li>
														<li><a href="CheckoutController">Checkout</a></li>
													</ul></li>
												<li><a href="#">Pages</a></li>
												<li><a href="#">Blog<i class="ti-angle-down"></i></a>
													<ul class="dropdown">
														<li><a href="BlogController">Blog
																Single Sidebar</a></li>
													</ul></li>
												<li><a href="contact.html">Contact Us</a></li>
											</ul>
										</div>
									</div>
								</nav>
								<!--/ End Main Menu -->
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!--/ End Header Inner -->
	</header>
	<table border="1" width="1250" align="center" cellspacing="0">
		<tr>
			<td colspan="3"><marquee>
				<H1 style="color: blue;">Lịch Sử Mua Hàng</H1>
				</marquee></td>
		</tr>
		<tr>
			<td>
				<table border="1" width="800" valign="top" class="table table-light">
					<thead>
						<tr>
							<th scope="col">STT</th>
							<th scope="col">Mã Hóa Đơn</th>
							<th scope="col">Tên Áo</th>
							<th scope="col">Số Lượng Mua</th>
							<th scope="col">Thành Tiền</th>
							<th scope="col">Đã Mua</th>
						</tr>
					</thead>

					<tbody>
						<%
						ArrayList<lichsubean> ls = (ArrayList<lichsubean>) request.getAttribute("dslichsu");
						int i = 1;
						for (lichsubean s : ls) {
						%>
						<tr>
							<td><%=i%></td>
							<td><%=s.getMaHoaDon()%></td>
							<td><%=s.getTenao()%></td>
							<td><%=s.getSoLuongMua()%></td>
							<td><%=s.getThanhtien()%></td>
							<td><%=(s.isDamua() ? "Đã thanh Toán" : "đang đặt mua")%></td>
						</tr>
						<%
						i++;
						%>
						<%
						}
						%>
					</tbody>
				</table>
		</tr>
	</table>
</body>
</html>
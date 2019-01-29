<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/2
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.JDBC.User.userAccount" %>
<%@ page import="com.JDBC.WishAndCart.wishCart" %>
<%@ page import="com.JDBC.Appl.WCDBoperator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.JDBC.ImgIO.ImageUnit" %>
<%@ page import="com.JDBC.Appl.IMDBoperator" %>
<%@ page import="com.JDBC.Appl.FDBoperator" %>
<html lang="en-US">
	
<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>有点家具--404</title><link href="css/master.css" rel="stylesheet">
	<!-- SWITCHER -->
	<link rel="stylesheet" id="switcher-css" type="text/css" href="assets/switcher/css/switcher.css" media="all" />
	<link rel="alternate stylesheet" type="text/css" href="assets/switcher/css/color1.css" title="color1" media="all" />
	<link rel="alternate stylesheet" type="text/css" href="assets/switcher/css/color2.css" title="color2" media="all" />
	<link rel="alternate stylesheet" type="text/css" href="assets/switcher/css/color3.css" title="color3" media="all" />
	<link rel="alternate stylesheet" type="text/css" href="assets/switcher/css/color4.css" title="color4" media="all" />
	<link rel="stylesheet" href="css/iconfont/iconfont.css"/>
	</head>
<body>
		<!-- Loader -->
		<div id="page-preloader"><span class="spinner"></span></div>
		<!-- Loader end -->

		<div class="b-page">
			<!-- Start Switcher -->
			<div class="switcher-wrapper">
			</div>
			<!-- End Switcher --><header>
			<div class="b-top-line">
				<div class="container">
					<div class="row">
						<div class="col-sm-12 clearfix">
							<div class="b-top-options pull-left">
								<div class="nav">
									<ul class="list-inline">
										<li class="dropdown">
											<div class="btn-group" id="wodetiana">
                                        <span class="dropdown-toggle">
                                            <%
												userAccount user = (userAccount) session.getAttribute("user");
												if(user == null) out.print("<a href='login.jsp'>登录</a>");
												else out.print(user.getUsername());
											%>
                                        </span>
												<span class="dropdown-toggle">
                                            <%
												if(user == null)    out.print("<a href='register.jsp'>注册</a>");
												else out.print("<a onclick='logout();' href='logout.jsp'>退出</a>");
											%>
                                        </span>
												<span class="dropdown-toggle" id="admin">
                                            <%
												String admin = (String)session.getAttribute("admin");
												if(admin == null)    out.print("");
												else out.print("<a href='product-list.jsp'>管理界面</a>");
											%>
                                        </span>
											</div>
										</li>
									</ul>
								</div>
							</div>
							<div class="b-top-info pull-right">
								<div class="nav">
									<ul class="list-inline">
										<li>
											<span><i class="fa fa-phone"></i>(0) 100 000 000</span>
										</li>
										<li>
											<span><i class="fa fa-envelope-o"></i>clqqz123@126.com</span>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="b-header-main style-2">
				<div class="container">
					<div class="row">
						<div class="col-xs-6 col-sm-2 col-md-2 col-lg-2">
							<div class="b-logo">
								<a href="index.jsp">
									<!--span></span>
                                    <br>
                                    <span></span-->
									<img src="media/offers/logo.png"  />
								</a>
							</div>
						</div>
						<div id="toggle-nav" class="col-xs-12 col-sm-10 col-md-8 col-lg-8 menu-wrapper clearfix">
							<div class="toggle-nav-btn">
								<button class="btn btn-menu"><i class="fa fa-bars fa-lg"></i></button>
							</div>
							<div class="b-header-menu pull-middle">
								<ul class="list-inline">
									<li>
										<a class="heading-line" href="index.jsp">首页</a>
									</li>
									<li>
										<a class="heading-line" href="category.jsp">分类</a>
									</li>
									<li>
										<a class="heading-line" href="contact.jsp">联系我们</a>
									</li>
									<li>
										<a class="heading-line" href="wishService.jsp">我的心愿单</a>
									</li>
								</ul>
							</div>
						</div>
						<div id="cart-wrapper" class="col-xs-6 col-sm-12 col-md-2 col-lg-2">
							<div class="b-cart pull-right">
								<button id="cart" class="btn btn-default-color1 btn-sm">
									<span class="price"><i class="fa fa-shopping-bag"></i> 购物车</span>
								</button>
								<div class="cart-products">
									<div class="c-holder">
										<h3 class="title">
											我的购物车
										</h3>
										<%
											if(user == null)
												out.print("<div class=\"caption\"><span></span><span class=\"product-price\">要使用购物车，请先登录</span></div>" +
														"<button type=\"button\" onclick=\"tologin();\" class=\"btn btn-primary-color2 btn-sm\">登录</button>" +
														"<script>" +
														"function tologin() {" +
														"window.location.href = \"login.jsp\";" +
														"}" +
														"</script>");
											else
											{
												userAccount ua = (userAccount)session.getAttribute("user");
												System.out.println(ua);
												List<wishCart> list = (new WCDBoperator()).searchCartByUser(ua);
												if(list.size() == 0)
													out.print("<div class=\"caption\"><span></span><span class=\"product-price\">您的购物车还能装下一头大象</span></div>");
												else{
													out.print("<ul class=\"products-list list-unstyled\">");
													for (int i = 0;i < 2;i++)
													{
														ImageUnit iu;
														if(i<list.size()) {
															iu = (new IMDBoperator()).searchImageById(list.get(i).getFid()).get(0);
															out.print("<li>" +
																	"<div class=\"b-cart-table \">" +
																	"<a href=\"#\" class=\"image\">" +
																	"<img style=\"width:70px;height:70px\" src=\"" + request.getContextPath() + "/upload/" + iu.getFimg() + "\" alt=\"/\">" +
																	"</a>" +
																	"<div class=\"caption\">" +
																	"<a class=\"product-name\" href=\"product-details.jsp?fid=" + list.get(i).getFid() + "\">"+(new FDBoperator()).searchFurnitureById(list.get(i).getFid()).getFname()+"</a>" +
																	"<span class=\"product-price\">"+list.get(i).getFnumber()+" x ￥"+ (new FDBoperator()).searchFurnitureById(list.get(i).getFid()).getFprice()+"</span>" +
																	"<div class=\"rating\">" +
																	"<span class=\"star\"><i class=\"fa fa-star\"></i></span>" +
																	"<span class=\"star\"><i class=\"fa fa-star\"></i></span>" +
																	"<span class=\"star\"><i class=\"fa fa-star\"></i></span>" +
																	"<span class=\"star\"><i class=\"fa fa-star\"></i></span>" +
																	"<span class=\"star star-empty\"><i class=\"fa fa-star-o\"></i></span>" +
																	"</div>" +
																	"</li>");
														}
													}
												}
												out.print("<div class=\"products-buttons text-center\">\n" +
														"<button onclick=\"toCart()\" type=\"button\" class=\"btn btn-default-color1 btn-sm\">更多</button>\n" +
														"<button type=\"button\" class=\"btn btn-primary-color2 btn-sm\">去结算</button>\n" +
														"</div>" +
														"<script>" +
														"function toCart()" +
														"{window.location.href=\"shopping-cart.jsp\"}" +
														"</script>");

											}
										%>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
				<div class="container">
					<div class="row">
						<div class="col-sm-12 text-center text-b-404 wow fadeInUp">
							<div class="b-404">
								<div class="image">
									<div class="empty-b">
										<div>
											<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 118 168"><style type="text/css">
													.st0{fill-rule:evenodd;clip-rule:evenodd;fill:#222222;}
												</style><g id="_x34_04"><path class="st0" d="M66.4 33.2V2.7L50.9 33.2H66.4zM34 134.1h32.5v-32.5H34V134.1zM34 66.7h32.5V34.2h-16L34 66.7zM65.8 67.9H34v32.5h15.4L65.8 67.9zM32.7 100.4V69.9l-15.4 30.5H32.7zM0.3 134.1h32.5v-32.5H16.4L0.3 134.1zM67.7 100.4h32.5V67.9H67.7V100.4zM101.1 101.6v32.5h16.5v-32.5H101.1zM67.7 167.7h32.5v-32.5H67.7V167.7zM67.7 33.2h32.5V0.7H67.7V33.2zM67.7 66.7h32.5V34.2H67.7V66.7zM67.7 134.1h32.5v-32.5H67.7V134.1z"/></g></svg>
										</div>
										<div class="zero-change">
											<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 101 168"><style type="text/css">
													.st0{fill-rule:evenodd;clip-rule:evenodd;}
												</style><path class="st0" d="M0.8 66.7h32.5V34.2H0.8V66.7zM0.8 100.4h32.5V67.9H0.8V100.4zM0.8 151.5c0 4.5 1.5 8.3 4.6 11.5 3.1 3.2 6.9 4.7 11.4 4.7h16.5v-32.5H0.8V151.5zM0.8 134.1h32.5v-32.5H0.8V134.1zM34.5 167.7H67v-32.5H34.5V167.7zM5.6 5.6c-3.2 3.2-4.7 7-4.7 11.4v16.2h32.5V0.7H16.8C12.5 0.7 8.7 2.4 5.6 5.6zM34.5 33.2H67V0.7H34.5V33.2zM95.9 5.6C92.8 2.4 89 0.7 84.7 0.7H68.2v32.5h32.5V17C100.7 12.7 99.1 8.9 95.9 5.6zM68.2 100.4h32.5V67.9H68.2V100.4zM68.2 66.7h32.5V34.2H68.2V66.7zM68.2 167.7h16.5c4.5 0 8.3-1.6 11.4-4.7 3.1-3.2 4.6-7 4.6-11.5v-16.2H68.2V167.7zM68.2 134.1h32.5v-32.5H68.2V134.1z"/></svg>
										</div>
										<div>
											<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 118 168"><style type="text/css">
													.st0{fill-rule:evenodd;clip-rule:evenodd;fill:#222222;}
												</style><path class="st0" d="M0.4 134.1h16.5v-32.5H0.4V134.1zM17.9 167.7h32.5v-32.5H17.9V167.7zM17.9 100.4h32.5V67.9H17.9V100.4zM17.9 134.1h32.5v-32.5H17.9V134.1zM85.3 69.9v30.5h15.4L85.3 69.9zM51.6 2.7v30.5h15.5L51.6 2.7zM51.6 34.2v32.5H84L67.6 34.2H51.6zM17.9 66.7h32.5V34.2H17.9V66.7zM68.7 100.4H84V67.9H52.2L68.7 100.4zM101.6 101.6H85.3v32.5h32.5L101.6 101.6zM17.9 33.2h32.5V0.7H17.9V33.2zM51.6 134.1H84v-32.5H51.6V134.1z"/></svg>
										</div>
									</div>
								</div>
								<p class="text-404">
									<img style="width: 50px;height: 50px" src="images/frown.png" alt="">心愿单只对登录用户开放
								</p>
								<a href="login.jsp" class="btn btn-primary-color2 btn-sm">去登录</a>
							</div>
						</div>
					</div>
				</div><div class="b-hr-mod">
			<hr>
		</div>
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<div class="b-features-wrapper">
							<div class="b-store-features clearfix wow fadeInUp">
								<div class="b-feature-holder col-sm-3">
									<div class="feature-block">
										<div class="feature-icon">
											<i class="fa fa-thumbs-up"></i>
										</div>
										<div class="feature-info">
											<p>质量担保</p>
											<p>全场质量保障</p>
										</div>
									</div>
								</div>
								<div class="b-feature-holder col-sm-3">
									<div class="feature-block">
										<div class="feature-icon">
											<i class="fa fa-truck"></i>
										</div>
										<div class="feature-info">
											<p>极速购物</p>
											<p>体验不一样的网购家具</p>
										</div>
									</div>
								</div>
								<div class="b-feature-holder col-sm-3">
									<div class="feature-block">
										<div class="feature-icon">
											<i class="fa fa-commenting"></i>
										</div>
										<div class="feature-info">
											<p>信息建议</p>
											<p>欢迎提出宝贵的建议</p>
										</div>
									</div>
								</div>
								<div class="b-feature-holder col-sm-3">
									<div class="feature-block">
										<div class="feature-icon">
											<i class="fa fa-headphones"></i>
										</div>
										<div class="feature-info">
											<p>7x24 无休服务</p>
											<p>随时随地找到我们</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="js/jquery-1.11.2.min.js"></script>
		<script src="js/bootstrap.min.js"></script>

		<script src="assets/switcher/js/dmss.js"></script>

		<script src="js/jquery-ui.min.js"></script>
		<script src="js/modernizr.custom.js"></script>
		<script src="js/wow.min.js"></script>

		<!--bootstrap-select -->
		<script src="assets/bootstrap-select/bootstrap-select.min.js"></script>

		<!-- Countdown Timer -->
		<script src="assets/countdown/dscountdown.min.js"></script>

		<!--Owl Carousel-->
		<script src="assets/owl-carousel/owl.carousel.min.js"></script>

		<!--bx slider-->
		<script src="assets/bxslider/jquery.bxslider.min.js"></script>

		<!-- slider-pro-master -->
		<script src="assets/slider-pro-master/js/jquery.sliderPro.min.js"></script>

		<script src="assets/prettyPhoto/js/jquery.prettyPhoto.js"></script>
		<script src="js/waypoints.min.js"></script>
		<script src="js/jquery.easypiechart.min.js"></script>
		<script src="js/jquery.spinner.min.js"></script>
		<script src="js/isotope.pkgd.min.js"></script>
		<script src="js/jquery.placeholder.min.js"></script>
		<script src="js/theme.js"></script>

	</body>

</html>

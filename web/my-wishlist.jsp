<%@ page import="com.JDBC.User.userAccount" %>
<%@ page import="java.util.List" %>
<%@ page import="com.JDBC.Appl.FDBoperator" %>
<%@ page import="com.JDBC.Appl.WCDBoperator" %>
<%@ page import="com.JDBC.WishAndCart.wishCart" %>
<%@ page import="com.JDBC.Appl.IMDBoperator" %>
<%@ page import="com.JDBC.ImgIO.ImageUnit" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/2
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en-US">
	
<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>有点心愿</title><link href="css/master.css" rel="stylesheet">
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

										<!--ul class="products-list list-unstyled">
                                            <li>
                                                <div class="b-cart-table ">
                                                    <a href="#" class="image">
                                                        <img src="media/cart-products/product1.jpg" alt="/">
                                                    </a>
                                                    <div class="caption">
                                                        <a class="product-name" href="product-details.jsp">Huawei Mate S</a>
                                                        <span class="product-price">1 x $280.00</span>
                                                        <div class="rating">
                                                            <span class="star"><i class="fa fa-star"></i></span>
                                                            <span class="star"><i class="fa fa-star"></i></span>
                                                            <span class="star"><i class="fa fa-star"></i></span>
                                                            <span class="star"><i class="fa fa-star"></i></span>
                                                            <span class="star star-empty"><i class="fa fa-star-o"></i></span>
                                                        </div>
                                                    </div>
                                                    <button class="btn btn-remove"><i class="fa fa-trash fa-lg"></i></button>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="b-cart-table ">
                                                    <a href="#" class="image">
                                                        <img src="media/cart-products/product2.jpg" alt="/">
                                                    </a>
                                                    <div class="caption">
                                                        <a class="product-name" href="product-details.jsp">Sony xperia z5</a>
                                                        <span class="product-price">1 x $620.00</span>
                                                        <div class="rating">
                                                            <span class="star"><i class="fa fa-star"></i></span>
                                                            <span class="star"><i class="fa fa-star"></i></span>
                                                            <span class="star"><i class="fa fa-star"></i></span>
                                                            <span class="star"><i class="fa fa-star"></i></span>
                                                            <span class="star star-empty"><i class="fa fa-star-o"></i></span>
                                                        </div>
                                                    </div>
                                                    <button class="btn btn-remove"><i class="fa fa-trash fa-lg"></i></button>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="products-subtotal text-right">
                                                    Cart Subtotal <span class="subtotal-price">$900.00</span>
                                                </div>
                                            </li>
                                        </ul>
                                        <div class="products-buttons text-center">
                                            <button type="button" class="btn btn-default-color1 btn-sm">view cart</button>
                                            <button type="button" class="btn btn-primary-color2 btn-sm">Checkout</button>
                                        </div-->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
			<section class="section-mywishlist">
				<div class="b-page-header">
					<div class="container">
						<div class="row">
							<div class="col-sm-12 clearfix">
								<h3 class="page-title pull-left">我的心愿单</h3>
								<div class="b-breadcrumbs pull-right">
									<ul class="list-unstyled">
										<li>
											<a href="#">首页</a>
										</li>
										<li>
											<span>我的心愿单</span>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<!--div class="col-sm-12 text-right">
							<button class="btn btn-default-color1 btn-sm btn-clear" type="button">清空心愿单</button>
						</div-->
						<div class="col-sm-12 mywishlist-container">
							<%
								userAccount ua = (userAccount)session.getAttribute("user");
								System.out.println(ua);
								List<wishCart> list = (new WCDBoperator()).searchWishByUser(ua);
								System.out.println(list.size());
								if(list.size() == 0)
								{
								    out.print("<div style=\"text-align:center\"><span style=\"font-family:微软雅黑;font-size:32px\">您的心愿单还能装下一头大象</span></div>");
								}
								int i = 0;
								for(wishCart wc:list)
								{
								    if(i % 4 == 0)
								        out.print("<div class=\"row\">");
								    out.print("<div class=\"col-xs-6 col-sm-3 col-md-3 col-lg-3\">" +
											"<div class=\"b-item-card wow fadeInUp\">" +
											"<div class=\"image\">" +
									 		"<a href=\"product-details.jsp?fid="+wc.getFid()+"\">" +
											"<img src=\""+request.getContextPath()+"/upload/"+(new IMDBoperator()).searchImageById(wc.getFid()).get(0).getFimg()+"\" class=\"img-responsive center-block\">" +
											"</a>" +
											"</div>" +
											"<div class=\"card-info\">" +
											"<div class=\"caption\">" +
											"<p class=\"name-item\">" +
											"<a class=\"product-name\" href=\"product-details.jsp?fid="+wc.getFid()+"\">"+(new FDBoperator()).searchFurnitureById(wc.getFid()).getFname()+"</a>" +
											"</p>" +
											"<span class=\"product-price\">￥"+(new FDBoperator()).searchFurnitureById(wc.getFid()).getFprice()+"</span>" +
											"</div>" +
											"<div class=\"add-buttons\">" +
											"<button type=\"button\" onclick=\"removeFromWish("+wc.getFid()+")\" class=\"btn btn-add btn-add-remove\"><i class=\"fa fa-trash\"></i></button>" +
											"<button type=\"button\" onclick=\"addtocart("+wc.getFid()+")\" class=\"btn btn-add btn-add-cart\"><i class=\"fa fa-shopping-cart\"></i></button>                                </div>" +
											"</div>" +
											"</div>" +
											"</div>");
								    if(++i%4 == 0)
								        out.print("</div>");
								}
							%>
						</div>
						<script>
							function removeFromWish(fid) {
								window.location.href="deleteFromWish.jsp?fid="+fid;
                            }
                            function addtocart(fid) {
								window.location.href="addToCart.jsp?fid="+fid;
                            }
						</script>
					</div>
				</div>
				<div class="b-hr-mod">
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
			</section> 
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

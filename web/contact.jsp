<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.JDBC.User.userAccount" %>
<%@ page import="com.JDBC.WishAndCart.wishCart" %>
<%@ page import="com.JDBC.Appl.WCDBoperator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.JDBC.ImgIO.ImageUnit" %>
<%@ page import="com.JDBC.Appl.IMDBoperator" %>
<%@ page import="com.JDBC.Appl.FDBoperator" %>
<html>
	
<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>有点联系</title>
	<link href="css/master.css" rel="stylesheet">
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
			<section class="section-contact">
				<div class="b-page-header">
					<div class="container">
						<div class="row">
							<div class="col-sm-12 clearfix">
								<h3 class="page-title pull-left">联系我们</h3>
								<div class="b-breadcrumbs pull-right">
									<ul class="list-unstyled">
										<li>
											<a href="#">首页</a>
										</li>
										<li>
											<span>联系我们</span>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 wow fadeInLeft">
							<h3 class="heading-line">
								发送您的消息
							</h3>
							<div id="success"></div>
							<form novalidate id="contactForm" class="b-form" >
								<div class="form-group">
									<div class="b-form-description">
										<p>
											给我们发送建议。
										</p>
									</div>
									<div class="row">
										<div class="col-sm-6">
											<input type="text" class="form-control" id="form-first-name" placeholder="姓氏 *">
										</div>
										<div class="col-sm-6">
											<input type="text" class="form-control" id="form-last-name" placeholder="名字 *">
										</div>
										<div class="col-sm-12">
											<input type="email" class="form-control" id="form-email" placeholder="邮箱 *">
										</div>
										<div class="col-sm-12">
											<input type="text" class="form-control" id="form-subject" placeholder="主要">
										</div>
										<div class="col-sm-12">
											<textarea id="form-comment" class="form-control" rows="6" placeholder="详细信息"></textarea>
										</div>
										<div class="col-sm-12">
											<button type="submit" class="btn btn-default">发送信息</button>
										</div>
									</div>
								</div>
							</form>
						</div>
						<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 wow fadeInRight">
							<h3 class="heading-line">
								我们在这里
							</h3>
							<div class="row">
								<div class="col-sm-12">
									<div class="b-map">
										<div id="container" style="width:100%; height:300px; border:none;"></div>
                                        <script src="https://webapi.amap.com/maps?v=1.4.10&key=3101aa4f510ba5fca322d145596ee598"></script>
                                        <script type="text/javascript">
                                            var map = new AMap.Map('container', {
                                                resizeEnable: true,
                                                center:[114.50839251279832, 38.084616011481955],
                                                zoom:11
                                            });
                                            AMap.plugin('AMap.ToolBar',function(){
                                                var toolbar = new AMap.ToolBar();
                                                map.addControl(toolbar)
                                            })
                                            var marker = new AMap.Marker({
                                                position: new AMap.LngLat(114.50839251279832, 38.084616011481955),   // 经纬度对象，也可以是经纬度构成的一维数组[116.39, 39.9]
                                                title: '我们'
                                            });
                                            marker.setMap(map);
                                            marker.setTitle('我们');
                                        </script>
                                        <script type="text/javascript" src="https://webapi.amap.com/demos/js/liteToolbar.js"></script>
									</div>
									<div class="b-contact-info">
										<ul class="list-unstyled">
											<li>
												<span class="info-title"><i class="fa fa-map-pin"></i>地址</span>
												<span class="info-text">中国河北省石家庄市北二环东路17号石家庄铁道大学</span>
											</li>
											<li>
												<span class="info-title"><i class="fa fa-phone"></i>7x24服务热线</span>
												<span class="info-text">+123 456 7890</span>
											</li>
											<li>
												<span class="info-title"><i class="fa fa-envelope-o"></i>邮箱</span>
												<span class="info-text">order@ismilestore.net</span>
											</li>
											<li>
												<span class="info-title"><i class="fa fa-skype"></i>QQ</span>
												<span class="info-text">8888888888</span>
											</li>
										</ul>
									</div>
									<div class="b-socials clearfix">
										<ul class="list-unstyled">
											<li><a href="#"><i class="fa fa-twitter fa-fw"></i></a></li>
											<li><a href="#"><i class="fa fa-facebook fa-fw"></i></a></li>
											<li><a href="#"><i class="fa fa-linkedin fa-fw"></i></a></li>
											<li><a href="#"><i class="fa fa-google-plus fa-fw"></i></a></li>
											<li><a href="#"><i class="fa fa-pinterest-p fa-fw"></i></a></li>
											<li><a href="#"><i class="fa fa-youtube-play fa-fw"></i></a></li>
										</ul>
									</div>
								</div>
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

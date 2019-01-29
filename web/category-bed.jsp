<%@ page import="com.JDBC.Furniture.furnitureUnit" %>
<%@ page import="java.util.List" %>
<%@ page import="com.JDBC.Appl.FDBoperator" %>
<%@ page import="com.JDBC.Appl.IMDBoperator" %>
<%@ page import="com.JDBC.User.userAccount" %>
<%@ page import="com.JDBC.WishAndCart.wishCart" %>
<%@ page import="com.JDBC.Appl.WCDBoperator" %>
<%@ page import="com.JDBC.ImgIO.ImageUnit" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/28
  Time: 23:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>有点分类</title><link href="css/master.css" rel="stylesheet">
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
			<section class="section-category">
				<div class="b-page-header">
					<div class="container">
						<div class="row">
							<div class="col-sm-12 clearfix">
								<h3 class="page-title pull-left">分类视图</h3>
								<div class="b-breadcrumbs pull-right">
									<ul class="list-unstyled">
										<li>
											<a href="index.jsp">首页</a>
										</li>

										<li>
											<span>分类</span>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
							<div class="lb-content lb-content-accordion">
								<div id="accordion1" class="accordion-l-box wow fadeInUp enable-accordion" data-active="false" data-collapsible="true" data-height-style="content">
									<h3 class="accordion-header-mod">
										<span class="heading-line title-accordion-menu-item">客厅</span>
										<span class="accordion-icon"></span>
									</h3>
									<div>
										<ul>
											<li class="active">
												<a href="category.jsp">
													<i class="fa fa-caret-square-o-right"></i>
													沙发
													<!--span class="category-counter">[25]</span-->
												</a>
											</li>
											<li>
												<a href="#">
													<i class="fa fa-caret-square-o-right"></i>
													电视柜
													<!--span class="category-counter">[08]</span-->
												</a>
											</li>
											<li>
												<a href="#">
													<i class="fa fa-caret-square-o-right"></i>
													茶几
													<!--span class="category-counter">[39]</span-->
												</a>
											</li>
											<li>
												<a href="#">
													<i class="fa fa-caret-square-o-right"></i>
													多功能柜
													<!--span class="category-counter">[50]</span-->
												</a>
											</li>
											<li>
												<a href="#">
													<i class="fa fa-caret-square-o-right"></i>
													装饰椅
													<!--span class="category-counter">[17]</span-->
												</a>
											</li>
												</ul>
											</li>
										</ul>
									</div>
								</div>
								<div id="accordion2" class="accordion-l-box wow fadeInUp enable-accordion" data-active="0" data-collapsible="true" data-height-style="content">
									<h3 class="accordion-header-mod">
										<span class="heading-line title-accordion-menu-item">卧室</span>
										<span class="accordion-icon"></span>
									</h3>
									<div>
										<ul>
											<li class="active">
												<a href="category-bed.jsp">
													<i class="fa fa-caret-square-o-right"></i>
													床
													<!--span class="category-counter">[25]</span-->
												</a>
											</li>
											<li>
												<a href="#">
													<i class="fa fa-caret-square-o-right"></i>
													床垫
													<!--span class="category-counter">[08]</span-->
												</a>
											</li>
											<li>
												<a href="#">
													<i class="fa fa-caret-square-o-right"></i>
													床头柜
													<!--span class="category-counter">[39]</span-->
												</a>
											</li>
											<li>
												<a href="#">
													<i class="fa fa-caret-square-o-right"></i>
													衣柜
													<!--span class="category-counter">[50]</span-->
												</a>
											</li>
											<li>
												<a href="#">
													<i class="fa fa-caret-square-o-right"></i>
													斗柜
													<!--span class="category-counter">[17]</span-->
												</a>
											</li>
											<li class="more">
												<span class="load-more">load more</span>
												<ul class="more-list">
													<li>
														<a href="#">
															<i class="fa fa-caret-square-o-right"></i>
															梳妆台
															<!--span class="category-counter">[08]</span-->
														</a>
													</li>
													<li>
														<a href="#">
															<i class="fa fa-caret-square-o-right"></i>
															梳妆镜
															<!--span class="category-counter">[39]</span-->
														</a>
													</li>
													<li>
														<a href="#">
															<i class="fa fa-caret-square-o-right"></i>
															梳妆凳
															<!--span class="category-counter">[39]</span-->
														</a>
													</li>
												</ul>
											</li>
										</ul>
									</div>
								</div>
								<div id="accordion3" class="accordion-l-box wow fadeInUp enable-accordion" data-active="false" data-collapsible="true" data-height-style="content">
									<h3 class="accordion-header-mod">
										<span class="heading-line title-accordion-menu-item">餐厅</span>
										<span class="accordion-icon"></span>
									</h3>
									<div>
										<ul>
											<li class="active">
												<a href="#">
													<i class="fa fa-caret-square-o-right"></i>
													餐桌
													<!--span class="category-counter">[25]</span-->
												</a>
											</li>
											<li>
												<a href="#">
													<i class="fa fa-caret-square-o-right"></i>
													餐椅
													<!--span class="category-counter">[08]</span-->
												</a>
											</li>
												</ul>
											</li>
										</ul>
									</div>
								</div>
								<div id="accordion" class="accordion-l-box wow fadeInUp enable-accordion" data-active="false" data-collapsible="true" data-height-style="content">
									<h3 class="accordion-header-mod">
										<span class="heading-line title-accordion-menu-item">书房</span>
										<span class="accordion-icon"></span>
									</h3>
									<div>
										<ul>
											<li class="active">
												<a href="#">
													<i class="fa fa-caret-square-o-right"></i>
													书桌
												</a>
											</li>
											<li>
												<a href="#">
													<i class="fa fa-caret-square-o-right"></i>
													办公椅
													<!--span class="category-counter">[08]</span-->
												</a>
											</li>

												</ul>
											</li>
										</ul>
									</div>
								</div>

							</div>
							<div class="side-offer wow fadeInUp">
								<div class="b-offers">
									<a href="#">
										<img src="media/offers/category-b-side.jpg" class="img-responsive" alt="/">
									</a>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
							<div class="b-offers wow fadeInUp">
								<a href="3dback2.html">
									<img src="media/offers/category-b1.jpg" class="img-responsive center-block" alt="/">
								</a>
							</div>
							<div class="b-settings">
								<div class="settings-tools">
									<h3 class="heading-line pull-left">
										床
									</h3>
									<div class="settings-block pull-right">
										<div class="settings-view hidden-md hidden-sm hidden-xs">
											<ul id="type-of-display" class="list-unstyled">
												<li>
													<button class="btn toogle-view grid-list">
														<i class="fa fa-th-list fa-fw"></i>
													</button>
												</li>
												<li>
													<button class="btn toogle-view grid-3 active-view">
														<i class="fa fa-th-large fa-fw"></i>
													</button>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<!--div class="settings-result text-center">
									<p>Showing restults 1 to 12 of 140 total</p>
								</div-->
							</div>
							<div class="b-grid">
								<div class="row">
                                    <%
                                        List<furnitureUnit> list = (new FDBoperator()).searchFurnitureByType("床");
                                        if(list.size() == 0)
                                            out.print("<div class=\"name-item\">该分类下没有家具</div>");
                                        else
                                        {
                                            out.print("<div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-6\">" +
                                                    "<div class=\"b-item-card wow fadeInUp\">" +
                                                    "<div class=\"image\">\n" +
                                                    "<!--a href=\""+request.getContextPath()+"/upload/"+(new IMDBoperator()).searchImageById(list.get(0).getFid()).get(0).getFimg() +"\" data-gal=\"prettyPhoto\" title=\"Item\"-->" +
                                                    "<img style=\"width:260px;height:246px\" src=\""+request.getContextPath()+"/upload/"+(new IMDBoperator()).searchImageById(list.get(0).getFid()).get(0).getFimg() +"\" class=\"img-responsive center-block\">" +
                                                    "<!--div class=\"image-add-mod\">\n" +
                                                    "<span class=\"btn btn-lightbox btn-default-color1 btn-sm\">" +
                                                    "<i class=\"fa fa-search-plus fa-lg\"></i>" +
                                                    "</span>" +
                                                    "</div>" +
                                                    "</a-->" +
                                                    "</div>" +
                                                    "<div class=\"card-info\">" +
                                                    "<div class=\"caption\">" +
                                                    "<div class=\"name-item\">" +
                                                    "<a class=\"product-name\" href=\"product-details.jsp?fid="+list.get(0).getFid()+"\">"+list.get(0).getFname()+"</a>" +
                                                    "<div class=\"rating\">" +
                                                    "<span class=\"star\"><i class=\"fa fa-star\"></i></span>" +
                                                    "<span class=\"star\"><i class=\"fa fa-star\"></i></span>" +
                                                    "<span class=\"star\"><i class=\"fa fa-star\"></i></span>" +
                                                    "<span class=\"star\"><i class=\"fa fa-star\"></i></span>" +
                                                    "<span class=\"star star-empty\"><i class=\"fa fa-star-o\"></i></span>" +
                                                    "</div>" +
                                                    "</div>" +
                                                    "<div class=\"card-price-block\">" +
                                                    "<span class=\"price-title\">价格</span>" +
                                                    "<span class=\"product-price\">￥"+list.get(0).getFprice()+"</span>" +
                                                    "</div>" +
                                                    "<div class=\"product-description\">" +
                                                    "<p>这里是商品描述，这里是商品描述，这里是商品描述，这里是商品描述，这里是商品描述，这里是商品描述" +
                                                    "</p>" +
                                                    "</div>" +
                                                    "</div>" +
                                                    "<div class=\"add-buttons\">" +
                                                    "<button type=\"button\" class=\"btn btn-add btn-add-compare\"><i class=\"fa fa-refresh\"></i></button>" +
                                                    "<button type=\"button\" onclick=\"addtowish("+list.get(0).getFid()+")\" class=\"btn btn-add btn-add-wish\"><i class=\"fa fa-heart-o\"></i></button>" +
                                                    "<button type=\"button\" onclick=\"addtocart("+list.get(0).getFid()+")\" class=\"btn btn-add btn-add-cart\"><i class=\"fa fa-shopping-cart\"></i></button>" +
                                                    "<div class=\"cart-add-buttons\">" +
                                                    "<button type=\"button\" onclick=\"addtocart("+list.get(0).getFid()+")\" class=\"btn btn-cart-color1\"><i class=\"fa fa-shopping-cart\"></i> 添加到购物车</button>" +
                                                    "</div>" +
                                                    "</div>" +
                                                    "</div>" +
                                                    "</div>" +
                                                    "</div>");
                                            for(int i = list.size()-1;i >0;i--)
                                            {
                                                if(i < 12){
                                                        out.print("<div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-6\">" +
                                                                "<div class=\"b-item-card wow fadeInUp\">" +
                                                                "<div class=\"image\">" +
                                                                "<!--a href=\""+request.getContextPath()+"/upload/"+(new IMDBoperator()).searchImageById(list.get(i).getFid()).get(0).getFimg() +"\" data-gal=\"prettyPhoto\" title=\"Item\"-->" +
                                                                "<img src=\""+request.getContextPath()+"/upload/"+(new IMDBoperator()).searchImageById(list.get(i).getFid()).get(0).getFimg() +"\" class=\"img-responsive center-block\">" +
                                                                "<!--div class=\"image-add-mod\">" +
                                                                "<span class=\"btn btn-lightbox btn-default-color1 btn-sm\">" +
                                                                "<i class=\"fa fa-search-plus fa-lg\"></i>" +
                                                                "</span>" +
                                                                "</div>" +
                                                                "</a-->" +
                                                                "</div>" +
                                                                "<div class=\"card-info\">" +
                                                                "<div class=\"caption\">" +
                                                                "<div class=\"name-item\">" +
                                                                "<a class=\"product-name\" href=\"product-details.jsp?fid="+list.get(i).getFid()+"\">"+list.get(i).getFname()+"</a>" +
                                                                "<div class=\"rating\">" +
                                                                "<span class=\"star\"><i class=\"fa fa-star\"></i></span>" +
                                                                "<span class=\"star\"><i class=\"fa fa-star\"></i></span>" +
                                                                "<span class=\"star\"><i class=\"fa fa-star\"></i></span>" +
                                                                "<span class=\"star\"><i class=\"fa fa-star\"></i></span>" +
                                                                "<span class=\"star star-empty\"><i class=\"fa fa-star-o\"></i></span>" +
                                                                "</div>" +
                                                                "</div>" +
                                                                "<div class=\"card-price-block\">" +
                                                                "<span class=\"price-title\">价格</span>" +
                                                                "<span class=\"product-price\">￥"+list.get(i).getFprice()+"</span>" +
                                                                "</div>" +
                                                                "<div class=\"product-description\">" +
                                                                "<p>这里是商品描述，这里是商品描述，这里是商品描述，这里是商品描述，这里是商品描述，这里是商品描述" +
                                                                "</p>" +
                                                                "</div>" +
                                                                "</div>" +
                                                                "<div class=\"add-buttons\">" +
                                                                "<button type=\"button\" class=\"btn btn-add btn-add-compare\"><i class=\"fa fa-refresh\"></i></button>" +
                                                                "<button type=\"button\" onclick=\"addtowish("+list.get(i).getFid()+")\" class=\"btn btn-add btn-add-wish\"><i class=\"fa fa-heart-o\"></i></button>" +
                                                                "<button type=\"button\" onclick=\"addtocart("+list.get(i).getFid()+")\" class=\"btn btn-add btn-add-cart\"><i class=\"fa fa-shopping-cart\"></i></button>" +
                                                                "<div class=\"cart-add-buttons\">" +
                                                                "<button type=\"button\" onclick=\"addtocart("+list.get(i).getFid()+")\" class=\"btn btn-cart-color1\"><i class=\"fa fa-shopping-cart\"></i> 添加到购物车</button>" +
                                                                "</div>" +
                                                                "</div>" +
                                                                "</div>" +
                                                                "</div>" +
                                                                "</div>");
                                                    }

                                            }
                                        }
                                    %>
									<script>
                                        function addtocart(param) {
                                            window.location.href="addToCart.jsp?fid="+param;
                                        }
                                    </script>
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

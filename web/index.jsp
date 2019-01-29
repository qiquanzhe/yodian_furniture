<%@ page import="com.JDBC.User.userAccount" %>
<%@ page import="com.JDBC.WishAndCart.wishCart" %>
<%@ page import="com.JDBC.Appl.WCDBoperator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.JDBC.ImgIO.ImageUnit" %>
<%@ page import="com.JDBC.Appl.IMDBoperator" %>
<%@ page import="com.JDBC.Appl.FDBoperator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	
<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>有点首页</title>
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

		<%
			String s = (String)session.getAttribute("loginModel");
			session.setAttribute("loginModel",s);
		%>
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
			<section class="section-home home-2">
				<section class="main-slider">
					<div class="slider-pro full-width-slider" id="main-slider" data-width="100%" data-height="570" data-fade="true" data-buttons="true" data-wait-for-layers="true" data-thumbnail-pointer="false" data-touch-swipe="false" data-autoplay="true" data-auto-scale-layers="true" data-visible-size="100%" data-force-size="fullWidth" data-autoplay-delay="5000" >
						<div class="sp-slides">
							<div class="sp-slide">
								<img class="sp-image" src="media/slides/slide_1.jpg"
									data-src="media/slides/slide_1.jpg"
									data-retina="media/slides/slide_1.jpg" alt="slide1" />
								<div class="sp-layer slider-discount"
									data-horizontal="12.6%" data-vertical="20.5%"
									data-show-transition="left" data-hide-transition="up" data-show-delay="400" data-hide-delay="200">
                                    <img src="media/slides/one.png" alt="samsung one">
								</div>
								
								<div class="sp-layer"
									data-horizontal="16.9%" data-vertical="68.7%"
									data-show-transition="left" data-hide-transition="up" data-show-delay="1000">
									<a class="btn btn-primary-color1 btn-sm" href="category.jsp">SHOP NOW</a>
								</div>
							</div>

							<div class="sp-slide">
								<img class="sp-image" src="media/slides/slide_2.jpg"
									data-src="media/slides/slide_2.jpg"
									data-retina="media/slides/slide_2.jpg" alt="slide2" />
								
								
								<div class="sp-layer"
									data-horizontal="14.8%" data-vertical="12.5%"
									data-show-transition="left" data-hide-transition="up" data-show-delay="400" data-hide-delay="200">
									<img src="media/slides/galaxy.png" alt="samsung galaxy">
								</div>
								
								<div class="sp-layer sl3"
									data-horizontal="20%" data-vertical="63.4%"
									data-show-transition="left" data-hide-transition="up" data-show-delay="600" data-hide-delay="100">
                                    <button onclick="javascript:window.location.href='category.jsp';" class="btn btn-default-color1 btn-sm" type="button">SHOP NOW</button>
                              </div>
							</div>

							<div class="sp-slide">
								<img class="sp-image" src="media/slides/slide_3.jpg"
									data-src="media/slides/slide_3.jpg"
									data-retina="media/slides/slide_3.jpg" alt="slide3" />
								<div class="sp-layer slider-discount"
									data-horizontal="12.6%" data-vertical="12.5%"
									data-show-transition="left" data-hide-transition="up" data-show-delay="400" data-hide-delay="200">
                                    <img src="media/slides/two.png" alt="samsung two">
								</div>
								<div class="sp-layer sl3"
									data-horizontal="18.5%" data-vertical="74.4%"
									data-show-transition="left" data-hide-transition="up" data-show-delay="1000">
									<button onclick="javascript:window.location.href='category.jsp';" class="btn btn-default-color1 btn-sm" type="button">SHOP NOW</button>
								</div>
							</div>

						</div>
					</div>
				</section>
				<div class="b-prom-offers">
					<div class="container">
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
								<a href="#" class="wow fadeInLeft">
									<img src="media/offers/promotion-offers/prom3-1.jpg" class="img-responsive" alt="/">
								</a>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
								<a href="#" class="wow fadeInRight">
									<img src="media/offers/promotion-offers/prom3-2.jpg" class="img-responsive" alt="/">
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="b-3offer-row">
					<div class="container">
						<div class="row">
							<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 wow bounceInUp">
								<a href="#">
									<img src="media/offers/offers-row/rowb-1.jpg" class="img-responsive center-block" alt="/">
								</a>
							</div>
							<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 wow bounceInUp">
								<a href="#">
									<img src="media/offers/offers-row/rowb-2.jpg" class="img-responsive center-block" alt="/">
								</a>
							</div>
							<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 wow bounceInUp">
								<a href="#">
									<img src="media/offers/offers-row/rowb-3.jpg" class="img-responsive center-block" alt="/">
								</a>
							</div>
						</div>
					</div>
				</div>
<div class="b-featured b-hot-deal-mod">
					<div class="container">
						<div class="row">
							<div class="col-sm-8">
								<div class= "row">
									<div class="hot-deal-mod-item clearfix">
										<div>
											<div class="col-sm-5">
												<div class="image">
													<img src="media/item-card-media/hot-deal-mod.png" class="img-responsive center-block" alt="/">
												</div>
											</div>
											<div class="col-sm-7">
												<div class="detail-info">
													<div class="card-info">
														<div class="caption">
															<div class="name-item">弧光圆舞Dazzling Arc</div>
															<div class="rating heading-line">
																<span class="star"><i class="fa fa-star"></i></span>
																<span class="star"><i class="fa fa-star"></i></span>
																<span class="star"><i class="fa fa-star"></i></span>
																<span class="star"><i class="fa fa-star"></i></span>
																<span class="star star-empty"><i class="fa fa-star-o"></i></span>
															</div>
															<div class="product-description">
																<p>多一度灰的雅致双色，天然纹理流转时光印记，飘逸弧线，释放木的优雅张力，每一个日子都温柔有光，都值得踮起脚尖轻快起舞。<br>
																优雅设计取悦挑剔双眸，美食好味犒赏舌尖味蕾，杯盏晶莹剔透，新酒清甜微醺，美味与温情，在这里温柔蔓延</p>
																<a href="#">查看详情</a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="b-hot-deal wow fadeInRight">
									<div class="hot-deal-card">
										<!--div class="countdown" data-end-date="December 31, 2017 23:59:00" data-theme="custom" data-title-days="DAY" data-title-hours="HRS" data-title-minutes="MINS" data-title-seconds="SECS" ></div-->
										<div class="card-info">
											<div class="caption">
												<div class="deal-prices clearfix">
													<div class="deal pull-left">
														<span>优惠价格</span>
														<br>
														<span class="product-price">499.00元</span>
													</div>
													<div class="regular pull-right">
														<span>原价</span>
														<br>
														<span class="product-price-old">649.00元</span>
													</div>
												</div>
											</div>
											<div class="cart-add-buttons">
												<button id="add-cart1" type="button" class="btn btn-add-cart-full"><!--span><i class="fa fa-shopping-cart"></i></span-->加入购物车</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
<div class="b-latest-mod">
					<div class="container">
						<div class="row">
<div class="col-sm-12">
<h3 class="heading-line-long">今日推荐</h3>
  <div class="custom-nav-mod">
	  <div class="slider-nav">
  <a class="slider-prev latest-mod-prev"><i class="fa fa-chevron-left"></i></a>
  <span class="nav-divider"></span>
  <a class="slider-next latest-mod-next"><i class="fa fa-chevron-right"></i></a>
  </div>
</div>
</div>
 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	<div class="row">
		<div class="latest-mod-wrapper enable-owl-carousel" data-loop="false" data-auto-width="false" data-dots="false" data-nav="false" data-margin="0" data-responsive-class="true" data-responsive='{"0":{"items":1},"991":{"items":1},"992":{"items":2}}' data-slider-next=".latest-mod-next" data-slider-prev=".latest-mod-prev">
										<div class="latest-mod-item">
											<div>
												<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
													<div class="image">
														<ul class="latest-mod-imgs enable-bx-slider" data-pager-custom="null" data-controls="false" data-min-slides="1" data-max-slides="1" data-slide-width="0" data-slide-margin="0" data-pager="true" data-mode="horizontal" data-infinite-loop="false">
															<li>
																<a href="#">
																	<img src="media/item-card-media/latest1.jpg" alt="/">
																</a>
															</li>
															<li>
																<a href="#">
																	<img src="media/item-card-media/latest2.jpg" alt="/">
																</a>
															</li>
															<li>
																<a href="#">
																	<img src="media/item-card-media/latest3.jpg" alt="/">
																</a>
															</li>
														</ul>
													</div>
												</div>
												<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
													<div class="detail-info">
														<div class="card-info">
														  <div class="caption">
																<div class="name-item heading-line">蓝调探戈Blues Tango</div>
																<div class="add-description">
																	<ul class="list-unstyled">
                                    <li>传统与当代碰撞融合，灵感碎片肆意迸发<br>
																	  进入一段让人沉浸的生活新乐章<br>
																	  随手翻阅已细微泛黄的乐谱<br>
																	  泛着波光的旖旎旧梦在脑海中不断涌现<br>
																	  每一个音符都是点滴人生的叙述<br>
																	  跳动在指尖，让一段段情愫有了归属
																	</li>
                                                                      <br>
																	</ul>
															  </div>
															  <a href="#" class="btn btn-default-color1 btn-sm">查看详情</a>
														  </div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="latest-mod-item">
											<div>
												<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
													<div class="image">
														<ul class="latest-mod-imgs enable-bx-slider" data-pager-custom="null" data-controls="false" data-min-slides="1" data-max-slides="1" data-slide-width="0" data-slide-margin="0" data-pager="true" data-mode="horizontal" data-infinite-loop="false">
															<li>
																<a href="#">
																	<img src="media/item-card-media/1.jpg" class="img-responsive center-block" alt="/">
																</a>
															</li>
															<li>
																<a href="#">
																	<img src="media/item-card-media/2.jpg" class="img-responsive center-block" alt="/">
																</a>
															</li>
															<li>
																<a href="#">
																	<img src="media/item-card-media/3.jpg" class="img-responsive center-block" alt="/">
																</a>
															</li>
														</ul>
													</div>
												</div>
												<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
													<div class="detail-info">
														<div class="card-info">
															<div class="caption">
																<div class="name-item heading-line">夏洛克公寓Sherlock′s </div>
																<div class="add-description">
																	<ul class="list-unstyled">
																	  <li>件件物品在艺术氛围的衬托下韵味十足<br>
																	    灵动且张力十足的传记圆腿<br>
																	    简约与典雅的结合<br>
																	    现代都市里一笔浓墨重彩的色调<br>
																	    简约美式里一缕典雅的英伦之风<br>
																	    经典的场景，奇妙的邂逅<br>
																    你，是否也在等待夏洛克的到来</li>
																	</ul>
																</div>
																<a href="#" class="btn btn-default-color1 btn-sm">查看详情</a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
                                        </div>
				<div class="b-editor-choice">
					<div class="container">
						<div class="row">
						  <div class="col-sm-12">
								<h3 class="heading-line-long">热门商品</h3>
							</div>
							<div class="col-sm-12">
								<div class="row">
									<div class="b-related">
										<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3 wow fadeInUp">
											<div class="b-item-card wow fadeInUp">
												<div class="special-plank sale">
													<span>-20%</span>
												</div>
												<div class="image">
													<a href="#">
														<img src="media/item-card-media/1.png" class="img-responsive center-block" alt="/">
													</a>
													<div class="image-add-mod">
														<div class="add-description">
															<div>
																<span></span>
																<br>
																<span></span>
																<br>
																<span></span>
																<br>
																<span></span>
																<br>
																<button class="btn btn-default-color1 btn-sm" type="button"><i class="fa fa-refresh fa-lg"></i></button>
																<!--a href="media/item-card-media/1.png" data-gal="prettyPhoto" title="田园木制" class="btn btn-lightbox btn-default-color1 btn-sm">
																	<i class="fa fa-search-plus fa-lg"></i>
																</a-->
															</div>

														</div>
													</div>
												</div>
												<div class="card-info">
													<div class="caption">
														<p class="name-item">
															<a class="product-name" href="#">田园木制</a>
														</p>
														<span class="product-price">280.00</span>
														<span class="product-price-old">649.00</span>
													</div>
													<div class="add-buttons">
														<button type="button" class="btn btn-add btn-add-wish"><i class="fa fa-heart-o"></i></button>
														<button type="button" class="btn btn-add btn-add-cart"><i class="fa fa-shopping-cart"></i></button>                                
													</div>
												</div>
											</div>
										</div>
										<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3 wow fadeInUp">
											<div class="b-item-card wow fadeInUp">
												<div class="image">
													<a href="#">
														<img src="media/item-card-media/2.png" class="img-responsive center-block" alt="/">
													</a>
													<div class="image-add-mod">
														<div class="add-description">
															<div>
																<span></span>
																<br>
																<span></span>
																<br>
																<span></span>
																<br>
																<span></span>
																<br>
																<button class="btn btn-default-color1 btn-sm" type="button"><i class="fa fa-refresh fa-lg"></i></button>
																<!--a href="media/item-card-media/2.png" data-gal="prettyPhoto" title="弧光圆舞" class="btn btn-lightbox btn-default-color1 btn-sm">
																	<i class="fa fa-search-plus fa-lg"></i>
																</a-->
															</div>

														</div>
													</div>
												</div>
												<div class="card-info">
													<div class="caption">
														<p class="name-item">
															<a class="product-name" href="#">弧光圆舞</a>
														</p>
														<span class="product-price">335.00</span>
													</div>
													<div class="add-buttons">
														<button type="button" class="btn btn-add btn-add-wish"><i class="fa fa-heart-o"></i></button>
													<button type="button" class="btn btn-add btn-add-cart"><i class="fa fa-shopping-cart"></i></button>                                </div>
												</div>
											</div>
										</div>
										<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3 wow fadeInUp">
											<div class="b-item-card wow fadeInUp">
												<div class="image">
													<a href="#">
														<img src="media/item-card-media/3.png" class="img-responsive center-block" alt="/">
													</a>
													<div class="image-add-mod">
														<div class="add-description">
															<div>
																<span></span>
																<br>
																<span></span>
																<br>
																<span></span>
																<br>
																<span></span>
																<br>
																<button class="btn btn-default-color1 btn-sm" type="button"><i class="fa fa-refresh fa-lg"></i></button>
																<!--a href="media/item-card-media/3.png" data-gal="prettyPhoto" title="平淡生活" class="btn btn-lightbox btn-default-color1 btn-sm">
																	<i class="fa fa-search-plus fa-lg"></i>
																</a-->
															</div>
														</div>
													</div>
												</div>
												<div class="card-info">
													<div class="caption">
														<p class="name-item">
															<a class="product-name" href="#">平淡生活</a>
														</p>
														<span class="product-price">129.00</span>
													</div>
													<div class="add-buttons">
														<button type="button" class="btn btn-add btn-add-wish"><i class="fa fa-heart-o"></i></button>
													<button type="button" class="btn btn-add btn-add-cart"><i class="fa fa-shopping-cart"></i></button>                                </div>
												</div>
											</div>
										</div>
										<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3 wow fadeInUp">
											<div class="b-item-card wow fadeInUp">
												<div class="image">
													<a href="#">
														<img src="media/item-card-media/4.png" class="img-responsive center-block" alt="/">
													</a>
													<div class="image-add-mod">
														<div class="add-description">
															<div>
																<span>Qualcomm Snapdragon 801</span>
																<br>
																<span></span>
																<br>
																<span></span>
																<br>
																<span></span>
																<br>
																<button class="btn btn-default-color1 btn-sm" type="button"><i class="fa fa-refresh fa-lg"></i></button>
																<!--a href="media/item-card-media/4.png" data-gal="prettyPhoto" title="蓝调探戈" class="btn btn-lightbox btn-default-color1 btn-sm">
																	<i class="fa fa-search-plus fa-lg"></i>
																</a-->
															</div>

														</div>
													</div>
												</div>
												<div class="card-info">
													<div class="caption">
														<p class="name-item">
															<a class="product-name" href="#">蓝调探戈</a>
														</p>
														<span class="product-price">550.00</span>
													</div>
													<div class="add-buttons">
														<button type="button" class="btn btn-add btn-add-wish"><i class="fa fa-heart-o"></i></button>
													<button type="button" class="btn btn-add btn-add-cart"><i class="fa fa-shopping-cart"></i></button>                                </div>
												</div>
											</div>
										</div>
										<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3 wow fadeInUp">
											<div class="b-item-card wow fadeInUp">
												<div class="image">
													<a href="#">
														<img src="media/item-card-media/5.png" class="img-responsive center-block" alt="/">
													</a>
													<div class="image-add-mod">
														<div class="add-description">
															<div>
																<span>Qualcomm Snapdragon 801</span>
																<br>
																<span></span>
																<br>
																<span></span>
																<br>
																<span></span>
																<br>
																<button class="btn btn-default-color1 btn-sm" type="button"><i class="fa fa-refresh fa-lg"></i></button>
																<!--a href="media/item-card-media/5.png" data-gal="prettyPhoto" title="蓝色妖姬" class="btn btn-lightbox btn-default-color1 btn-sm">
																	<i class="fa fa-search-plus fa-lg"></i>
																</a-->
															</div>

														</div>
													</div>
												</div>
												<div class="card-info">
													<div class="caption">
														<p class="name-item">
															<a class="product-name" href="#">蓝色妖姬</a>
														</p>
														<span class="product-price">399.00</span>
													</div>
													<div class="add-buttons">
														<button type="button" class="btn btn-add btn-add-wish"><i class="fa fa-heart-o"></i></button>
													<button type="button" class="btn btn-add btn-add-cart"><i class="fa fa-shopping-cart"></i></button>                                </div>
												</div>
											</div>
										</div>
										<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3 wow fadeInUp">
											<div class="b-item-card wow fadeInUp">
												<div class="special-plank new">
													<span>new</span>
												</div>
												<div class="image">
													<a href="#">
														<img src="media/item-card-media/6.png" class="img-responsive center-block" alt="/">
													</a>
													<div class="image-add-mod">
														<div class="add-description">
															<div>
																<span>Qualcomm Snapdragon 801</span>
																<br>
																<span></span>
																<br>
																<span></span>
																<br>
																<span></span>
																<br>
																<button class="btn btn-default-color1 btn-sm" type="button"><i class="fa fa-refresh fa-lg"></i></button>
																<!--a href="media/item-card-media/6.png" data-gal="prettyPhoto" title="清风无语" class="btn btn-lightbox btn-default-color1 btn-sm">
																	<i class="fa fa-search-plus fa-lg"></i>
																</a-->
															</div>

														</div>
													</div>
												</div>
												<div class="card-info">
													<div class="caption">
														<p class="name-item">
															<a class="product-name" href="#">清风无语</a>
														</p>
														<span class="product-price">280.00</span>
													</div>
													<div class="add-buttons">
														<button type="button" class="btn btn-add btn-add-wish"><i class="fa fa-heart-o"></i></button>
													<button type="button" class="btn btn-add btn-add-cart"><i class="fa fa-shopping-cart"></i></button>                                </div>
												</div>
											</div>
										</div>
										<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3 wow fadeInUp">
											<div class="b-item-card wow fadeInUp">
												<div class="special-plank new">
													<span>new</span>
												</div>
												<div class="image">
													<a href="#">
														<img src="media/item-card-media/7.png" class="img-responsive center-block" alt="/">
													</a>
													<div class="image-add-mod">
														<div class="add-description">
															<div>
																<span>Qualcomm Snapdragon 801</span>
																<br>
																<span></span>
																<br>
																<span></span>
																<br>
																<span></span>
																<br>
																<button class="btn btn-default-color1 btn-sm" type="button"><i class="fa fa-refresh fa-lg"></i></button>
																<!--a href="media/item-card-media/7.png" data-gal="prettyPhoto" title="夏洛克公寓" class="btn btn-lightbox btn-default-color1 btn-sm">
																	<i class="fa fa-search-plus fa-lg"></i>
																</a-->
															</div>

														</div>
													</div>
												</div>
												<div class="card-info">
													<div class="caption">
														<p class="name-item">
															<a class="product-name" href="#">夏洛克公寓</a>
														</p>
														<span class="product-price">550.00</span>
													</div>
													<div class="add-buttons">
														<button type="button" class="btn btn-add btn-add-wish"><i class="fa fa-heart-o"></i></button>
													<button type="button" class="btn btn-add btn-add-cart"><i class="fa fa-shopping-cart"></i></button>                                </div>
												</div>
											</div>
										</div>
										<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3 wow fadeInUp">
											<div class="b-item-card wow fadeInUp">
												<div class="image">
													<a href="#">
														<img src="media/item-card-media/8.png" class="img-responsive center-block" alt="/">
													</a>
													<div class="image-add-mod">
														<div class="add-description">
															<div>
																<span>Qualcomm Snapdragon 801</span>
																<br>
																<span></span>
																<br>
																<span></span>
																<br>
																<span></span>
																<br>
																<button class="btn btn-default-color1 btn-sm" type="button"><i class="fa fa-refresh fa-lg"></i></button>
																<!--a href="media/item-card-media/8.png" data-gal="prettyPhoto" title="折叠城市" class="btn btn-lightbox btn-default-color1 btn-sm">
																	<i class="fa fa-search-plus fa-lg"></i>
																</a-->
															</div>
														</div>
													</div>
												</div>
												<div class="card-info">
													<div class="caption">
														<p class="name-item">
															<a class="product-name" href="#">折叠城市</a>
														</p>
														<span class="product-price">350.00</span>
													</div>
													<div class="add-buttons">
														<button type="button" class="btn btn-add btn-add-wish"><i class="fa fa-heart-o"></i></button>
													<button type="button" class="btn btn-add btn-add-cart"><i class="fa fa-shopping-cart"></i></button>                                </div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="b-say">
					<div class="container">
						<div class="row">
							<div class="col-sm-12 text-center">
								<h3 class="heading-line text-center">商品评论</h3>
							</div>
							<div class="b-says-holder col-sm-10 col-sm-offset-1 wow bounce  animated">
								<div class="row">
									<ul class="b-say-blockquotes enable-bx-slider" data-pager-custom="null" data-controls="false" data-min-slides="1" data-max-slides="1" data-slide-width="0" data-slide-margin="35" data-pager="true" data-mode="vertical" data-infinite-loop="true">
										<li>
											<div class="b-blockquote-holder">
												<div class="quote-circle-long">
													<div class="b-blockquote-fa-quote-circle">
														<div class="circle-block clearfix col-sm-3">
															<span class="quote-icon"><i class="fa fa-quote-left"></i></span>
															<p class="circle-author">
																<span class="circle-quote-author">小哥噻</span>
																<br>
																<span class="circle-author-role">用户</span>
															</p>
														</div>
														<div class="circle-text col-sm-9">
															<p class="quote-text">
																沙发很棒！质量也不错！布料舒服好看，下面的储物区很实用。自带的抱枕很不错，都是原木色的黄色搭配，很适合小户型，很满意。
															</p>
														</div>
													</div>
												</div>
											</div>
											<div class="b-blockquote-holder">
												<div class="quote-circle-long">
													<div class="b-blockquote-fa-quote-circle">
														<div class="circle-block clearfix col-sm-3">
															<span class="quote-icon"><i class="fa fa-quote-left"></i></span>
															<p class="circle-author">
																<span class="circle-quote-author">如初</span>
																<br>
																<span class="circle-author-role">用户</span>
															</p>
														</div>
														<div class="circle-text col-sm-9">
															<p class="quote-text">
																挺划算的，沙发软硬适中，坐着很舒服，而且可以拆洗，可以放倒当床，有客人的时候可以多个临时床位。送的抱枕手感不错，颜色和沙发也很匹配，总之还不错的。
															</p>
														</div>
													</div>
												</div>
											</div>
										</li>
									</ul>
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

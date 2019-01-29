<%@ page import="com.JDBC.Furniture.furnitureUnit" %>
<%@ page import="com.JDBC.Appl.FDBoperator" %>
<%@ page import="com.JDBC.ImgIO.ImageUnit" %>
<%@ page import="java.util.List" %>
<%@ page import="com.JDBC.Appl.IMDBoperator" %>
<%@ page import="com.JDBC.User.userAccount" %>
<%@ page import="com.JDBC.WishAndCart.wishCart" %>
<%@ page import="com.JDBC.Appl.WCDBoperator" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/29
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en-US">
	
<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>有点产品</title>
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
				<%
					int fid = Integer.parseInt(request.getParameter("fid"));
					furnitureUnit fu = (new FDBoperator()).searchFurnitureById(fid);
                    List<ImageUnit> list = (new IMDBoperator()).searchImageById(fid);
					if(fu == null)
					{
					    %> <script type="text/javascript">
							alert("查无此商品，或已断货。");
							window.history.back(-1);

							</script> <%
					}
				%>
			</div>
			<!-- End Switcher -->
			<header>
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
													List<wishCart> newlist = (new WCDBoperator()).searchCartByUser(ua);
													if(newlist.size() == 0)
														out.print("<div class=\"caption\"><span></span><span class=\"product-price\">您的购物车还能装下一头大象</span></div>");
													else{
														out.print("<ul class=\"products-list list-unstyled\">");
														for (int i = 0;i < 2;i++)
														{
															ImageUnit iu;
															if(i<newlist.size()) {
																iu = (new IMDBoperator()).searchImageById(newlist.get(i).getFid()).get(0);
																out.print("<li>" +
																		"<div class=\"b-cart-table \">" +
																		"<a href=\"#\" class=\"image\">" +
																		"<img style=\"width:70px;height:70px\" src=\"" + request.getContextPath() + "/upload/" + iu.getFimg() + "\" alt=\"/\">" +
																		"</a>" +
																		"<div class=\"caption\">" +
																		"<a class=\"product-name\" href=\"product-details.jsp?fid=" + newlist.get(i).getFid() + "\">"+(new FDBoperator()).searchFurnitureById(newlist.get(i).getFid()).getFname()+"</a>" +
																		"<span class=\"product-price\">"+newlist.get(i).getFnumber()+" x ￥"+ (new FDBoperator()).searchFurnitureById(newlist.get(i).getFid()).getFprice()+"</span>" +
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
			<section class="section-product-detail-2">
				<div class="b-page-header">
					<div class="container">
						<div class="row">
							<div class="col-sm-12 clearfix">
								<h3 class="page-title pull-left">产品细节</h3>
								<div class="b-breadcrumbs pull-right">
									<ul class="list-unstyled">
										<li>
											<a href="#">首页</a>
										</li>
										<li>
											<a href="#">分类</a>
										</li>
										<li>
											<a href="#"><%=fu.getFtype()%></a>
										</li>
										<li>
											<span><%=fu.getFname()%></span>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<div class="detail-main pd-2">
								<div class="row">
									<div class="col-xs-12 col-sm-2 col-md-2 col-lg-1 product-image-2 prew-image">
										<div class="product-image-thumbs">
											<ul id="bx-pager2" class="pager-custom list-unstyled enable-bx-slider" data-pager-custom="null" data-controls="true" data-min-slides="4" data-max-slides="12" data-slide-width="96" data-slide-margin="8" data-pager="false" data-mode="vertical" data-infinite-loop="false">

                                                <%
                                                    int i = 0;
                                                    for(ImageUnit iu:list)
                                                    {
                                                        out.print("<li>" +
                                                                "<a data-slide-index=\""+(i++)+"\" href=\"#\"><img style=\"width:96px;height:96px\" src=\""+request.getContextPath()+"/upload/"+iu.getFimg()+"\" /></a>" +
                                                                "</li>");
                                                    }
                                                %>
											</ul>
										</div>
									</div>
									<div class="col-xs-12 col-sm-3 col-md-3 col-lg-4 product-image-2 pi2-big-image">
										<ul class="bxslider-product2 enable-bx-slider" data-pager-custom="#bx-pager2" data-controls="false" data-min-slides="1" data-max-slides="1" data-slide-width="0" data-slide-margin="0" data-pager="true" data-mode="horizontal" data-infinite-loop="true">
                                            <%
                                                for(ImageUnit iu:list)
                                                {
                                                    out.print("<li><img style=\"width:335px;height:415px\" src=\""+request.getContextPath()+"/upload/"+iu.getFimg()+"\" class=\"image-responsive\" alt=\"/\" /></li>");
                                                }
                                            %>
										</ul>
									</div>
									<div class="col-xs-12 col-sm-7 col-md-7 col-lg-7 pd2-descr-product wow fadeInRight">
										<div class="detail-title">
											<h3 class=heading-line><%=fu.getFname()%></h3>
											<p><span class="product-availability pull-right">iN STOCk</span></p>
										</div>
										<div class="detail-info clearfix">
											<div class="card-info">
												<div class="caption">
													<div class="name-item">
														<div class="card-price-block clearfix">
															<span class="price-title">价格</span>
															<span class="product-price">￥<%=fu.getFprice()%></span>
															<span class="product-price-old">￥<%=fu.getFprice()*1.5%></span>
														</div>
														<div class="rating">
															<span class="star"><i class="fa fa-star"></i></span>
															<span class="star"><i class="fa fa-star"></i></span>
															<span class="star"><i class="fa fa-star"></i></span>
															<span class="star"><i class="fa fa-star"></i></span>
															<span class="star star-empty"><i class="fa fa-star-o"></i></span>
															<div class="add-review">
																<span><span class="review-counter">4</span>评论</span>
																<a href="#">添加评论</a>
															</div>
														</div>
														<div class="b-socials full-socials clearfix">
															<ul class="list-unstyled">
																<li><a href="#"><i class="fa fa-twitter fa-fw"></i>Tweet</a></li>
																<li><a href="#"><i class="fa fa-facebook fa-fw"></i>Share</a></li>
																<li><a href="#"><i class="fa fa-google-plus fa-fw"></i>Google+</a></li>
																<li><a href="#"><i class="fa fa-pinterest fa-fw"></i>Pinterest</a></li>
															</ul>
														</div>
													</div>
													<div class="product-description">
														<p>
															简约/外观简单别致,没有花里花哨的修饰却也有别有一番情趣,给人简洁、清爽的视觉效果。<br/>
															简约的设计理念,细腻、精致的做工,这不仅是产品,更是时尚魅力诱惑的艺术品,相结合带来唯美的生活享受。<br/>
															时尚简洁大方是作品的灵魂,端庄高贵无比的诱惑,让人心迷意乱、难以抵挡,她的魅力才不同凡响。<br/>
															黑白色彩是一种经典的搭配。设计简约、落落大方,非常有艺术感。<br/>
															简单的棱角和构架,外观上显得有点轻薄,让人心疑能否承受得住我们伏案阅读。</p>
													</div>
												</div>
											</div>
                                            <div class="detail-qty-color col-xs-12 col-sm-12 col-md-12 col-lg-4">
                                                <div class="input-group colors" style="margin-top: 50px">
													<%

													%>
													<a href="3dmodel.html">
                                                    <span style="font-size: large;font-weight: bold">3D模型展示</span><img style="width: 50px;height: 50px;" src="fonts/3D.png" alt="3D模型"/>
													</a>
                                                </div>
                                                <div class="input-group spinner" data-trigger="spinner">
                                                    <h6 class="heading-line">数量</h6>
                                                    <input type="text" data-rule="quantity" value="1">
                                                    <div class="spinner-btn">
                                                        <a class="btn btn-default" href="javascript:;" data-spin="up"><i class="fa fa-chevron-up"></i></a>
                                                        <a class="btn btn-default" href="javascript:;" data-spin="down"><i class="fa fa-chevron-down"></i></a>
                                                    </div>
                                                </div>
                                            </div>
											<div class="detail-buttons col-xs-12 col-sm-12 col-md-12 col-lg-8 clearfix">
												<div class="add-buttons custom-add-buttons">
													<button type="button" onclick="addto(0,<%=fid%>)" class="btn btn-add btn-add-wish"><i class="fa fa-heart-o"></i>添加到心愿单</button>
												</div>
												<div class="cart-add-buttons">
													<button type="button" onclick="addto(1,<%=fid%>)" class="btn btn-cart-color2"><i class="fa fa-shopping-cart fa-lg"></i>添加到购物车</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<script>
									function addto(cartorwish,fid) {
										if(cartorwish == 0)
										    window.location.href="addToWish.jsp?fid="+fid;
										else
										    window.location.href="addToCart.jsp?fid="+fid;
                                    }
								</script>
								<div class="row">
									<div class="col-sm-12">
										<div class="b-hr">
											<hr>
										</div>
										<div class="detail-tabs wow fadeInUp">
											<ul class="nav nav-tabs" role="tablist">
												<li role="presentation" class="active">
													<a class="heading-line" href="product-details.jsp#description" aria-controls="description" role="tab" data-toggle="tab">描述</a>
												</li>
												<li role="presentation">
													<a class="heading-line" href="product-details.jsp#reviews" aria-controls="reviews" role="tab" data-toggle="tab">用户评论</a>
												</li>
											</ul>
											<div class="tab-content">
												<div role="tabpanel" class="tab-pane active" id="description">
													<img src="<%=request.getContextPath()%>/upload/message.png" alt=""/>
												</div>
												<div role="tabpanel" class="tab-pane" id="reviews">
													<div class="form-group">
														<p>很喜欢颜色漂亮，尺寸也非常的合适，质量和服务简直没得话说，之后还会添置一些商品，再来选!
														</p>
														<p>这个沙发的皮子真不错，大块拼接的纯牛皮，这个皮质很喜欢，颜色也很搭，价格有点小贵，希望物有所值吧!
														</p>
														<p>沙发很棒！质量也不错！布料舒服好看，下面的储物区很实用。自带的抱枕很不错，都是原木色的黄色搭配，很适合小户型，很满意。 !
														</p>
														<p>挺划算的，沙发软硬适中，坐着很舒服，而且可以拆洗，可以放倒当床，有客人的时候可以多个临时床位。送的抱枕手感不错，颜色和沙发也很匹配，总之还不错的。
														</p>
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
				<div class="b-hr">
					<hr>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-sm-12 clearfix">
							<h3 class="heading-line-long">用户也购买了这些</h3>
							<div class="custom-nav-mod">
								<div class="slider-nav">
									<a class="slider-prev"><i class="fa fa-chevron-left"></i></a>
									<span class="nav-divider"></span>
									<a class="slider-next"><i class="fa fa-chevron-right"></i></a>
								</div>
							</div>
						</div>
						<div class="col-sm-12 wow fadeInUp">
							<div class="row">
								<div id="detail-related" class="b-related enable-owl-carousel" data-loop="true" data-auto-width="false" data-dots="false" data-nav="false" data-margin="0" data-responsive-class="true" data-responsive='{"0":{"items":1},"479":{"items":2},"768":{"items":3},"1199":{"items":4}}' data-slider-next=".slider-next" data-slider-prev=".slider-prev">
									<%
										List<furnitureUnit> list1 = (new FDBoperator()).searchFurnitureByType(fu.getFtype());
										if(list1.size() == 0)	out.print("暂无商品推荐");
										else
										{
										    for(furnitureUnit funit:list1)
										    	out.print("<div class=\"related-item\">" +
														"<div class=\"b-item-card\">" +
														"<div class=\"special-plank new\">" +
														"<span>new</span>" +
														"</div>" +
														"<div class=\"image\">" +
														"<a href=\"product-details.jsp?fid="+funit.getFid()+"\">" +
														"<img src=\""+request.getContextPath()+"/upload/"+(new IMDBoperator()).searchImageById(funit.getFid()).get(0).getFimg()+"\" class=\"img-responsive center-block\" alt=\"/\">" +
														"</a>" +
														"<div class=\"image-add-mod\">" +
														"<div class=\"add-description\">" +
														"<div>" +
														"<button class=\"btn btn-default-color1 btn-sm\" type=\"button\"><i class=\"fa fa-refresh fa-lg\"></i></button>" +
														"</div>" +
														"</div>" +
														"</div>" +
														"</div>" +
														"<div class=\"card-info\">" +
														"<div class=\"caption\">" +
														"<p class=\"name-item\">" +
														"<a class=\"product-name\" href=\"product-details.jsp?fid="+funit.getFid()+"\">"+funit.getFname()+"</a>" +
														"</p>" +
														"<span class=\"product-price\">￥"+funit.getFprice()+"</span>" +
														"</div>" +
														"<div class=\"add-buttons\">" +
														"<button type=\"button\" onclick=\"addto(0,"+funit.getFid()+")\" class=\"btn btn-add btn-add-wish\"><i class=\"fa fa-heart-o\"></i></button>" +
														"<button type=\"button\" onclick=\"addto(1,"+funit.getFid()+")\" class=\"btn btn-add btn-add-cart\"><i class=\"fa fa-shopping-cart\"></i></button>" +
														"</div>" +
														"</div>" +
														"</div>" +
														"</div>");
										}
									%>
								</div>
							</div>
						</div>
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

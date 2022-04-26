<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.*" import = "objects.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.text.SimpleDateFormat, java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>detailRestaurant</title>
<head>
<meta charset="utf-8">
<meta
	http-equiv="X-UA-Compatible"
	content="IE=edge"
>
<meta
	name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no"
>
<meta
	name="description"
	content="FooYes - Quality delivery or takeaway food"
>
<meta
	name="author"
	content="Ansonika"
>

<link
	rel="shortcut icon"
	href="img/favicon1.ico"
	type="image/x-icon"
>
<link
	rel="apple-touch-icon"
	type="image/x-icon"
	href="img/apple-touch-icon-57x57-precomposed.png"
>
<link
	rel="apple-touch-icon"
	type="image/x-icon"
	sizes="72x72"
	href="img/apple-touch-icon-72x72-precomposed.png"
>
<link
	rel="apple-touch-icon"
	type="image/x-icon"
	sizes="114x114"
	href="img/apple-touch-icon-114x114-precomposed.png"
>
<link
	rel="apple-touch-icon"
	type="image/x-icon"
	sizes="144x144"
	href="img/apple-touch-icon-144x144-precomposed.png"
>
<!-- GOOGLE WEB FONT -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700&display=swap"
	rel="stylesheet"
>
<!-- BASE CSS -->
<link
	href="css/bootstrap_customized.min.css"
	rel="stylesheet"
>
<link
	href="css/style.css"
	rel="stylesheet"
>
<!-- SPECIFIC CSS -->
<link
	href="css/detail-page.css"
	rel="stylesheet"
>
<!-- YOUR CUSTOM CSS -->
<link
	href="css/custom.css"
	rel="stylesheet"
>
</head>
<body
	data-spy="scroll"
	data-target="#secondary_nav"
	data-offset="75"
>
	<header class="header_in clearfix">
		<div class="container">
			<div id="logo">
				<a href="index.jsp"><img
					src="img/logo_sticky.svg"
					width="140"
					height="35"
					alt=""
				></a>
			</div>
			<div class="layer"></div>
			<!-- Opacity Mask Menu Mobile -->
			<ul
				id="top_menu"
				class="drop_user"
			>
				<li><div class="dropdown user clearfix">
						<a
							href="#"
							data-toggle="dropdown"
						><figure>
								<img
									src="img/avatar.jpg"
									alt=""
								>
							</figure>
							<span>
							<% 
// 								Cookie&url username double checker
								String username = null;
								Cookie [] cookies =request.getCookies();
								if(cookies!=null){
									for(Cookie cookie: cookies){
										if((cookie.getName().indexOf("nyufoodproject"))!=-1){//find special format cookie 
											username=cookie.getName().substring(14);
											out.print(username+", ");
										}
									}
								}
								if(username == null || username.equals("null")){
									username = request.getParameter("username");
									if(username==null || username.equals("null")){
										out.print("Not Login, ");
									}else{
										out.print(username+", ");
									}
								}
								%>
							</span></a>
<!-- 							username here ！ -->
						<div class="dropdown-menu">
							<div class="dropdown-menu-content">
								<ul>
									<li><a href="#0"><i class="icon_cog"></i>Dashboard</a></li>
									<li><a href="#0"><i class="icon_document"></i>Bookings</a></li>
									<li><a href="#0"><i class="icon_heart"></i>Wish List</a></li>
									<% 
									if(username!=null){
									%>	<li><a href="jsp/logOut.jsp"><i class="icon_key"></i>Log out</a></li>
									<% 
									}else{
									%> 
										<li><a href="html/login2.html"><i class="icon_key"></i>Log in</a></li>
									<%					
									}
									%>
								</ul>
							</div>
						</div>
					</div>
					<!-- /dropdown --></li>
			</ul>
			<!-- /top_menu -->
			<a
				href="#0"
				class="open_close"
			><i class="icon_menu"></i><span>Menu</span></a>
			<nav class="main-menu">
				<div id="header_menu">
					<a
						href="#0"
						class="open_close"
					><i class="icon_close"></i><span>Menu</span></a><a href="index.jsp"><img
						src="img/logo.svg"
						width="350"
						height="100"
						alt=""
					></a>
				</div>
				<ul>
					<li class="submenu"><a
						href="#0"
						class="show-submenu"
					>Home</a>
					<ul>
							<li><a href="index.jsp">Address Autocomplete</a></li>
							<li><a href="index-2.html">Search by Keyword</a></li>
							<li><a href="index-3.html">Home Version 2</a></li>
							<li><a href="index-4.html">Video Background</a></li>
							<li><a href="index-5.html">GDPR Cookie Bar EU Law</a></li>
							<li><a href="header-user-logged.html">Header User Logged</a></li>
							<li><a href="header-cart-top.html">Header Cart Top</a></li>
						</ul></li>
					<li class="submenu"><a
						href="#0"
						class="show-submenu"
					>Listing</a>
					<ul>
							<li class="third-level"><a href="#0">List pages</a>
							<ul>
									<li><a href="discover.jsp">List
											default</a></li>
									<li><a href="grid-listing-filterscol-map.html">List
											with map</a></li>
									<li><a href="listing-map.html">List side map</a></li>
									<li><a href="grid-listing-masonry.html">List Masonry
											Filter</a></li>
								</ul></li>
							<li class="third-level"><a href="#0">Detail pages</a>
							<ul>
									<li><a href="detail-restaurant.html">Detail page 1</a></li>
									<li><a href="detail-restaurant-2.html">Detail page 2</a></li>
									<li><a href="detail-restaurant-3.html">Detail page 3</a></li>
								</ul></li>
							<li class="third-level"><a href="#0">OpenStreetMap</a>
							<ul>
									<li><a href="grid-listing-filterscol-openstreetmap.html">List
											with map</a></li>
									<li><a href="listing-map-openstreetmap.html">List side
											map</a></li>
									<li><a href="grid-listing-masonry-openstreetmap.html">List
											Masonry Filter</a></li>
								</ul></li>
							<li><a href="submit-restaurant.html">Submit Restaurant</a></li>
							<li><a href="submit-rider.html">Submit Rider</a></li>
							<li><a href="order.html">Order</a></li>
							<li><a href="confirm.html">Confirm Order</a></li>
						</ul></li>
					<li class="submenu"><a
						href="#0"
						class="show-submenu"
					>Other Pages</a>
					<ul>
							<li><a href="404.html">404 Error</a></li>
							<li>
							<form method="get" action="jsp/AskQuestionProcess.jsp">
							<a href="jsp/AskQuestionProcess.jsp?username=<%=username%>">help</a>
							</form>
							</li>
							<li><a href="blog.html">Blog</a></li>
							<li><a href="leave-review.html">Leave a review</a></li>
							<li><a href="contacts.html">Contacts</a></li>
							<li><a href="coming_soon/index.jsp">Coming Soon</a></li>
							<li><a href="register.html">Sign Up</a></li>
							<li><a href="icon-pack-1.html">Icon Pack 1</a></li>
							<li><a href="icon-pack-2.html">Icon Pack 2</a></li>
							<li><a href="shortcodes.html">Shortcodes</a></li>
						</ul></li>
				</ul>
			</nav>
		</div>
	</header>
	<!-- /header -->
	<%
	String resturantName=request.getParameter("resturantName"); 
	float rate=0;
	String displayAddress="";
	try{
		
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
	
		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		ResultSet rs = null;
		String query ="SELECT * FROM demo.restaurant where restaurantName = '"+resturantName+"'";
		PreparedStatement ps = con.prepareStatement(query);
		rs = ps.executeQuery();
		
	
		while(rs!= null && rs.next()) {
			rate=rs.getFloat("rate");
			displayAddress=(rs.getString("address")+", "+rs.getString("city")+", "+rs.getString("country"));
		}
	
	%>
	<main>
		<div
			class="hero_in detail_page background-image"
			data-background="url(img/hero_general.jpg)"
		>
			<div
				class="wrapper opacity-mask"
				data-opacity-mask="rgba(0, 0, 0, 0.5)"
			>
				<div class="container">
					<div class="main_info">
						<div class="row">
							<div class="col-xl-4 col-lg-5 col-md-6">
								<div class="head">
									<div class="score">
										<strong><%out.print(rate);%></strong>
									</div>
								</div>
								<h1><%out.print(resturantName);%></h1>
								<%out.print(displayAddress);%><a
									href="https://www.google.com/maps/dir//Assistance+%E2%80%93+H%C3%B4pitaux+De+Paris,+3+Avenue+Victoria,+75004+Paris,+Francia/@48.8606548,2.3348734,14z/data=!4m15!1m6!3m5!1s0x47e66e1de36f4147:0xb6615b4092e0351f!2sAssistance+Publique+-+H%C3%B4pitaux+de+Paris+(AP-HP)+-+Si%C3%A8ge!8m2!3d48.8568376!4d2.3504305!4m7!1m0!1m5!1m1!1s0x47e67031f8c20147:0xa6a9af76b1e2d899!2m2!1d2.3504327!2d48.8568361"
									target="blank"
								><br>Get directions (imcomplete)</a>
							</div>
						</div>
						<!-- /row -->
					</div>
					<!-- /main_info -->
				</div>
			</div>
		</div>
		<!--/hero_in-->
		<nav class="secondary_nav sticky_horizontal">
			<div class="container">
				<ul id="secondary_nav">
					<li><a
						class="list-group-item list-group-item-action"
						href="#section-5"
					><i class="icon_chat_alt"></i>Reviews</a></li>
				</ul>
			</div>
			<span></span>
		</nav>
		<!-- /secondary_nav -->
		<div class="bg_gray">
			<div class="container margin_detail">
				<div class="row">
					<div class="col-lg-8 list_menu">
						<section id="section-1">
							<h4>Starters</h4>
							<div class="row">
								<div class="col-md-6">
									<a
										class="menu_item modal_dialog"
										href="#modal-dialog"
									><figure>
											<img
												src="img/menu-thumb-placeholder.jpg"
												data-src="img/menu-thumb-1.jpg"
												alt="thumb"
												class="lazy"
											>
										</figure>
										<h3>1. Mexican Enchiladas</h3>
										<p>Fuisset mentitum deleniti sit ea.</p>
										<strong>$9.40</strong></a>
								</div>
								<div class="col-md-6">
									<a
										class="menu_item modal_dialog"
										href="#modal-dialog"
									><figure>
											<img
												src="img/menu-thumb-placeholder.jpg"
												data-src="img/menu-thumb-2.jpg"
												alt="thumb"
												class="lazy"
											>
										</figure>
										<h3>2. Fajitas</h3>
										<p>Fuisset mentitum deleniti sit ea.</p>
										<strong>$9.40</strong></a>
								</div>
								<div class="col-md-6">
									<a
										class="menu_item modal_dialog"
										href="#modal-dialog"
									><figure>
											<img
												src="img/menu-thumb-placeholder.jpg"
												data-src="img/menu-thumb-3.jpg"
												alt="thumb"
												class="lazy"
											>
										</figure>
										<h3>3. Royal Fajitas</h3>
										<p>Fuisset mentitum deleniti sit ea.</p>
										<strong>$9.40</strong></a>
								</div>
								<div class="col-md-6">
									<a
										class="menu_item modal_dialog"
										href="#modal-dialog"
									><figure>
											<img
												src="img/menu-thumb-placeholder.jpg"
												data-src="img/menu-thumb-4.jpg"
												alt="thumb"
												class="lazy"
											>
										</figure>
										<h3>4. Chicken Enchilada Wrap</h3>
										<p>Fuisset mentitum deleniti sit ea.</p>
										<strong>$9.40</strong></a>
								</div>
							</div>
							<!-- /row -->
						</section>
						<!-- /section -->
						<section id="section-2">
							<h4>Main Courses</h4>
							<div class="row">
								<div class="col-md-6">
									<a
										class="menu_item modal_dialog"
										href="#modal-dialog"
									><figure>
											<img
												src="img/menu-thumb-placeholder.jpg"
												data-src="img/menu-thumb-5.jpg"
												alt="thumb"
												class="lazy"
											>
										</figure>
										<h3>5. Cheese Quesadilla</h3>
										<p>Fuisset mentitum deleniti sit ea.</p>
										<strong>$9.40</strong></a>
								</div>
								<div class="col-md-6">
									<a
										class="menu_item modal_dialog"
										href="#modal-dialog"
									><figure>
											<img
												src="img/menu-thumb-placeholder.jpg"
												data-src="img/menu-thumb-6.jpg"
												alt="thumb"
												class="lazy"
											>
										</figure>
										<h3>6. Chorizo & Cheese</h3>
										<p>Fuisset mentitum deleniti sit ea.</p>
										<strong>$9.40</strong></a>
								</div>
								<div class="col-md-6">
									<a
										class="menu_item modal_dialog"
										href="#modal-dialog"
									><figure>
											<img
												src="img/menu-thumb-placeholder.jpg"
												data-src="img/menu-thumb-7.jpg"
												alt="thumb"
												class="lazy"
											>
										</figure>
										<h3>7. Beef Taco</h3>
										<p>Fuisset mentitum deleniti sit ea.</p>
										<strong>$9.40</strong></a>
								</div>
								<div class="col-md-6">
									<a
										class="menu_item modal_dialog"
										href="#modal-dialog"
									><figure>
											<img
												src="img/menu-thumb-placeholder.jpg"
												data-src="img/menu-thumb-8.jpg"
												alt="thumb"
												class="lazy"
											>
										</figure>
										<h3>8. Minced Beef Double Layer</h3>
										<p>Fuisset mentitum deleniti sit ea.</p>
										<strong>$9.40</strong></a>
								</div>
								<div class="col-md-6">
									<a
										class="menu_item modal_dialog"
										href="#modal-dialog"
									><figure>
											<img
												src="img/menu-thumb-placeholder.jpg"
												data-src="img/menu-thumb-9.jpg"
												alt="thumb"
												class="lazy"
											>
										</figure>
										<h3>9. Piri Piri Chicken</h3>
										<p>Fuisset mentitum deleniti sit ea.</p>
										<strong>$9.40</strong></a>
								</div>
								<div class="col-md-6">
									<a
										class="menu_item modal_dialog"
										href="#modal-dialog"
									><figure>
											<img
												src="img/menu-thumb-placeholder.jpg"
												data-src="img/menu-thumb-10.jpg"
												alt="thumb"
												class="lazy"
											>
										</figure>
										<h3>10. Burrito Al Pastor</h3>
										<p>Fuisset mentitum deleniti sit ea.</p>
										<strong>$9.40</strong></a>
								</div>
							</div>
							<!-- /row -->
						</section>
						<!-- /section -->
						<section id="section-3">
							<h4>Desserts</h4>
							<div class="row">
								<div class="col-md-6">
									<a
										class="menu_item modal_dialog"
										href="#modal-dialog"
									><figure>
											<img
												src="img/menu-thumb-placeholder.jpg"
												data-src="img/menu-thumb-5.jpg"
												alt="thumb"
												class="lazy"
											>
										</figure>
										<h3>5. Cheese Quesadilla</h3>
										<p>Fuisset mentitum deleniti sit ea.</p>
										<strong>$9.40</strong></a>
								</div>
								<div class="col-md-6">
									<a
										class="menu_item modal_dialog"
										href="#modal-dialog"
									><figure>
											<img
												src="img/menu-thumb-placeholder.jpg"
												data-src="img/menu-thumb-6.jpg"
												alt="thumb"
												class="lazy"
											>
										</figure>
										<h3>6. Chorizo & Cheese</h3>
										<p>Fuisset mentitum deleniti sit ea.</p>
										<strong>$9.40</strong></a>
								</div>
								<div class="col-md-6">
									<a
										class="menu_item modal_dialog"
										href="#modal-dialog"
									><figure>
											<img
												src="img/menu-thumb-placeholder.jpg"
												data-src="img/menu-thumb-7.jpg"
												alt="thumb"
												class="lazy"
											>
										</figure>
										<h3>7. Beef Taco</h3>
										<p>Fuisset mentitum deleniti sit ea.</p>
										<strong>$9.40</strong></a>
								</div>
								<div class="col-md-6">
									<a
										class="menu_item modal_dialog"
										href="#modal-dialog"
									><figure>
											<img
												src="img/menu-thumb-placeholder.jpg"
												data-src="img/menu-thumb-8.jpg"
												alt="thumb"
												class="lazy"
											>
										</figure>
										<h3>8. Minced Beef Double Layer</h3>
										<p>Fuisset mentitum deleniti sit ea.</p>
										<strong>$9.40</strong></a>
								</div>
								<div class="col-md-6">
									<a
										class="menu_item modal_dialog"
										href="#modal-dialog"
									><figure>
											<img
												src="img/menu-thumb-placeholder.jpg"
												data-src="img/menu-thumb-9.jpg"
												alt="thumb"
												class="lazy"
											>
										</figure>
										<h3>9. Piri Piri Chicken</h3>
										<p>Fuisset mentitum deleniti sit ea.</p>
										<strong>$9.40</strong></a>
								</div>
								<div class="col-md-6">
									<a
										class="menu_item modal_dialog"
										href="#modal-dialog"
									><figure>
											<img
												src="img/menu-thumb-placeholder.jpg"
												data-src="img/menu-thumb-10.jpg"
												alt="thumb"
												class="lazy"
											>
										</figure>
										<h3>10. Burrito Al Pastor</h3>
										<p>Fuisset mentitum deleniti sit ea.</p>
										<strong>$9.40</strong></a>
								</div>
							</div>
							<!-- /row -->
						</section>
						<!-- /section -->
						<section id="section-4">
							<h4>Drinks</h4>
							<div class="row">
								<div class="col-md-6">
									<a
										class="menu_item modal_dialog"
										href="#modal-dialog"
									><figure>
											<img
												src="img/menu-thumb-placeholder.jpg"
												data-src="img/menu-thumb-5.jpg"
												alt="thumb"
												class="lazy"
											>
										</figure>
										<h3>11. Coca Cola</h3>
										<p>Fuisset mentitum deleniti sit ea.</p>
										<strong>$2.40</strong></a>
								</div>
								<div class="col-md-6">
									<a
										class="menu_item modal_dialog"
										href="#modal-dialog"
									><figure>
											<img
												src="img/menu-thumb-placeholder.jpg"
												data-src="img/menu-thumb-6.jpg"
												alt="thumb"
												class="lazy"
											>
										</figure>
										<h3>12. Corona Beer</h3>
										<p>Fuisset mentitum deleniti sit ea.</p>
										<strong>$9.40</strong></a>
								</div>
								<div class="col-md-6">
									<a
										class="menu_item modal_dialog"
										href="#modal-dialog"
									><figure>
											<img
												src="img/menu-thumb-placeholder.jpg"
												data-src="img/menu-thumb-7.jpg"
												alt="thumb"
												class="lazy"
											>
										</figure>
										<h3>13. Red Wine</h3>
										<p>Fuisset mentitum deleniti sit ea.</p>
										<strong>$19.40</strong></a>
								</div>
								<div class="col-md-6">
									<a
										class="menu_item modal_dialog"
										href="#modal-dialog"
									><figure>
											<img
												src="img/menu-thumb-placeholder.jpg"
												data-src="img/menu-thumb-8.jpg"
												alt="thumb"
												class="lazy"
											>
										</figure>
										<h3>14. White Wine</h3>
										<p>Fuisset mentitum deleniti sit ea.</p>
										<strong>$19.40</strong></a>
								</div>
								<div class="col-md-6">
									<a
										class="menu_item modal_dialog"
										href="#modal-dialog"
									><figure>
											<img
												src="img/menu-thumb-placeholder.jpg"
												data-src="img/menu-thumb-9.jpg"
												alt="thumb"
												class="lazy"
											>
										</figure>
										<h3>15. Mineral Water</h3>
										<p>Fuisset mentitum deleniti sit ea.</p>
										<strong>$1.40</strong></a>
								</div>
								<div class="col-md-6">
									<a
										class="menu_item modal_dialog"
										href="#modal-dialog"
									><figure>
											<img
												src="img/menu-thumb-placeholder.jpg"
												data-src="img/menu-thumb-10.jpg"
												alt="thumb"
												class="lazy"
											>
										</figure>
										<h3>16. Red Bull</h3>
										<p>Fuisset mentitum deleniti sit ea.</p>
										<strong>$3.40</strong></a>
								</div>
							</div>
							<!-- /row -->
						</section>
						<!-- /section -->
					</div>
					<!-- /col -->
					<div
						class="col-lg-4"
						id="sidebar_fixed"
					>
						<div class="box_order mobile_fixed">
							<div class="head">
								<h3>Order Summary</h3>
								<a
									href="#0"
									class="close_panel_mobile"
								><i class="icon_close"></i></a>
							</div>
							<!-- /head -->
							<div class="main">
								<ul class="clearfix">
									<li><a href="#0">1x Enchiladas</a><span>$11</span></li>
									<li><a href="#0">2x Burrito</a><span>$14</span></li>
									<li><a href="#0">1x Chicken</a><span>$18</span></li>
									<li><a href="#0">2x Corona Beer</a><span>$9</span></li>
									<li><a href="#0">2x Cheese Cake</a><span>$11</span></li>
								</ul>
								<ul class="clearfix">
									<li>Subtotal<span>$56</span></li>
									<li>Delivery fee<span>$10</span></li>
									<li class="total">Total<span>$66</span></li>
								</ul>
								<div class="row opt_order">
									<div class="col-6">
										<label class="container_radio">Delivery <input
											type="radio"
											value="option1"
											name="opt_order"
											checked
										><span class="checkmark"></span></label>
									</div>
									<div class="col-6">
										<label class="container_radio">Take away <input
											type="radio"
											value="option1"
											name="opt_order"
										><span class="checkmark"></span></label>
									</div>
								</div>
								<div class="dropdown day">
									<a
										href="#"
										data-toggle="dropdown"
									>Day <span id="selected_day"></span></a>
									<div class="dropdown-menu">
										<div class="dropdown-menu-content">
											<h4>Which day delivered?</h4>
											<div class="radio_select chose_day">
												<ul>
													<li><input
														type="radio"
														id="day_1"
														name="day"
														value="Today"
													><label for="day_1">Today<em>-40%</em></label></li>
													<li><input
														type="radio"
														id="day_2"
														name="day"
														value="Tomorrow"
													><label for="day_2">Tomorrow<em>-40%</em></label></li>
												</ul>
											</div>
											<!-- /people_select -->
										</div>
									</div>
								</div>
								<!-- /dropdown -->
								<div class="dropdown time">
									<a
										href="#"
										data-toggle="dropdown"
									>Time <span id="selected_time"></span></a>
									<div class="dropdown-menu">
										<div class="dropdown-menu-content">
											<h4>Lunch</h4>
											<div class="radio_select add_bottom_15">
												<ul>
													<li><input
														type="radio"
														id="time_1"
														name="time"
														value="12.00am"
													><label for="time_1">12.00<em>-40%</em></label></li>
													<li><input
														type="radio"
														id="time_2"
														name="time"
														value="08.30pm"
													><label for="time_2">12.30<em>-40%</em></label></li>
													<li><input
														type="radio"
														id="time_3"
														name="time"
														value="09.00pm"
													><label for="time_3">1.00<em>-40%</em></label></li>
													<li><input
														type="radio"
														id="time_4"
														name="time"
														value="09.30pm"
													><label for="time_4">1.30<em>-40%</em></label></li>
												</ul>
											</div>
											<!-- /time_select -->
											<h4>Dinner</h4>
											<div class="radio_select">
												<ul>
													<li><input
														type="radio"
														id="time_5"
														name="time"
														value="08.00pm"
													><label for="time_1">20.00<em>-40%</em></label></li>
													<li><input
														type="radio"
														id="time_6"
														name="time"
														value="08.30pm"
													><label for="time_2">20.30<em>-40%</em></label></li>
													<li><input
														type="radio"
														id="time_7"
														name="time"
														value="09.00pm"
													><label for="time_3">21.00<em>-40%</em></label></li>
													<li><input
														type="radio"
														id="time_8"
														name="time"
														value="09.30pm"
													><label for="time_4">21.30<em>-40%</em></label></li>
												</ul>
											</div>
											<!-- /time_select -->
										</div>
									</div>
								</div>
								<!-- /dropdown -->
								<div class="btn_1_mobile">
									<a
										href="order.html"
										class="btn_1 gradient full-width mb_5"
									>Order Now</a>
									<div class="text-center">
										<small>No money charged on this steps</small>
									</div>
								</div>
							</div>
						</div>
						<!-- /box_order -->
						<div class="btn_reserve_fixed">
							<a
								href="#0"
								class="btn_1 gradient full-width"
							>View Basket</a>
						</div>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /bg_gray -->
		<div class="container margin_30_20">
			<div class="row">
				<div class="col-lg-8 list_menu">
					<section id="section-5">
						<h4>Reviews</h4>
						<div class="row add_bottom_30 d-flex align-items-center reviews">
							<div class="col-md-3">
								<div id="review_summary">
									<strong><%out.print(rate);%></strong>
								</div>
							</div>
						</div>
						<%	

						
							query = "SELECT * FROM demo.restaurantRate where restaurantName = '"+resturantName+"'";
							
							PreparedStatement ps2 = con.prepareStatement(query);
							ResultSet rs2 = ps2.executeQuery();
							
							ArrayList<String> usernames = new ArrayList<String>();
							ArrayList<Float> rates = new ArrayList<Float>();
							ArrayList<String> postTimes = new ArrayList<String>();
							ArrayList<String> titles = new ArrayList<String>();
							ArrayList<String> contents = new ArrayList<String>();
							
							while(rs2!= null && rs2.next()) { 
								usernames.add(rs2.getString("username"));
								rates.add(rs2.getFloat("rate"));
								postTimes.add(rs2.getString("postTime"));
								if(rs2.getString("title")==null || (rs2.getString("title").equals(""))){
									titles.add("No Title");
								}else{
									titles.add(rs2.getString("title"));
								}
								if(rs2.getString("content")==null || (rs2.getString("content").equals(""))){
									titles.add("No Content");
								}else{
									contents.add(rs2.getString("content"));
								}
								
							}
							int n=0;
							for(n=0;n<usernames.size();n++){%>
						<!-- /row -->
						<div id="reviews">
							<!-- /review_card -->
							
							<div class="review_card">
								<div class="row">
									<div class="col-md-2 user_info">
										<figure>
											<img
												src="img/avatar1.jpg"
												alt=""
											>
										</figure>
										<h5><%out.print(usernames.get(n));%></h5>
									</div>
									<div class="col-md-10 review_content">
										<div class="clearfix add_bottom_15">
											<span class="rating"><%out.print(rates.get(n));%><small>/10</small><strong>  Rating
													average</strong></span><em>Published <%out.print(postTimes.get(n));%></em>
										</div>
										<h4><%out.print(titles.get(n));%></h4>
										<p><%out.print(contents.get(n));%></p>
									</div>
								</div>
							</div>
							<%}
							
							con.close();
							}catch (Exception ex) {
								out.print(ex);
							}
							%>
							<!-- /review_card -->
						</div>
						<!-- /reviews -->
						<div class="text-right">
							<a
								href="postReview.jsp?username=<%=username%>&resturantName=<%=resturantName%>"
								class="btn_1 gradient"
							>Leave a Review</a>
						</div>
					</section>
					<!-- /section -->
				</div>
			</div>
		</div>
		<% %>
		<!-- /container -->
	</main>
	<!-- /main -->
	<footer>
		<div class="wave footer"></div>
		<div class="container margin_60_40 fix_mobile">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<h3 data-target="#collapse_1">Quick Links</h3>
					<div
						class="collapse dont-collapse-sm links"
						id="collapse_1"
					>
						<ul>
							<li><a href="about.html">About us</a></li>
							<li><a href="submit-restaurant.html">Add your restaurant</a></li>
							<li><a href="jsp/AskQuestionProcess.jsp?username=<%=username%>">help</a></li>
							<li><a href="account.html">My account</a></li>
							<li><a href="blog.html">Blog</a></li>
							<li><a href="contacts.html">Contacts</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<h3 data-target="#collapse_2">Categories</h3>
					<div
						class="collapse dont-collapse-sm links"
						id="collapse_2"
					>
						<ul>
							<li><a href="discover.jsp">Top
									Categories</a></li>
							<li><a href="grid-listing-filterscol-full-masonry.html">Best
									Rated</a></li>
							<li><a href="grid-listing-filterscol-full-width.html">Best
									Price</a></li>
							<li><a href="grid-listing-filterscol-full-masonry.html">Latest
									Submissions</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<h3 data-target="#collapse_3">Contacts</h3>
					<div
						class="collapse dont-collapse-sm contacts"
						id="collapse_3"
					>
						<ul>
							<li><i class="icon_house_alt"></i>6 MetroTech Center, Brooklyn<br>New York - US</li>
							<li><i class="icon_mobile"></i>+123-456-789</li>
							<li><i class="icon_mail_alt"></i><a href="#0">nyu@nyu.edu</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">

					<div
						class="collapse dont-collapse-sm"
						id="collapse_4"
					>
						<div class="follow_us">
							<h5>Follow Us</h5>
							<ul>
								<li><a href="#0"><img
										src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
										data-src="img/twitter_icon.svg"
										alt=""
										class="lazy"
									></a></li>
								<li><a href="#0"><img
										src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
										data-src="img/facebook_icon.svg"
										alt=""
										class="lazy"
									></a></li>
								<li><a href="#0"><img
										src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
										data-src="img/instagram_icon.svg"
										alt=""
										class="lazy"
									></a></li>
								<li><a href="#0"><img
										src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
										data-src="img/youtube_icon.svg"
										alt=""
										class="lazy"
									></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- /row-->
			<hr>
			<div class="row add_bottom_25">
				<div class="col-lg-6">
					<ul class="footer-selector clearfix">
						<li><img
							src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
							data-src="img/cards_all.svg"
							alt=""
							width="230"
							height="35"
							class="lazy"
						></li>
					</ul>
				</div>
				<div class="col-lg-6">
					<ul class="additional_links">
						<li><a href="https://github.com/AceJW/NYU-ECE9953-FoodDelivery-Web-Project-Spring-2022">Github</a></li>
						<li><span>Jiahao Wang & Jiazhao Shi</span></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
	<!--/footer-->
	<div id="toTop"></div>
	<!-- Back to top button -->
	<!-- Sign In Modal -->
	<div
		id="sign-in-dialog"
		class="zoom-anim-dialog mfp-hide"
	>
		<div class="modal_header">
			<h3>Sign In</h3>
		</div>
		<form>
			<div class="sign-in-wrapper">
				<a
					href="#0"
					class="social_bt facebook"
				>Login with Facebook</a><a
					href="#0"
					class="social_bt google"
				>Login with Google</a>
				<div class="divider">
					<span>Or</span>
				</div>
				<div class="form-group">
					<label>Email</label><input
						type="email"
						class="form-control"
						name="email"
						id="email"
					><i class="icon_mail_alt"></i>
				</div>
				<div class="form-group">
					<label>Password</label><input
						type="password"
						class="form-control"
						name="password"
						id="password"
						value=""
					><i class="icon_lock_alt"></i>
				</div>
				<div class="clearfix add_bottom_15">
					<div class="checkboxes float-left">
						<label class="container_check">Remember me <input
							type="checkbox"
						><span class="checkmark"></span></label>
					</div>
					<div class="float-right">
						<a
							id="forgot"
							href="javascript:void(0);"
						>Forgot Password?</a>
					</div>
				</div>
				<div class="text-center">
					<input
						type="submit"
						value="Log In"
						class="btn_1 full-width mb_5"
					>Don’t have an account? <a href="account.html">Sign up</a>
				</div>
				<div id="forgot_pw">
					<div class="form-group">
						<label>Please confirm login email below</label><input
							type="email"
							class="form-control"
							name="email_forgot"
							id="email_forgot"
						><i class="icon_mail_alt"></i>
					</div>
					<p>You will receive an email containing a link allowing you to
						reset your password to a new preferred one.</p>
					<div class="text-center">
						<input
							type="submit"
							value="Reset Password"
							class="btn_1"
						>
					</div>
				</div>
			</div>
		</form>
		<!--form -->
	</div>
	<!-- /Modal item order -->
	<!-- COMMON SCRIPTS -->
	<script src="js/common_scripts.min.js"></script>
	<script src="js/common_func.js"></script>
	<script src="assets/validate.js"></script>
	<!-- SPECIFIC SCRIPTS -->
	<script src="js/sticky_sidebar.min.js"></script>
	<script src="js/sticky-kit.min.js"></script>
	<script src="js/specific_detail.js"></script>
</body>
</html>
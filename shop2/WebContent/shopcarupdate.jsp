
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
int id = Integer.parseInt(request.getParameter("id"));//用request得到
request.setAttribute("id", id);%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->
<link rel="stylesheet"
	href="https://ajax.aspnetcdn.com/ajax/bootstrap/4.2.1/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<!-- Google fonts - Popppins for copy-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,800">
<!-- orion icons-->
<link rel="stylesheet" href="css/orionicons.css">
<!-- theme stylesheet-->
<link rel="stylesheet" href="css/style.blue.css" id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon" href="img/favicon.png?3">
<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
<title>sale</title>
</head>
<body>
	<!-- navbar-->
	<header class="header">
		<nav class="navbar navbar-expand-lg px-4 py-2 bg-white shadow">
			<a href="#" class="sidebar-toggler text-gray-500 mr-4 mr-lg-5 lead"><i
				class="fas fa-align-left"></i></a><a href="home.jsp"
				class="navbar-brand font-weight-bold text-uppercase text-base">商品销售管理</a>
			<ul class="ml-auto d-flex align-items-center list-unstyled mb-0">
				<li class="nav-item">
					<form id="select" method="post"
						action="ShopCarSumServlet?op=select"
						class="ml-auto d-none d-lg-block">
						<div class="form-group position-relative mb-0">
							<input id="getbyid" type="text" name="id" placeholder="请输入商品编号"
								class="form-control form-control-sm border-0 no-shadow pl-4" />
							<button type="submit" style="top: 0px; left: 0;"
								class="position-absolute bg-white border-0 p-0">
								<i class="o-search-magnify-1 text-gray text-lg"></i>
							</button>
						</div>
					</form>
				</li>
				<li><span id="userInfo" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"
					class="nav-link dropdown-toggle">用户 <%=session.getAttribute("pid")%></span>
				</li>
				<li class="nav-item dropdown ml-auto"><a
					href="${pageContext.request.contextPath}/LogoutServlet"
					class="dropdown-item">Logout</a></li>
			</ul>
		</nav>
	</header>
	<div class="d-flex align-items-stretch">
		<div id="sidebar" class="sidebar py-3">
			<div
				class="text-gray-400 text-uppercase px-3 px-lg-4 py-4 font-weight-bold small headings-font-family">MAIN</div>
			<ul class="sidebar-menu list-unstyled">
				<li class="sidebar-list-item"><a href="home.jsp"
					class="sidebar-link text-muted"><i
						class="o-home-1 mr-3 text-gray"></i><span>主页</span></a></li>
				<li class="sidebar-list-item"><a href="javascript:void(0);"
					onclick="sale(<%=session.getAttribute("q")%>)"
					class="sidebar-link text-muted active"><i
						class="o-imac-screen-1 mr-3 text-gray"></i><span>销售</span></a></li>
				<li class="sidebar-list-item"><a href="javascript:void(0);"
					onclick="salerecord(<%=session.getAttribute("q")%>)"
					class="sidebar-link text-muted"><i
						class="o-sales-up-1 mr-3 text-gray"></i><span>销售记录</span></a></li>
				<li class="sidebar-list-item"><a href="javascript:void(0);"
					onclick="goods(<%=session.getAttribute("q")%>)"
					class="sidebar-link text-muted"><i
						class="o-table-content-1 mr-3 text-gray"></i><span>商品管理</span></a></li>
				<li class="sidebar-list-item"><a href="javascript:void(0);"
					onclick="kucun(<%=session.getAttribute("q")%>)"
					class="sidebar-link text-muted"><i
						class="o-database-1 mr-3 text-gray"></i><span>库存管理</span></a></li>
				<li class="sidebar-list-item"><a href="javascript:void(0);"
					onclick="supplier(<%=session.getAttribute("q")%>)"
					class="sidebar-link text-muted"><i
						class="o-survey-1 mr-3 text-gray"></i><span>供货商管理</span></a></li>
				<li class="sidebar-list-item"><a href="javascript:void(0);"
					onclick="quanxian(<%=session.getAttribute("q")%>)"
					class="sidebar-link text-muted"><i
						class="o-exit-1 mr-3 text-gray"></i><span>员工管理</span></a></li>
			</ul>
		</div>
		
		<div class="page-holder w-100 d-flex flex-wrap">
			<div class="container-fluid px-xl-5">
				<section class="py-5">
					<div class="row">
						<!-- Form Elements -->
						<div class="col-lg-12 mb-5">
							<div class="card">
								<div class="card-header">
									<h3 class="h6 text-uppercase mb-0">修改</h3>
								</div>
								<div class="card-body">
									<form method="post" action="ShopCarSumServlet?op=update"
										class="form-horizontal">
										<div class="form-group row">
											<label class="col-md-3 form-control-label">商品编号</label>
											<div class="col-md-9">
												<input type="text" name="id" readonly="true" value="<%=id%>"
													class="form-control">
											</div>
										</div>
										<div class="line"></div>
										<div class="form-group row">
											<label class="col-md-3 form-control-label">数量</label>
											<div class="col-md-9">
												<input type="text" name="num" class="form-control">
											</div>
										</div>
										<div class="line"></div>
										<div class="form-group row">
											<div class="col-md-9 ml-auto">
												<a href="shopcarindex.jsp" class="btn btn-secondary">取消</a> <input
													type="submit" value="保存" class="btn btn-primary" />
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
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
<title>peoples manager</title>
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
					<form id="select" method="post" action="PeopleSumServlet?op=select"
						class="ml-auto d-none d-lg-block">
						<div class="form-group position-relative mb-0">
							<input id="getbyid" type="text" name="id" placeholder="请输入员工编号"
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
					class="sidebar-link text-muted"><i
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
					class="sidebar-link text-muted active"><i
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
										<h3 class="h6 text-uppercase mb-0">员工</h3>
									</div>
									<div class="card-body">
										<form method="post" action="PeopleSumServlet?op=insert" class="form-horizontal">
											<div class="form-group row">
												<label class="col-md-3 form-control-label">编号</label>
												<div class="col-md-9">
													<input type="text" name="id" class="form-control">
												</div>
											</div>
											<div class="line"></div>
											<div class="form-group row">
												<label class="col-md-3 form-control-label">姓名</label>
												<div class="col-md-9">
													<input type="text" name="name" class="form-control">
												</div>
											</div>
											<div class="line"></div>
											<div class="form-group row">
												<label class="col-md-3 form-control-label">性别<br></label>
												<div class="col-md-9">
													<div>
														<input id="optionsRadios1" type="radio" checked="checked" value="man" name="gender">
														<label for="optionsRadios1">男</label>
													</div>
													<div>
														<input id="optionsRadios2" type="radio" value="woman" name="gender">
														<label for="optionsRadios2">女</label>
													</div>
												</div>
											</div>
											<div class="line"></div>
											<div class="form-group row">
												<label class="col-md-3 form-control-label">密码</label>
												<div class="col-md-9">
													<input type="password" name="pwd" class="form-control">
												</div>
											</div>
											<div class="line"></div>
											<div class="form-group row">
												<label class="col-md-3 form-control-label">职位<br><small class="text-primary"></label>
												<div class="col-md-9">
													<div>
														<input id="optionsRadios1" type="radio" checked="checked" value="cangku" name="position">
														<label for="optionsRadios1">仓库管理</label>
													</div>
													<div>
														<input id="optionsRadios2" type="radio" value="sales" name="position">
														<label for="optionsRadios2">销售</label>
													</div>
												</div>
											</div>
											<div class="line"></div>
											<div class="form-group row">
												<label class="col-md-3 form-control-label">工资</label>
												<div class="col-md-9">
													<div class="form-group">
														<div class="input-group mb-3">
															<div class="input-group-prepend"><span class="input-group-text">¥</span></div>
															<input type="text" name="wage" aria-label="Dollar amount (with dot and two decimal places)" class="form-control">
														</div>
													</div>
												</div>
											</div>
											<div class="line"></div>
											<div class="form-group row">
												<label class="col-md-3 form-control-label">党员<br></label>
												<div class="col-md-9">
													<div>
														<input id="optionsRadios1" type="radio" checked="checked" value="yes" name="dang">
														<label for="optionsRadios1">是</label>
													</div>
													<div>
														<input id="optionsRadios2" type="radio" value="no" name="dang">
														<label for="optionsRadios2">否</label>
													</div>
												</div>
											</div>
											<div class="line"></div>
											<div class="form-group row">
												<label class="col-md-3 form-control-label">简介</label>
												<div class="col-md-9">
													<input type="text" name="resume" placeholder="简介" class="form-control">
												</div>
											</div>
											<div class="line"></div>
											<div class="form-group row">
												<label class="col-md-3 form-control-label">照片</label>
												<div class="col-md-9">
													<input type="text" name="photo" placeholder="照片" class="form-control">
												</div>
											</div>
											<div class="line"></div>
											<div class="form-group row">
												<div class="col-md-9 ml-auto">
												    <a href="index.jsp" class="btn btn-secondary">取消</a>
													<input type="submit" value="提交" class="btn btn-primary"/>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
<footer
				class="footer bg-white shadow align-self-end py-3 px-xl-5 w-100">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6 text-center text-md-left text-primary">
							<p class="mb-2 mb-md-0">Your company &copy; 2018-2020</p>
						</div>
						<div class="col-md-6 text-center text-md-right text-gray-400">
							<p class="mb-0">Copyright &copy; 2019.Company name All rights
								reserved.More Templates</p>
							<!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<!-- JavaScript files-->
	<script src="js/jquery.min.js"></script>
	<script src="vendor/popper.js/umd/popper.min.js"> </script>
	<script src="js/bootstrap.min.js"></script>
	<script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
	<script src="js/Chart.min.js"></script>
	<script src="js/js.cookie.min.js"></script>
	<script src="js/front.js"></script>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script>
   	function quanxian(val){ //员工
   		if(val == 1){
   			location.href="index.jsp";
   		}else {
   			alert("没有权限查看");
   		}
   	}
   	function sale(val){ //销售
   		if(val == 1){
   			location.href="zhuye.jsp";
   		}else if(val == 3){
   			location.href = "zhuye.jsp";
   		}else {
   			alert("没有权限查看");
   		}
   	}
   	function salerecord(val){ //销售记录
   		if(val == 1){
   			location.href="salesindex.jsp";
   		}else if(val == 3){
   			location.href = "salesindex.jsp";
   		}else {
   			alert("没有权限查看");
   		}
   	}
   	function goods(val){ //商品
   		if(val == 1){
   			location.href="goodsindex.jsp";
   		}else if(val == 2){
   			location.href = "goodsindex.jsp";
   		}else {
   			alert("没有权限查看");
   		}
   	}
   	function kucun(val){ //库存
   		if(val == 1){
   			location.href="stockindex.jsp";
   		}else if(val == 2){
   			location.href = "stockindex.jsp";
   		}else {
   			alert("没有权限查看");
   		}
   	}
   	function supplier(val){ //供货商
   		if(val == 1){
   			location.href="supplierindex.jsp";
   		}else if(val == 2){
   			location.href = "supplierindex.jsp";
   		}else {
   			alert("没有权限查看");
   		}
   	}
   </script>
</html>
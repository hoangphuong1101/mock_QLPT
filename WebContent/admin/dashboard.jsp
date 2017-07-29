<%@page import="statics.Pagination"%>
<%@page import="common.StringProcess"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
<meta charset="UTF-8">
<title>Thống kê</title>
<link href="../css/font-awesome.min.css" rel="stylesheet">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/compiled.min.css" rel="stylesheet">
<link href="../css/mdb.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<link href="../css/sweetalert.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-toggleable-md fixed-top">
	<button class="navbar-toggler navbar-toggler-right" type="button"
		data-toggle="collapse" data-target="#navbarNav1"
		aria-controls="navbarNav1" aria-expanded="false"
		aria-label="Toggle navigation">
		<i class="fa fa-bars" style="color: #2C97BE" aria-hidden="true"></i>
	</button>
	<a class="navbar-brand" href="../"> <strong><img
			src="../img/logo.png" height="25px;" /></strong>
	</a>
	<div class="collapse navbar-collapse" id="navbarNav1">
		<ul class="navbar-nav mr-auto">
		</ul>
		<ul class="navbar-nav ml-auto">
			<img id="imgAva" src="../img/avatar.jpg" alt="Hình đại diện"
				class="rounded-circle" style="width: 40px; height: 40px">
			<li class="nav-item dropdown btn-group"><a
				class="nav-link dropdown-toggle" id="dropdownMenu1"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></a>
				<div class="dropdown-menu dropdown dropdown-menu-right"
					aria-labelledby="dropdownMenu1">
					<a class="dropdown-item" onclick="logout();">Đăng xuất</a>
				</div></li>
		</ul>
	</div>
	</nav>

	<div class="row main-board">
		<div class="col-lg-2 hidden-lg-down side-menu-left">
			<div class="row dash-board">
				<a href="./dashboard-action.do">
					<button type="button"
						class="btn btn-elegant button-side-menu-left button-dash-board">
						<i class="fa fa-globe icon-in-button" style="color: #2C97BE"
							aria-hidden="true"></i>Thống kê
					</button>
				</a>
			</div>
			<div class="row dash-board">
				<a href="./account-manager-action.do">
					<button type="button" class="btn btn-elegant button-side-menu-left">
						<i class="fa fa-group icon-in-button" aria-hidden="true"></i>Tài
						khoản
					</button>
				</a>
			</div>
			<div class="row dash-board">
				<a href="./category-manager-action.do">
					<button type="button" class="btn btn-elegant button-side-menu-left">
						<i class="fa fa-globe icon-in-button" style="color: #2C97BE"
							aria-hidden="true"></i>Danh mục
					</button>
				</a>
			</div>
		</div>
		<div class="col-lg-10 scroll-box">
			<bean:define id="dashBoard" name="dashBoardForm" property="dashBoard"></bean:define>
			<div class="main-content hoverable" style="overflow-y: scroll;">
				<br>
				<div class="row" style="width: calc(100%); margin-left: 0px;">
					<!--First column-->
					<div class="col-md-4 mb-1">
						<!--Card-->
						<div class="card card-cascade cascading-admin-card">

							<!--Card Data-->
							<div class="admin-up">
								<i class="fa  fa-user-circle-o blue darken-3"
									style="background-color: #EF5350 !important;"></i>
								<div class="data">
									<p>Tài khoản</p>
									<h3>
										<bean:write name="dashBoard" property="numOfAccount" />
									</h3>
								</div>
							</div>
							<!--/.Card Data-->

							<!--Card content-->
							<div class="card-block">
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar"
										style="width: <bean:write name="dashBoard" property="perAccount"/>%"
										aria-valuenow="<bean:write name="dashBoard" property="perAccount"/>"
										aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								<!--Text-->
								<p class="card-text">
									<bean:write name="dashBoard" property="numOfAccountActive" />
									được duyệt (
									<bean:write name="dashBoard" property="perAccount" />
									%)
								</p>
							</div>
							<!--/.Card content-->

						</div>
						<!--/.Card-->
					</div>
					<!--/First column-->

					<!--Second column-->
					<div class="col-md-4 mb-1">
						<!--Card-->
						<div class="card card-cascade cascading-admin-card">

							<!--Card Data-->
							<div class="admin-up">
								<i class="fa  fa-newspaper-o deep-purple darken-4"
									style="background-color: #00BFA5 !important;"></i>
								<div class="data">
									<p>Bài viết</p>
									<bean:write name="dashBoard" property="numOfThread" />
								</div>
							</div>
							<!--/.Card Data-->

							<!--Card content-->
							<div class="card-block">
								<div class="progress">
									<div class="progress-bar bg-danger" role="progressbar"
										style="width: <bean:write name="dashBoard" property="perThread"/>%"
										aria-valuenow="<bean:write name="dashBoard" property="perThread"/>"
										aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								<!--Text-->
								<p class="card-text">
									<bean:write name="dashBoard" property="numOfThreadActive" />
									được duyệt (
									<bean:write name="dashBoard" property="perThread" />
									%)
								</p>
							</div>
							<!--/.Card content-->

						</div>
						<!--/.Card-->
					</div>
					<!--/Second column-->

					<!--Third column-->
					<div class="col-md-4 mb-1">
						<!--Card-->
						<div class="card card-cascade cascading-admin-card">

							<!--Card Data-->
							<div class="admin-up">
								<i class="fa fa-comments-o indigo"
									style="background: #FF9100 !important"></i>
								<div class="data">
									<p>Đánh giá</p>
									<h3>
										<bean:write name="dashBoard" property="numOfRate" />
									</h3>
								</div>
							</div>
							<!--/.Card Data-->

							<!--Card content-->
							<div class="card-block">
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar"
										style="width: <bean:write name="dashBoard" property="perRate" />%"
										aria-valuenow="<bean:write name="dashBoard" property="perRate" />"
										aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								<!--Text-->
								<p class="card-text">
									<bean:write name="dashBoard" property="numOfRateMax" />
									điểm 5 sao (
									<bean:write name="dashBoard" property="perRate" />
									%)
								</p>
							</div>
							<!--/.Card content-->

						</div>
						<!--/.Card-->
					</div>
					<!--/Third column-->

				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="card mb-r"
							style="margin: 15px; width: calc(100% - 30px);">
							<div class="card-block">
								<div class="view right hm-white-slight"
									style="margin-left: 0px !important;">
									<canvas id="sales" height="329" width="1200"
										style="width: 1200px; height: 329px;"></canvas>
									<div class="text-center">Biểu đồ thống kê bài viết</div>

								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="card mb-r"
							style="margin: 15px; width: calc(100% - 30px);">
							<div class="card-block">
								<h4 class="h4-responsive text-center mb-1">Thống kê theo
									danh mục</h4>
								<canvas id="seo" height="151" width="303"
									style="width: 337px; height: 168px;"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="../js/tether.min.js"></script>
		<script type="text/javascript" src="../js/bootstrap.min.js"></script>
		<script type="text/javascript" src="../js/mdb.min.js"></script>
		<script type="text/javascript" src="../js/sweetalert.min.js"></script>

		<script type="text/javascript">
			//Trỏ đến styleId( tương đương với id) của property page
			var pageId = $("#pageId");
			//Khi load trang xong
			$(document).ready(function() {
				$("#imgAva").attr("src", "../" + readCookie("avatarAdmin"));
				$("#dropdownMenu1").html(readCookie("emailAdmin"));
				//Đọc lại giá trị page hiện tại từ Form Class
				//Thêm class active vô id <li> của trang hiện tại
			});
			//Khi muốn xem kết quả tìm kiếm của trang nào đó
			function viewPage(page) {
				//Gán giá trị page truyền vào cho property page của Form Class
				pageId.val(page);
				//Submit form bằng javascript
				document.forms[0].submit();
			};
			//hàm sửa item
			function verifyItem(id) {
				var curentUrl = window.location.href;
				var index = curentUrl.lastIndexOf("/");
				var url = curentUrl.substring(0, index);
				window.location.href = url
						+ "/verify-thread-action.do?threadId=" + id;
			};
			//Hàm xóa item
			function deleteItem(id) {
				swal({
					title : "Bạn có chắc?",
					text : "Dữ liệu bị xóa sẽ mất vĩnh viễn!",
					type : "warning",
					showCancelButton : true,
					confirmButtonColor : "#DD6B55",
					confirmButtonText : "Đồng ý!",
					closeOnConfirm : false
				}, function() {
					var curentUrl = window.location.href;
					var index = curentUrl.lastIndexOf("/");
					var url = curentUrl.substring(0, index);
					window.location.href = url
							+ "/delete-thread-action.do?threadId=" + id;
				});
			};
			//Hàm xóa item
			function viewItem(id) {
				var curentUrl = window.location.href;
				index = curentUrl.lastIndexOf("/");
				url = curentUrl.substring(0, index);
				index = url.lastIndexOf("/");
				url = url.substring(0, index);
				window.open(url + "/view-thread-action.do?threadId=" + id);
			};
			function logout() {
				$.ajax({
					type : "POST",
					url : "/Mock_SE7/home-account-action.do",
					data : "action=logout",
					success : function(res) {
						log("Logout");
					},
					error : function(e) {
						alert('Error: ' + e);
					}
				});
				eraseCookie("email");
				eraseCookie("password");
				var curentUrl = window.location.href;
				index = curentUrl.lastIndexOf("/");
				url = curentUrl.substring(0, index);
				index = url.lastIndexOf("/");
				url = url.substring(0, index);
				window.location.href = url;
			};

			function log(a) {
				console.log(a);
			};

			function createCookie(name, value, days) {
				var expires = "";
				if (days) {
					var date = new Date();
					date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
					expires = "; expires=" + date.toUTCString();
				}
				document.cookie = name + "=" + value + expires + "; path=/";
			};

			function readCookie(name) {
				var nameEQ = name + "=";
				var ca = document.cookie.split(';');
				for (var i = 0; i < ca.length; i++) {
					var c = ca[i];
					while (c.charAt(0) == ' ')
						c = c.substring(1, c.length);
					if (c.indexOf(nameEQ) == 0)
						return c.substring(nameEQ.length, c.length);
				}
				return null;
			};

			function eraseCookie(name) {
				createCookie(name, "", -1);
			};
			$(function() {
				jsonThread = '<bean:write name="dashBoard" property="jsonThread" />';
				objThread = JSON.parse(jsonThread.replace(/&quot;/g, '"'));
				jsonRate = '<bean:write name="dashBoard" property="jsonRate" />';
				objRate = JSON.parse(jsonRate.replace(/&quot;/g, '"'));
				jsonPie = '<bean:write name="dashBoard" property="jsonPie" />';
				objPie = JSON.parse(jsonPie.replace(/&quot;/g, '"'));
				jsonThreadRate = '<bean:write name="dashBoard" property="jsonThreadRate" />';
				objThreadRate = JSON.parse(jsonThreadRate.replace(/&quot;/g,
						'"'));
				objThreadRate = objThreadRate.reverse();

				labelChart = [];
				dataThread = [];
				dataRate = [];
				for (i = 0; i < objThreadRate.length; i++) {
					labelChart.push(objThreadRate[i].label);
					dataThread.push(objThreadRate[i].num1);
					dataRate.push(objThreadRate[i].num2);
				}
				labelPie = [];
				var dataPie1 = [];
				for (i = 0; i < objPie.length; i++) {
					dataPie1.push({
						value : objPie[i].data,
						color : '#'
								+ (0x1000000 + (Math.random()) * 0xffffff)
										.toString(16).substr(1, 6),
						highlight : '#'
								+ (0x1000000 + (Math.random()) * 0xffffff)
										.toString(16).substr(1, 6),
						label : objPie[i].label
					});
				}
				var data = {
					labels : labelChart,
					datasets : [ {
						label : "My First dataset",
						fillColor : "rgba(247, 201, 138,0.2)",
						strokeColor : "#FF9100",
						pointColor : "#754403",
						pointStrokeColor : "#0f0",
						pointHighlightFill : "#000",
						pointHighlightStroke : "rgba(0,0,255,.15)",
						data : dataRate,
						backgroundColor : "#fff !important;"
					}, {
						label : "My First dataset",
						fillColor : "rgba(133, 214, 203,0.2)",
						strokeColor : "#00BFA5",
						pointColor : "#024c42",
						pointStrokeColor : "#0f0",
						pointHighlightFill : "#000",
						pointHighlightStroke : "rgba(0,0,255,.15)",
						data : dataThread,
						backgroundColor : "#fff !important;"
					} ]
				};

				var option = {
					responsive : true,
					// set font color
					scaleFontColor : "#000",
					// font family
					defaultFontFamily : "'Roboto', sans-serif",
					// background grid lines color
					scaleGridLineColor : "rgba(0,0,0,.4)",
					// hide vertical lines
					scaleShowVerticalLines : false,
				};

				var dataPie = [ {
					value : 300,
					color : "#4caf50",
					highlight : "#66bb6a",
					label : "Google Chrome"
				}, {
					value : 50,
					color : "#03a9f4",
					highlight : "#29b6f6",
					label : "Edge"
				}, {
					value : 100,
					color : "#d32f2f",
					highlight : "#e53935",
					label : "Firefox"
				} ]
				// Get the context of the canvas element we want to select
				var ctx = document.getElementById("sales").getContext('2d');
				var myLineChart = new Chart(ctx).Line(data, option); //'Line' defines type of the chart.

				// Get the context of the canvas element we want to select
				var ctx = document.getElementById("seo").getContext('2d');
				var myPieChart = new Chart(ctx).Pie(dataPie1, option);
			});
		</script>
</body>

</html>
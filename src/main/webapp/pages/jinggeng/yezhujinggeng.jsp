<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page language="java" import="java.util.*,com.newenv.communityFocus.vo.UserLogin,com.newenv.communityFocus.security.SecurityUserHolder"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
	String imagePath = SecurityUserHolder.getConfig().getImagePath();
%>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta name="description" content="Xenon Boostrap Admin Panel" />
		<meta name="author" content="" />
		<title>业主精耕管理</title>
		<link rel="stylesheet" href="<%=basePath%>/assets/css/fonts/linecons/css/linecons.css">
		<link rel="stylesheet" href="<%=basePath%>/assets/css/fonts/fontawesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=basePath%>/assets/css/fonts/elusive/css/elusive.css">
		<link rel="stylesheet" href="<%=basePath%>/assets/css/bootstrap.css">
		<link rel="stylesheet" href="<%=basePath%>/assets/css/xenon-core.css">
		<link rel="stylesheet" href="<%=basePath%>/assets/css/xenon-forms.css">
		<link rel="stylesheet" href="<%=basePath%>/assets/css/xenon-components.css">
		<link rel="stylesheet" href="<%=basePath%>/assets/css/xenon-skins.css">
		<link rel="stylesheet" href="<%=basePath%>/assets/css/custom.css">
		<link rel="stylesheet" href="<%=basePath%>/assets/css/jingen.css">
		<script src="<%=basePath%>/js/jquery-1.11.1.min.js"></script>
	
		<script>
			$(function(){
					$(".gengduodianji").click(function(){
						var genduo=$(".gengduodianji").val()
						if(genduo=="查看更多")
						{
							$(".gengduo").show();
							$(".gengduodianji").val("收起");
							$(".gengduodianji").html("收起");
						}
						else
						{
							$(".gengduo").hide();
							$(".gengduodianji").val("查看更多");
							$(".gengduodianji").html("查看更多");
						}
					});
				});
		</script>
		<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".s2example").select2({
			placeholder: '请输入搜索条件...',
			allowClear: true
		}).on('select2-open', function() {
			// Adding Custom Scrollbar
			$(this).data('select2').results.addClass('overflow-hidden').perfectScrollbar();
		});
	});
</script>
		<style>
		@media screen and (max-width: 1950px)
			{
				.table-responsive {
				    width: 100%;
				    margin-bottom: 13.5px;
				    overflow-y: hidden;
				    overflow-x: auto;
				    -ms-overflow-style: -ms-autohiding-scrollbar;
				    border: 1px solid #eeeeee;
				    -webkit-overflow-scrolling: touch;
				}
				.table-responsive > .table > thead > tr > th, .table-responsive > .table > tbody > tr > th, .table-responsive > .table > tfoot > tr > th, .table-responsive > .table > thead > tr > td, .table-responsive > .table > tbody > tr > td, .table-responsive > .table > tfoot > tr > td {
				    white-space: nowrap;
				}
			}
			.tabs-vertical-env .nav.tabs-vertical {
			    min-width: 70px;
			    width: 50px;
			}
			.nav > li a{
			    height: auto !important;
			   
			}
			.tabs-vertical-env .nav.tabs-vertical li > a{ word-wrap: break-word !important;white-space:inherit;}
			.nav > li > a {
			    padding-left: 5px !important;
			    padding-right: 5px !important;
			}
			.tabs-vertical-env .tab-content{ padding: 15px 5px;}
			.height800{max-height: 800px;  overflow-y: auto;}
			.select2-arrow{ margin-right: 0px !important;}

		</style>
		<script type="text/javascript" src="<%=basePath%>/js/syscs.js"></script>
		<script src="<%=basePath%>/assets/js/select2/select2.js"></script>
		<link rel="stylesheet" href="<%=basePath%>/assets/js/select2/select2.css">
		<link rel="stylesheet" href="<%=basePath%>/assets/js/select2/select2-bootstrap.css">
		<script type="text/javascript" src="<%=basePath%>/js/page.js"></script>
		<script type="text/javascript" src="<%=basePath%>/js/jinggeng/yezhujinggengPage.js"></script>
		<script type="text/javascript" src="<%=basePath%>/js/jinggeng/yezhujinggeng.js"></script>
	    <script type="text/javascript" src="<%=basePath%>/js/services.js"></script>
	</head>
	<div class='onsubing' style="display:none; width:100%; height:100%; background:#fff; position:fixed; z-index:99999; opacity:0.8;-moz-opacity:0.8; filter:alpha(opacity=80); ">
		<div class="text-center" style="position:absolute; top:20%; left:50%;">
			<img src="<%=basePath%>/images/loading.gif" width="176" height="220"/>
			<span> 数据正在加载中....请稍等</span>
		</div>
	</div>
	<body class="page-body">
		<div class="page-container">
			<!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->

			<!-- Add "fixed" class to make the sidebar fixed always to the browser viewport. -->
			<!-- Adding class "toggle-others" will keep only one menu item open at a time. -->
			<!-- Adding class "collapsed" collapse sidebar root elements and show only icons. -->
			<input type="hidden" id="userid" value="${userid }"/>
			<input type="hidden" id="departmentid" value="${departmentid }"/>
			<input type="hidden" id="cityid" value="${cityid }"/>
			<input type="hidden" id="imagePath" value="<%= imagePath %>"/>
			<div class="main-content">
					<div class="page-title">
					<div class="breadcrumb-env pull-left">
						<ol class="breadcrumb bc-1">
							<li>
								<a href="javascript:parent.refreshTab('首页','<%=path%>/console/HomePage.html')"><i class="fa-home"></i>首页</a>
							</li>
							<li class="active">
								<strong>业主精耕</strong>
							</li>
						</ol>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="table-responsive-1150">
						<div class="panel-body" style="padding-top:0px;">
							<table class="table xuanze" style=" min-width: 1050px;">
								<tbody>
									<tr>
										<td>
											<input type="hidden"  id="statussid" />
											<span><i class="fa-caret-right"></i> <a onclick="statussChoose('',this)"  class="active">全部</a></span>
											<a href="#" onclick="statussChoose('接触',this)" >接触</a>
											<a href="#"  onclick="statussChoose('委托',this)">委托</a>
											<a href="#"  onclick="statussChoose('了解需求',this)">了解需求</a>
											<a href="#"  onclick="statussChoose('客户带看',this)">客户带看</a>
											<a href="#"  onclick="statussChoose('合同洽谈',this)">合同洽谈</a>
										</td>
									</tr>
									<tr>
										<td>
											<span class="pull-left" style="line-height: 32px;"><i class="fa-caret-right"></i> 筛选</span>
											<div class="pull-left pright10">
												<select name="status" class="form-control" id="zhuangxiu"  onchange="queryData()">
													<option selected="" value="0">装修不限</option>
													<option value="不限">不限</option>
												</select>
											</div>
											<div class="pull-left pright10">
												<select name="status" class="form-control" id="biaoqian" onchange="queryData()">
													<option selected="" value="0">标签不限</option>
													<option value="1">钥匙</option>
													<option value="2">房堪</option>
													<option value="3">限时独家</option>
												</select>
											</div>
											<div class="pull-left pright10">
												<select name="status" class="form-control" id="panleixing" onchange="queryData()">
													<option selected="" value="0">盘类型不限</option>
													<c:choose>
														<c:when test="${cityid == 1 }"><option value="4">X</option></c:when>
														<c:otherwise><option value="1">A</option></c:otherwise>
													</c:choose>
													<option value="2">B</option>
													<option value="3">C</option>
												</select>
											</div>
											<div class="col-sm-4 col-md-3 col-lg-3" >
												<div class="form-group">
													<div class="input-group input-group-sm input-group-minimal">
														<span class="input-group-addon">
															店组：
														</span>
														<%-- 													<input id="userid" type="hidden" value="<%=userid%>"  name="condition.assign.assignPerson"/> --%>
															<select class="form-control s2example" id="dianzu" onchange="dianzuChoose(this.value)" >
															<option value="0">请选择接收店组</option>
															</select>
													</div>
												</div>
											</div>
											<div class="col-sm-4 col-md-3 col-lg-3">
												<div class="input-group input-group-sm input-group-minimal">
													<span class="input-group-addon">
														经纪人：
													</span>
													<select class="form-control s2example"  id="jingjiren"  onchange="queryData()">
															<option value="0">请选择接受经纪人</option>
													</select>
												</div>
											</div>
										</td>
										<td>
										<button type="button" class="btn btn-danger" data-dismiss="modal">参数说明</button>
										</td>
									</tr>
								</tbody>
							</table>
							
						</div>
					</div>
				</div>
				<div class="panel ">
					<div class="vertical-top xkys-box col-lg-12" style=" padding: 10px 0px;">
						<ul class="col-lg-8 pull-right">
							<li class=""  ><div class="btn btn-xs" >正常</div></li>
							<li class="" ><div class="btn btn-baojing btn-xs" >报警</div></li>
<!-- 							<li class="" ><div class="pull-left zaizu" ></div><div class="pull-left">在租</div></li> -->
<!-- 							<li class="" ><div class="pull-left zushou" ></div><div class="pull-left">租售</div></li> -->
<!-- 							<li class=""  ><div class="pull-left baozu" ></div><div class="pull-left">包租</div></li> -->
<!-- 							<li class=""  ><div class="pull-left ruzu"></div><div class="pull-left">如租</div></li> -->
<!-- 							<li class=""  ><div class="pull-left yizu"  ></div><div class="pull-left">已租</div></li> -->
<!-- 							<li class=""  ><div class="pull-left yishou"></div><div class="pull-left">已售</div></li> -->
<!-- 							<li class="" ><div class="pull-left daoqi" ></div><div class="pull-left">到期</div></li> -->
							<li class="text-right">精耕颜色说明：</li>
						</ul>		
						<div class="col-lg-4 col-md-4 pull-left" style="color: red;">当前楼盘：<span id="totalloupan"></span>,报警<span id="totalbaojing"></span>套，请对下列异常状态房子及时查看并跟进<span style="font-size: 20px"> ！！</span></div>
						<div style="clear:both;"></div>
					</div>
					<div class="col-md-12 height800" id="allnull">
								<div class="tabs-vertical-env tabs-vertical-bordered"><!-- add class "right-aligned" for the right aligned tabs -->
									<input type="hidden"  id = "lpid">
									<ul class="nav tabs-vertical" id="ullp">
<!-- 										<li><a href="#v4-messages" data-toggle="tab">楼盘003</a></li> -->
<!-- 										<li><a href="#v4-settings" data-toggle="tab">楼盘004</a></li> -->
									</ul>
									<div class="tab-content">
										<div class="tab-pane active" id="v4-home">
											<div class="row text-right" style="padding-bottom: 20px;">
												<div class="col-sm-4 col-md-4 col-lg-3 pull-right">
													<div class="input-group input-group-sm input-group-minimal">
														<span class="input-group-addon">
															单元：
														</span>
														<select class="form-control s2example" id="dy"  onchange="queryData()">
															<option value="">请选择</option>
														</select>
													</div>
												</div>
												<div class="col-sm-4 col-md-4 col-lg-3 pull-right">
													<div class="input-group input-group-sm input-group-minimal">
														<span class="input-group-addon">
															栋座：
														</span>
														<select class="form-control s2example"  id="dz" onchange="querySCDanyuan(this.value)">
															<option value="">请选择</option>
														</select>
													</div>
												</div>
											
											</div>
											<div class="mouren">
																<div id="scTable"></div>
																<div class="clearfix"></div>
											</div>
											<div class="gengduo" style="display: none;margin-top: 20px" >
													<div id="scTable2"></div>
																<div class="clearfix"></div>
											</div>
											<div class="col-lg-12 text-center gengduodianji" style="border-top: 1px #E1E2E2 solid; padding: 10px 0px;">
												查看更多
											</div>
										</div>
								</div>
									
								</div>	
							
							</div>
					<div style="clear: both;"></div>
				</div>
				<div class="panel">
					<div class="panel-heading">
						<h3 class="panel-title">精耕列表</h3>
					</div>
					<div class="panel-body">
						<div class="table-responsive-1950">
							<table class="table table-bordered table-striped">
								<thead>
									<tr>
										<th class="col-cb middle-align text-center hanhuan" width="50">
											<input type="checkbox" class="cbr" />
										</th>
										<th colspan="2" width="40%" class="text-center hanhuan">房屋基本信息</th>
										<th class="text-center hanhuan" width="13%">责任人</th>
										<th class="text-center hanhuan"  width="20%">精耕</th>
										<th class="text-center hanhuan"  width="10%">精耕状态</th>
										<th class="text-center hanhuan"  width="17%">操作</th>
									</tr>
								</thead>
								<tbody  id="tbodyid">
								</tbody>
							</table>
							<div id="macPageWidget"></div>
						</div>
					</div>
				</div>
				<!-- Main Footer -->
			</div>

		</div>

		<div class="go-up" style="position: fixed;right: 15px; bottom: 10px; z-index: 9999; background: #f7aa47;padding: 10px;filter:alpha(opacity=50);moz-opacity:0.5;opacity:0.5;">
			<a href="#" rel="go-top">
				<i class="fa-arrow-up" style="font-size: 3em;"></i>
			</a>
		</div>
	</body>

</html>

<!-- Bottom Scripts -->
<script src="<%=basePath%>/assets/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/assets/js/TweenMax.min.js"></script>
<script src="<%=basePath%>/assets/js/resizeable.js"></script>
<script src="<%=basePath%>/assets/js/joinable.js"></script>
<script src="<%=basePath%>/assets/js/xenon-api.js"></script>
<script src="<%=basePath%>/assets/js/xenon-toggles.js"></script>
<script src="<%=basePath%>/assets/js/moment.min.js"></script>

<!-- Imported scripts on this page -->

<!-- Imported scripts on this page  xiala-->
<script src="<%=basePath%>/assets/js/xenon-custom.js"></script>

	<script type="text/javascript">
		
		var basepath = '<%=basePath%>';
		var userid = $("#userid").val();
		var departmentid = $("#departmentid").val();
		var cityid = $("#cityid").val();
// 		document.writeln(basepath+"/"+userid+"/"+cityid+"/");
// 		alert(basepath+"/"+userid+"/"+cityid+"/");
		</script>

<script type="text/javascript">
	// Sample Javascript code for this page
	jQuery(document).ready(function($) {
		// Edit Modal
		$('.gallery-env a[data-action="edit"]').on('click', function(ev) {
			ev.preventDefault();
			$("#gallery-image-modal").modal('show');
		});
		// Delete Modal
		$('.gallery-env a[data-action="trash"]').on('click', function(ev) {
			ev.preventDefault();
			$("#gallery-image-delete-modal").modal('show');
		});
		// Sortable
		$('.gallery-env a[data-action="sort"]').on('click', function(ev) {
			ev.preventDefault();
			var is_sortable = $(".album-images").sortable('instance');
			if (!is_sortable) {
				$(".gallery-env .album-images").sortable({
					items: '> div'
				});
				$(".album-sorting-info").stop().slideDown(300);
			} else {
				$(".album-images").sortable('destroy');
				$(".album-sorting-info").stop().slideUp(300);
			}
		});
	});
</script>


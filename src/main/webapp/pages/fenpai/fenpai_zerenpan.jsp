<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ include file="common.jsp" %>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta name="description" content="Xenon Boostrap Admin Panel" />
		<meta name="author" content="" />
		<title>BMS首页</title>
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
		<script src="<%=basePath%>/assets/js/pagination/pagination.js"></script>
		<script src="<%=basePath%>/assets/js/common/common.js"></script>
		<script src="<%=basePath%>/assets/js/assignResponsiblePerson/assignResponsiblePerson.js"></script>
		
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
		<style>
			.nav.nav-tabs + .tab-content{ margin-bottom: 0px;}
			#building-ul li:hover{background-color:#888;color:#fff;}
			#select-building-ul li:hover{background-color:#888;color:#fff;}
			#building-ul-1 li:hover{background-color:#888;color:#fff;}
			#select-building-ul-1 li:hover{background-color:#888;color:#fff;}
			html .select2-container .select2-choice .select2-chosen{
				text-overflow:ellipsis ;
				width:100%;
			}
		</style>
	</head>

	<body class="page-body">
		<div class="page-container">
			<div class="main-content">
			<div class="page-title">
					<div class="breadcrumb-env pull-left">
						<ol class="breadcrumb bc-1">
							<li>
								<a href="../首页.html"><i class="fa-home"></i>首页</a>
							</li>
							<li>
								<a href="#">分派</a>
							</li>
							<li class="active">
								<strong>分派（责任盘）</strong>
							</li>
						</ol>
					</div>
				</div>
				<div class="panel">
					<div class="well" style="padding: 6px;  margin: 0px;" id="headMessage">
					
					</div>
				</div>
				<ul class="nav nav-tabs">
					<li class="active">
						<a href="#tab-01" data-toggle="tab" onclick="queryResponsiblePersonForList(1,1);">
							按人分派
						</a>
					</li>
					<li>
						<a href="#tab-02" data-toggle="tab" onclick="queryBuildingForListByPage(1,1);">
							按盘分派
						</a>
					</li>
					<li>
						<a href="#tab-03" data-toggle="tab" onclick="queryOperationRecordByPage(1,1);">
							操作记录
						</a>
					</li>
				</ul>
				<div class="panel">
					<div class="tab-content">
						<div class="tab-pane active" id="tab-01">
							<div class="table-responsive-1150">
								<div class="row" style="display: ; padding-top: 15px;">
									<div class="col-sm-12">
										<div class="col-sm-4 col-md-4 col-lg-3">
											<div class="form-group">
												<div class="input-group input-group-sm input-group-minimal">
													<span class="input-group-addon">
														姓名：
													</span>
													<input class="form-control" type="text" id="viceManagerSelect_1" >
												</div>
											</div>
										</div>
										<div class="col-sm-4 col-md-2 col-lg-1" style="height: 60px;">
										<label >
											<input type="checkbox" id="alreadyAssigned">
											只显示已指派
										</label>
									</div>
									<div class="col-sm-4 col-md-4 col-lg-2">
										<div class="form-group">
											<button class="btn btn-secondary" onclick="queryResponsiblePersonForList(1,0);">查询</button>
											<button class="btn btn-secondary" onclick="openModal();">分派</button>
										</div>
									</div>
									</div>
									
								</div>
							</div>
							<div class="panel" >
								<div class="table-responsive">
									<table class="table table-bordered table-striped">
										<thead>
											<tr>
												<th class="text-center">序号</th>
												<th class="text-center">姓名（岗位）</th>
												<th class="text-center">已分派/总小区数</th>
												<th class="text-center">操作</th>
												<th class="text-center">操作时间</th>
											</tr>
										</thead>
										<tbody id="responsiblePersonList">
										
										</tbody>
									</table>
								</div>
								<div class="pagination pull-right" id="responsiblePersonListPag">
								</div>
								<div style="clear: both;"></div>
							</div>
						</div>
						<div class="tab-pane" id="tab-02">
							<div class="table-responsive-1150">
								<div class="row" style="display: ; padding-top: 15px;">
									<div class="col-sm-4 col-md-4 col-lg-3">
										<div class="form-group">
											<div class="input-group input-group-sm input-group-minimal">
												<span class="input-group-addon">
													区域：
												</span>
												<select class="form-control s2example heiht37" id="stressSelect" onchange="queryShangQuanForList('');">
												
												</select>
											</div>
										</div>
									</div>
									<div class="col-sm-4 col-md-4 col-lg-3">
										<div class="form-group">
											<div class="input-group input-group-sm input-group-minimal">
												<span class="input-group-addon">
													商圈：
												</span>
												<select class="form-control s2example heiht37" id="shangQuanSelect-1" onchange="queryBuildingForList('shangQuanSelect-1')">
												
												</select>
											</div>
										</div>
									</div>
									<div class="col-sm-4 col-md-4 col-lg-3">
										<div class="form-group">
											<div class="input-group input-group-sm input-group-minimal">
												<span class="input-group-addon">
													楼盘：
												</span>
												<select class="form-control s2example heiht37" id="buildingSelect-2">
												
												</select>
											</div>
										</div>
									</div>
									<div class="col-sm-4 col-md-4 col-lg-3">
										<div class="form-group">
											<button class="btn btn-secondary" onclick="queryBuildingForListByPage(1,0);">查询</button>
											<button class="btn btn-secondary" onclick="openModal1();">分派</button>
										</div>
									</div>
								</div>
							</div>
							<div class="panel">
								<div class="table-responsive">
									<table class="table table-bordered table-striped">
										<thead>
											<tr>
												<th class="text-center">序号</th>
												<th class="text-center">区域</th>
												<th class="text-center">商圈</th>
												<th class="text-center">楼盘</th>
												<th class="text-center">责任人</th>
												<th class="text-center">操作</th>
												<th class="text-center">操作时间</th>
											</tr>
										</thead>
										<tbody id="queryBuildingForList">
											
										</tbody>
									</table>
								</div>
								<div class="pagination pull-right" id="queryBuildingForListPag">
								</div>
								<div style="clear: both;"></div>
							</div>
						</div>
						<div class="tab-pane" id="tab-03">
							<div class="panel">
								<div class="table-responsive">
									<table class="table table-bordered table-striped">
										<thead>
											<tr>
												<th class="text-center">序号</th>
												<th class="text-center">操作人</th>
												<th class="text-center">所在部门</th>
												<th class="text-center">电话</th>
												<th class="text-center">操作记录</th>
												<th class="text-center">操作时间</th>
											</tr>
										</thead>
										<tbody id="operationRecordList">
											
										</tbody>
									</table>
								</div>
								<div class="pagination pull-right" id="operationRecordListPage">
								
								</div>
								<div style="clear: both;"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- Main Footer -->
			</div>
		</div>
		<div class="go-up" style="position: fixed;right: 15px; bottom: 10px; z-index: 9999;">
			<a href="#" rel="go-top" style="font-size: 24px;">
				<i class="fa-angle-up"></i>
			</a>
		</div>
	</body>
	<div class="modal fade in" id="modal-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true" >×</button>
					<h4 class="modal-title">分派/修改</h4>
				</div>
				<div class="modal-body">
					<div class="col-lg-5 col-md-5">
						<div class="row" style=" padding-top: 15px;">
							<div class="col-lg-12">
								<div class="form-group">
									<div class="input-group input-group-sm input-group-minimal">
										<span class="input-group-addon">
											区域：
										</span>
										<!-- <input type="hidden" id="quYuSelect"/> -->
										<select class="form-control s2example" id="quYuSelect">
										</select>
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<div class="input-group input-group-sm input-group-minimal">
										<span class="input-group-addon">
											商圈：
										</span>
										<select class="form-control " id="shangQuanSelect" onChange="queryBuildingForList('shangQuanSelect')">
										</select>
									</div>
								</div>
							</div>
							<div class="col-lg-12 mt10" id="buildingNumTips" style="margin-top:30px">
								共搜索到0个楼盘
							</div>
							<div class="col-lg-12 mt10">
								<div class="ms-selectable">
									<ul class="ms-list ps-container ps-active-y" tabindex="-1" id="building-ul" style="height:200px;overflow:auto">
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2" style="text-align: center;">
						<img src="<%=basePath%>/assets/images/choose (1).png"  class="jiantou_xuanze">
						<div style="clear: both;"></div>
					</div>
					<div class="col-lg-5 col-md-5">
						<div class="col-lg-12 mt10 line32" id="selectBuildingNum">
							确定分派0个楼盘给责任人
						</div>
						<div class="col-lg-12 mt10">
							<div class="form-group">
								<div class="input-group input-group-sm input-group-minimal">
									<span class="input-group-addon">
										城市：
									</span>
									<!-- <select class="form-control " id="citySelect" onChange="queryLevelPersonForList('viceManagerSelect','citySelect')">
									</select> -->
									<span class="input-group-addon" id="citySelect">
									</span>
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<div class="input-group input-group-sm input-group-minimal">
									<span class="input-group-addon">
										责任人：
									</span>
									<!-- <select class="form-control " id="viceManagerSelect">
									</select> -->
									<input type="hidden" id="viceManagerSelect"/>
								</div>
							</div>
						</div>
						<div class="col-lg-12 mt10"  style="padding-top: 10px;">
							<div class="ms-selectable">
								<ul class="ms-list ps-container ps-active-y" tabindex="-1" id="select-building-ul" style="height:200px;overflow:auto">
								</ul>
							</div>
						</div>
					</div>
					<div style="clear: both;"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" onclick="assignResponsiblePerson();">分派</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade in" id="modal-2">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title">分派/修改</h4>
				</div>
				<div class="modal-body">
					<div class="col-lg-5 col-md-5">
						<div class="row" style=" padding-top: 15px;">
							<div class="col-lg-12 mt10">
							<div class="form-group">
								<div class="input-group input-group-sm input-group-minimal">
									<span class="input-group-addon">
										城市：
									</span>
									<!-- <select class="form-control " id="citySelect-1" onChange="queryLevelPersonForList('viceManagerSelect-2','citySelect-1')">
									</select> -->
									<span class="input-group-addon" id="citySelect-1">
									</span>
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<div class="input-group input-group-sm input-group-minimal">
									<span class="input-group-addon">
										责任人：
									</span>
									<!-- <select class="form-control " id="viceManagerSelect-2">
									</select> -->
									<input type="hidden" id="viceManagerSelect-2"/>
								</div>
							</div>
						</div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2" style="text-align: center;">
						<div style="clear: both;"></div>
					</div>
					<div class="row" style=" padding-top: 25px;">
						<div class="col-lg-5 col-md-5">
							<div class="col-lg-12">
									<div class="form-group">
										<div class="input-group input-group-sm input-group-minimal">
											<span class="input-group-addon">
											区域：
											</span>
										<!-- <input type="hidden" id="quYuSelect"/> -->
											<select class="form-control s2example" id="quYuSelect-1" >
											</select>
										</div>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="form-group">
										<div class="input-group input-group-sm input-group-minimal">
											<span class="input-group-addon">
											商圈：
											</span>
											<select class="form-control " id="shangQuanSelect-2" onChange="queryBuildingForList('shangQuanSelect-2')">
											</select>
										</div>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="form-group">
										<div class="input-group input-group-sm input-group-minimal">
											<span class="input-group-addon">
											楼盘：
											</span>
											<select class="form-control " id="buildingSelect-1" >
											</select>
										</div>
									</div>
								</div>
						</div>
						<div style="clear: both;"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-info" onclick="assignResponsiblePerson1();">分派</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade in" id="modal-4">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title">分派/修改</h4>
				</div>
				<div class="modal-body">
					<div class="col-lg-5 col-md-5">
						<div class="row" style=" padding-top: 15px;">
							<div class="col-lg-12 mt10">
							<div class="form-group">
								<div class="input-group input-group-sm input-group-minimal">
									<span class="input-group-addon">
										城市：
									</span>
									<!-- <select class="form-control " id="citySelect-2" onChange="queryLevelPersonForList('viceManagerSelect-3','citySelect-2')">
									</select> -->
									<span class="input-group-addon" id="citySelect-2">
									</span>
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<div class="input-group input-group-sm input-group-minimal">
									<span class="input-group-addon">
										责任人：
									</span>
									<!-- <select class="form-control " id="viceManagerSelect-3">
									</select> -->
									<input type="hidden" id="viceManagerSelect-3"/>
								</div>
							</div>
						</div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2" style="text-align: center;">
						<div style="clear: both;"></div>
					</div>
					<div class="row" style=" padding-top: 25px;">
						<div class="col-lg-5 col-md-5">
							<div class="col-lg-12">
									<div class="form-group">
										<div class="input-group input-group-sm input-group-minimal">
											<span class="input-group-addon">
											区域：
											</span>
											<span class="input-group-addon" id="qyName">
											</span>
										</div>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="form-group">
										<div class="input-group input-group-sm input-group-minimal">
											<span class="input-group-addon">
											商圈：
											</span>
											<span class="input-group-addon" id="sqName">
											</span>
										</div>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="form-group">
										<div class="input-group input-group-sm input-group-minimal">
											<span class="input-group-addon">
											楼盘：
											</span>
											<span class="input-group-addon" id="lpName">
											</span>
										</div>
									</div>
								</div>
						</div>
						<div style="clear: both;"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-info" onclick="assignUpdateResponsiblePerson1();">分派</button>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" id="lpId"/>
	</div>
	<div class="modal fade in" id="modal-3">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true" >×</button>
					<h4 class="modal-title">分派/修改</h4>
				</div>
				<div class="modal-body">
					<div class="col-lg-5 col-md-5">
						<div class="row" style=" padding-top: 15px;">
							<div class="col-lg-12">
								<div class="form-group">
									<div class="input-group input-group-sm input-group-minimal">
										<span class="input-group-addon">
											区域：
										</span>
										<!-- <input type="hidden" id="quYuSelect"/> -->
										<select class="form-control s2example" id="quYuSelect-2">
										</select>
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<div class="input-group input-group-sm input-group-minimal">
										<span class="input-group-addon">
											商圈：
										</span>
										<select class="form-control " id="shangQuanSelect-3" onChange="queryBuildingForList('shangQuanSelect-3')">
										</select>
									</div>
								</div>
							</div>
							<div class="col-lg-12 mt10" id="buildingNumTips-1" style="margin-top:30px">
								共搜索到0个楼盘
							</div>
							<div class="col-lg-12 mt10">
								<div class="ms-selectable">
									<ul class="ms-list ps-container ps-active-y" tabindex="-1" id="building-ul-1" style="height:200px;overflow:auto">
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2" style="text-align: center;">
						<img src="<%=basePath%>/assets/images/choose (1).png"  class="jiantou_xuanze">
						<div style="clear: both;"></div>
					</div>
					<div class="col-lg-5 col-md-5">
						<div class="col-lg-12 mt10 line32" id="selectBuildingNum-1">
							确定分派0个楼盘给责任人
						</div>
						<div class="col-lg-12 mt10">
							<div class="form-group">
								<div class="input-group input-group-sm input-group-minimal">
									<span class="input-group-addon">
										城市：
									</span>
									<span class="input-group-addon" id="cityName">
									</span>
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<div class="input-group input-group-sm input-group-minimal">
									<span class="input-group-addon">
										责任人：
									</span>
									<span class="input-group-addon" id="pName">
									</span>
								</div>
							</div>
						</div>
						<div class="col-lg-12 mt10"  style="padding-top: 10px;">
							<div class="ms-selectable">
								<ul class="ms-list ps-container ps-active-y" tabindex="-1" id="select-building-ul-1" style="height:200px;overflow:auto">
								</ul>
							</div>
						</div>
					</div>
					<div style="clear: both;"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" onclick="assignUpdateResponsiblePerson();">分派</button>
				</div>
			</div>
		</div>
		<input type="hidden" id="cityId"/>
		<input type="hidden" id="pId"/>
		<input type="hidden" id="loginUserCityId"/>
		<input type="hidden" id="prefId"/>
	</div>
	<div class="modal fade in" id="modal-5">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true" >×</button>
					<h4 class="modal-title">参数配置</h4>
				</div>
				<div class="modal-body">
					<div class="input-group input-group-sm input-group-minimal">
						<span class="input-group-addon">
							责任人负责楼盘数上限：
						</span>
						<input class="form-control" type="text" id="setParameter" >
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" onclick="setParameter();">确定</button>
				</div>
			</div>
		</div>
	</div>
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
<script src="<%=basePath%>/assets/js/devexpress-web-14.1/js/globalize.min.js"></script>
<script src="<%=basePath%>/assets/js/devexpress-web-14.1/js/dx.chartjs.js"></script>

<!-- Imported scripts on this page  xiala-->
<link rel="stylesheet" href="<%=basePath%>/assets/js/daterangepicker/daterangepicker-bs3.css">
<link rel="stylesheet" href="<%=basePath%>/assets/js/select2/select2.css">
<link rel="stylesheet" href="<%=basePath%>/assets/js/select2/select2-bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>/assets/js/multiselect/css/multi-select.css">
<script src="<%=basePath%>/assets/js/rwd-table/js/rwd-table.js"></script>
<script src="<%=basePath%>/assets/js/daterangepicker/daterangepicker.js"></script>
<script src="<%=basePath%>/assets/js/datepicker/bootstrap-datepicker.js"></script>
<script src="<%=basePath%>/assets/js/timepicker/bootstrap-timepicker.min.js"></script>
<script src="<%=basePath%>/assets/js/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="<%=basePath%>/assets/js/select2/select2.min.js"></script>
<script src="<%=basePath%>/assets/js/select2/select2_locale_zh-CN.js"></script>
<script src="<%=basePath%>/assets/js/xenon-custom.js"></script>

<link rel="stylesheet" href="<%=basePath%>/assets/js/datepicker/bootstrap-datetimepicker.min.css">
<!-- Imported scripts on this page  xiala-->
<script type="text/javascript" src="<%=basePath%>/assets/js/datepicker/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath%>/assets/js/datepicker/bootstrap-datetimepicker.zh-CN.js"></script>
<!-- JavaScripts initializations and stuff -->
<script src="<%=basePath%>/assets/js/xenon-custom.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#prefId").val("<%=prefId%>");
		$("#loginUserCityId").val("<%=cityId%>");
		queryResponsiblePersonForList(1,0);
		queryHeadMessage();
		
	});
</script>

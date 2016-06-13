<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() + "/communityFocus";
%>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta name="description" content="Xenon Boostrap Admin Panel" />
		<meta name="author" content="" />
		<title>楼盘精耕分派</title>
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
		<script src="<%=basePath%>/assets/js/jquery-1.11.1.min.js"></script>
		<script src="<%=basePath%>/js/page.js"></script>

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
		<style>
			.nav.nav-tabs + .tab-content{ margin-bottom: 0px;}
		</style>
	</head>

	<body class="page-body">
		<div class="page-container">
<!-- 			<div class="sidebar-menu toggle-others fixed"> -->
<%-- 				<jsp:include page="../include/left.jsp"/> --%>
<!-- 			</div> -->
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
								<strong>分派（主营盘）</strong>
							</li>
						</ol>
					</div>
				</div>
				<div class="panel" id="panel_id">
					<div class="well" style="padding: 6px;  margin: 0px;" id="headMessage">
<%-- 						<p>当前管辖共${stat.m_mdSum}个门店，其中${stat.m_notAssignMdSum}个门店没有指派楼盘</p> --%>
<%-- 						<p>当前管辖共${stat.m_lpSum}个楼盘，其中${stat.m_notAssignLpSum} 个楼盘未指派</p> --%>
<!-- 						<button class="btn btn-secondary" onclick="jQuery('#modal-3').modal('show', {backdrop: 'fade'});">参数配置</button> -->
					</div>
				</div>
				<ul class="nav nav-tabs">
						<li class="active">
							<a href="#tab-01" data-toggle="tab" id="andianJump">
								按店分派
							</a>
						</li>
						<li>
							<a href="#tab-02" data-toggle="tab" id="anpanJump">
								按盘分派
							</a>
						</li>
						<li>
							<a href="#tab-03" data-toggle="tab" id="operJump">
								操作记录
							</a>
						</li>
					</ul>
				<div class="panel">
					<div class="tab-content">
						<div class="tab-pane active" id="tab-01">
							<div class="table-responsive-1150">
								<div class="row" style="display: ; padding-top: 15px;">
									<div class="col-sm-4 col-md-4 col-lg-3">
										<div class="form-group">
											<div class="input-group input-group-sm input-group-minimal">
												<span class="input-group-addon">
													总监区：
												</span>
												<select class="form-control s2example" id="zjqid1" onclick="selectMd(2,this.value)">
													<option value ="0">全部</option>
													<c:forEach items="${jl}" var="myList" varStatus="list1">  
															<option value ="${myList.id}">${myList.department_name}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="col-sm-4 col-md-4 col-lg-3">
										<div class="form-group">
											<div class="input-group input-group-sm input-group-minimal">
												<span class="input-group-addon heiht37">
													门店：
												</span>
												<select class="form-control heiht37"  id="ad-md">
													<option value ="0">全部</option>
												</select>
											</div>
										</div>
									</div>
									<div class="col-sm-4 col-md-4 col-lg-3">
										<div class="form-group">
											<button class="btn btn-secondary" onclick="query1()">查询</button>
											<button class="btn btn-secondary" onclick="jQuery('#modal-1').modal('show', {backdrop: 'fade'});">分派</button>
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
												<th class="text-center">总监区</th>
												<th class="text-center">门店</th>
												<th class="text-center">已分派/总小区数</th>
												<th class="text-center">操作</th>
												<th class="text-center">操作时间</th>
											</tr>
										</thead>
										<tbody id="queryDiv">
										</tbody>
									</table>
								</div>
								<div class="pagination pull-right" id="macPageWidget">
								</div>
								<div class="clearfix"></div>
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
												<select class="form-control s2example" id="qy-pan-list"  onclick="selectSq(3,this.value)">
													<option value ="0">全部</option>
													<c:forEach items="${qylist}" var="myList" varStatus="list1">  
														<option value ="${myList.id}">${myList.qy_name}</option>
													</c:forEach>
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
												<select class="form-control s2example" id="sq-pan-list" onclick="selectLp(3,this.value);">
													<option value ="0">全部</option>
													<c:forEach items="${sqlist}" var="myList" varStatus="list1">  
														<option value ="${myList.id}">${myList.sq_name}</option>
													</c:forEach>
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
												<select class="form-control s2example" id="lp-pan-list" >
													<option value ="0">全部</option>
													<c:forEach items="${lplist}" var="myList" varStatus="list1">  
														<option value ="${myList.id}">${myList.lpname}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="col-sm-4 col-md-4 col-lg-3">
										<div class="form-group">
											<button class="btn btn-secondary" onclick="query2()">查询</button>
											<button class="btn btn-secondary" onclick="jQuery('#modal-2').modal('show', {backdrop: 'fade'});">分派</button>
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
												<th class="text-center">已分店数/总店数</th>
												<th class="text-center">操作</th>
												<th class="text-center">操作时间</th>
											</tr>
										</thead>
										<tbody id="queryDiv2">
										</tbody>
									</table>
								</div>
								<div class="pagination pull-right" id="macPageWidget2">
								</div>
								<div class="clearfix"></div>
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
<!-- 												<th class="text-center">电话</th> -->
												<th class="text-center">操作记录</th>
<!-- 												<th class="text-center">操作</th> -->
												<th class="text-center">操作时间</th>
											</tr>
										</thead>
										<tbody id="logbody">
										</tbody>
									</table>
								</div>
								<div class="pagination pull-right" id="macPageWidget3">
								</div>
								<div class="clearfix"></div>
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
<div class="modal fade in" id="modal-4">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title">分派/修改</h4>
				</div>
				<div class="modal-body">
					<div class="col-lg-5">
						<div class="row" style=" padding-top: 15px;">
							<div class="col-lg-12">
								<div class="form-group">
									<div class="input-group input-group-sm input-group-minimal">
										<span class="input-group-addon">
											区域：
										</span>
										<select class="form-control s2example" id="mod4-quyu" onclick="selectSq('mod4-sq',this.value)">
											<option value ="0">请选择区域</option>
											<c:forEach items="${qylist}" var="myList" varStatus="list1">  
													<option value ="${myList.id}">${myList.qy_name}</option>
											</c:forEach>	
										</select>
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<div class="input-group input-group-sm input-group-minimal">
										<span class="input-group-addon" >
											商圈：
										</span>
										<select class="form-control " id="mod4-sq"  onclick="selectLp('mod4-lp',this.value);">
											<option value ="0">请选择商圈</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-lg-12 mt10">
<!-- 								共搜索552个资源 -->
							</div>
							<div class="col-lg-12 mt10">
								<div class="ms-selectable">
									<ul class="ms-list ps-container ps-active-y" tabindex="-1" id="mod4-lp">
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-2" style="text-align: center;">
						<img src="<%=basePath%>/assets/images/choose (1).png"  class="jiantou_xuanze">
						<div style="clear: both;"></div>
					</div>
					<div class="col-lg-5">
						<div class="col-lg-12 mt10 line32">
<!-- 							确定分派N条资源给以下店 -->
						</div>
						<div class="col-lg-12 mt10">
							<div class="form-group">
								<div class="input-group input-group-sm input-group-minimal" id="mod4-zjq">
									<span class="input-group-addon">
										总监区：
									</span>
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<div class="input-group input-group-sm input-group-minimal" id="mod4-md">
									<span class="input-group-addon">
										门店：
									</span>
								</div>
							</div>
						</div>
						<div class="col-lg-12 mt10"  style="padding-top: 30px;">
							<div class="ms-selectable">
								<ul class="ms-list ps-container ps-active-y" tabindex="-1" id="assign-mod4-lp">
<!-- 									<li class="ms-elem-selectable" ><span>Silky Door</span></li> -->
								</ul>
							</div>
						</div>
					</div>
					<div style="clear: both;"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" onclick="fenpai(3)">分派</button>
				</div>
			</div>
		</div>
	</div>
<div class="modal fade in" id="modal-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title">分派/修改</h4>
				</div>
				<div class="modal-body">
					<div class="col-lg-5">
						<div class="row" style=" padding-top: 15px;">
							<div class="col-lg-12">
								<div class="form-group">
									<div class="input-group input-group-sm input-group-minimal">
										<span class="input-group-addon">
											区域：
										</span>
										<select class="form-control s2example" id="quyu1" onclick="selectSq(1,this.value)">
											<option value ="0">请选择区域</option>
											<c:forEach items="${qylist}" var="myList" varStatus="list1">  
													<option value ="${myList.id}">${myList.qy_name}</option>
											</c:forEach>	
										</select>
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<div class="input-group input-group-sm input-group-minimal">
										<span class="input-group-addon" >
											商圈：
										</span>
										<select class="form-control " id="sq1" onclick="selectLp(1,this.value);">
											<option value ="0">请选择商圈</option>
<%-- 											<c:forEach items="${sqlist}" var="myList" varStatus="list1">   --%>
<%-- 															<option value ="${myList.id}">${myList.sq_name}</option> --%>
<%-- 											</c:forEach>	 --%>
										</select>
									</div>
								</div>
							</div>
							<div class="col-lg-12 mt10">
<!-- 								共搜索552个资源 -->
							</div>
							<div class="col-lg-12 mt10">
								<div class="ms-selectable">
									<ul class="ms-list ps-container ps-active-y" tabindex="-1" id="loupan1" style="height:200px;overflow:auto" data-max-height="390">
<!-- 										<li class="ms-elem-selectable" ><span>andian Silky Door</span></li> -->
<!-- <li class="ms-elem-selectable" id="51" onclick="assginLp(1,'',51)"><span>佳乐公寓</span></li> -->
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-2" style="text-align: center;">
						<img src="<%=basePath%>/assets/images/choose (1).png"  class="jiantou_xuanze">
						<div style="clear: both;"></div>
					</div>
					<div class="col-lg-5">
						<div class="col-lg-12 mt10 line32">
<!-- 							确定分派N条资源给以下店 -->
						</div>
						<div class="col-lg-12 mt10">
							<div class="form-group">
								<div class="input-group input-group-sm input-group-minimal">
									<span class="input-group-addon">
										总监区：
									</span>
									<select class="form-control " id="lp1" onclick="selectMd(1, this.value);">
											<option value ="0">请选择总监区</option>
											<c:forEach items="${jl}" var="myList" varStatus="list1">  
													<option value ="${myList.id}">${myList.department_name}</option>
											</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<div class="input-group input-group-sm input-group-minimal">
									<span class="input-group-addon">
										门店：
									</span>
									<select class="form-control "   id="mendian1">
											<option value ="0">请选择门店</option>
<%-- 										<c:forEach items="${md}" var="myList" varStatus="list1">  --%>
<%-- 															<option value ="${myList.deptid}">${myList.department_name}</option> --%>
<%-- 										</c:forEach> --%>
									</select>
								</div>
							</div>
						</div>
						<div class="col-lg-12 mt10"  style="padding-top: 30px;">
							<div class="ms-selectable">
								<ul class="ms-list ps-container ps-active-y" tabindex="-1" id="assign-lp">
<!-- 									<li class="ms-elem-selectable" ><span>Silky Door</span></li> -->
								</ul>
							</div>
						</div>
					</div>
					<div style="clear: both;"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" onclick="fenpai(1)">分派</button>
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
					<div class="col-lg-5">
						<div class="col-lg-12 mt10 line32">
							确定分派以下店管理该楼盘
						</div>
						<div class="col-lg-12 mt10">
							<div class="form-group">
								<div class="input-group input-group-sm input-group-minimal">
									<span class="input-group-addon">
										总监区：
									</span>
									<select class="form-control " onclick="selectMd(3,this.value);">
										<option value="0">请选择总监区</option>
										<c:forEach items="${jl}" var="myList" varStatus="list1">  
												<option value ="${myList.id}">${myList.department_name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
<!-- 								<div class="input-group input-group-sm input-group-minimal"> -->
<!-- 									<span class="input-group-addon"> -->
<!-- 										店组： -->
<!-- 									</span> -->
<!-- 									<select class="form-control "> -->
<%-- 										<c:forEach items="${md}" var="myList" varStatus="list1">  --%>
<%-- 															<option value ="${myList.id}">${myList.department_name}</option> --%>
<%-- 										</c:forEach> --%>
<!-- 									</select> -->
<!-- 								</div> -->
							</div>
						</div>
						<div class="col-lg-12 mt10"  style="padding-top: 30px;">
							<div class="ms-selectable">
								<ul class="ms-list ps-container ps-active-y" tabindex="-1" id="mendian2" style="height:200px;overflow:auto" data-max-height="320">
<!-- 									<li class="ms-elem-selectable" ><span>Tales of Flames --mendian2</span></li> -->
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-2" style="text-align: center;">
						<img src="<%=basePath%>/assets/images/choose (1).png"  class="jiantou_xuanze">
						<div style="clear: both;"></div>
					</div>
					<div class="col-lg-5">
						<div class="row" style=" padding-top: 15px;">
							<div class="col-lg-12">
								<div class="form-group">
									<div class="input-group input-group-sm input-group-minimal">
										<span class="input-group-addon">
											区域：
										</span>
										<select class="form-control s2example" id="quyu2" onclick="selectSq(2,this.value)">
											<c:forEach items="${qylist}" var="myList" varStatus="list1">  
													<option value ="${myList.id}">${myList.qy_name}</option>
											</c:forEach>	
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
										<select class="form-control " id="sq2" onclick="selectLp(2,this.value);">>
<%-- 											<c:forEach items="${sqlist}" var="myList" varStatus="list1">   --%>
<%-- 													<option value ="${myList.id}">${myList.qy_name}</option> --%>
<%-- 											</c:forEach>	 --%>
										</select>
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<div class="input-group input-group-sm input-group-minimal" >
										<span class="input-group-addon">
											楼盘：
										</span>
										<select class="form-control " id="lp2" >
<%-- 											<c:forEach items="${lplist}" var="myList" varStatus="list1">   --%>
<%-- 													<option value ="${myList.id}">${myList.qy_name}</option> --%>
<%-- 											</c:forEach>	 --%>
										</select>
									</div>
								</div>
							</div>
							<div class="col-lg-12 mt10">
<!-- 								共搜索55个资源 -->
							</div>
							<div class="col-lg-12 mt10">
								<div class="ms-selectable">
									<ul class="ms-list ps-container ps-active-y" tabindex="-1" id="assign-md2">
<!-- 										<li class="ms-elem-selectable" ><span>The Absent Twilight</span></li> -->
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div style="clear: both;"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" onclick="fenpai(2)">分派</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade in" id="modal-3">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title">决策参数配置</h4>
				</div>
				<div class="modal-body">
					<div class="col-lg-5 col-md-5">
					
					</div>
					<div class="col-lg-2 col-md-2" style="text-align: center;">
						<img src="<%=basePath%>/assets/images/choose (1).png"  class="jiantou_xuanze">
						<div style="clear: both;"></div>
					</div>
					<div class="col-lg-5 col-md-5">
						<div class="row" style=" padding-top: 15px;">
							
						</div>
					</div>
					<div style="clear: both;"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" onclick="fenpai(2)">分派</button>
				</div>
			</div>
		</div>
	</div>
</html>

<div class="modal fade in" id="modal-5">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title">分派/修改</h4>
				</div>
				<div class="modal-body">
					<div class="col-lg-5">
						<div class="col-lg-12 mt10 line32">
							确定分派以下店管理该楼盘
						</div>
						<div class="col-lg-12 mt10">
							<div class="form-group">
								<div class="input-group input-group-sm input-group-minimal" id="mod5-zjq" >
									<span class="input-group-addon">
										总监区：
									</span>
									<select class="form-control " onclick="selectMd('mod5',this.value);">
										<option value="0">请选择总监区</option>
										<c:forEach items="${jl}" var="myList" varStatus="list1">  
												<option value ="${myList.id}">${myList.department_name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<div class="input-group input-group-sm input-group-minimal" >
<!-- 									<span class="input-group-addon"> -->
<!-- 										店组： -->
<!-- 									</span> -->
<!-- 									<select class="form-control " > -->
<!-- 										<option value="0">请选择店组</option> -->
<!-- 									</select> -->
									<ul class="ms-list ps-container ps-active-y" tabindex="-1" id="mod5-">
<!-- 									<li class="ms-elem-selectable" id="3" onclick="assignMd(3,'测试一店',3)"><span>测试一店</span></li> -->
									</ul>
								</div>
							</div>
						</div>
						<div class="col-lg-12 mt10"  style="padding-top: 30px;">
							<div class="ms-selectable">
								<ul class="ms-list ps-container ps-active-y" tabindex="-1" id="mod5-dz" style="height:200px;overflow:auto" data-max-height="390">
<!-- 									<li class="ms-elem-selectable" ><span>Tales of Flames --mendian2</span></li> -->
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-2" style="text-align: center;">
						<img src="<%=basePath%>/assets/images/choose (1).png"  class="jiantou_xuanze">
						<div style="clear: both;"></div>
					</div>
					<div class="col-lg-5">
						<div class="row" style=" padding-top: 15px;">
							<div class="col-lg-12">
								<div class="form-group">
									<div class="input-group input-group-sm input-group-minimal" id="mod5-quyu">
										<span class="input-group-addon">
											区域：
										</span>
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<div class="input-group input-group-sm input-group-minimal" id="mod5-sq">
										<span class="input-group-addon">
											商圈：
										</span>
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<div class="input-group input-group-sm input-group-minimal" id="mod5-lp">
										<span class="input-group-addon">
											楼盘：
										</span>
									</div>
								</div>
							</div>
							<div class="col-lg-12 mt10">
<!-- 								共搜索55个资源 -->
							</div>
							<div class="col-lg-12 mt10">
								<div class="ms-selectable">
									<ul class="ms-list ps-container ps-active-y" tabindex="-1" id="mod5-assign-md">
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div style="clear: both;"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" onclick="fenpai(5)">分派</button>
				</div>
			</div>
		</div>
	</div>
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
<script src="<%=basePath%>/assets/js/xenon-custom.js"></script>

<link rel="stylesheet" href="<%=basePath%>/assets/js/datepicker/bootstrap-datetimepicker.min.css">
<!-- Imported scripts on this page  xiala-->
<script type="text/javascript" src="<%=basePath%>/assets/js/datepicker/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath%>/assets/js/datepicker/bootstrap-datetimepicker.zh-CN.js"></script>
<!-- JavaScripts initializations and stuff -->
<script src="<%=basePath%>/assets/js/xenon-custom.js"></script>

<script type="text/javascript">
	$('.form_date').datetimepicker({
		//$('.form_date').datetimepicker({ “form_datetime” 时分秒
		language: 'zh-CN',
		weekStart: 1,
		todayBtn: 1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
	});
	$(".form_datetime").datetimepicker({
		format: 'yyyy-mm-dd:hh:ii',
		language: 'zh-CN',
	});
</script>
<script type="text/javascript">
	function refreshHeadMessage(){
		$("#headMessage").empty();
		var url = "<%=basePath%>/services/assignLouPanService/refreshHeadMessage";
		var result = $.ajax({
			url : url,
			
			type : "POST",
			dataType : "json",
			contentType : "application/json;charset=UTF-8",
			async : false
		})
		var resultData = $.parseJSON(result.responseText);
		var html = "<p style='color:black'>当前管辖共"+resultData.headMessage1.m_mdSum+"个门店，其中"+resultData.headMessage1.m_notAssignMdSum+"个门店没有指派楼盘</p>"+
		    "<p style='color:black'>当前管辖共"+resultData.headMessage1.m_lpSum+"个楼盘，其中"+resultData.headMessage1.m_notAssignLpSum+"个楼盘未指派</p>";
		$("#headMessage").html(html);
		
	}
	function query1(){
		var obj=new Object();
		var requestParameter = new Object();
		requestParameter.zjqId = $("#zjqid1").val();
		requestParameter.mdId  = $("#ad-md").val();
		obj.requestParameter = requestParameter;
		var jsonData=requestParameter;
		$("#macPageWidget").asynPage("<%=basePath%>/services/assignLouPanService/query", "queryDiv", queryList, true, true, jsonData);
	}
	

	function modify1(mdid,zjq,md){
<<<<<<< HEAD
		$("#mod4-lp").empty();
		$("#assign-mod4-lp").empty();
=======
>>>>>>> aa6433be91419cf20278114adc5d4e74917df3a7
		$("#mod4-zjq").html('<span class="input-group-addon">总监区：</span>');
		$("#mod4-md").html('<span class="input-group-addon">门店：</span>');
		$("#mod4-zjq").append('<span class="input-group-addon" id="mod4-z">'+ zjq + '</span>')
		$("#mod4-md").append('<option class="form-control " id ="mod4-m" value="'+ mdid +'"><span class="input-group-addon"  >'+ md +'</span></option>')
		var url = "<%=basePath%>/services/assignLouPanService/queryAssignedByDian";
		var requestParameter = new Object();	
		requestParameter.mdId  =mdid;
		var dataJson = JSON.stringify(requestParameter);
		var result = $.ajax({
			url : url,
			data : dataJson,
			type : "POST",
			dataType : "json",
			contentType : "application/json;charset=UTF-8",
			async : false
		})
		
		var r1 = result.responseJSON;
		var c ='';
		$.each(r1, function(i,r){
<<<<<<< HEAD
				c += '<li class="ms-elem-selectable" id="' + r.id +'"onClick="assginLp(6,\'' + r.lpname +'\',' + r.id + ')"><span>'+ r.lpname +'</span></li>';
=======
			c += '<li class="ms-elem-selectable" id="' + r.id +'"onClick="assginLp(6,\'' + r.lpname +'\',' + r.id + ')"><span>'+ r.lpname +'</span></li>';
>>>>>>> aa6433be91419cf20278114adc5d4e74917df3a7
		});
		$("#assign-mod4-lp").html(c);
		jQuery('#modal-4').modal('show', {backdrop: 'fade'});
	}  
	
	function modify2(lpid,qy,sq,lp){
		$("#mod5-quyu").html('');$("#mod5-sq").html('');$("#mod5-lp").html('');
		$("#mod5-quyu").html('<span class="input-group-addon">区域：</span><option class="form-control " id="mod4-z">'+ qy + '</option>');
		$("#mod5-sq").html('<span class="input-group-addon">商圈：</span><option class="form-control " id="mod4-s">'+ sq + '</option>');
		$("#mod5-lp").html('<span class="input-group-addon">楼盘：</span><option class="form-control " value="'+ lpid +'" id="mod5-l">'+ lp +'</option>')
// 		$("#mod5-lp").html('<span class="input-group-addon">楼盘：</span><li class="ms-elem-selectable" value="'+ lpid +'" id="mod5-l"> <span class="input-group-addon" >'+ lp +'</span></li>')
// 		$("#mod5-quyu").append('<span class="input-group-addon" id="mod4-z">'+ qy + '</span>');
// 		$("#mod5-sq").append('<span class="input-group-addon" id="mod4-s">'+ sq + '</span>')
// 		$("#mod5-lp").append('<span class="input-group-addon" id="mod4-l">'+ lp +'</span>')
		
 	    var url = "<%=basePath%>/services/assignLouPanService/queryAssignedByPan2/"+lpid;
		//var requestParameter = new Object();	
		//requestParameter.lpId  =lpid;
		//var dataJson = JSON.stringify(requestParameter);
		$.ajax({
			url: url,
			//dataType: "json", 
			type: "GET",
			async : false,
			success: function(data){
				var c ='';
				$.each(data, function(i,n){
					c += '<li class="ms-elem-selectable" id="' + n.dept2_id +'"onClick="assignMd(6,\'' + n.dept2_name +'\',' + n.dept2_id + ')"><span>'+ n.dept2_name +'</span></li>';
				});
				$("#mod5-assign-md").html(c);
			},
			error: function(data){
			}
		}); 
		jQuery('#modal-5').modal('show', {backdrop: 'fade'});
	}  
	
	function queryList(arrdata,data){
		var cHtml = '';
		$.each(arrdata, function(i,n){
			var time = '';
			if(typeof(n.operatedate)!="undefined"){
				time = n.operatedate;
			} else {
				time = '未知'
			}
			cHtml += '<tr><td class="col-lg-1">' + ((data.page-1)*10+i+1) + '<td class="middle-align text-center">' 
			+n.zjq + '</td><td class="middle-align text-center">' 
			+ n.md +'</td><td class="middle-align text-center">' + n.num+'/'+ ${stat.m_lpSum}
			+ '</td><td class="middle-align text-center"><a href="javascript:modify1('+ n.mdid + ',\''+n.zjq+'\',\''+ n.md +'\')">分派/修改</a></td>'
			+ '<td class="middle-align text-center">' + time +'</td></tr>';
		});
		$("#queryDiv").html(cHtml);
	}
	//
	function query2(){
		var requestParameter = new Object();
		requestParameter.buildingIdStr  = $("#lp-pan-list").val();
		requestParameter.sqId  = $("#sq-pan-list").val();
		requestParameter.stressId  = $("#qy-pan-list").val();
		var jsonData=requestParameter;
		//var jsonData=JSON.stringify(requestParameter);
		$("#macPageWidget2").asynPage("<%=basePath%>/services/assignLouPanService/queryByPan", "#queryDiv2", queryList2, true, true, jsonData);
	}
	
	function queryList2(arrdata,data){
		var cHtml = '';
		$.each(arrdata, function(i,n){
			var time = '';
			if(typeof(n.lasttime)!="undefined"){
				time = n.lasttime;
			} else {
				time = '未知'
			}
			//a.id ,s.qy_name,q.sq_name, a.lp_name ,SUM( CASE WHEN l.id IS NULL THEN 0 ELSE 1 END) assnum/
			cHtml += '<tr><td class="col-lg-1">' + ((data.page-1)*10+i+1) + '<td class="middle-align text-center">' 
			+n.qy_name + '</td><td class="middle-align text-center">' 
			+ n.sq_name +'</td><td class="middle-align text-center">'+n.lp_name
			+ '</td><td class="middle-align text-center">'+n.assnum +'/'+ ${stat.m_mdSum} + '</td>'
			+ '<td class="middle-align text-center"><a href="javascript:modify2('+ n.lpid + ',\''+n.qy_name+'\',\''+n.sq_name+'\',\''+ n.lp_name +'\')">分派/修改</a></td>'
			+ '<td class="middle-align text-center">' + time +'</td></tr>';
		});
		$("#queryDiv2").html(cHtml);
	}
	
	function selectSq(type, id){
		var requestParameter = new Object();
		requestParameter.stressId = id ;
		var jsonData=JSON.stringify(requestParameter); 
		//id : sqid		
		$.ajax({
			url: "<%=basePath%>/services/commonService/selectSq",
			dataType: "json", 
			type: "POST",
			contentType : "application/json; charset=utf-8",
			data: jsonData,
			async : false,
			success: function(data){
				var cHtml = '';
				$.each(data, function(i,n){
					//cHtml += '<li class="ms-elem-selectable" id='+n.id +'  onClick="assginLp(1,\'' + n.sq_name + '\',' + n.id + ')" ><span>' + n.sq_name+'</span></li>';
					cHtml += '<option value="'+ n.id + '">'+  n.sq_name +'</option>' ;
				});
				if(type == 1 || type =='mod4-sq'){
					$("#sq1").html(cHtml);
					$("#"+ type).html(cHtml);
				}else if(type == 2){
					$("#sq2").html(cHtml);
				}else if(3 == type){
					$("#sq-pan-list").html('<option value="0">全部</option>'+cHtml);
					$("#lp-pan-list").html('<option value="0">全部</option>');
				}
			}
		});
	}
	
	
	function selectLp(type, id){
		//id : sqid		
		$.ajax({
			url: "<%=basePath%>/services/commonService/selectLpBySqId/"+id,
			dataType: "json", 
			type: "POST",
			async : false,
			success: function(data){
				var cHtml = '';
				$.each(data, function(i,n){
					if( 1== type || type ==5){
<<<<<<< HEAD
						var flag = 1;
						var arr = new Array();
						$("#assign-lp li").each(function(){
							$(this).each(function(){
								var lpId = $(this).attr("id");
								arr.push(lpId);
							});
						});
						for(var i = 0;i<arr.length;i++){
							if(n.id == arr[i]){
								flag =0;
								break;
							}
						}
						if(flag == 1){
							cHtml += '<li class="ms-elem-selectable" id='+n.id +'  onClick="assginLp(1,\'' + n.lpname + '\',' + n.id + ')" ><span>' + n.lpname+'</span></li>';
						}
						
					}else if( 2== type){
						cHtml += '<option value="'+ n.id + '">'+  n.lpname +'</option>' ;
					}else if(type == 'mod4-lp'){
						var flag = 1;
						var arr = new Array();
						$("#assign-mod4-lp li").each(function(){
							$(this).each(function(){
								var lpId = $(this).attr("id");
								arr.push(lpId);
							});
						});
						for(var i = 0;i<arr.length;i++){
							if(n.id == arr[i]){
								flag =0;
								break;
							}
						}
						if(flag == 1){
							cHtml += '<li class="ms-elem-selectable" id='+n.id +'  onClick="assginLp(5,\'' + n.lpname + '\',' + n.id + ')" ><span>' + n.lpname+'</span></li>';
						}
=======
						cHtml += '<li class="ms-elem-selectable" id='+n.id +'  onClick="assginLp(1,\'' + n.lpname + '\',' + n.id + ')" ><span>' + n.lpname+'</span></li>';
					}else if( 2== type){
						cHtml += '<option value="'+ n.id + '">'+  n.lpname +'</option>' ;
					}else if(type == 'mod4-lp'){
						cHtml += '<li class="ms-elem-selectable" id='+n.id +'  onClick="assginLp(5,\'' + n.lpname + '\',' + n.id + ')" ><span>' + n.lpname+'</span></li>';
>>>>>>> aa6433be91419cf20278114adc5d4e74917df3a7
					}
					else{
						cHtml += '<option value="'+ n.id + '">'+  n.lpname +'</option>' ;
					}
				});
				if( 1== type){
					$("#loupan1").html(cHtml);
				}else if( 2== type){
					$("#lp2").html(cHtml);
				}else if( 3== type){//liebiao
					$("#lp-pan-list").html('<option value="0">全部</option>'+cHtml);
				}else if(type=='mod4-lp'){
					$("#"+type).html(cHtml);
				}
			}
		});
	}

	function assginLp(type, lpname,id){
		var cHtml='';
		if(type == 1){
			cHtml += '<li class="ms-elem-selectable" id="' + id +'"onClick="assginLp(2,\'' +lpname +'\',' + id + ')"><span>' + lpname + '</span></li>';
			$("#loupan1 li[id="+id+"]").remove();
			$("#assign-lp").append(cHtml);
		}else if(type == 2){
			cHtml += '<li class="ms-elem-selectable" id="' + id +'"onClick="assginLp(1,\'' +lpname +'\',' + id + ')"><span>' + lpname + '</span></li>';
			$("#assign-lp li[id="+id+"]").remove();
			$("#loupan1").append(cHtml);
// 			$("#mendian2 li[id="+id+"]").remove();
// 			$("#assign-md2").append(cHtml);
		}else if(type == 3){
			cHtml += '<li class="ms-elem-selectable" id="' + id +'"onClick="assginLp(4,\'' +lpname +'\',' + id + ')"><span>' + lpname + '</span></li>';
			$("#mendian2 li[id="+id+"]").remove();
			$("#assign-md2").append(cHtml);
		}else if(type == 4){
			cHtml += '<li class="ms-elem-selectable" id="' + id +'"onClick="assginLp(3,\'' +lpname +'\',' + id + ')"><span>' + lpname + '</span></li>';
			$("#assign-md2 li[id="+id+"]").remove();
			$("#mendian2").append(cHtml);
		}else{
			if( type == 5){
				cHtml += '<li class="ms-elem-selectable" id="' + id +'"onClick="assginLp(6,\'' +lpname +'\',' + id + ')"><span>' + lpname + '</span></li>';
				$("#mod4-lp li[id="+id+"]").remove();
				$("#assign-mod4-lp").append(cHtml);
			}else if(type == 6){
				cHtml += '<li class="ms-elem-selectable" id="' + id +'"onClick="assginLp(5,\'' +lpname +'\',' + id + ')"><span>' + lpname + '</span></li>';
				$("#assign-mod4-lp li[id="+id+"]").remove();
				$("#mod4-lp").append(cHtml);
			}
			
		}
	}
	
	function selectMd(type, id){//type 1:andian 
		var url0 ;
		if(type == 2 || type == 3){
			url0 = "<%=basePath%>/services/commonService/selectMdByZj/"+id;
		}else if(type == 1 ){
			url0 = "<%=basePath%>/services/commonService/selectMdByZj/"+id;
		}
		else {
			url0 = "<%=basePath%>/services/commonService/selectMdByZj/"+id;
		}
		$.ajax({
			url: url0,
			dataType: "json", 
			type: "POST",
			async : false,
			success: function(data){
				if(1 == type){//fenpai选择 （andian）
					var cHtml = '<option value="0">请选择门店</option>';
					$.each(data, function(i,n){
						cHtml += '<option value ="'+ n.tbl_department_id +'">'+ n.department_name + '</option>';
					});
					$("#mendian1").html(cHtml);
				}else if(2 == type){//列表选择 (andian)
					var cHtml = '<option value="0">全部</option>';
					$.each(data, function(i,n){
						cHtml += '<option value ="'+ n.tbl_department_id +'">'+ n.department_name + '</option>';
					});
					$("#ad-md").html(cHtml);
				}else if(3 == type){//fenpai选择 (anloupan)
					var cHtml = '';
					$.each(data, function(i,n){
						cHtml += '<li class="ms-elem-selectable" id="'+ n.tbl_department_id +'" onclick="assignMd(3,\''+ n.department_name+'\','+ n.tbl_department_id +')"><span>'+ n.department_name + '</span></li>';
					});
					$("#mendian2").html(cHtml);
				}else{
					var cHtml = '';
					$.each(data, function(i,n){
						cHtml += '<li class="ms-elem-selectable" id="'+ n.tbl_department_id +'" onclick="assignMd(5,\''+ n.department_name+'\','+ n.tbl_department_id +')"><span>'+ n.department_name + '</span></li>';
					});
					$("#mod5-dz").html(cHtml);
				}
			},
			error: function(data){
			}
		});
	}
	
	function assignMd(type, lpname,id){
		if(type == 1){
			var cHtml='';
			cHtml += '<li class="ms-elem-selectable" id="' + id +'"onClick="assignMd(2,"' +lpname +'",' + id + ')"><span>' + lpname + '</span></li>';
			$("#assign-lp li[id="+id+"]").remove();
			$("#md1").append(cHtml);
		}else if(type == 2){
			var cHtml='';
			cHtml += '<li class="ms-elem-selectable" id="' + id +'"onClick="assignMd(1,"' +lpname +'",' + id + ')"><span>' + lpname + '</span></li>';
			$("#mendian2 li[id="+id+"]").remove();
			$("#assign-md2").append(cHtml);
		}else if(type == 3){
			var cHtml='';
			cHtml += '<li class="ms-elem-selectable" id="' + id +'"onClick="assignMd(4,\'' +lpname +'\',' + id + ')"><span>' + lpname + '</span></li>';
			$("#mendian2 li[id="+id+"]").remove();
			$("#assign-md2").append(cHtml);
		}else if(type == 4){
			var cHtml='';
			cHtml += '<li class="ms-elem-selectable" id="' + id +'"onClick="assignMd(3,\'' +lpname +'\',' + id + ')"><span>' + lpname + '</span></li>';
			$("#assign-md2 li[id="+id+"]").remove();
			$("#mendian2").append(cHtml);
		}else if(type == 5){
			var cHtml='';
			cHtml += '<li class="ms-elem-selectable" id="' + id +'"onClick="assignMd(6,\'' +lpname +'\',' + id + ')"><span>' + lpname + '</span></li>';
			$("#mod5-dz li[id="+id+"]").remove();
			$("#mod5-assign-md").append(cHtml);
		}else if(type == 6){
			var cHtml='';
			cHtml += '<li class="ms-elem-selectable" id="' + id +'"onClick="assignMd(5,\'' +lpname +'\',' + id + ')"><span>' + lpname + '</span></li>';
			$("#mod5-assign-md li[id="+id+"]").remove();
			$("#mod5-dz").append(cHtml);
		}		
		
	}

	function fenpaiEntry(){
		$.ajax({
			url: "<%=basePath%>/services/commonService/selectLp/1",
			dataType: "json", 
			type: "POST",
			async : false,
			success: function(data){
				var cHtml = '';
				$.each(data, function(i,n){
					cHtml += '<option value="'+ n.id + '">'+n.lpname+'</option>';
				});
				$("#loupan").html(cHtml);
			}
		});
		jQuery('#modal-1').modal('show', {backdrop: 'fade'});	
	}
	
	var reSubmitFlag = 0;
	function fenpai(type){
		if(reSubmitFlag == 0){
			reSubmitFlag = 1;
			var c ='';
			var obj = new Object();
			var params = new Object();
			if(1== type){
				$("#assign-lp li").each(function(){      
				    $(this).each(function(){    
				        var pId = $(this).attr("id");    
				        c += pId +","; 
				    });
				});
				params.lps = c.substr(0,c.length-1);
				params.mdId = $("#mendian1").val();
			}else if(2 == type){
				$("#assign-md2 li").each(function(){      
				    $(this).each(function(){    
				        var pId = $(this).attr("id");    
				        c += pId +","; 
				    });
				});
				params.mds = c.substr(0,c.length-1);
				params.buildingIdStr = $("#lp2").val();
			}else if(3 == type){
				$("#assign-mod4-lp li").each(function(){      
				    $(this).each(function(){    
				        var pId = $(this).attr("id");    
				        c += pId +","; 
				    });
				});
				params.lps = c.substr(0,c.length-1);
				params.mdId = $("#mod4-m").val();
			}else if(4 == type){
				//$("#mod5-dz").html('');
				$("#mod5-assign-md li").each(function(){      
				    $(this).each(function(){    
				        var pId = $(this).attr("id");    
				        c += pId +","; 
				    });
				});
				params.mds = c.substr(0,c.length-1);
				params.buildingIdStr = $("#mod5-l").val();
			}
			params.type = type;
			var jsonData=JSON.stringify(params); 
			
			$.ajax({
				url: "<%=basePath%>/services/assignLouPanService/saveFenPai",
				//dataType: "json", 
				type: "POST",
				contentType : "application/json; charset=utf-8",
				data: jsonData,
				async : false,
				success: function(data){
					reSubmitFlag = 0;
					alert("分派成功");
					if(type == 3){
						$("#modal-4").modal("hide");
					}else{
						$("#modal-"+type).modal("hide");
					} 
					if(type == 3 || type == 1){
						query1();
					} else {
						query2();
					}
					refreshHeadMessage();
				}
			});
			reSubmitFlag = 0;
		}
	}
	
	jQuery(document).ready(function($) {
		$(".s2example").select2({
			placeholder: '请输入搜索条件...',
			allowClear: true
		}).on('select2-open', function() {
			// Adding Custom Scrollbar
			$(this).data('select2').results.addClass('overflow-hidden').perfectScrollbar();
		});
		query1();
		refreshHeadMessage();
	});
	
	function logList(arrdate,data){
		var cHtml = '';
		$.each(arrdate, function(i,n){
			cHtml += '<tr><td class="col-lg-1">' + ((data.page-1)*10+i+1) + '<td class="middle-align text-center">' 
				+n.operator + '</td><td class="middle-align text-center">' 
				+ n.bm 
				//+'</td><td class="middle-align text-center">1894152222</td>'
				+ '<td class="middle-align text-center">'+n.message + '</td>'
				+ '<td class="middle-align text-center">' + n.operatedate +'</td></tr>';
		});
		$("#logbody").html(cHtml);
	}
	
	jQuery("#operJump").bind('click',function(){
		var jsonData = new Object(); 
		jsonData.type = 1;
		$("#macPageWidget3").asynPage("<%=basePath%>/services/assignService/queryLog", "#queryDiv", logList, true, true, jsonData);
	});
	
	jQuery("#anpanJump").bind('click',function(){
		var jsonData = new Object(); 
		$("#macPageWidget2").asynPage("<%=basePath%>/services/assignLouPanService/queryByPan", "#queryDiv2", queryList2, true, true, jsonData);
	});
	
 	jQuery("#andianJump").bind('click',function(){
 		var obj=new Object();
		var requestParameter = new Object();
		requestParameter.zjqId = $("#zjqid1").val();
		requestParameter.mdId  = $("#ad-md").val();
		obj.requestParameter = requestParameter;
		var jsonData=requestParameter;
		$("#macPageWidget").asynPage("<%=basePath%>/services/assignLouPanService/query", "queryDiv", queryList, true, true, jsonData);
 	});
	
	
</script>
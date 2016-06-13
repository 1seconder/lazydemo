<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ page language="java" import="java.util.*,com.newenv.communityFocus.vo.UserLogin,com.newenv.communityFocus.security.SecurityUserHolder"%>
<%
String imagePath = SecurityUserHolder.getConfig().getImagePath();
%>
<%@ include file="../fenpai/common.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Xenon Boostrap Admin Panel" />
	<meta name="author" content="" />
	<title>精跟详情</title>
	<link rel="stylesheet" href="<%=basePath%>/assets/css/fonts/linecons/css/linecons.css">
	<link rel="stylesheet" href="<%=basePath%>/assets/css/fonts/fontawesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="<%=basePath%>/assets/css/fonts/elusive/css/elusive.css">
	<link rel="stylesheet" href="<%=basePath%>/assets/css/bootstrap.css">
	<link rel="stylesheet" href="<%=basePath%>/assets/css/xenon-core.css">
	<link rel="stylesheet" href="<%=basePath%>/assets/css/xenon-forms.css">
	<link rel="stylesheet" href="<%=basePath%>/assets/css/xenon-components.css">
	<link rel="stylesheet" href="<%=basePath%>/assets/css/xenon-skins.css">
	<link rel="stylesheet" href="<%=basePath%>/assets/css/custom.css">
	<script src="<%=basePath%>/assets/js/jquery-1.11.1.min.js"></script>
	<script src="<%=basePath%>/assets/js/pagination/pagination.js"></script>
	<script src="<%=basePath%>/js/jinggeng/jiechouqi.js"></script>

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
<title>房源详情</title>
</head>
	<body class="page-body">
		<div class="page-container">
			<div class="main-content">
				<div class="page-title">
					<div class="breadcrumb-env pull-left">
						<ol class="breadcrumb bc-1">
							<li>
								<a href="<%=basePath%>/首页.html"><i class="fa-home"></i>首页</a>
							</li>
							<li>
								<a href="#">房源管理</a>
							</li>
							<li class="active">
								<strong>详情</strong>
							</li>
						</ol>
					</div>
				</div>
				<div class="panel">
					<div class="col-lg-12">
						<pre>房屋编号：<c:choose><c:when test="${result.number == '' || result.number == null}">FH${result.id }</c:when><c:otherwise>${result.number }</c:otherwise></c:choose></pre>
						<div class="row">
							<div class="col-lg-5 col-md-6 col-sm-6">
								<div class="col-lg-5 col-md-6 col-sm-6">
									<c:choose><c:when test="${result.imagepath == '' || result.imagepath == null}"><img src="<%=basePath%>/assets/images/user-5.png" width="128" height="128" /></c:when>
									<c:otherwise><img src="<%=imagePath %>${result.imagepath }" width="128" height="128" /></c:otherwise></c:choose>
								</div>
								<div class="col-lg-6">
									<div class="line24"><a href="javascript:void(0);" class="f18" target="_blank">${result.fh_name }  ${result.isencryption }</a>&nbsp;&nbsp;&nbsp;&nbsp;</div>
									<div class="line24 f16">${result.buildingName },${result.dyName },${result.fanghao }室</div>
									<div>
										<div class="btn-group">
											<button class="btn btn-success" onclick="openModal_2();" id="coreButton">查看核心信息</button>
										</div> 
										<div class="btn-group">
											<button type="button" class="btn btn-blue dropdown-toggle" data-toggle="dropdown">
												操作 <span class="caret"></span>
											</button>
											<ul class="dropdown-menu no-spacing" role="menu">
												<!-- <li>
													<a href="#">修改房源</a>
												</li> -->
												<li>
													<a href="<%=basePath%>/services/refineService/mainPage/1/${result.id }?k=yzjg&p=jg" >精耕</a>
												</li>
												
												<!--  <li>
													<a href="#" data-toggle="modal" data-target="#fangkan">房堪</a>
												</li>
												<li>
													<a href="#" data-toggle="modal" data-target="#yaoshi">钥匙</a>
												</li>
												<li>
													<a href="#">独家限时代卖</a>
												</li>
												<li>
													<a href="#" data-toggle="modal" data-target="#wuxiao">无效</a>
												</li>
												<li>
													<a href="#" data-toggle="modal" data-target="#guanzhu">关注</a>
												</li>
												<li>
													<a href="#" data-toggle="modal" data-target="#zhongdian">重点</a>
												</li>
												<li>
													<a href="#" data-toggle="modal" data-target="#yuekan">约看</a>
												</li>
												<li>
													<a href="#" data-toggle="modal" data-target="#kongkan">空看</a>
												</li>
												<li>
													<a href="#" data-toggle="modal" data-target="#jujiao">聚焦</a>
												</li>
												<li>
													<a href="#" data-toggle="modal" data-target="#fangyuandianping">房源点评</a>
												</li>
												<li>
													<a href="#" data-toggle="modal" data-target="#xiugairizhi">修改日志</a>
												</li>
												<li>
													<a href="#" data-toggle="modal" data-target="#caozuorizhi">操作日志</a>
												</li>
												<li>
													<a href="#">转为A盘</a>
												</li>
												<li>
													<a href="#">转为B盘</a>
												</li>
												<li>
													<a href="#">转为C盘</a>
												</li> -->
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-2 col-sm-2">
								<div class="line24">区域：${result.qyName }</div>
								<div class="line24">商圈：${result.sqName }</div>
								<div class="line24">归属店组：${result.department_name }</div>
								<div class="line24">用途：${result.useagename }</div>
							</div>
							<div class="col-lg-4 col-md-3 col-sm-3">
								<div class="col-lg-6 line24">
									类型： ${result.type }
								</div>
								<div class="col-lg-6 line24">
									归属人：${result.fullname }
								</div>
								<div class="col-lg-6 line24">
									房源录入时间：${result.createdate }
								</div>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
					<div style="height: 20px;"></div>
					<ul class="nav nav-tabs">
						<li class="active">
							<a href="#tab-01" data-toggle="tab">
								房屋信息
							</a>
						</li>
						<li>
							<a href="#tab-02" data-toggle="tab" onclick="queryOwnerInfo(1,1);">
								业主信息
							</a>
						</li>
						<li>
							<a href="#tab-03" data-toggle="tab" onclick="queryPreciseRecordForList(1,1);">
								跟进记录
							</a>
						</li>
						<li>
							<a href="#tab-04" data-toggle="tab" onclick="queryContractForList(0);">
								房屋成交信息
							</a>
						</li>
						<li>
							<a href="#tab-05" data-toggle="tab">
								配套设施
							</a>
						</li>
						<li>
							<a href="#tab-06" data-toggle="tab" onclick="queryOperationRecordForList(1,1);">
								操作记录
							</a>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tab-01">
							<div class="table-responsive">
								<table class="table table-model-2">
									<thead>
										<tr>
											<th colspan="5">基本信息</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>房屋名称：${result.fh_name }</td>
											<td>户型：<c:choose><c:when test="${result.shi == null || result.shi == ''}"></c:when><c:otherwise>${result.shi }室</c:otherwise></c:choose>
												<c:choose><c:when test="${result.ting == null || result.ting == ''}"></c:when><c:otherwise>${result.ting }厅</c:otherwise></c:choose>
												<c:choose><c:when test="${result.chu == null || result.chu == ''}"></c:when><c:otherwise>${result.chu }厨</c:otherwise></c:choose>
												<c:choose><c:when test="${result.wei == null || result.wei == ''}"></c:when><c:otherwise>${result.wei }卫</c:otherwise></c:choose>
												<c:choose><c:when test="${result.yang == null || result.yang == ''}"></c:when><c:otherwise>${result.yang }阳</c:otherwise></c:choose></td>
											<td>用途：${result.useagename }</td>
											<td>朝向：${result.chaoxiang }</td>
											<td>楼层：${result.ceng }-${result.totalfloor }</td>
										</tr>
										<tr>
											<td>权属性质：${result.propertyinfo }</td>
											<td>国土性质：${result.TerritoryInfo }</td>
											<td>产权编码：${result.PropertyNumber }</td>
											<td>区域范围：${result.qyName }${result.sqName }</td>
											<td>产权面积：${result.propertysize }</td>
										</tr>
										<tr>
											<td>使用面积：${result.innersize }</td>
											<td>产权年限：${result.propertyage }</td>
											<td>备案号：${result.codes }</td>
											<td>配套设施：${result.facility }</td>
										</tr>
										<tr>
											<td colspan="5">市场地址：${result.marketaddress }</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="tab-pane" id="tab-02">
							<div class="table-responsive">
								<div class="panel" id="singleOwner">
									<div class="panel-default">
										<div class="row">
											<div class="panel  panel-gray dujia_sc_hearder">
												<div class="panel-heading  padd_hearde">
													基本信息
												</div>
												<div class="panel-body">
													<div class="row col-lg-12 col-md-12 col-xs-12 col-sm-12">
														<div class="col-md-6 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon red">业主姓名：</span>
																	<input type="text" class="form-control" id="name" value="${per.name }" disabled="disabled"/>
																	<span class="input-group-addon" style="padding: 0;"></span>
																	<select class="form-control" style="width: 150px;" id ="namevalue" disabled="disabled">
								<!-- 										<option>请选择</option> -->
								<!-- 										<option value="1">男士</option> -->
								<!-- 										<option value="2">女士</option> -->
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-6 col-sm-12" id="linkid">
															<div class="form-group" id="linkid1">
																<div class="input-group input-group-minimal" >
																	<span class="input-group-addon red">联系电话：</span>
																	<input type="text" class="form-control" disabled="disabled"/>
																	<span class="input-group-addon" style="padding: 0;"></span>
																	<select class="form-control" style="width: 80px;" disabled="disabled">
												                       	<option value="1">本人</option>
												                        <option value="2">父母</option>
												                        <option value="3">授权委托人</option>
												                        <option value="4">配偶</option>
												                        <option value="5">亲戚</option>
												                        <option value="5">朋友</option>
																	</select>
																	<!-- <span class="input-group-addon"><i class="fa-plus" onclick="addLink()"></i></span>
																	<span class="input-group-addon"><i class="fa-plus" onclick="delLink(this)"></i></span> -->
																</div>
								<!-- 								<p class="help-block red">系统查询到该联系方式下有3位经纪人维护查询</p> -->
															</div>
														</div>
														<div class="col-md-6 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon red">居住地址：</span>
																	<input class="form-control" type="text"  id="juzhuAddress" value="${per.homeAddress }" disabled="disabled">
																</div>
															</div>
														</div>
														<div class="col-md-6 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon red">房产地址：</span>
																	<input class="form-control" type="text" id="lpAddress" value="${per.homeAddress }" disabled="disabled">
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon red">客户等级：</span>
																	<select class="form-control" id="customerLevel" value="${req.customerLevel}" disabled="disabled">
																		<option value="283">A级</option>
																		<option value="284">B级</option>
																		<option value="285">C级</option>
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon red">用途：</span>
																	<select class="form-control"  id="useType"  disabled="disabled">
																		<c:forEach items="${yt}" var="myList" varStatus="list1">  
																			<option value="${myList.id }">${mylist.name }</option>
																		</c:forEach>
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon" >装修情况：</span>
																	<select class="form-control" id="decorationCondition" disabled="disabled">
																		<c:forEach items="${decor}" var="myList" varStatus="list1">  
																			<option value="${myList.id }">${myList.name }</option>
																		</c:forEach>
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-12 col-sm-12">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon red">户型：</span>
																	<select class="form-control" id="roomNumberFrom" value="${req.roomnumberfrom}" disabled="disabled">
																		<option value="1">1室</option>
																		<option value="2">2室</option>
																		<option value="3">3室</option>
																		<option value="4">4室</option>
																		<option value="5">5室</option>
																	</select>
																	<span class="input-group-addon">-</span>
																	<select class="form-control"  id="hallNumberFrom" value="${req.hallnumberfrom}" disabled="disabled">
																		<option value="1">1厅</option>
																		<option value="2">2厅</option>
																		<option value="3">3厅</option>
																		<option value="4">4厅</option>
																		<option value="5">5厅</option>
																	</select>
																	<span class="input-group-addon">-</span>
																	<select class="form-control"  id="kitchenNumberFrom" value="${req.kitchennumberfrom}" disabled="disabled">
																		<option value="1">1厨</option>
																		<option value="2">2厨</option>
																		<option value="3">3厨</option>
																		<option value="4">4厨</option>
																		<option value="5">5厨</option>
																	</select>
																	<span class="input-group-addon">-</span>
																	<select class="form-control"  id="toiletNumberFrom" value="${req.toiletnumberfrom}" disabled="disabled">
																		<option value="1">1卫</option>
																		<option value="2">2卫</option>
																		<option value="3">3卫</option>
																		<option value="4">4卫</option>
																		<option value="5">5卫</option>
																	</select>
																	<span class="input-group-addon">-</span>
																	<select class="form-control"  id="balconyNumberFrom" value="${req.balconynumberfrom}" disabled="disabled">
																		<option value="1">1阳台</option>
																		<option value="2">2阳台</option>
																		<option value="3">3阳台</option>
																		<option value="4">4阳台</option>
																		<option value="5">5阳台</option>
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-6 col-sm-12">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon red">预算（元）：</span>
																	<input type="text" class="form-control" id="expectedPriceFrom" value="${req.expectedpricefrom }" disabled="disabled">
																	<span class="input-group-addon">-</span>
																	<input type="text" class="form-control"  id="expectedPriceTo" value="${req.expectedpriceto }" disabled="disabled">
																</div>
															</div>
														</div>
														<div class="col-md-6 col-sm-12">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon red">面积：</span>
																	<input type="text" class="form-control" id="sizeFrom" value="${ req.sizefrom}" disabled="disabled">
																	<span class="input-group-addon">-</span>
																	<input type="text" class="form-control" id="sizeTo" value="${ req.sizeto}" disabled="disabled">
																</div>
															</div>
														</div>
														<div class="col-md-6 col-sm-12">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon red">楼层：</span>
																	<input type="text" class="form-control" id="floorFrom" value="${ req.floorfrom}" disabled="disabled">
																	<span class="input-group-addon">-</span>
																	<input type="text" class="form-control" id="floorTo" value="${ req.floorto}" disabled="disabled">
																</div>
															</div>
														</div>
														<div class="col-md-6 col-sm-12">
															<div class="form-group">
																<div class="input-group input-group-minimal"> 
																	<span class="input-group-addon red">楼龄：</span>
																	<input type="text" class="form-control" id="buildingAgeFrom" value="${ req.buildingagefrom}" disabled="disabled">
																	<span class="input-group-addon">-</span>
																	<input type="text" class="form-control" id="buildingAgeTo" value="${ req.buildingageto}" disabled="disabled">
																</div>
															</div>
														</div>
														<div class="col-md-6 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon red">需求委托：</span>
																	<select class="form-control"  id="delegateType" value="${ cus.delegatetype}" onchange="delegate_f()" disabled="disabled">
																		<option value="2">求租</option>
																		<option value="1">求购</option>
																	</select>
																</div>
															</div>
														</div>
														
														<div class="col-md-6 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon red">委托来源：</span>
																	<select class="form-control" value="${cus.delegateSource}" id="delegateSource" disabled="disabled">
																		<option value="1">店面开发</option>
																	</select>
																	<span class="input-group-addon">-</span>
																	<select class="form-control" disabled="disabled">
																		<option>精耕</option>
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6" id="rentdiv">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon red">租期（月）：</span>
																	<input type="text" class="form-control" id="rentingRange" value="${ req.rentingrange}" disabled="disabled"/>
																</div>
															</div>
														</div>
														<div class="col-md-2 col-sm-3 pull-right" id="paydiv">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">付：</span>
																	<input type="text" class="form-control" value="${cus.mortgage}" id="mortgage" disabled="disabled"/>
																</div>
															</div>
														</div>
														<div class="col-md-2 col-sm-3 pull-right" id="yadiv">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">押：</span>
																	<input type="text" class="form-control" value="${cus.fee}" id="fee" disabled="disabled"/>
																</div>
															</div>
														</div>
								<!-- 						<div class="col-md-4 col-sm-6 pull-right"> -->
								<!-- 							<div class="form-group"> -->
								<!-- 								<div class="input-group input-group-minimal"> -->
								<!-- 									<span class="input-group-addon">付款方式：</span> -->
								<%-- 									<select class="form-control" id="payType" value ="${rent.payType }"> --%>
								<!-- 										<option>1</option> -->
								<!-- 									</select> -->
								<!-- 								</div> -->
								<!-- 							</div> -->
								<!-- 						</div> -->
														<div class="clearfix"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="panel-default">
										<div class="row">
											<div class="panel  panel-gray dujia_sc_hearder">
												<div class="panel-heading  padd_hearde">
													其他信息
												</div>
												<div class="panel-body">
													<div class="row col-lg-12 col-md-12 col-xs-12 col-sm-12">
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">QQ：</span>
																	<input type="text" class="form-control" id="qq" value="${per.qq }" disabled="disabled"/>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">微信：</span>
																	<input type="text" class="form-control" id="weXin" value="${per.weXin }" disabled="disabled"/>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">电子信箱：</span>
																	<input type="text" class="form-control" id="email" value="${per.email }" disabled="disabled"/>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">工作单位：</span>
																	<input type="text" class="form-control" id="workPlace" value="${per.workplace }" disabled="disabled"/>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">教育程度：</span>
																	<select class="form-control" id="education" disabled="disabled">
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">出生日期：</span>
																	<input type="text" class="form-control form_date" id="birthday" value="${per.birthday }" disabled="disabled"/>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">消费观念：</span>
																	<select class="form-control" id="consumptionconcept" disabled="disabled">
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">单位地址：</span>
																	<input type="text" class="form-control" id="officeAddress" value="${per.officeaddress }" disabled="disabled"/>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">身份证：</span>
																	<input type="text" class="form-control" id="identityCode" value="${per.identitycode }" disabled="disabled"/>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">现家庭地址：</span>
																	<input type="text" class="form-control" id="homeAddress" value="${per.homeaddress }" disabled="disabled"/>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">国籍：</span>
																	<select class="form-control" id="nationality" disabled="disabled" >
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">工作性质：</span>
																	<select class="form-control" id="workType" disabled="disabled">
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">现有房产套数：</span>
																	<input type="text" class="form-control" id="ownedHouseNumber" value="${cus.ownedhousenumber }" disabled="disabled"/>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-4">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">居住人口：</span>
																	<input type="text" class="form-control" id="livePersonCount" value="${req.livePersonCount }" disabled="disabled"/>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-4">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">紧迫感：</span>
																	<select class="form-control" id="isUrgently" value="${req.isurgently }" disabled="disabled">
																		<option value="1">紧急</option>
																		<option value="2">不紧急</option>
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-4">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">入住时间：</span>
																	<input type="text" class="form-control form-input form_date" id="liveInDate" value="${req.liveindate }" disabled="disabled"/>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-4">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">车位：</span>
																	<select class="form-control" id="isParkingPlace" value="${req.isparkingplace }" disabled="disabled">
																		<option value="1">有</option>
																		<option value="2">无</option>
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-4">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">是否集团客户：</span>
																	<select class="form-control" id="IsGroupCustomer " value="${req.isgroupcustomer  }" disabled="disabled">
																		<option value="1">是</option>
																		<option value="0">否</option>
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-4">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">期限：</span>
								<%-- 									<input type="text" class="form-control" id="homeAddress" value="${per.homeaddress }"/> --%>
																	<input type="text" class="form-control " id="deadline" value="${req.liveindate }"  disabled="disabled"/>
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-12 col-sm-12">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">备注：</span>
																	<textarea class="form-control" id="comment" value="${req.comment }" disabled="disabled"></textarea>
																</div>
															</div>
														</div>
														<div class="col-md-12 col-sm-12">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="">小区熟悉程度：</span>
																	<p class="" id="isFamiliarToCommunity" >
								<!-- 										<label class="radio-inline" value="1"> -->
								<!-- 											<input type="radio" name="radio-2" > -->
								<!-- 											熟悉商圈小区 -->
								<!-- 										</label> -->
								<!-- 										<label class="radio-inline"> -->
								<!-- 											<input type="radio" name="radio-2" value="2"> -->
								<!-- 											多次看房，熟悉商圈小区 -->
								<!-- 										</label> -->
								<!-- 										<label class="radio-inline"> -->
								<!-- 											<input type="radio" name="radio-2" value="3"> -->
								<!-- 											不熟悉商圈小区 -->
								<!-- 										</label> -->
																	</p>
																</div>
															</div>
														</div>
														<div class="col-md-12 col-sm-12">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="">周边配套需求：</span>
																	<p class="" >
																		<label >
																			<input type="checkbox" name="radio-2" id="is_hospital" disabled="disabled">
																			医院
																		</label>
																		<label >
																			<input type="checkbox" name="radio-2" id="is_park" disabled="disabled">
																			公园
																		</label>
																		<label >
																			<input type="checkbox" name="radio-2" id="is_supermarkets" disabled="disabled">
																			超市
																		</label>
																		<label>
																			<input type="checkbox" name="radio-2" id="is_subway" disabled="disabled"> 
																			地铁
																		</label>
																		<label >
																			<input type="checkbox" name="radio-2" id="is_bank" disabled="disabled">
																			银行
																		</label>
																		<label >
																			<input type="checkbox" name="radio-2" id="is_school" disabled="disabled">
																			学校
																		</label>
																		<label >
																			<input type="checkbox" name="radio-2" id="is_commercial_street" disabled="disabled">
																			商业街
																		</label>
																		<label >
																			<input type="checkbox" name="radio-2" id="is_other" disabled="disabled">
																			其他
																		</label>
																	</p>
																</div>
															</div>
														</div>
														<div class="col-md-12 col-sm-12">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="" >家具：</span>
																	<p class="" id="furniture" >
								<!-- 										<label > -->
								<!-- 											<input type="checkbox" style="padding-left: 0px;" name="radio-2" checked="" > -->
								<!-- 											全选 -->
								<!-- 										</label> -->
																	</p>
																</div>
															</div>
														</div>
														<div class="col-md-12 col-sm-12">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="">家电：</span>
																	<p class="" id="appliances"  name="appliances" >
																	</p>
																</div>
															</div>
														</div>
														<div class="clearfix"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
							<!-- <div class="table-responsive"> -->
								<!-- <table class="table table-model-2" id="singleOwner">
									<thead>
										<tr>
											<th colspan="5">业主信息</th>
										</tr>
									</thead>
									<tbody id="ownerBasicInfo">
										
									</tbody>
									<thead>
										<tr>
											<th colspan="5">其他信息</th>
										</tr>
									</thead>
									<tbody id="otherInfo">
									
									</tbody>
									<thead>
										<tr>
											<th colspan="5">其他需求</th>
										</tr>
									</thead>
									<tbody id="otherRequirement">
										
									</tbody>
								</table> -->
								<table class="table table-model-2" id="ownerList">
									<thead>
										<tr>
											<th>编号</th>
											<th>业主</th>
											<th>联系电话</th>
											<th>微信</th>
											<th>QQ</th>
											<th>电子信箱</th>
											<th>精耕人</th>
											<th>最后维护时间</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody id="ownerListInfo">
										
									</tbody>
								</table>
								<div class="pagination pull-right" id="ownerListInfoPag">
							
								</div>
								<div style="clear: both;"></div>
							</div>
						</div>
						<div class="tab-pane" id="tab-03">
							<div class="table-responsive">
								<table class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>时间</th>
											<th>门店</th>
											<th>经纪人</th>
											<th>跟进内容</th>
											<!-- <th>操作</th> -->
										</tr>
									</thead>
									<tbody id="preciseRecord">
										
									</tbody>
								</table>
								<div class="pagination pull-right" id="preciseRecordPag">
							
								</div>
								<div style="clear: both;"></div>
							</div>
						</div>
						<div class="tab-pane" id="tab-04">
							<div class="row text-right" style="padding-bottom: 20px;">
								<div class="col-sm-4 col-md-4 col-lg-3 pull-left">
									<div class="input-group input-group-sm input-group-minimal">
										<span class="input-group-addon">
											成交方式：
										</span>
										<select class="form-control" onchange="chenjiao(this)" id="dealStyle">
											<option value="0">买卖</option>
											<option value="1">租赁</option>
										</select>
									</div>
								</div>
							</div>
							<div class="table-responsive" id="maimaichengjiao">
								<table class="table table-bordered table-striped">
									<thead>
										<tr>
											<th class="middle-align text-center">房源编号</th>
											<th class="middle-align text-center">合同编号</th>
											<th class="middle-align text-center">签约日期</th>
											<th class="middle-align text-center">成交价</th>
											<th class="middle-align text-center">经纪人</th>
											<th class="middle-align text-center">业主</th>
											<th class="middle-align text-center">业主电话</th>
											<th class="middle-align text-center">数据来源</th>
										</tr>
									</thead>
									<tbody id="contractList">
										
									</tbody>
								</table>
							</div>
						</div>
						<div class="tab-pane" id="tab-05">
							<iframe width="100%" height="600px" frameborder=0 scrolling=auto src="<%=basePath%>/jsp/zhoubiansousuo.jsp"></iframe>
						</div>
						<div class="tab-pane" id="tab-06">
							<table class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>序号</th>
										<th>操作人</th>
										<th>所在部门</th>
										<th>电话</th>
										<th>操作记录</th>
										<th>操作时间</th>
									</tr>
								</thead>
								<tbody id="operationRecord">
									
								</tbody>
							</table>
							<div class="pagination pull-right" id="operationRecordPag">
							
							</div>
							<div style="clear: both;"></div>
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
<<<<<<< HEAD
		<input type="hidden" value="${coreResult.ax }" id="cflag"/>
		<input type="hidden" value="${coreResult.fullname }" id="cfullname"/>
		<input type="hidden" value="${coreResult.tel }" id="ctel"/>
		<input type="hidden" value="${coreResult.sex }" id="csex"/>
		
		
=======
		<input type="hidden" value="${flag }" id="flag"/>
>>>>>>> aa6433be91419cf20278114adc5d4e74917df3a7
		<input type="hidden" value="${result.id }" id="fhId"/>
		<input type="hidden" value="${result.id }" id="fanghao"/>
		<input type="hidden" value="${result.personid }" id="yzId"/>
		<input type="hidden" value="${userTitle }" id="userTitle"/>
		<input type="hidden" value="${result.x }" id="xPoint"/>
		<input type="hidden" value="${result.y }" id="yPoint"/>
		<input type="hidden" id="pId"/>
	</body>
	<div class="modal fade in" id="modal_1">
		<div class="modal-dialog" style="width:900px;height:500px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true" >×</button>
					<h4 class="modal-title">业主详情</h4>
				</div>
				<div class="modal-body" id="detailModal">
					<div class="panel" >
									<div class="panel-default">
										<div class="row">
											<div class="panel  panel-gray dujia_sc_hearder">
												<div class="panel-heading  padd_hearde">
													基本信息
												</div>
												<div class="panel-body">
													<div class="row col-lg-12 col-md-12 col-xs-12 col-sm-12">
														<div class="col-md-6 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon red">业主姓名：</span>
																	<input type="text" class="form-control" id="name" value="${per.name }" disabled="disabled"/>
																	<span class="input-group-addon" style="padding: 0;"></span>
																	<select class="form-control" style="width: 150px;" id ="namevalue" disabled="disabled">
								<!-- 										<option>请选择</option> -->
								<!-- 										<option value="1">男士</option> -->
								<!-- 										<option value="2">女士</option> -->
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-6 col-sm-12" id="linkid">
															<div class="form-group" id="linkid1">
																<div class="input-group input-group-minimal" >
																	<span class="input-group-addon red">联系电话：</span>
																	<input type="text" class="form-control" disabled="disabled"/>
																	<span class="input-group-addon" style="padding: 0;"></span>
																	<select class="form-control" style="width: 80px;" disabled="disabled">
												                       	<option value="1">本人</option>
												                        <option value="2">父母</option>
												                        <option value="3">授权委托人</option>
												                        <option value="4">配偶</option>
												                        <option value="5">亲戚</option>
												                        <option value="5">朋友</option>
																	</select>
																	<!-- <span class="input-group-addon"><i class="fa-plus" onclick="addLink()"></i></span>
																	<span class="input-group-addon"><i class="fa-plus" onclick="delLink(this)"></i></span> -->
																</div>
								<!-- 								<p class="help-block red">系统查询到该联系方式下有3位经纪人维护查询</p> -->
															</div>
														</div>
														<div class="col-md-6 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon red">居住地址：</span>
																	<input class="form-control" type="text"  id="juzhuAddress" value="${per.homeAddress }" disabled="disabled">
																</div>
															</div>
														</div>
														<div class="col-md-6 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon red">房产地址：</span>
																	<input class="form-control" type="text" id="lpAddress" value="${per.homeAddress }" disabled="disabled">
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon red">客户等级：</span>
																	<select class="form-control" id="customerLevel" value="${req.customerLevel}" disabled="disabled">
																		<option value="283">A级</option>
																		<option value="284">B级</option>
																		<option value="285">C级</option>
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon red">用途：</span>
																	<select class="form-control"  id="useType"  disabled="disabled">
																		<c:forEach items="${yt}" var="myList" varStatus="list1">  
																			<option value="${myList.id }">${mylist.name }</option>
																		</c:forEach>
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon" >装修情况：</span>
																	<select class="form-control" id="decorationCondition" disabled="disabled">
																		<c:forEach items="${decor}" var="myList" varStatus="list1">  
																			<option value="${myList.id }">${myList.name }</option>
																		</c:forEach>
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-12 col-sm-12">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon red">户型：</span>
																	<select class="form-control" id="roomNumberFrom" value="${req.roomnumberfrom}" disabled="disabled">
																		<option value="1">1室</option>
																		<option value="2">2室</option>
																		<option value="3">3室</option>
																		<option value="4">4室</option>
																		<option value="5">5室</option>
																	</select>
																	<span class="input-group-addon">-</span>
																	<select class="form-control"  id="hallNumberFrom" value="${req.hallnumberfrom}" disabled="disabled">
																		<option value="1">1厅</option>
																		<option value="2">2厅</option>
																		<option value="3">3厅</option>
																		<option value="4">4厅</option>
																		<option value="5">5厅</option>
																	</select>
																	<span class="input-group-addon">-</span>
																	<select class="form-control"  id="kitchenNumberFrom" value="${req.kitchennumberfrom}" disabled="disabled">
																		<option value="1">1厨</option>
																		<option value="2">2厨</option>
																		<option value="3">3厨</option>
																		<option value="4">4厨</option>
																		<option value="5">5厨</option>
																	</select>
																	<span class="input-group-addon">-</span>
																	<select class="form-control"  id="toiletNumberFrom" value="${req.toiletnumberfrom}" disabled="disabled">
																		<option value="1">1卫</option>
																		<option value="2">2卫</option>
																		<option value="3">3卫</option>
																		<option value="4">4卫</option>
																		<option value="5">5卫</option>
																	</select>
																	<span class="input-group-addon">-</span>
																	<select class="form-control"  id="balconyNumberFrom" value="${req.balconynumberfrom}" disabled="disabled">
																		<option value="1">1阳台</option>
																		<option value="2">2阳台</option>
																		<option value="3">3阳台</option>
																		<option value="4">4阳台</option>
																		<option value="5">5阳台</option>
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-6 col-sm-12">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon red">预算（元）：</span>
																	<input type="text" class="form-control" id="expectedPriceFrom" value="${req.expectedpricefrom }" disabled="disabled">
																	<span class="input-group-addon">-</span>
																	<input type="text" class="form-control"  id="expectedPriceTo" value="${req.expectedpriceto }" disabled="disabled">
																</div>
															</div>
														</div>
														<div class="col-md-6 col-sm-12">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon red">面积：</span>
																	<input type="text" class="form-control" id="sizeFrom" value="${ req.sizefrom}" disabled="disabled">
																	<span class="input-group-addon">-</span>
																	<input type="text" class="form-control" id="sizeTo" value="${ req.sizeto}" disabled="disabled">
																</div>
															</div>
														</div>
														<div class="col-md-6 col-sm-12">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon red">楼层：</span>
																	<input type="text" class="form-control" id="floorFrom" value="${ req.floorfrom}" disabled="disabled">
																	<span class="input-group-addon">-</span>
																	<input type="text" class="form-control" id="floorTo" value="${ req.floorto}" disabled="disabled">
																</div>
															</div>
														</div>
														<div class="col-md-6 col-sm-12">
															<div class="form-group">
																<div class="input-group input-group-minimal"> 
																	<span class="input-group-addon red">楼龄：</span>
																	<input type="text" class="form-control" id="buildingAgeFrom" value="${ req.buildingagefrom}" disabled="disabled">
																	<span class="input-group-addon">-</span>
																	<input type="text" class="form-control" id="buildingAgeTo" value="${ req.buildingageto}" disabled="disabled">
																</div>
															</div>
														</div>
														<div class="col-md-6 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon red">需求委托：</span>
																	<select class="form-control"  id="delegateType" value="${ cus.delegatetype}" onchange="delegate_f()" disabled="disabled">
																		<option value="2">求租</option>
																		<option value="1">求购</option>
																	</select>
																</div>
															</div>
														</div>
														
														<div class="col-md-6 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon red">委托来源：</span>
																	<select class="form-control" value="${cus.delegateSource}" id="delegateSource" disabled="disabled">
																		<option value="1">店面开发</option>
																	</select>
																	<span class="input-group-addon">-</span>
																	<select class="form-control" disabled="disabled">
																		<option>精耕</option>
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6" id="rentdiv">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon red">租期（月）：</span>
																	<input type="text" class="form-control" id="rentingRange" value="${ req.rentingrange}" disabled="disabled"/>
																</div>
															</div>
														</div>
														<div class="col-md-2 col-sm-3 pull-right" id="paydiv">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">付：</span>
																	<input type="text" class="form-control" value="${cus.mortgage}" id="mortgage" disabled="disabled"/>
																</div>
															</div>
														</div>
														<div class="col-md-2 col-sm-3 pull-right" id="yadiv">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">押：</span>
																	<input type="text" class="form-control" value="${cus.fee}" id="fee" disabled="disabled"/>
																</div>
															</div>
														</div>
								<!-- 						<div class="col-md-4 col-sm-6 pull-right"> -->
								<!-- 							<div class="form-group"> -->
								<!-- 								<div class="input-group input-group-minimal"> -->
								<!-- 									<span class="input-group-addon">付款方式：</span> -->
								<%-- 									<select class="form-control" id="payType" value ="${rent.payType }"> --%>
								<!-- 										<option>1</option> -->
								<!-- 									</select> -->
								<!-- 								</div> -->
								<!-- 							</div> -->
								<!-- 						</div> -->
														<div class="clearfix"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="panel-default">
										<div class="row">
											<div class="panel  panel-gray dujia_sc_hearder">
												<div class="panel-heading  padd_hearde">
													其他信息
												</div>
												<div class="panel-body">
													<div class="row col-lg-12 col-md-12 col-xs-12 col-sm-12">
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">QQ：</span>
																	<input type="text" class="form-control" id="qq" value="${per.qq }" disabled="disabled"/>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">微信：</span>
																	<input type="text" class="form-control" id="weXin" value="${per.weXin }" disabled="disabled"/>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">电子信箱：</span>
																	<input type="text" class="form-control" id="email" value="${per.email }" disabled="disabled"/>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">工作单位：</span>
																	<input type="text" class="form-control" id="workPlace" value="${per.workplace }" disabled="disabled"/>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">教育程度：</span>
																	<select class="form-control" id="education" disabled="disabled">
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">出生日期：</span>
																	<input type="text" class="form-control form_date" id="birthday" value="${per.birthday }" disabled="disabled"/>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">消费观念：</span>
																	<select class="form-control" id="consumptionconcept" disabled="disabled">
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">单位地址：</span>
																	<input type="text" class="form-control" id="officeAddress" value="${per.officeaddress }" disabled="disabled"/>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">身份证：</span>
																	<input type="text" class="form-control" id="identityCode" value="${per.identitycode }" disabled="disabled"/>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">现家庭地址：</span>
																	<input type="text" class="form-control" id="homeAddress" value="${per.homeaddress }" disabled="disabled"/>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">国籍：</span>
																	<select class="form-control" id="nationality" disabled="disabled" >
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">工作性质：</span>
																	<select class="form-control" id="workType" disabled="disabled">
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-6">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">现有房产套数：</span>
																	<input type="text" class="form-control" id="ownedHouseNumber" value="${cus.ownedhousenumber }" disabled="disabled"/>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-4">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">居住人口：</span>
																	<input type="text" class="form-control" id="livePersonCount" value="${req.livePersonCount }" disabled="disabled"/>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-4">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">紧迫感：</span>
																	<select class="form-control" id="isUrgently" value="${req.isurgently }" disabled="disabled">
																		<option value="1">紧急</option>
																		<option value="2">不紧急</option>
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-4">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">入住时间：</span>
																	<input type="text" class="form-control form-input form_date" id="liveInDate" value="${req.liveindate }" disabled="disabled"/>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-4">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">车位：</span>
																	<select class="form-control" id="isParkingPlace" value="${req.isparkingplace }" disabled="disabled">
																		<option value="1">有</option>
																		<option value="2">无</option>
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-4">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">是否集团客户：</span>
																	<select class="form-control" id="IsGroupCustomer " value="${req.isgroupcustomer  }" disabled="disabled">
																		<option value="1">是</option>
																		<option value="0">否</option>
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-4 col-sm-4">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">期限：</span>
								<%-- 									<input type="text" class="form-control" id="homeAddress" value="${per.homeaddress }"/> --%>
																	<input type="text" class="form-control " id="deadline" value="${req.liveindate }"  disabled="disabled"/>
																	</select>
																</div>
															</div>
														</div>
														<div class="col-md-12 col-sm-12">
															<div class="form-group">
																<div class="input-group input-group-minimal">
																	<span class="input-group-addon">备注：</span>
																	<textarea class="form-control" id="comment" value="${req.comment }" disabled="disabled"></textarea>
																</div>
															</div>
														</div>
														<div class="clearfix"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
					 <!-- <table class="table table-model-2">
						<thead>
							<tr>
								<th colspan="5">业主信息</th>
							</tr>
						</thead>
						<tbody id="ownerBasicInfoModal">
							
						</tbody>
						<thead>
							<tr>
								<th colspan="5">其他信息</th>
							</tr>
						</thead>
						<tbody id="otherInfoModal">
						
						</tbody>
						<thead>
							<tr>
								<th colspan="5">其他需求</th>
							</tr>
						</thead>
						<tbody id="otherRequirementModal">
							
						</tbody>
					</table>  -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade in" id="modal_2">
		<div class="modal-dialog" style="width:80%">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true" >×</button>
					<h4 class="modal-title">核心信息</h4>
				</div>
				<div class="modal-body">
					<div class="table-responsive">
								<table class="table table-bordered table-striped">
									<thead>
										<tr>
											<th class="middle-align text-center">成交时间</th>
											<th class="middle-align text-center">楼盘名称</th>
											<th class="middle-align text-center">栋座</th>
											<th class="middle-align text-center">单元</th>
											<th class="middle-align text-center">房号</th>
											<th class="middle-align text-center">地址</th>
											<th class="middle-align text-center">业主</th>
											<th class="middle-align text-center">业主电话</th>
											<th class="middle-align text-center">数据来源</th>
										</tr>
									</thead>
									<tbody id="coreMessageList">
										
									</tbody>
								</table>
							</div>
							<div class="pagination pull-right" id="coreMessageListPag">
							
							</div>
							<div style="clear: both;"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
<<<<<<< HEAD
	
	<div class="modal fade in" id="modal_3">
		<div class="modal-dialog" style="width:80%">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true" >×</button>
					<h4 class="modal-title">查看详情</h4>
				</div>
				<div class="modal-body" id="cdetail">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
=======
>>>>>>> aa6433be91419cf20278114adc5d4e74917df3a7
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
<script src="<%=basePath%>/assets/js/xenon-custom.js"></script>

<link rel="stylesheet" href="<%=basePath%>/assets/js/datepicker/bootstrap-datetimepicker.min.css">
<!-- Imported scripts on this page  xiala-->
<script type="text/javascript" src="<%=basePath%>/assets/js/datepicker/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath%>/assets/js/datepicker/bootstrap-datetimepicker.zh-CN.js"></script>
<!-- JavaScripts initializations and stuff -->
<script src="<%=basePath%>/assets/js/xenon-custom.js"></script>


<script type="text/javascript">

	$(document).ready(function(){
		
	});
	function chenjiao(obj){
		queryContractForList($(obj).val());
	}
	
	function queryOwnerInfo(pageIndex,flag){
		var type = $("#userTitle").val();
		if(flag == 3){
			type = 0;
		}else{
			if(type == 0){
				$("#ownerList").css("display","none");
				$("#ownerListInfoPag").css("display","none");
			}else{
				$("#singleOwner").css("display","none");
			}
			$("#ownerListInfo").empty();
			$("#ownerBasicInfo").empty();
			$("#otherInfo").empty();
			$("#otherRequirement").empty();
		}
		
		var postParameter = new Object();
		var requestParameter = new Object();
		var pageInfo = new Object();
		pageInfo.page = pageIndex;
		requestParameter.creatorId = $("#yzId").val();
		if(flag == 3){
			requestParameter.creatorId = $("#pId").val();
		}
		requestParameter.fhId = $("#fhId").val();
		requestParameter.type = type;
		postParameter.pageInfo = pageInfo;
		postParameter.requestParameter = requestParameter;
		var dataJson = JSON.stringify(postParameter);
		var url = "<%=basePath%>/services/houseService/queryOwnerInfo";
		var result = $.ajax({
			url : url,
			type : "POST",
			data : dataJson,
			contentType : "application/json;charset=UTF-8",
			dataType : "json",
			async : false
		});
		if(type == 0){
				if(flag == 3){
					$("#singleOwner").empty();
					jjryezhu('detail');
				}else{
					jjryezhu();
					disCheckBox("furniture","checkbox");
					disCheckBox("appliances","checkbox");
					disCheckBox("isFamiliarToCommunity","radio");
				}
		}else{
			var resultArr = result.responseJSON.listJson.gridModel;
			var index = result.responseJSON.listJson.page;
			var html = "";
			if(null == resultArr || typeof(resultArr) == "undefined"){
				
			}else{
				for(var i=0;i<resultArr.length;i++){
					var obj = resultArr[i];
					var name = obj.name == null ? "":obj.name;
					var wexin = obj.wexin == null ? "":obj.wexin;
					var mobilephone = obj.mobilephone == null ? "":obj.mobilephone;
					var qq = obj.qq == null ? "":obj.qq;
					var email = obj.email == null ? "":obj.email;
					var fullname = obj.fullname == null ? "":obj.fullname;
				 	html +='<tr><td>'+((index-1)*10+i+1)+'</td>'+
					'<td>'+name+'</td>'+
					'<td>'+mobilephone+'</td>'+
					'<td>'+wexin+'</td>'+
					'<td>'+qq+'</td>'+
					'<td>'+email+'</td>'+
					'<td>'+fullname+'</td>'+
					'<td>'+obj.modifydate+'</td>'+
					'<td><a href="javascript:openModal(\''+obj.id+'\')">详情</a></td></tr>';
				}
			}
			$("#ownerListInfo").append(html);
			page("ownerListInfoPag",result.responseJSON.listJson.page,result.responseJSON.listJson.total,null,pageIndex,flag);
		}
	}
	
	function queryPreciseRecordForList(pageIndex,flag){
		$("#preciseRecord").empty();
		var postParameter = new Object();
		var requestParameter = new Object();
		var pageInfo = new Object();
		pageInfo.page = pageIndex;
		requestParameter.fhId = $("#fhId").val();
		postParameter.pageInfo = pageInfo;
		postParameter.requestParameter = requestParameter;
		var dataJson = JSON.stringify(postParameter);
		var url = "<%=basePath%>/services/houseService/queryPreciseRecordForList";
		var result = $.ajax({
			url : url,
			type : "POST",
			data : dataJson,
			contentType : "application/json;charset=UTF-8",
			dataType : "json",
			async : false
		});
		var resultArr = result.responseJSON.listJson.gridModel;
		var index = result.responseJSON.listJson.page;
		var html = '';
		if(null == resultArr || typeof(resultArr) == "undefined"){
			
		}else{
			for(var i = 0;i<resultArr.length;i++){
				var resultData = resultArr[i];
				var modifydate = resultData.modifydate == null ? "":resultData.modifydate;
				var department_name = resultData.department_name == null ? "":resultData.department_name;
				var fullname = resultData.fullname == null ? "":resultData.fullname;
				var tel = resultData.tel == null ? "":resultData.tel;
				var messages = resultData.messages == null ? "":resultData.messages;
				
				html += '<tr><td class="middle-align">'+modifydate+'</td>'+
				'<td class="middle-align">'+department_name+'</td>'+
				'<td class="middle-align">'+fullname+'  '+tel+'</td>'+
				'<td class="middle-align">'+messages+'</td>';
				/* '<td class="middle-align">无效</td></tr>'; */
			}
		}
		$("#preciseRecord").append(html);
		page("preciseRecordPag",result.responseJSON.listJson.page,result.responseJSON.listJson.total,null,pageIndex,flag);
	}
	
	function queryOperationRecordForList(pageIndex,flag){
		$("#operationRecord").empty();
		var postParameter = new Object();
		var requestParameter = new Object();
		var pageInfo = new Object();
		pageInfo.page = pageIndex;
		requestParameter.fhId = $("#fhId").val();
		postParameter.pageInfo = pageInfo;
		postParameter.requestParameter = requestParameter;
		var dataJson = JSON.stringify(postParameter);
		var url = "<%=basePath%>/services/houseService/queryOperationRecordForList";
		var result = $.ajax({
			url : url,
			type : "POST",
			data : dataJson,
			contentType : "application/json;charset=UTF-8",
			dataType : "json",
			async : false
		});
		
		var resultArr = result.responseJSON.listJson.gridModel;
		var index = result.responseJSON.listJson.page;
		var html = "";
		if(null == resultArr || typeof(resultArr) == "undefined"){
			
		}else{
			for(var i=0;i<resultArr.length;i++){
				var obj = resultArr[i];
				var fullname = obj.fullname == null ? "":obj.fullname;
				var department_name = obj.department_name == null ? "":obj.department_name;
				var tel = obj.tel == null ? "":obj.tel;
				var message = obj.message == null ? "":obj.message;
			 	 html +='<tr><td>'+((index-1)*10+i+1)+'</h4></td>'+
				'<td>'+fullname+'</td>'+
				'<td>'+department_name+'</td>'+
				'<td>'+tel+'</td>'+
				'<td>'+message+'</td>'+
				'<td>'+obj.operatedate+'</td></tr>';
			}
		}
		$("#operationRecord").append(html);
		page("operationRecordPag",result.responseJSON.listJson.page,result.responseJSON.listJson.total,null,pageIndex,flag);
	}
	
	function queryContractForList(type){
		if($("#dealStyle").val() != type){
			$("#dealStyle").val(type);
		}
		$("#contractList").empty();
		var postParameter = new Object();
		var requestParameter = new Object();
		var pageInfo = new Object();
		pageInfo.page = 1;
		requestParameter.fhId = $("#fhId").val();
		requestParameter.type = type;
		requestParameter.pageInfo = pageInfo;
		postParameter.requestParameter = requestParameter;
		var dataJson = JSON.stringify(postParameter);
		var url = "<%=basePath%>/services/houseService/queryContractForList";
		var result = $.ajax({
			url : url,
			type : "POST",
			data : dataJson,
			contentType : "application/json;charset=UTF-8",
			dataType : "json",
			async : false
		});
		
		var resultArr = result.responseJSON.listJson.gridModel;
		var index = result.responseJSON.listJson.page;
		var html = "";
		if(null == resultArr || typeof(resultArr) == "undefined"){
			
		}else{
			for(var i=0;i<resultArr.length;i++){
				var obj = resultArr[i];
				var housesourceid  = obj.housesourceid == null ? "":obj.housesourceid;
				var contractnumber = obj.contractnumber == null ? "":obj.contractnumber;
				var buyerpaycommissionamount = obj.buyerpaycommissionamount == null ? "":obj.buyerpaycommissionamount;
				var sellername = obj.sellername == null ? "":obj.sellername;
				var buyername = obj.buyername == null ? "":obj.buyername;
				var buyertel = obj.buyertel == null ? "":obj.buyertel;
				var source = obj.source == null ? "":obj.source;
			 	 html +='<tr><td>'+housesourceid+'</td>'+
				'<td class="middle-align text-center">'+contractnumber+'</td>'+
				'<td class="middle-align text-center">'+obj.contractdate+'</td>'+
				'<td class="middle-align text-center">'+buyerpaycommissionamount+'</td>'+
				'<td class="middle-align text-center">'+sellername+'</td>'+
				'<td class="middle-align text-center">'+buyername+'</td>'+
				'<td class="middle-align text-center">'+buyertel+'</td>'+
				'<td class="middle-align text-center">'+source+'</td>'+
				'</tr>';
			}
		}
		$("#contractList").append(html);
	}
	
	function queryCoreMessageList(pageIndex,flag){
<<<<<<< HEAD
		if($("#cflag").val() == 'A'){
			alert("该楼盘不属于你自己的A盘,不可以查看核心信息");
			return;
		}
		if($("#cflag").val() == 'X'){
			openModal_3();
			return;
		}
=======
		if($("#flag").val() == "false"){
			alert("该楼盘不属于你自己的A盘,不可以查看核心信息");
			return;
		}
>>>>>>> aa6433be91419cf20278114adc5d4e74917df3a7
		$("#coreMessageList").empty();
		var postParameter = new Object();
		var requestParameter = new Object();
		var pageInfo = new Object();
		pageInfo.page = pageIndex;
		requestParameter.fhId = $("#fhId").val();
		postParameter.pageInfo = pageInfo;
		postParameter.requestParameter = requestParameter;
		var dataJson = JSON.stringify(postParameter);
		var url = "<%=basePath%>/services/houseService/queryCoreMessageList";
		var result = $.ajax({
			url : url,
			type : "POST",
			data : dataJson,
			contentType : "application/json;charset=UTF-8",
			dataType : "json",
			async : false
		});
		
		var resultArr = result.responseJSON.listJson.gridModel;
		var index = result.responseJSON.listJson.page;
		var html = "";
		if(null == resultArr || typeof(resultArr) == "undefined"){
			
		}else{
			for(var i=0;i<resultArr.length;i++){
				var obj = resultArr[i];
				var username = obj.username == null ? "":obj.username;
				var userphone = obj.userphone == null ? "":obj.userphone;
				var lp_name = obj.lp_name == null ? "":obj.lp_name;
				var d_name = obj.d_name == null ? "":obj.d_name;
				var dy_name = obj.dy_name == null ? "":obj.dy_name;
				var fanghao = obj.fanghao == null ? "":obj.fanghao;
				var address = obj.address == null ? "":obj.address;
				
			 	 html +='<tr><td class="middle-align text-center">'+obj.createdate+'</td>'+
				'<td class="middle-align text-center">'+lp_name+'</td>'+
				'<td class="middle-align text-center">'+d_name+'</td>'+
				'<td class="middle-align text-center">'+dy_name+'</td>'+
				'<td class="middle-align text-center">'+fanghao+'</td>'+
				'<td class="middle-align text-center">'+address+'</td>'+
				'<td class="middle-align text-center">'+username+'</td>'+
				'<td class="middle-align text-center">'+userphone+'</td>'+
				'<td class="middle-align text-center">报表</td>'+
				'</tr>';
			}
		}
		$("#coreMessageList").append(html);
		page("coreMessageListPag",result.responseJSON.listJson.page,result.responseJSON.listJson.total,null,pageIndex,flag);
	}
	
	function openModal(pId){
		$("#fanghao").val(pId);
		queryOwnerInfo(1,3);
		jQuery('#modal_1').modal('show', {backdrop: 'fade'});
	}
	
	function openModal_2(){
		queryCoreMessageList(1,1);
		jQuery('#modal_2').modal('show', {backdrop: 'fade'});
	}
	
<<<<<<< HEAD
	function openModal_3(){
		var html = "独家限时代卖人信息<br>";
		html += "姓名："+$("#cfullname").val()+"<br>性别："+$("#csex").val()+"<br>联系电话："+$("#ctel").val();
		$("#cdetail").append(html);
		jQuery('#modal_3').modal('show', {backdrop: 'fade'});
	}
	
=======
>>>>>>> aa6433be91419cf20278114adc5d4e74917df3a7
	function disCheckBox(id,type){
		$("#"+id+" input[type="+type+"]").attr("disabled","disabled");
	}
	
	function page(paginationId,page,total,historyPageIndex,pageIndex,flag){
		var paginationHtml = '<div style="float:right;" id="paginationId">' +
		'<input id="pageNum" name="pageNum" type="hidden" value="10">'+
		'<div id="macPageWidget"></div>' +
		'<div class="clearfix"></div>'+
		'<div class="clear"></div>'+
	 	'</div>';
		
		if(flag == 1){
			$("#paginationId").remove();
		}
	 	
	 	if($("#paginationId").length == 0){
	 		$("#"+paginationId).append(paginationHtml);
	 	}
	    // 分页.
		$('#macPageWidget').html(pagination(page, total));
	 	bindPageEvent(paginationId);
	    // 分页高亮.
		if(historyPageIndex==undefined || historyPageIndex==null){
			historyPageIndex = 1;
		}
		$("#macPageWidget li a[pagenum='"+pageIndex+"']").addClass("pageOpen");
	}
	
	var historyPageIndex;
	function bindPageEvent(func){
		var links = $("#macPageWidget li").find("a");
		$.each(links, function(i, link1){
			var link = $(link1);
			var pageNum = link.attr("pageNum");
			link.click(function(){
				jumpPage(pageNum,func);
			});
		});
	}
	
	function jumpPage(pageNum,func){
	    if(func == "operationRecordPag"){
	    	queryOperationRecordForList(pageNum,0);
		}else if(func == "ownerListInfoPag"){
			queryOwnerInfo(pageNum,0);
		}else if(func == "preciseRecordPag"){
			queryPreciseRecordForList(pageNum,0);
		}else if(func == "coreMessageListPag"){
			queryCoreMessageList(pageNum,0);
		}
	}
</script>
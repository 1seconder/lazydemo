<%@page language="java"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*,com.newenv.communityFocus.vo.UserLogin,com.newenv.communityFocus.security.SecurityUserHolder"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
         + request.getServerName() + ":" + request.getServerPort()+ path;
String bmsUrl = SecurityUserHolder.getConfig().getBmsUrl();
String jmbjrUrl = SecurityUserHolder.getConfig().getJmbjrUrl();
%>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta name="description" content="Xenon Boostrap Admin Panel" />
		<meta name="author" content="" />
		<title>楼盘精耕</title>
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
		<script type="text/javascript">var basepath = "<%=basePath%>";</script>
		<script  src="<%=basePath%>/js/jquery-1.11.1.min.js"></script>
		<script src="<%=basePath%>/js/page.js"></script>
		
		<script type="text/javascript">
		
		var fanghao  ;
		var houseType ;
		var housenumber ;
		var saleOrRentId ;
		var houseSourceId ;
		var type;
		var fangyuan;
		var fangyuanStr;
		
		var i = "${fn:length(fhList)}";
		var fanghaoid;
		var idx = ${idx};
		var arr = new Array;
		function prev(){
			if(idx == 0){
				$("#next").removeClass("btn btn-gray");
				$("#next").addClass("btn btn-success");
				$("#prev").removeClass("btn btn-success");
				$("#prev").addClass("btn btn-gray");
				return
			}
			idx = idx -1;
			fanghaoid = arr[idx];
			window.location.href = "<%=basePath%>/services/refineService/mainPage/2/"+fanghaoid+"/"+idx;
		}
		
		function next(){
			if(idx+1 >= arr.length){
				$("#prev").removeClass("btn btn-gray");
				$("#prev").addClass("btn btn-success");
				$("#next").removeClass("btn btn-success");
				$("#next").addClass("btn btn-gray");
				//alert(idx)
				//alert("已经是最后一个异常房屋")
				return
			}
			
			idx = idx + 1;
			fanghaoid = arr[idx];
			window.location.href ="<%=basePath%>/services/refineService/mainPage/2/"+fanghaoid+"/"+idx;
		}
		
		jQuery(document).ready(function($) {
			if("0"==i && ${businessType} == 2){
				$("#panel_weihu").hide();
				$("#right_weihu").hide();
				
			}else{
				<c:forEach items="${fhList}" var="myList" >  
					arr.push(${myList.fhid});
				</c:forEach>
			 	fanghaoid = arr[idx];
			 	console.log(fanghaoid);
			}
		})
		var houseType;
		jQuery(document).ready(function($) {
			type= ${businessType};
			var loginType = ${loginType} ;
			if( loginType == 3 || loginType == 2){
				$("#jgcontent option[value='1']").hide();
			}else if(loginType == 1){
// 				$("#jgcontent option[value='0']").hide();
// 				$("#jgcontent option[value='2']").hide();
// 				$("#jgcontent option[value='3']").hide();
// 				$("#jgcontent option[value='4']").hide();
				
				$("#fw_save").hide();
				$("#jjr_save").hide();
				$("#tel_save").hide();
				$("#competition_save").hide();
			}
			
			if(loginType == 1){
				$("#jgcontent").val(1);
				$("#jgcontent").attr("disabled","disabled");
				$("#weituoid").hide();
				
				$("#jc_jibenxinxi").hide();
				$("#jc_shanquanjinli").show();
				$("#jc_yezujinli").hide();
				$("#jc_dianhuagenjin").hide();
				$("#jc_duishougenjin").hide();
				sqlist();//商圈经理经纪人业主
			}
			
			
			if(type == 1){
				fanghao = "${jb.fanghao}";
				var v ="${jb.fanghaoid}";
				$("#loupan").html('<option value="${jb.lpid}">${jb.lpname}</option>');
				$("#building").html('<option value="${jb.dong}">${jb.dong}</option>');
				$("#danyuan").html('<option value="${jb.danyuan}">${jb.danyuan}</option>');
				$("#fanghao").html('<option value="${jb.fhid}">${jb.fanghao}</option>');
			
// 				$("#danyuan").val('"'+danyuan+'"');
			}else {
				//l.id lpid ,lp_name lpname ,d.id dongid, lpd_name dong,dy.id dyid, dy_name danyuan,f.id fhid , fanghao
				$("#loupan").val("${jb.lpid}");
				$("#building").html('<option value="${jb.dong}">${jb.dong}</option>');
				$("#danyuan").html('<option value="${jb.dyid}">${jb.danyuan}</option>');
				$("#fanghao").html('<option value="${jb.fhid}">${jb.fanghao}</option>');
				if(loginType == 3){
					$("#jgcontent").val(0);
				}
			}
			hidefh();
			
		})
		function hidefh(){
			$("#loupan").attr("disabled","disabled")
			$("#building").attr("disabled","disabled")
			$("#danyuan").attr("disabled","disabled")
			$("#fanghao").attr("disabled","disabled")
		}
<%-- 		var basepath = "<%=basePath%>"; --%>
		function zushouselect()
		{

		}
		</script>
		<script  src="<%=basePath%>/js/services.js"></script>
		<script  src="<%=basePath%>/js/syscs.js"></script>
		<script  src="<%=basePath%>/js/jinggeng/jinggeng.js"></script>
		<script type="text/javascript" src="<%=basePath%>/js/zui/js/zui.min.js"></script>
<%-- 		<script src="<%=basePath%>/js/doc.js"></script> --%>
		<script src="<%=basePath%>/js/common/common.js"></script>
		<script src="<%=basePath%>/js/jinggeng/jiechouqi.js"></script>
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
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
			    min-width: 95px;
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
			.tabs-vertical-env .tab-content{ padding: 15px 30px;}
			.height800{max-height: 800px;  overflow-y: auto;}

		</style>
	</head>

	<body class="page-body">
		<input type="hidden" id="bmsUrl" value="<%=bmsUrl%>"/>
		<input type="hidden" id="jmbjrUrl" value="<%=jmbjrUrl%>"/>
		<div class="page-container">
			<!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->

			<!-- Add "fixed" class to make the sidebar fixed always to the browser viewport. -->
			<!-- Adding class "toggle-others" will keep only one menu item open at a time. -->
			<!-- Adding class "collapsed" collapse sidebar root elements and show only icons. -->
			<div class="main-content">
				<!-- User Info, Notifications and Menu Bar -->
				<div class="page-title">

					<div class="breadcrumb-env pull-left">
						<ol class="breadcrumb bc-1">
							<li>
								<a href="#"><i class="fa-home"></i>首页</a>
							</li>
							<li class="active">
								<a href="小区列表.html">批量精耕</a>
							</li>
						</ol>
					</div>
				</div>
				<div class="panel row" id="excepDiv">
					<div class="pull-left" style=" font-size: 24px; padding-left: 25px;" id="excepCotent">
						待处理精耕异常总共<span class="red">${fhList.size()}</span>户
					</div>
					<div class="col-lg-6 pull-right text-right" id="right_weihu">
						<button class="btn btn-gray"	style="padding: 3px 12px !important;  margin-top: 3px; margin-bottom: 5px;" id="prev" onclick="prev()">上一个</button>
						<button class="btn btn-success" style="padding: 3px 12px !important;  margin-top: 3px; margin-bottom: 5px;" id="next" onclick="next()">下一个</button>
<!-- 						<button class="btn btn-success" style="padding: 3px 12px !important;  margin-top: 3px; margin-bottom: 5px;" id="skip" onclick="skip()">跳过</button> -->
					</div>
				</div>
				
				<div class="panel " id="panel_weihu">
						<div class="col-md-12" style="padding-bottom: 20px;">
							<div class="panel-body" style="padding-top:0px;">
								<div class="col-sm-4 col-md-3 col-lg-2" style="padding-left: 0px;">
									<div class="input-group input-group-sm input-group-minimal">
										<span class="input-group-addon">
											楼盘：
										</span>
										<select class="form-control s2example" id="loupan" onchange="selectDong(this.value)">
											<c:forEach items="${fhList}" var="myList" >  
												<option value="${myList.lpid }">${myList.lpname}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-sm-4 col-md-2 col-lg-2">
									<div class="input-group input-group-sm input-group-minimal">
										<span class="input-group-addon">
											栋：
										</span>
										<select class="form-control s2example" id="building" onchange="selectDy(this.value)">
											<option value="0">全部</option>
											
<%-- 											<c:forEach items="${dList}" var="myList" >   --%>
<%-- 												<option value="${myList.id }">${myList.lpname}</option> --%>
<%-- 											</c:forEach> --%>
										</select>
									</div>
								</div>
								<div class="col-sm-4 col-md-2 col-lg-2">
									<div class="input-group input-group-sm input-group-minimal">
										<span class="input-group-addon">
											单元：
										</span>
										<select class="form-control s2example" id="danyuan" onchange="selectFh(this.value)">
											<option value="0">全部</option>
<%-- 											<c:forEach items="${dyList}" var="myList" >   --%>
<%-- 												<option value="${myList.id }">${myList.dyname}</option> --%>
<%-- 											</c:forEach> --%>
										</select>
									</div>
								</div>
								<div class="col-sm-4 col-md-3 col-lg-2">
									<div class="input-group input-group-sm input-group-minimal">
										<span class="input-group-addon">
											房号：
										</span>
										<select class="form-control s2example" id="fanghao" onchange="loadQuery()">
											<option value="0">全部</option>
<%-- 											<c:forEach items="${fhList}" var="myList" >   --%>
<%-- 												<option value="${myList.id }">${myList.fanghao}</option> --%>
<%-- 											</c:forEach> --%>
										</select>
									</div>
								</div>
								
								
							</div>
						</div>
					<div class="col-md-12 " >
								<div class="tabs-vertical-env tabs-vertical-bordered"><!-- add class "right-aligned" for the right aligned tabs -->
									<ul class="nav tabs-vertical" id="tabUlId">
										<li class="active" id="home"><a href="#v4-home" data-toggle="tab" >接触期</a></li>
										<li><a href="#v4-profile" data-toggle="tab" id="weituoid">委托期</a></li>
										<li id="identify_needs"><a href="#v4-identify_needs" data-toggle="tab" onclick="queryProvinceList();queryCityList(2);">了解需求</a></li> 
										<li id="customers_look"><a href="#v4-home" data-toggle="tab" >客户带看</a></li> 
										<li id="contract_negotiation"><a href="#v4-home" data-toggle="tab" >合同洽谈</a></li> 
									</ul>
									<div class="tab-content">
										<div class="tab-pane active" id="v4-home">
											<div class="row text-right" style="padding-bottom: 20px;">
												<div class="col-sm-4 col-md-4 col-lg-3 pull-left">
													<div class="input-group input-group-sm input-group-minimal">
														<span class="input-group-addon">
															精耕内容：
														</span>
														<select class="form-control" id="jgcontent" onchange="jiecujingen(this)">
															<option value="0">基本信息</option>
															<option value="1">商圈经理业主信息维护</option>
															<option value="2">经纪人业主信息维护</option>
															<option value="3">电话跟进</option>
															<option value="4">竞争对手跟进</option>
														</select>
													</div>
												</div>
											</div>

											<c:if  test="${businessType==1}">
												<script type="text/javascript"> 
													$("#excepDiv").hide();
												</script>
												<jsp:include page="./jiechouqi/fwinfo.jsp"/> 
											</c:if>
											<c:if  test="${businessType==2}">
												<jsp:include page="./jiechouqi/fwinfo.jsp"/> 
											</c:if>
											
											<!--商圈经理业主信息维护-->
											<jsp:include page="./jiechouqi/sq_info.jsp"/> 
											<!--经纪人业主信息维护-->
											<jsp:include page="./jiechouqi/jjrinfo.jsp"/> 
											<!--电话跟进-->
											<jsp:include page="./jiechouqi/phone.jsp"/> 
											<!--竞争对手跟进-->
											<jsp:include page="./jiechouqi/competition.jsp"/> 
										
										</div>
										<div class="tab-pane" id="v4-profile">
											<div class="row text-right" style="padding-bottom: 20px;">
												<div class="col-sm-4 col-md-4 col-lg-3 pull-left">
													<div class="input-group input-group-sm input-group-minimal">
														<span class="input-group-addon">
															精耕内容：
														</span>
														<select class="form-control" id = "xzjgneiron" onchange="xzjgneiron(this)">
															<option value="">请选择精耕内容</option>
															<option value="0">房源</option>
															<option value="1">钥匙</option>
															<option value="2">房堪</option>
															<option value="3">独家限时</option>
														</select>
													</div>
												</div>
												<div class="col-sm-4 col-md-2 col-lg-3 pull-left">
													<div class="input-group input-group-sm input-group-minimal">
															<span class="input-group-addon">
																需求：
															</span>
																<select class="form-control" id="fangyuanxuqiu" onchange="gaibianzushou(this.value)" >
																	<option value="0" >租售类型</option>
																	<option value="1" >售</option>
																	<option value="2" >租</option>
																</select>
														</div>
													</div>
												<div class="col-sm-4 col-md-4 col-lg-4" id="weituofanyuango" style="display: none">
																<div class="form-group">
																	<div class="input-group input-group-sm input-group-minimal">
																		<span class="input-group-addon">
																			用途：
																		</span>
																		<select class="form-control" id="yongtu1" onchange="fangyuan(this.value)">
																			<option value="0">房屋用途</option>
																		</select>
																	</div>
																</div>
															</div>
											</div>
											<!--委托房源-->
											<div class="panel" id="weituofanyuan">
												<div class="panel-heading" style="display:none">
													<h3 class="panel-title">房间还未在系统进行房源委托，您可以进行委托【
														<a id="fangyuango" href="javascript:void(0)">
															<i class="fa-print"></i>
															<span style="color:red">点击开始房源委托</span></a>】，抢占先机。</h3>
													<iframe id="fangyuango2" name="fangyuango2" style="display:none" border=0 frameborder=0 framespacing=0 height=1600 marginheight=0 marginwidth=0 name=manager scrolling="NO" noresize src=""; width=1200 vspale="0"></iframe>
												</div>
<!-- 												<div class="panel-body"> -->
<!-- 													<div class="form-group"> -->
<!-- 														<div class="row"> -->
<!-- 															<div class="col-sm-4 col-md-4 col-lg-3"> -->
<!-- 																<div class="form-group"> -->
<!-- 																	<div class="input-group input-group-sm input-group-minimal"> -->
<!-- 																		<span class="input-group-addon"> -->
<!-- 																			用途： -->
<!-- 																		</span> -->
<!-- 																		<select class="form-control" id="yongtu1" onchange="fangyuan(this.value)"> -->
<!-- 																			<option value="0">房屋用途</option> -->
<!-- 																		</select> -->
<!-- 																	</div> -->
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 															<button class="btn btn-secondary btn-icon btn-icon-standalone" style="padding: 0px !important;"> -->
<!-- 																<a href="javascript:void(0)" id="fangyuango"> -->
<!-- 																<i class="fa-print"></i> -->
<!-- 																<span>下一步</span></a> -->
<!-- 															</button> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</div> -->
											</div>
											<!--委托期钥匙-->
											<div class="panel" id="weituoyaoshi" style="display: none;" >
												<div class="panel-heading">
													<h3 class="panel-title">该房间还未在系统进行添加钥匙，您可以进行钥匙添加【
														<a id="yaoshigo" href="javascript:void(0)">
															<i class="fa-print"></i>
															<span style="color:red">点击开始钥匙委托</span></a>】，抢占先机。</h3></br>
															<iframe style="display:none" id="yaoshigo2" name="yaoshigo2"  border=0 frameborder=0 framespacing=0 height=380 marginheight=0 marginwidth=0 name=manager scrolling="NO" noresize src=""; width=600 vspale="0"></iframe>
															
<!-- 													<button class="btn btn-secondary btn-icon btn-icon-standalone" style="padding: 0px !important;"> -->
<!-- 														<a id="yaoshigo" href="javascript:void(0)"> -->
<!-- 															<i class="fa-print"></i> -->
<!-- 															<span>下一步</span></a> -->
<!-- 													</button> -->
												</div>
<!-- 												<div class="panel-body" > -->
<!-- 													<div class="form-group"> -->
<!-- 														<div class="row"> -->
<!-- 															<button class="btn btn-secondary btn-icon btn-icon-standalone" style="padding: 0px !important;"> -->
<!-- 																<i class="fa-print"></i> -->
<!-- 																<span><a id="yaoshigo" href="javascript:void(0)">下一步</a></span> -->
<!-- 															</button> -->
<!-- 														</div> -->
														
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 												<div class="panel-heading" style="display: none;"> -->
<!-- 													<h3 class="panel-title">钥匙登记</h3> -->
<!-- 												</div> -->
											</div>
											<!--委托期房堪-->
											<div class="panel" id="weituoqifankan" style="display: none;">
												<div class="panel-heading">
													<h3 class="panel-title" >房间还未在系统进行房堪录入，您可以进行房堪录入【
														<a id="fangkango"  href="javascript:void(0)">
															<i class="fa-print"></i>
															<span style="color:red">点击开始房堪委托</span></a>】，抢占先机。</h3>
														<iframe style="display:none" id="fangkango2"  name="fangkango2"  border=0 frameborder=0 framespacing=0 height=600 marginheight=0 marginwidth=0 name=manager scrolling="NO" noresize src=""; width=600 vspale="0"></iframe>
												</div>
<!-- 												<div class="panel-body"> -->
<!-- 													<div class="form-group"> -->
<!-- 														<div class="row"> -->
<!-- 															<button class="btn btn-secondary btn-icon btn-icon-standalone" style="padding: 0px !important;"> -->
<!-- 																<a  href="javascript:void(0)" id="fangkango"><i class="fa-print"></i> -->
<!-- 																<span>下一步</span></a> -->
<!-- 															</button> -->
<!-- 														</div> -->
														
<!-- 													</div> -->
<!-- 												</div> -->
											</div>
											<!--委托期独家-->
											<div class="panel" id="weituodujia" style="display: none;">
												<div class="panel-heading" >
													<h3 class="panel-title" >房间还未在系统进行独家委托，您可以进行独家委托【
														<a id="weituodujiago" >
															<i class="fa-print"></i>
															<span style="color:red">点击开始独家委托</span></a>】，抢占先机。</h3>
															
															<iframe style="display:none" id="weituodujiago2" name="weituodujiago2"  border=0 frameborder=0 framespacing=0 height=1100 marginheight=0 marginwidth=0 name=manager scrolling="NO" noresize src=""; width=800 vspale="0"></iframe>
<!-- 													<button class="btn btn-secondary btn-icon btn-icon-standalone" style="padding: 0px !important;"> -->
<!-- 														<a id="weituodujiago" href="javascript:void(0)"> -->
<!-- 														<i class="fa-print"></i> -->
<!-- 														<span>下一步</span></a> -->
<!-- 													</button> -->
												</div>
<!-- 												<div class="panel-body"> -->
<!-- 													<div class="form-group"> -->
<!-- 														<div class="row"> -->
<!-- 															<button class="btn btn-secondary btn-icon btn-icon-standalone" style="padding: 0px !important;"> -->
<!-- 																<i class="fa-print"></i> -->
<!-- 																<a href="houseExclusive!addExclusiveInput.action?houseType=1&houseSourceId=956798&saleOrRentId=275335&param.houseSourceNumber=HS16032800001&param.salingAmount=55555.00"><span>下一步</span></a> -->
<!-- 															</button> -->
<!-- 														</div> -->
														
<!-- 													</div> -->
<!-- 												</div> -->
											</div>
										</div>
										
										<!-- 理财需求 -->
										<jsp:include page="./acquaintance/finance.jsp"/>
										<div class="tab-pane" id="v4-settings">
											<div class="row text-right" style="padding-bottom: 20px;">
												<div class="col-sm-4 col-md-4 col-lg-3 pull-right">
													<div class="input-group input-group-sm input-group-minimal">
														<span class="input-group-addon">
															栋座：
														</span>
														<select class="form-control s2example">
															<option>楼盘名称</option>
															<option>楼盘名称</option>
															<option>楼盘名称</option>
															<option>楼盘名称</option>
															<option>楼盘名称</option>
														</select>
													</div>
												</div>
												<div class="col-sm-4 col-md-4 col-lg-3 pull-right">
													<div class="input-group input-group-sm input-group-minimal">
														<span class="input-group-addon">
															单元：
														</span>
														<select class="form-control s2example">
															<option>楼盘名称</option>
															<option>楼盘名称</option>
															<option>楼盘名称</option>
															<option>楼盘名称</option>
															<option>楼盘名称</option>
														</select>
													</div>
												</div>
											</div>
										</div>
									</div>
									
								</div>	
							
							</div>
					<div style="clear: both;"></div>
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
<script  src="<%=basePath%>/assets/js/bootstrap.min.js"></script>
<script  src="<%=basePath%>/assets/js/TweenMax.min.js"></script>
<script  src="<%=basePath%>/assets/js/resizeable.js"></script>
<script  src="<%=basePath%>/assets/js/joinable.js"></script>
<script  src="<%=basePath%>/assets/js/xenon-api.js"></script>
<script  src="<%=basePath%>/assets/js/xenon-toggles.js"></script>
<script  src="<%=basePath%>/assets/js/moment.min.js"></script>

<!-- Imported scripts on this page -->
<link rel="stylesheet" href="<%=basePath%>/assets/js/daterangepicker/daterangepicker-bs3.css">
<link rel="stylesheet" href="<%=basePath%>/assets/js/select2/select2.css">
<link rel="stylesheet" href="<%=basePath%>/assets/js/select2/select2-bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>/assets/js/multiselect/css/multi-select.css">
<script  src="<%=basePath%>/assets/js/rwd-table/js/rwd-table.js"></script>
<script  src="<%=basePath%>/assets/js/daterangepicker/daterangepicker.js"></script>
<script  src="<%=basePath%>/assets/js/datepicker/bootstrap-datepicker.js"></script>
<script  src="<%=basePath%>/assets/js/timepicker/bootstrap-timepicker.min.js"></script>
<script  src="<%=basePath%>/assets/js/colorpicker/bootstrap-colorpicker.min.js"></script>
<script  src="<%=basePath%>/assets/js/select2/select2.min.js"></script>
<script  src="<%=basePath%>/assets/js/xenon-custom.js"></script>

<link rel="stylesheet" href="<%=basePath%>/assets/js/datepicker/bootstrap-datetimepicker.min.css">
<!-- Imported scripts on this page  xiala-->
<script type="text/javascript"  src="<%=basePath%>/assets/js/datepicker/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript"  src="<%=basePath%>/assets/js/datepicker/bootstrap-datetimepicker.zh-CN.js"></script>
<script  src="<%=basePath%>/assets/js/xenon-custom.js"></script>

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
	
	function gaibianzushou(value)
	{
		if(value==0)
		{
			$("#weituofanyuango").hide();
			$("#weituofanyuan").hide();
			return;
		}else
		{
			$("#weituofanyuango").show();
			$("#weituofanyuan").show();
			houseType=value;
			fangyuan($("#yongtu1").val());
		}
	}
	
	function checkStage(){
		var stage = 0;
		$("#tabUlId").find("li").each(function(){
			var id = $(this).attr("id");
			if($(this).attr("class") == "active"){
				if(id == "home"){
					stage = 1;
				}else if(id == "customers_look"){
					stage = 2;
				}else if(id == "contract_negotiation"){
					stage = 3;
				}
			}
		})
		return stage;
	}
	
	function xzjgneiron(obj){
		var urlSelect="";
		houseType=$("#fangyuanxuqiu").val();
		if($(obj).val()=="")
		{
<%--			$("#xzjgneiron").val(0);--%>
<%--			xzjgneiron($("#xzjgneiron"));--%>
			return;
		}
		if($(obj).val()==0)
		{
			$("#weituoyaoshi").hide();
			$("#weituoqifankan").hide();
			$("#weituodujia").hide();
			$("#weituofanyuan").hide();
			var url = basepath + "/services/traceServices/isWeiTuoFangyuan/"+fanghao+"/"+houseType;
			$.ajax({ 
				url:url ,
				dataType: "json", 
				type: "GET",
//					async : false,
				data : {"name" : fanghao},
				success: function(data){
					$("#weituofanyuan").show();
					$("#fangyuango2").parent().css("display","none");

					if(null != data && data.length>0)
					{
						if(data.length>=2)
						{
							$("#weituofanyuan").html("<h3 style='color:red'>房源已进行委托</h3>");
							$("#fangyuango2").parent().css("display","none");
							return;
						}else if(data.length<2 && data.zushou =="租")
						{
							$("#weituofanyuan").html("<h3 style='color:red'>房源已进行租委托，您可以进入售委托。</h3>");
							$("#weituofanyuango").show();
							$("#fangyuanxuqiu").val(2);
							$("#fangyuanxuqiu").attr("disabled","disabled");
							return;
						}else if(data.length<2 && data.zushou =="售"){
							$("#weituofanyuan").html("<h3 style='color:red'>房源已进行售委托，您可以进入租委托。</h3>");
							$("#weituofanyuango").show();
							$("#fangyuanxuqiu").val(1);
							$("#fangyuanxuqiu").attr("disabled","disabled");
							
							return;
						}
						fangyuan = data;
						fanghao  =fangyuan.fanghao;
						houseType  =fangyuan.houseType;
						housenumber  =fangyuan.housenumber;
						saleOrRentId  =fangyuan.saleOrRentId;
						houseSourceId  =fangyuan.houseSourceId;
						
					}else
					{
						$("#fangyuanxuqiu").show();
<%--						alert(JSON.stringify(data));--%>
// 						urlSelect = BMS_URL + "saveHouseKey!initHouseKey.action?houseType=2&houseSourceId=956800&saleOrRentId=450802&housenumber=HR16032900001";
// 						js = "javascript:parent.refreshTab('房源委托','"+urlSelect+"')";
// 						$("#fangyuango2").attr("href",urlSelect);
					}
					fangyuanStr = JSON.stringify(data);
			    }
			});

		}
		else if($(obj).val()==1)
		{
// 			fangyuan=[];
// 			var fangyuan2 = {};
// 			fangyuan2.zushou = data.zushou;
// 			fangyuan2.fanghaoid = data.fanghaoid;
// 			fangyuan2.fanghao = data.fanghao;
// 			fangyuan2.houseSourceId = data.houseSourceId;
// 			fangyuan2.saleOrRentId = data.saleOrRentId;
// 			fangyuan2.houseTypeid = data.houseTypeid;
// 			fangyuan2.housenumber = data.housenumber;
// 			fangyuan2.houseType = data.houseType;
// 			fangyuan2.KeyID = data.KeyID;
// 			fangyuan2.SurveyID = data.SurveyID;
// 			fangyuan2.DelegateID = data.DelegateID;
// 			fangyuan.push(fangyuan2);
			if(null == fangyuanStr || fangyuanStr =="" || fangyuanStr =="undefined" || fangyuanStr =="[]" || fangyuanStr.length <=2 ){
				alert("房源不存在,请先录入房源.")
				return false;
			}
				$("#weituofanyuan").hide();
				$("#weituoqifankan").hide();
				$("#weituodujia").hide();
				$("#weituoyaoshi").hide();
				$("#weituofanyuango").hide();
				
				$("#weituoyaoshi").show();
				if(null != fangyuan && fangyuan.length>0 && fangyuan.KeyID =="undefined")
				{
					$("#weituoyaoshi").html("<h3 style='color:red'>钥匙已进行委托</h3>");
				}else
				{
					urlSelect = $("#bmsUrl").val() + "saveHouseKey!initHouseKey.action?houseType="+houseType+"&houseSourceId="+houseSourceId+"&saleOrRentId="+saleOrRentId+"&housenumber="+housenumber;
					js = "javascript:parent.refreshTab('钥匙委托','"+urlSelect+"')";
					$("#yaoshigo2").attr("src",urlSelect);
				}
				
				$("#yaoshigo").click(function(){
					$("#yaoshigo2").css("display","block");
				});
		}
		else if($(obj).val()==2)
		{
	
			if(null == fangyuanStr || fangyuanStr =="" || fangyuanStr =="undefined" || fangyuanStr =="[]" || fangyuanStr.length <=2 ){
				alert("房源不存在,请先录入房源.")
				return false;
			}
					$("#weituofanyuan").hide();
					$("#weituoyaoshi").hide();
					$("#weituodujia").hide();
					$("#weituoqifankan").hide();
					$("#weituofanyuango").hide();
					
					$("#weituoqifankan").show();
					if(fangyuan.SurveyID =="undefined")
					{
						$("#weituoqifankan").html("<h3 style='color:red'>已有房堪</h3>");	
					}else
					{
						urlSelect = $("#bmsUrl").val() + "houseSurvey!addInput.action?houseType="+houseType+"&houseSourceId="+houseSourceId+"&saleOrRentId="+saleOrRentId;
						js = "javascript:parent.refreshTab('房堪委托','"+urlSelect+"')";
						$("#fangkango2").attr("src",urlSelect);
					}
		
					$("#fangkango").click(function(){
						$("#fangkango2").css("display","block");
					});
		}
		else if($(obj).val()==3)
		{
			if(null == fangyuanStr || fangyuanStr =="" || fangyuanStr =="undefined" || fangyuanStr =="[]" || fangyuanStr.length <=2 ){
				alert("房源不存在,请先录入房源.")
				return false;
			}
					
				$("#weituofanyuan").hide();
				$("#weituoyaoshi").hide();
				$("#weituoqifankan").hide();
				$("#weituodujia").hide();
				$("#weituofanyuango").hide();
				
				$("#weituodujia").show();
				if(fangyuan.DelegateID =="undefined")
				{
					$("#weituodujia").html("<h3 style='color:red'>已独家委托</h3>");
				}else
				{
					urlSelect = $("#bmsUrl").val() + "houseExclusive!addExclusiveInput.action?houseType="+houseType+"&houseSourceId="+houseSourceId+"&saleOrRentId="+saleOrRentId+"&param.houseSourceNumber="+housenumber;
					// 	urlSelect = BMS_URL + "houseExclusive!addExclusiveInput.action?houseType=1&houseSourceId=956798&saleOrRentId=275335&param.houseSourceNumber=HS16032800001&param.salingAmount=55555.00";
					js = "javascript:parent.refreshTab('独家限时','"+urlSelect+"')";
					$("#weituodujiago2").attr("src",urlSelect);
				}
				
				$("#weituodujiago").click(function(){
					$("#weituodujiago2").css("display","block");
				});
		}
	}
	function jiecujingen(obj){
		if($(obj).val()==0)
		{
			$("#jc_jibenxinxi").show();
			$("#jc_shanquanjinli").hide();
			$("#jc_yezujinli").hide();
			$("#jc_dianhuagenjin").hide();
			$("#jc_duishougenjin").hide();
			
			fwdetail();//
		}
		else if($(obj).val()==1)
		{
			$("#jc_jibenxinxi").hide();
			$("#jc_shanquanjinli").show();
			$("#jc_yezujinli").hide();
			$("#jc_dianhuagenjin").hide();
			$("#jc_duishougenjin").hide();
			
			sqlist();//商圈经理经纪人业主
		}
		else if($(obj).val()==2)
		{
			$("#jc_jibenxinxi").hide();
			$("#jc_shanquanjinli").hide();
			$("#jc_yezujinli").show();
			$("#jc_dianhuagenjin").hide();
			$("#jc_duishougenjin").hide();
			
			jjryezhu();//经纪人业主
			
			
		}
		else if($(obj).val()==3)
		{
			$("#jc_jibenxinxi").hide();
			$("#jc_shanquanjinli").hide();
			$("#jc_yezujinli").hide();
			$("#jc_dianhuagenjin").show();
			$("#jc_duishougenjin").hide();
			
			telfollow();
		}
		else if($(obj).val()==4)
		{
			$("#jc_jibenxinxi").hide();
			$("#jc_shanquanjinli").hide();
			$("#jc_yezujinli").hide();
			$("#jc_dianhuagenjin").hide();
			$("#jc_duishougenjin").show();
			
			competitionfollw();
		}
	}
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
<div class="modal fade" id="Fenpai" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
				<h4 class="modal-title">分派</h4>
			</div>
			<div class="modal-body">
				<div class="table-responsive">
					<table class="table">
						<tbody class="middle-align">
							<tr>
								<td colspan="2">楼盘名称：爵世名邸 </td>
							</tr>
							<tr>
								<td colspan="2" class="red">确定分派0条房源？</td>
							</tr>
							<tr>
								<td width="130">选择接收店组： </td>
								<td>
									<select class="form-control s2example">
										<option>请选择接收店组</option>
									</select>
								</td>
							</tr>
							<tr>
								<td width="130">选择接收经纪人： </td>
								<td>
									<select class="form-control s2example">
										<option>请选择接受经纪人</option>
									</select>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-info">保存</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>

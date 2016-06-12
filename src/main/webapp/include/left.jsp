<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@page import="com.newenv.communityFocus.security.SecurityUserHolder,com.newenv.communityFocus.vo.UserLogin"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/communityFocus";
UserLogin userLogin = SecurityUserHolder.getCurrentUserLogin();
%>
	<div class="sidebar-menu-inner">
					<header class="logo-env">
						<!-- logo -->
						<div class="logo">
							<a href="#" class="logo-expanded">
								<img src="<%=path%>/assets/images/logo@2x.png" width="80" alt="">
							</a>

							<a href="#" class="logo-collapsed">
								<img src="<%=path%>/assets/images/logo-collapsed@2x.png" width="40" alt="">
							</a>
						</div>
						<!-- This will toggle the mobile menu and will be visible only on mobile devices -->
						<div class="mobile-menu-toggle visible-xs">
							<a href="javascript:void(0)" data-toggle="user-info-menu">
								<i class="fa-bell-o"></i>
								<span class="badge badge-success">7</span>
							</a>
							<a href="javascript:void(0)" data-toggle="mobile-menu">
								<i class="fa-bars"></i>
							</a>
						</div>
					</header>
					<ul id="main-menu" class="main-menu">
						<!-- add class "multiple-expanded" to allow multiple submenus to open -->
						<!-- class "auto-inherit-active-class" will automatically add "active" class for parent elements who are marked already with class "active" -->
						<li>
							<a href="javascript:parent.refreshTab('首页','<%=path%>/console/ver.jsp')"  class="menuitem"><i class="linecons-cog"></i>首页</a>
						</li>
						<li>
							<a style="display:none">
								<i class="linecons-cog"></i>
								<span class="title">首页</span>
							</a>
						</li>
						<%if(userLogin.hasPermission("分派")){%>
						<li class='${param.p=="fp"?"opened":""}'>
							<a href="javascript:void(0)">
								<i class="linecons-desktop"></i>
								<span class="title">分派</span>
							</a>
							<ul>
								<%if(userLogin.hasPermission("分派(主营盘)")){%>
								<li class='${param.k=="fpzyp"?"active ":""}'>
									<a href="<%=basePath%>/services/assignService/fenpai/2?k=fpzyp&p=fp" class="menuitem">
										<span class="title">分派(主营盘)</span>
									</a>
								</li>
								<%} %>
								<%if(userLogin.hasPermission("分派(组对盘,人对户)")){%>
								<li class='${param.k=="fpzdp"?"active ":""}'>
									<a href="<%=basePath%>/services/assignService/fenpai/1?k=fpzdp&p=fp" class="menuitem">
										<span class="title">分派(组对盘,人对户)</span>
									</a>
								</li>
								<%} %>
								<%if(userLogin.hasPermission("分派(责任盘)")){%>
								<li class='${param.k=="fpzrp"?"active ":""}'>
									<a href="<%=basePath%>/services/assignService/fenpai/3?k=fpzrp&p=fp" class="menuitem">
										<span class="title">分派(责任盘)</span>
									</a>
								</li>
								<%} %>
							</ul>
						</li>
						<%} %>

					<!-- 精耕  -->
					<%if(userLogin.hasPermission("精耕")){%>
						<li class='${param.p=="jg"?"opened":""}'>
							<a href="javascript:void(0)">
								<i class="linecons-desktop"></i>
								<span class="title">精耕</span>
							</a>
							<ul>
								<%if(userLogin.hasPermission("销控管理")){%>
								<li class='${param.k=="xkgl"?"active ":""}'>
									<a href="<%=basePath%>/services/sellControl/initPoint/?k=xkgl&p=jg" class="menuitem">
										<span class="title">销控管理</span>
									</a>
								</li>
								<%} %>
								<%if(userLogin.hasPermission("销控管理")){%>
								<li class='${param.k=="yzjg"?"active ":""}'>
									<a href="<%=basePath%>/services/traceServices/initTrace/?k=yzjg&p=jg" class="menuitem">
										<span class="title">业主精耕</span>
									</a>
								</li>
								<%} %>
								
								<%if(userLogin.hasPermission("销控管理")){%>
								<li class='${param.k=="pljg"?"active ":""}'>
									<a href="<%=basePath%>/services/refineService/mainPage/2/-1/0?k=pljg&p=jg" class="menuitem">
										<span class="title">批量精耕</span>
									</a>
								</li>
								<%} %>
								
								<%if(userLogin.hasPermission("精耕审核")){%>
								<li class='${param.k=="jgsh"?"active ":""}'>
									<a href="<%=basePath%>/services/houseService/houseChecked?k=jgsh&p=jg" class="menuitem">
										<span class="title">精耕审核</span>
									</a>
								</li>
								<%} %>
								
							</ul>
						</li>
					<%} %>
					<!-- 商圈统计  -->
					<%if(userLogin.hasPermission("商圈统计")){%>
						<li class='${param.p=="sqtj"?"opened":""}'>
							<a href="javascript:void(0)">
								<i class="linecons-desktop"></i>
								<span class="title">商圈统计</span>
							</a>
							<ul>
								<%if(userLogin.hasPermission("市占率")){%>
								<li class='${param.k=="szl"?"active ":""}'>
									<a href="<%=basePath%>/services/sqtjServices/forwardToSqtj/?k=szl&p=sqtj" class="menuitem">
										<span class="title">市占率</span>
									</a>
								</li>
								<%} %>
							</ul>
						</li>
					<%} %>
				</div>
	<script type="text/javascript">

	</script>
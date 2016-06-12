﻿<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*,com.newenv.communityFocus.security.SecurityUserHolder,com.newenv.communityFocus.vo.UserLogin,org.nutz.dao.entity.Record"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ page isELIgnored="false"%>
<%
  String path = request.getContextPath(); 
//  List<Record> titles = request.getAttribute("titles");
 UserLogin userLogin = SecurityUserHolder.getCurrentUserLogin();
 String username = userLogin.getUserLogin().getUsername();
 String departmentName = userLogin.getDepartment().getDepartmentName();
 String titleName = userLogin.getTitleName();
 String logoutUrl = SecurityUserHolder.getConfig().getLogoutUrl();
%>
				<nav class="navbar user-info-navbar" role="navigation">
					<!-- Left links for user info navbar -->
					<ul class="user-info-menu left-links list-inline list-unstyled">
						<li class="hidden-sm hidden-xs">
							<a href="#" data-toggle="sidebar">
								<i class="fa-bars"></i>
							</a>
						</li>
					</ul>
					<input type="hidden" id = "username" value="<%=username%>"/>
					<input type="hidden" id = "titleName" value="<%=titleName%>"/>
					<!-- Right links for user info navbar -->
					<ul class="user-info-menu right-links list-inline list-unstyled">

						<li class="dropdown user-profile">
								<i class="fa-reorder"></i>
								<select id="selectList" onchange="changTitle(this.value,this)" class="fa-info" style="border: 1px rgb(255, 255, 255) solid;padding: 12px;">
<%-- 									<option selected=""><%=titleName%></option> --%>
									<c:forEach items="${titles}" var="title" varStatus="list1">
										<option value="${title.cityDepId}">${title.cityDepName}</option>
									</c:forEach>
								</select>
						</li>

						<li class="dropdown user-profile">
							<a href="#" data-toggle="dropdown">
								<img src="<%=path%>/assets/images/user-4.png" alt="user-image" class="img-circle img-inline userpic-32" width="28" />
								<span><%=username%>&nbsp;&nbsp;<%=departmentName%>&nbsp;&nbsp;<i class="fa-angle-down"></i>
							</span>
							</a>
							<ul class="dropdown-menu user-profile-menu list-unstyled">
								<li>
									<a href="javascript:void(0)">
										<i class="fa-info"></i> 帮助
									</a>
								</li>
								<li class="last">
									<!-- <a href="<=path%>/loginOut.action">
										<i class="fa-lock"></i> 注销
									</a> -->
									<a href="<%=logoutUrl %>">
										<i class="fa-lock"></i> 注销
									</a>
								</li>
<!-- 									&url=http://192.168.1.83:8084/communityFocus/sec/fedservlet -->
							</ul>
						</li>

					</ul>

				</nav>
				


<script type="text/javascript">
    $(function(){
		$("#selectList option").each(function(){
            if ($(this).text() == $("#titleName").val()) {
				$(this).attr("selected", "selected");
			}
		});
    });
    
	function changTitle(id,obj){
// 		alert(id+"||"+$(obj).find("option:selected").text());

		var name = $(obj).find("option:selected").text();
// 		var url = basepath + "/services/sellControl/updateTitle/cityDepId/"+id+"/cityDepName/"+name;
		var url = basepath + "/services/sellControl/updateTitle/cityDepId/"+id;

			$.ajax({ 
				url:url ,
				dataType: "json", 
				type: "GET",
//				async : false,
// 				data : {"name" : name},
				success: function(data){
					window.location.href=basepath+"/services/securityUserHolder/login/"+$("#username").val()+"/changeRole";
// 					alert(data);
// 					var cHtml = '<option value="0">请选择</option>';
// 					$.each(data, function(i,n){
// 						cHtml += '<option value="'+n.id+'">'+n.name+'</option>';
// 					});
// 					$("#" + buildDIV).html(cHtml);
			    }
			});
	}
</script>
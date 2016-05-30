<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%
    String path2 = request.getContextPath();
    String basePath2 = request.getScheme() + "://"
             + request.getServerName() + ":" + request.getServerPort()+ path2;
 %>
<!--精耕模块--基本信息-->
<div class="panel" id="jc_jibenxinxi">
	<div class="panel-heading">
		<h3 class="panel-title">基本信息</h3>
	</div>
	<div class="panel-body">
		<div class="col-md-12 col-sm-12">
			<div class="form-group">
				<div class="input-group input-group-minimal">
					<span class="input-group-addon red" >房屋名称：</span>
					<select class="form-control" id="lpid" disabled="disabled">
						<option value="${jb.lpid }">${jb.lpname }</option>
					</select>
					<span class="input-group-addon">-</span>
					<select class="form-control" id="dongid" disabled="disabled">
						<option value="${jb.dongid }">${jb.dong }栋</option>
					</select>
					<span class="input-group-addon">-</span>
					<select class="form-control" id="dyid" disabled="disabled">
						<option value="${jb.dyid }">${jb.danyuan}单元</option>
					</select>
					<span class="input-group-addon">-</span>
					<select class="form-control" id="fhid" disabled="disabled">
						<option value="${jb.fhid }">房号:${jb.fanghao}</option>
					</select>
				</div>
			</div>
		</div>
		<div class="col-md-12 col-sm-12">
			<div class="form-group">
				<div class="input-group input-group-minimal">
					<span class="input-group-addon red">户型：</span>
					<select class="form-control" name="shi" id="shi" disabled="disabled">
						<option>${jb.shi }室</option>
					</select>
					<span class="input-group-addon">-</span>
					<select class="form-control" id="shi" value="${jb.shi }" disabled="disabled">
						<option>${jb.ting }厅</option>
					</select>
					<span class="input-group-addon">-</span>
					<select class="form-control" id="chu" value="${jb.shi }" disabled="disabled">
						<option>${jb.chu }厨</option>
					</select>
					<span class="input-group-addon">-</span>
					<select class="form-control" id="wei" value="${jb.shi }" disabled="disabled">
						<option>${jb.wei }卫</option>
					</select>
					<span class="input-group-addon">-</span>
					<select class="form-control" id="yangtai" value="${jb.shi }" disabled="disabled">
						<option>${jb.yang }阳台</option>
					</select>
				</div>
			</div>
		</div>
		<div class="col-md-12 col-sm-12">
			<div class="form-group">
				<div class="input-group input-group-minimal">
					<span class="input-group-addon red">区域范围：</span>
					<select class="form-control" id="city"  disabled="disabled">
						<option value="${jb.cityid }">${jb.cityname }</option> 
					</select>
					<span class="input-group-addon">-</span>
					<select class="form-control" id="qy" disabled="disabled">
						<option value="${jb.stressid }">${jb.qyname }</option>
					</select>
					<span class="input-group-addon">-</span>
					<select class="form-control" id="sq"  disabled="disabled">
						<option value="${jb.sq_id }">${jb.sqname }</option>
					</select>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-3">
			<div class="form-group">
				<div class="input-group input-group-sm input-group-minimal">
					<span class="input-group-addon">
						用途：
					</span>
					<select class="form-control" id="purpose" >
						<c:forEach items="${yt}" var="myList" varStatus="list1">  
							<option value="${myList.id}">${myList.name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-3">
			<div class="form-group">
				<div class="input-group input-group-sm input-group-minimal">
					<span class="input-group-addon">
						朝向：
					</span>
					<select class="form-control" id="direction" >
						<c:forEach items="${dir}" var="myList" varStatus="list1">  
							<option value="${myList.id }">${myList.name }</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-3">
			<div class="form-group">
				<div class="input-group input-group-sm input-group-minimal">
					<span class="input-group-addon">
						市场地址：
					</span>
					<input class="form-control" type="text"  id="marketAddress" value="${fw.marketAddress}">
<%-- 					<c:if test="${!empty fw.marketAddress}"> --%>
<%-- 						<input class="form-control" type="text"  id="marketAddress" value="${fw.marketAddress}"> --%>
<%-- 					</c:if> --%>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-3">
			<div class="form-group">
				<div class="input-group input-group-sm input-group-minimal">
					<span class="input-group-addon">
						国土性质：
					</span>
					<select class="form-control" id="territoryInfo" >
						<c:forEach items="${gtu }" var ="myObj">
							<option value="${myObj.id }">${myObj.name}</option>
						</c:forEach>
					</select>
<%-- 					<input class="form-control" type="text" id="territoryinfo" value="${fw.territoryInfo }"> --%>
				</div>	
			</div>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-3">
			<div class="form-group">
				<div class="input-group input-group-sm input-group-minimal">
					<span class="input-group-addon">
						权属性质：
					</span>
					<select class="form-control" id="propertyInfo" >
						<c:forEach items="${rl}" var="myList" varStatus="list1">  
								<option value ="${myList.id}">${myList.name}</option>
						</c:forEach>	
					</select>
<%-- 					<input class="form-control" type="text"  id="propertyInfo" value="${fw.propertyInfo }"> --%>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-3">
			<div class="form-group">
				<div class="input-group input-group-sm input-group-minimal">
					<span class="input-group-addon">
						产权编码：
					</span>
					<input class="form-control" type="text" id="propertyNumber" value="${fw.propertyNumber }">
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-3">
			<div class="form-group">
				<div class="input-group input-group-sm input-group-minimal">
					<span class="input-group-addon">
						产权面积：
					</span>
					<input class="form-control" type="text" id="propertySize" name="propertySize" value="${fw.propertySize  }">
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-3">
			<div class="form-group">
				<div class="input-group input-group-sm input-group-minimal">
					<span class="input-group-addon">
						使用面积：
					</span>
					<input class="form-control" type="text" id="innerSize" name="innerSize" value="${fw.innerSize  }">
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-3">
			<div class="form-group">
				<div class="input-group input-group-sm input-group-minimal">
					<span class="input-group-addon">
						产权年限：
					</span>
					<input class="form-control" type="text" id="propertyAge" value="${fw.propertyAge  }">
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-3">
			<div class="form-group">
				<div class="input-group input-group-sm input-group-minimal">
					<span class="input-group-addon">
						备案号：
					</span>
					<input class="form-control" type="text"  id="codes" value="${fw.codes  }" >
				</div>
			</div>
		</div>
	
		<div class="clearfix"></div>
	</div>
	<button class="btn btn-secondary btn-icon btn-icon-standalone" id="fw_save" style="padding: 0px !important; margin-top: 10px;">
		<i class="fa-print"></i>
		<span onclick="save()">保存</span>
	</button>
</div>

<script type="text/javascript">
// 	$(document).ready(function() {
// 		loadQuery();
		
// 	});
</script>
<script>
$(document).ready(function() {
	loadQuery();
	
});

function save(){
	var house = new Object(); 
	house.marketAddress = $("#marketAddress").val();
	house.territoryInfo = $("#territoryInfo").val();
	house.propertyNumber = $("#propertyNumber").val();
	house.propertySize = $("#propertySize").val();
	house.innerSize = $("#innerSize").val();
	house.propertyAge = $("#propertyAge").val();
	house.facility = $("#facility").val();	
	house.propertyInfo = $("#propertyInfo").val();
	house.direction = $("#direction").val();
	house.purpose = $("#purpose").val();
	house.codes = $("#codes").val();
	
	
	house.lpid = $("#lpid").val();
	house.dzid = $("#dongid").val();
	house.dyid = $("#dyid").val();
	house.fhid = $("#fanghao").val();
	house.stage = checkStage();
	
	var fhid = house.fhid;
	//house.fhid = 915;
	///house = $('#jc_jibenxinxi').serialize();
	var dataJson =  JSON.stringify(house);
	var result = $.ajax({
		url: "<%=basePath2%>/services/refineService/saveFwBasicInfo",
		type : "POST",
		dataType : "json",
		data : dataJson ,
		contentType : "application/json;charset=UTF-8",
		async : false
	})
	if(result.status == 200){
		alert("保存成功");
		window.location.href = "<%=basePath2%>/services/refineService/mainPage/2/" + fhid  +"/" + idx;
	}
}
</script>
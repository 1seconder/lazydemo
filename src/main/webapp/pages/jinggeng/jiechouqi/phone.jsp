<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<div class="panel" id="jc_dianhuagenjin" style="display: none;">
	<div class="panel-heading">
		<h3 class="panel-title">电话跟进</h3>
	</div>
	<div class="panel-body">
		<div class="form-group">
			<div class="row">
				<div class="col-sm-4 col-md-4 col-lg-3">
					<div class="form-group">
						<div class="input-group input-group-sm input-group-minimal">
							<span class="input-group-addon">
								关系：
							</span>
							<select class="form-control s2example" id="relationship">
									<option value="850">本人</option>
				                        <option value="851">父母</option>
				                        <option value="852">授权委托人</option>
				                        <option value="853">配偶</option>
				                        <option value="854">亲戚</option>
				                        <option value="855">朋友</option>
							</select>
						</div>
					</div>
				</div>
				<div class="col-sm-4 col-md-4 col-lg-3">
					<div class="form-group">
						<div class="input-group input-group-sm input-group-minimal">
							<span class="input-group-addon" >
								电话号码：
							</span>
							<input class="form-control" type="text" id="phone_tel">
						</div>
					</div>
				</div>
				<div class="col-sm-4 col-md-4 col-lg-3">
					<div class="form-group">
						<div class="input-group input-group-sm input-group-minimal">
							<span class="input-group-addon">
								跟进内容：
							</span>
							<select class="form-control" id="content" >
								<option value="1">对方意向不明确</option>
								<option value="2">对方没意向</option>
								<option value="3">约定下次见面</option>
<!-- 								<option value="3">内容4</option> -->
<!-- 								<option value="4">内容5</option> -->
							</select>
						</div>
					</div>
				</div>
				<div class="col-md-12 col-sm-12">
					<div class="form-group">
						<div class="input-group input-group-minimal">
							<span class="input-group-addon">备注：</span>
							<textarea class="form-control" id="follw_remark"></textarea>
						</div>
					</div>
				</div>
			</div>
			<button class="btn btn-secondary btn-icon btn-icon-standalone" id="tel_save" style="padding: 0px !important; margin-top: 10px;">
				<i class="fa-print"></i>
				<span onclick="savePhone()">确认</span>
			</button>
		</div>
	</div>
</div>

<script type="text/javascript">
function savePhone(){
		var params = new Object();
		params.fhid = $("#fanghao").val();
		params.relationship = $("#relationship").val();
		params.tel = $("#phone_tel").val();
		//params.remarks = $("#follow_content").val();//跟进内容
		params.relationtype = $("#relationtype").val();
		params.remarks = $("#follw_remark").val();
		params.contentType = $("#content").val();
		params.stage = checkStage();
		var dataJson = JSON.stringify(params);
		$.ajax({
			url: "<%=basePath%>/services/refineService/saveTelInfo",
			type : "POST",
			dataType : "json",
			data : dataJson ,
			contentType : "application/json;charset=UTF-8",
			async : false,
			success: function(data){
	 			alert("操作成功");
	 			window.location.href = "<%=basePath%>/services/refineService/mainPage/2/" + params.fhid  +"/" + idx;
	 		}
		})
	}
</script>											
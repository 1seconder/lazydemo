function getSyscsParamByName(name ,buildDIV){
	var url = basepath + "/services/syscsServices/syscs/name/"+name
	$.ajax({ 
		url:url ,
		dataType: "json", 
		type: "GET",
//		async : false,
		data : {"name" : name},
		success: function(data){
			var cHtml = '<option value="0">请选择</option>';
			$.each(data, function(i,n){
				cHtml += '<option value="'+n.id+'">'+n.name+'</option>';
			});
			$("#" + buildDIV).html(cHtml);
	    }
	});
};


function getSyscsParamByName2(name ,buildDIV){
	var url = basepath + "/services/syscsServices/syscs/name/"+name
	$.ajax({ 
		url:url ,
		dataType: "json", 
		type: "GET",
//		async : false,
		data : {"name" : name},
		success: function(data){
			var cHtml = '<option value="0">'+name+'不限</option>';
			$.each(data, function(i,n){
				cHtml += '<option value="'+n.id+'">'+n.name+'</option>';
			});
			$("#" + buildDIV).html(cHtml);
	    }
	});
};


function getSyscsParamById(sid ,buildDIV){
	$.ajax({ 
		url: basepath + "/cam/campus!getSyscs.action",
		dataType: "json", 
		type: "GET",
//		async : false,
		data : {"sid" : sid},
		success: function(data){
			var cHtml = '<option value="0">请选择</option>';
			$.each(data, function(i,n){
				cHtml += '<option value="'+n.id+'">'+n.name+'</option>';
			});
			$("#" + buildDIV).html(cHtml);
	    }
	});
};

function queryBM(divHtml)
{
//	$("#"+number).parent().find("div a span").eq(0).html("请选择店组");
//	$("#tixing"+number).css("display","none");
	var url = basepath + "/services/syscsServices/queryBM/city/"+cityid+"/user/"+userid;
	$.ajax({
		url:url,
		data:{"city":"1111","name":"2222name"},
		dataType:"json",
		type:"GET",
		async:true,
		success:function(result)
		{
			var pHtml = '<option value="0">请选择接收店组</option>';
			$.each(result, function(i,department){
				pHtml += '<option value="'+department.id+'">'+department.department_name+'</option>';
			});
			$("#"+divHtml).html(pHtml);
		}
		
	});
}


function queryBM2(divHtml)
{
	$("#"+divHtml).parent().find("div a span").eq(0).html("请选择店组");
//	$("#tixing"+number).css("display","none");
	var url = basepath + "/services/syscsServices/queryBM/city/1/"
	$.ajax({
		url:url,
		data:{"city":"1111"},
		dataType:"json",
		type:"GET",
		async:true,
		success:function(result)
		{
			var pHtml = '<option value="0">请选择接收店组</option>';
			$.each(result, function(i,department){
				pHtml += '<option value="'+department.id+'">'+department.department_name+'</option>';
			});
			$("#"+divHtml).html(pHtml);
		}
		
	});
}


function queryBMJL(departmentId,divHtml)
{
	$("#"+divHtml).parent().find("div a span").eq(0).html("请选择接收经纪人");
	var url = basepath + "/services/syscsServices/queryBMJJ/departmentId/"+departmentId
	$.ajax({
		url:url,
		data:{"departmentId":departmentId},
		dataType:"json",
		type:"GET",
		async:false,
		success:function(result)
		{
			var pHtml = '<option value="0">请选择接收经纪人</option>';
			$.each(result, function(i,n){
				pHtml += '<option value="'+n.id+'">'+n.fullname+'</option>';
			});
			$("#"+divHtml).html(pHtml);
		}
		
	});
}

//根据下标删除
Array.prototype.baoremove = function(dx) 
{ 
  if(isNaN(dx)||dx>this.length){return false;} 
  this.splice(dx,1); 
} 



Array.prototype.indexOf = function(val) {
  for (var i = 0; i < this.length; i++) {
      if (this[i] == val) return i;
  }
  return -1;
};
Array.prototype.remove = function(val) {
  var index = this.indexOf(val);
  if (index > -1) {
      this.splice(index, 1);
  }
};
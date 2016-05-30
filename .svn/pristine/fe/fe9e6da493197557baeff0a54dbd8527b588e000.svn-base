//js获取项目根路径，如： http://localhost:8083/uimcardprj
function getRootPath(){
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
    var curWwwPath=window.document.location.href;
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPaht=curWwwPath.substring(0,pos);
    //获取带"/"的项目名，如：/uimcardprj
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    return(localhostPaht+projectName);
}
function queryAllQuYuForList(){
	$("#stressSelect").empty();
	var url = getRootPath()+"/services/assignResponsiblePersonService/queryQuYuForList?cityId="+$("#loginUserCityId").val();
	var result = $.ajax({
		url : url,
		type : "GET",
		dataType : "json",
		contentType : "application/json;charset=UTF-8",
		async : false
	})
	var dataResult = result.responseJSON.result;
	var html = "<option value='hhh'>请选择区域</option>";
	for(var i=0;i<dataResult.length;i++){
		var data = dataResult[i];
		html += "<option value='"+data.id+"'>"+data.qy_name+"</option>"
	}
	$("#stressSelect").append(html);
}


function queryShangQuanForList(stressId){
	$("#shangQuanSelect-1").empty();
	var url = getRootPath()+"/services/assignResponsiblePersonService/queryShangQuanForList";
	var requestParameter = new Object();
	if(stressId == ""){
		stressId = $("#stressSelect option:selected").val();
	}
	if(stressId == "hhh"){
		var html ="<option value='hhh'>请选择商圈</option>";
		$("#shangQuanSelect-1").append(html);
		$('#shangQuanSelect-1').select2().select2('val', $('#shangQuanSelect-1 option:eq(0)').val());
		$('#buildingSelect-2').select2().select2('val', $('#buildingSelect-2 option:eq(0)').val());
		$('#buildingSelect-2').empty();
	}else{
		requestParameter.stressId = stressId;
		var dataJson = JSON.stringify(requestParameter);
		var result = $.ajax({
			url : url,
			data : dataJson,
			type : "POST",
			dataType : "json",
			contentType : "application/json;charset=UTF-8",
			async : false
		})
		var dataResult = $.parseJSON(result.responseText);
		var pre ="<option value='hhh'>请选择商圈</option>";
		var html = "";
		for(var i=0;i<dataResult.length;i++){
			var data = dataResult[i];
			html += "<option value='"+data.id+"'>"+data.sq_name+"</option>"
		}
		$("#shangQuanSelect-1").append(pre+html);
		$('#shangQuanSelect-1').select2().select2('val', $('#shangQuanSelect-1 option:eq(0)').val());
		$('#buildingSelect-2').select2().select2('val', $('#buildingSelect-2 option:eq(0)').val());
		$('#buildingSelect-2').empty();
	}
}

function queryBuildingForList(shangQuan){
	$("#buildingSelect-2").empty();
	var sqId = $("#"+shangQuan+" option:selected").val();
	if(sqId == "hhh"){
		var html ="<option value='hhh'>请选择楼盘</option>";
		$("#buildingSelect-2").append(html);
		$('#buildingSelect-2').select2().select2('val', $('#buildingSelect-2 option:eq(0)').val());
	}else{
		var url = getRootPath()+"/services/assignResponsiblePersonService/queryBuildingForList";
		var requestParameter = new Object();
		requestParameter.sqId = sqId;
		var dataJson = JSON.stringify(requestParameter);
		var result = $.ajax({
			url : url,
			data : dataJson,
			type : "POST",
			dataType : "json",
			contentType : "application/json;charset=UTF-8",
			async : false
		})
		var dataResult = $.parseJSON(result.responseText);
		var pre ="<option value='hhh'>请选择楼盘</option>";
		var html = "";
		for(var i=0;i<dataResult.length;i++){
			var data = dataResult[i];
			html += "<option value='"+data.id+"'>"+data.lp_name+"</option>"
		}
		$("#buildingSelect-2").append(pre+html);
		$('#buildingSelect-2').select2().select2('val', $('#buildingSelect-2 option:eq(0)').val());
	}
}


function queryDiv1(){
	var requestParameter = new Object();
	requestParameter.dateTime = $("#dateTimeId").val();
	var jsonData=requestParameter;
	var url = getRootPath()+"/services/sqtjServices/sqtjTopGridData/";
	$("#queryDiv1Page").asynPage(url, "#queryDiv1", queryList1, true, true, jsonData);
}

function queryList1(data){
	var cHtml="" ;
	$.each(data, function(i,n){
		var parentCounts = '0';
		if(typeof(n.parentcounts) != 'undefined'){
			parentCounts = n.parentcounts;
		}
		cHtml += '<tr><td class="middle-align text-center">' + n.counts +'</td><td class="middle-align text-center">' + parentCounts +'</td>';
		cHtml += '<td class="middle-align text-center">' + n.allcounts+'/'+ n.fdjcounts + '</td><td class="middle-align text-center">'+n.counts+ '/'+ n.allcounts +'</td>'  ;
		cHtml += '<td class="middle-align text-center">'+ n.counts+'/'+ n.fdjcounts + '</td></tr>';
	});
	$("#queryDiv1").html(cHtml);
}

function queryDiv2(){
	var requestParameter = new Object();
	var stressId = $("#stressSelect option:selected").val();
	var sqId = $("#shangQuanSelect-1 option:selected").val();
	var buildingId = $("#buildingSelect-2 option:selected").val();
	if(typeof(stressId) != "undefined" && stressId != "hhh"){
		requestParameter.stressId = stressId;
	}
	if(typeof(sqId) != "undefined" && sqId != "hhh"){
		requestParameter.sqId = sqId;
	}
	if(typeof(buildingId) != "undefined" && buildingId != "hhh"){
		requestParameter.buildingId = buildingId;
	}
	requestParameter.dateTime = $("#dateTimeId").val();
	var jsonData=requestParameter;
	var url = getRootPath()+"/services/sqtjServices/sqtjBottomGridData/";
	$("#queryDiv2Page").asynPage(url, "#queryDiv2", queryList2, true, true, jsonData);
}

function queryList2(data){
	var cHtml="" ;
	$.each(data, function(i,n){
		cHtml += '<tr>';
		cHtml += '<td class="middle-align text-center">' + n.lp_name +'</td>';
		cHtml += '<td class="middle-align text-center">' + n.d3name +'</td>';
		cHtml += '<td class="middle-align text-center">' + n.d2name +'</td>';
		cHtml += '<td class="middle-align text-center">' + n.d1name +'</td>';
		cHtml += '<td class="middle-align text-center">' + n.counts +'</td>';
		cHtml += '<td class="middle-align text-center">' + n.xhjdealcount+'/'+ n.fdjcount + '</td>';
		cHtml += '<td class="middle-align text-center">' + n.counts+ '/'+ n.xhjdealcount +'</td>';
		cHtml += '<td class="middle-align text-center">' + n.counts+'/'+ n.fdjcount + '</td>';
		cHtml += '</tr>';
	});
	$("#queryDiv2").html(cHtml);
}

function queryLoad(){
	queryDiv1();
	loadReport();
	queryDiv2();
}

function exportData(){
	var stressId = null;
	var sqId = null;
	var buildingId = null;
	var dateTime = null;
	if(typeof($("#stressSelect option:selected").val()) != "undefined" && $("#stressSelect option:selected").val() != "hhh"){
		stressId = $("#stressSelect option:selected").val();
	}
	if(typeof($("#shangQuanSelect-1 option:selected").val()) != "undefined" && $("#shangQuanSelect-1 option:selected").val() != "hhh"){
		sqId = $("#shangQuanSelect-1 option:selected").val();
	}
	if(typeof($("#buildingSelect-2 option:selected").val()) != "undefined" && $("#buildingSelect-2 option:selected").val() != "hhh"){
		buildingId = $("#buildingSelect-2 option:selected").val();
	}
	if(typeof($("#dateTimeId").val()) != "undefined" && $("#dateTimeId").val() != ""){
		dateTime = $("#dateTimeId").val();
	}
	var flag = "export";
	var url = getRootPath()+"/services/sqtjServices/sqtjExportData/"+dateTime+"/"+stressId+"/"+sqId+"/"+buildingId+"/"+flag;
	location.href = url;
}

function loadReport(){
	var requestParameter = new Object();
	var stressId = $("#stressSelect option:selected").val();
	var sqId = $("#shangQuanSelect-1 option:selected").val();
	var buildingId = $("#buildingSelect-2 option:selected").val();
	if(typeof(stressId) != "undefined" && stressId != "hhh"){
		requestParameter.stressId = stressId;
	}
	if(typeof(sqId) != "undefined" && sqId != "hhh"){
		requestParameter.sqId = sqId;
	}
	if(typeof(buildingId) != "undefined" && buildingId != "hhh"){
		requestParameter.buildingId = buildingId;
	}
	requestParameter.dateTime = $("#dateTimeId").val();
	var jsonData=requestParameter;
	var url = getRootPath()+"/services/sqtjServices/sqtjReportData/";
	$().asynPage(url, "", initReport, true, true, jsonData);
}

function initReport(data){
	var reportType = Number($("#reportType option:selected").val());
	var cHtml="" ;
	var arrayObj = new Array();
	var arrayObj1 = new Array();
	var arrayObj2 = new Array();
	$.each(data, function(i,n){
		arrayObj.push(n.lp_name);
		var lp1 = new Object();
		if(reportType == 1){
			lp1.value = n.counts;
		} else if(reportType == 2){
			if(Number(n.xhjdealcount)==0){
				lp1.value = 0;
			} else {
				lp1.value = parseFloat(Number(n.counts)/Number(n.xhjdealcount))*100;
			}
		} else if(reportType == 3){
			if(Number(n.fdjcount)==0){
				lp1.value = 0;
			} else {
				lp1.value = parseFloat(Number(n.counts)/Number(n.fdjcount))*100;
			}
		} else {
			lp1.value = n.counts;
		}
		lp1.name = n.lp_name;
		arrayObj1.push(lp1);
		var lp2 = new Object();
		var countsArr = new Array();
		countsArr.push(n.counts);
		countsArr.push(n.xhjparentcount);
		countsArr.push(n.fdjcount);
		lp2.type = 'bar';
		lp2.name = n.lp_name;
		lp2.data = countsArr;
		arrayObj2.push(lp2);
	});
	// 基于准备好的dom，初始化echarts实例
    var myChart1 = echarts.init(document.getElementById('reportData1'));
    
    // 指定图表的配置项和数据
	option = {
	    title : {
	        text: '楼盘成交数',
	        subtext: '',
	        x:'center'
	    },
	    tooltip : {
	        trigger: 'item',
	        formatter: "{a} <br/>{b} : {c} ({d}%)"
	    },
	    legend: {
	        orient: 'vertical',
	        left: 'left',
	        data:arrayObj
	    },
	    series : [
	        {
	            name: '成交数',
	            type: 'pie',
	            radius : '55%',
	            center: ['50%', '60%'],
	            data:arrayObj1,
	            itemStyle: {
	                emphasis: {
	                    shadowBlur: 10,
	                    shadowOffsetX: 0,
	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
	                }
	            }
	        }
	    ]
	};
    // 使用刚指定的配置项和数据显示图表。
    myChart1.setOption(option);
    
    var myChart2 = echarts.init(document.getElementById('reportData2'));
    
    option = {
   	    tooltip : {
   	        trigger: 'axis',
   	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
   	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
   	        }
   	    },
   	    legend: {
   	        data:arrayObj
   	    },
   	    grid: {
   	        left: '3%',
   	        right: '4%',
   	        bottom: '3%',
   	        containLabel: true
   	    },
   	    xAxis : [
   	        {
   	            type : 'category',
   	            data : ['成交套数','上一级成交套数','房地局成交套数']
   	        }
   	    ],
   	    yAxis : [
   	        {
   	            type : 'value'
   	        }
   	    ],
   	    series : arrayObj2
   	};
    myChart2.setOption(option);
}

function reloadReport(){
	loadReport();
}
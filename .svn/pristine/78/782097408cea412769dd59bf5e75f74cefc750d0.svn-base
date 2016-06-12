
var communityFocus = "http://192.168.3.101:8080/LPJG";


function getRootPath(){
    var curWwwPath=window.document.location.href;
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    var localhostPath=curWwwPath.substring(0,pos);
    var projectName= pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    return(localhostPath+projectName);
}


function selectDong(id){
	$.ajax({
		url: getRootPath()+ "/services/commonService/selectLd/"+id,
		dataType: "json", 
		type: "POST",
		async : false,
		success: function(data){
			var cHtml = '';
			var dyid;
			$.each(data, function(i,n){
				cHtml += '<option value="'+ n.id + '">'+n.ldname+'</option>';
			});
			$("#building").html(cHtml);
		}
	});
}

function selectDy(id){
	$.ajax({
		url: getRootPath()+ "/services/commonService/selectDy/"+id,
		dataType: "json", 
		type: "GET",
		async : false,
		success: function(data){
			var cHtml = '';
			var dyid;
			$.each(data, function(i,n){
				cHtml += '<option value="'+ n.id + '">'+n.dyname+'</option>';
			});
			$("#danyuan").html(cHtml);
		}
	});
}

function selectFh(id){
	$.ajax({
		url: getRootPath()+  "/services/commonService/selectFh/"+id,
		dataType: "json", 
		type: "GET",
		async : false,
		success: function(data){
			var cHtml = '';
			var dyid;
			$.each(data, function(i,n){
				cHtml += '<option value="'+ n.id + '">'+n.fanghao +'</option>';
			});
			$("#fanghao").html(cHtml);
		}
	});
}
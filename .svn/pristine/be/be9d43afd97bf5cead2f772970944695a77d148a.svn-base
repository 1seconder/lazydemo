function pager_gotoPage(pageNo) {
	document.pagerForm["pager.page"].value = pageNo;
//	$("form[name='pagerForm']").append("<input type='hidden' name='clickedTopMenuId' value='${param.clickedTopMenuId}'/>")
	loadPagination();
}

function pager_gotoCustPage() {
	var pageNo = $("#pager_txtPageNo").val();
	if (pageNo == "" || isNaN(pageNo)) {
		alert("页码无效，请重新输入！");
		$("#pager_txtPageNo").focus();
	} else {
		pager_gotoPage(pageNo)
	}
}

$("#pager_txtPageNo").keydown(function(e) {
	if (e.keyCode == 13) {
		pager_gotoCustPage();
	}
});

$(function() {
	$("[name='pagerForm']").submit(function() {
		document.pagerForm["pager.page"].value = 1;
		$("form[name='pagerForm']").append("<input type='hidden' name='clickedTopMenuId' value='${param.clickedTopMenuId}'/>")
	});
});

function showView(type){
	
};

function showPagerDatas(datas) {
	return "<tr></tr>";
}

var pagesLinkToShow = 3;
// 显示页码
function pagination(curPage, totalPage) {
	var sHtml = '<ul class="pager clearfix" style="list-style: none;">';
	if(curPage > 1) {
		sHtml += '<li class="pull-left previous" style="list-style: none;"><a href="javascript:void(0)" pageNum="1">首页</a></li>'
				+ '<li class="pull-left previous"><a href="javascript:void(0)" pageNum="'+(curPage - 1)+'">上一页</a></li>';
	}
	if(totalPage < 10) {
		for (var i = 1; i <= totalPage; i++) {
			sHtml += '<li ' + (i == curPage ? 'class="pull-left active"' : 'class="pull-left"')
					+ '><a href="javascript:void(0)" pageNum="' + i
					+ '">' + i + '</a></li>';
		}
	} else {
		if(curPage < 5) {
			for(var i = 1; i < 10; i++) {
				sHtml += '<li ' + (i == curPage ? 'class="pull-left active"' : 'class="pull-left"')
				+ '><a href="javascript:void(0)" pageNum="' + i
				+ '">' + i + '</a></li>';
            }
		} else if(totalPage - curPage < 4) {
	        for(var i = totalPage - 8; i <= totalPage; i++) {
	        	sHtml += '<li ' + (i == curPage ? 'class="pull-left active"' : 'class="pull-left"')
				+ '><a href="javascript:void(0)" pageNum="' + i
				+ '">' + i + '</a></li>';
	        }
		} else {
            for(var i = curPage - 4; i < curPage + 5; i++){
            	sHtml += '<li ' + (i == curPage ? 'class="pull-left active"' : 'class="pull-left"')
				+ '><a href="javascript:void(0)" pageNum="' + i
				+ '">' + i + '</a></li>';
            }  
        }  
	}
//	if (curPage + pagesLinkToShow < totalPage) {
//		sHtml += '<li class="previous"><a href="javascript:void(0)" data-toggle="pager" data-placement="top">...</a></li>';
//	}
	if(curPage < totalPage) {
		sHtml += '<li class="pull-left next"><a href="javascript:void(0)" pageNum="'+(curPage + 1)+'">下一页</a></li>'
			+ '<li class="pull-left next"><a href="javascript:void(0)" pageNum="'+ totalPage +'">尾页</a></li>';
	}
	sHtml +='<li class="pull-left mr10"><span>共 '+ totalPage + ' 页</span></li>';
	sHtml += '</ul>';
	return sHtml;
};

/* 为分页控件绑定事件 */  
var bindEvent = function(){  
    var links = $("#pagerLinks li").find("a");  
    $.each(links,function(i,link){
        var link = $(link);
        var pageNum = link.attr("pageNum");
        link.click(function(){
        	pager_gotoPage(pageNum);
        });
    });  
}
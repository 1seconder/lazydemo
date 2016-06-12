/* 
 * Page类 
 */  
function Page(pageNO,pageSize,totalData,totalPages){  
    this.pageNO = pageNO;  
    this.pageSize = pageSize;  
    this.totalData = totalData;  
    this.totalPages = totalPages;
}  
 
Page.prototype.setPageNO = function(pageNO){  
    this.pageNO = pageNO;  
}; 
Page.prototype.getPageNO = function(){
	if(this.pageNO<=0){
		return this.pageNO;
	}else{
		return this.pageNO;
	}
}; 
Page.prototype.setPageSize = function(pageSize){  
    this.pageSize = pageSize;  
};  
Page.prototype.getPageSize = function(){  
	if(this.pageSize<=0){
		return this.pageSize;
	}else{
		return this.pageSize;
	}
    return this.pageSize;  
};  
Page.prototype.setTotalData = function(totalData){  
    return this.totalData=totalData;  
};  
Page.prototype.getTotalData = function(){  
    return this.totalData;  
};  
Page.prototype.setTotalPages = function(totalPages){
	return this.totalPages=totalPages;  
}
Page.prototype.getTotalPages = function(){  
	if(this.totalData <=0){
		return 1;
	}else{
		return parseInt((this.totalData + this.pageSize - 1) / this.pageSize);
	}
};  

/* 
 * ===================AJAX异步分页================= 
 *  
 * 假设id为pageWidget的div是你放置分页控件的容器，则按如下形式调用： 
 * $("#pageWidget").asynPage("/user/findUser_asyn.action","#tbody",buildHtml,{"pageRowSize":10}); 
 * 参数说明： 
 * ------------Required----------- 
 * 参数一：请求URL 
 * 参数二：渲染结果集的页面容器 
 * 参数三：负责渲染结果集到页面的函数 
 * 参数四：参数(json对象)
 * 参数五： 是否使用分页
 * 参数六： 是否加载数据
 * ------------Optional-----------
 * 参数七(json对象)：
 * 属性pageRowSize:每页记录数(不配置，则默认为20) 
 * 属性param:请求参数(json格式) 
 */  
(function($){  
    var settings;  
    var page;  
    var paramStr;  
      
    $.fn.asynPage = function(url,contentContainer,buildHtml_fun,usePager,loadService,params,callerSettings,contentContainer1){  
      
        settings = $.extend({
            pageNo:1,
            pageSize:10,
            param:null,
            usePager:true,
            loadService:true
        },callerSettings||{});  
      
        settings.contentContainer = $(contentContainer);
        settings.contentContainer1 = $(contentContainer1);
        settings.url = url;
        settings.pageWidget = this;
        settings.param = params;
        settings.usePager = usePager;
        settings.loadService = loadService;
        settings.buildHtml_fun = buildHtml_fun;
          
        page = new Page(settings.pageNo,settings.pageSize);
          
        paramStr = makeParamStr(settings.param);
        if(loadService){
        	//开始获取数据  
        	fetchData(page.getPageNO());
        }else if(loadService==false && usePager){
        	//不加载数据，显示分页信息
        	page = new Page(1,10,0);  
        	buildPageWidget(page);//触发构建分页控件
        }
          
        return this;  
    };  
      
    /* 将json转换为请求参数字符串 */  
    var trunParamConfig2RequestParamStr = function(json){  
        var str = {};  
        var pageNo;
        var pageSize ;
        str = json;
      	str.pageInfo = {};
        for(key in json){  
        	if(key == 'pageNo'){
        		pageNo = json[key];
        		str.pageInfo.page= pageNo;
        		delete str.pageNo;
        	}else if(key == 'pageSize'){
        		pageSize = json[key];   
        		str.pageInfo.rows= pageSize;
        		delete str.pageSize;
        	}
        }  
        if(!pageNo){
        	str.pageInfo.page=settings.pageNo;
        }
        
        if(!pageSize){
        	str.pageInfo.rows= settings.pageSize;
        }
      	str =JSON.stringify(str);
      return str;  
    };  
      
    /* 将配置参数拼接为请求字符串 */  
    var makeParamStr = function(param_json){  
//        if(param_json==null){  
//            return "";  
//        }else{  
            return trunParamConfig2RequestParamStr(param_json);  
//        }  
    };  
      
    /*  
     * 负责获取后台数据，获取完毕后会触发构建分页控件 
     */  
    var fetchData = function(pageNo,isToPage){  
    	if(isToPage == true){
//        	settings.pageNo = 1;
        	//settings.pageSize = pageNo;
        	//settings.param.pageSize=pageNo;
//        	settings.param.pageNo=1;
        	settings.pageNo = 1;
        	settings.param.pageNo=1;

        } else{
        	settings.pageNo = pageNo;
        	//settings.pageSize = pageNo;
        	settings.param.pageNo=pageNo;  
        	//settings.param.pageSize=settings.pageSize;
        } 
        
        var data = trunParamConfig2RequestParamStr(settings.param);  
        $.ajax({  
            type :"POST",  
            dataType: "json",
            url : settings.url,
            async : false,
            contentType : "application/json; charset=utf-8",
            data :data,  
            success :function(datas){
        		var jsonData = eval(datas); 
                settings.contentContainer.empty();
                settings.contentContainer1.empty();
                settings.totalData = jsonData.listSize;  
				//OFBIZ改用-Pagination属性
                page = new Page(jsonData.page,jsonData.rows,jsonData.records);
                settings.buildHtml_fun(jsonData.gridModel,jsonData);
                if(settings.usePager){
                	buildPageWidget(page);//触发构建分页控件
                }
            },  
            error:function(xmlHttpRequest,textStatus,errorThrown){
                if(textStatus == "error"){  
                    var error = eval('('+xmlHttpRequest.responseText+')');  
                    alert("Sorry："+error.errorCode+"，"+error.message+"！");  
                }  
            }  
        });  
    };  
      
    var trunTargetPage = function(pageNum,isToPage){  
        fetchData(pageNum,isToPage);  
    }  
      
    /* 为分页控件绑定事件 */  
    var bindEvent = function(){  
        var links = settings.pageWidget.find("a");  
        $.each(links,function(i,link){  
            var link = $(link);  
            var pageNum = link.attr("pageNum");  
            var toPage = link.attr("toPage");
            link.click(function(){  
            	 //上一页或下一页不可用时pageNum=0
            	 if(pageNum && pageNum >0){
            		 trunTargetPage(pageNum,false);  
            	 }else if(toPage && toPage>0){
            		 trunTargetPage(toPage,true);
            	 }
            });
        });  
    }  
      
    /* 构建分页控件的具体算法实现 */  
    var buildPageWidget = function(page){  
          
        //构建分页控件前，先清理现有控件  
        settings.pageWidget.empty();  
        
        // 如果总数据条数小于等于10时，则不显示分页
        var totalDate = Number(page.getTotalData());
        var pageSize  = Number(page.getPageSize());
        var pageNo    = Number(page.getPageNO());
        
        settings.pageWidget.find(".pagination-centered").append("<input type='hidden' id='pageNo' value='"+pageNo+"'/>");
        settings.pageWidget.find(".pagination-centered").append("<input type='hidden' id='pageSize' value='"+pageSize+"'/>");
        settings.pageWidget.find(".pagination-centered").append("<input type='hidden' id='total' value='"+settings.totalData+"'/>");
        
        /*if(totalDate <= pageSize){
        	settings.pageWidget.append("<p>共有 "+totalDate+" 条数据，当前第 "+pageNo+" 页</p>"); 
        	return;
        }*/
        
        /* --------------- 下面开始进入真正的分页控件构建过程 -------------- */ 
        settings.pageWidget.append("<div class='pull-right' style=' line-height:32px; '>共有 <span id='totalid'>"+page.getTotalData()+"</span>条数据，当前第 "+pageNo+" 页</div>");  
        settings.pageWidget.append("<div class='pull-left'>");
        settings.pageWidget.find('div').next().append('<span class="pagination-centered pull-left"><ul class="pagination" style="margin:0px 0px 9px 0;"></ul></span>');
        /* --------------- 1.结束：构建描述信息（如“共？页，？条记录”） ----------------- */  
          
        /* --------------- 2.开始：构建“首页”和“上一页”控件 ------------- */  
        var pageNo = Number(page.getPageNO());  
        var totalPages = Number(page.getTotalPages());  
          
        if(pageNo==1){
            //如果你希望当前页是第一页的时候，也允许“首页”和“上一页”控件出现，则可以在这里进行补充  
        	settings.pageWidget.find("ul").append("<li class='disabled'><a id='' pageNum='0' href='javascript:void(0);' title='上一页' class='prev'>上一页</a></li>");  
        }else{  
            settings.pageWidget.find("ul").append("<li><a id='' pageNum='1' href='javascript:void(0);' title='首页' class='first'>首页</a></li>");  
            settings.pageWidget.find("ul").append("<li><a id='' pageNum='"+(pageNo-1)+"' href='javascript:void(0);' title='上一页' class='prev'>上一页</a></li>");  
        }  
        /* --------------- 2.结束：构建“首页”和“上一页”控件 ------------- */  
          
        /* --------------- 3.开始：构建分页数字控件 -------------- */  
        if(totalPages<10){  
            for(var i=1;i<=totalPages;i++){  
                if(i==pageNo){  
                    settings.pageWidget.find("ul").append("<li class='active'><a id='' pageNum='"+i+"' href='javascript:void(0);' title='' class='current'>"+i+"</a></li>");  
                }else{  
                    settings.pageWidget.find("ul").append("<li><a id='' pageNum='"+ i +"' href='javascript:void(0);' title='' class='pro-page' >"+ i +"</a></li>"); 
                }  
            }  
        //如果总页数>=10    
        }else{  
            //如果当前页小于5，则显示1-9项，且记忆当前项  
            if(pageNo<5){  
                for(var i =1;i<10;i++){  
                    if(i==pageNo){  
                        settings.pageWidget.find("ul").append("<li class='active'><a id='' pageNum='"+i+"' href='javascript:void(0);' title='' class='current'>"+i+"</a></li>");  
                    }else{  
                        settings.pageWidget.find("ul").append("<li><a id='' pageNum='"+i+"' href='javascript:void(0);' title='' class=''>"+i+"</a></li>");  
                    }  
                }  
            //如果当前页>=5，且总页数与当前页的差<4  
            }else if(totalPages-pageNo<4){  
                for(var i=totalPages-8;i<=totalPages;i++){  
                    if(i==pageNo){  
                        settings.pageWidget.find("ul").append("<li class='active'><a id='' pageNum='"+i+"' href='javascript:void(0);' title='' class='current'>"+i+"</a></li>");  
                    }else{  
                        settings.pageWidget.find("ul").append("<li><a id='' pageNum='"+i+"' href='javascript:void(0);' title='' class=''>"+i+"</a></li>");  
                    }  
                }  
            //如果当前页>=5，则显示围绕当前页的9项，且记忆当前项      
            }else{  
                for(var i=pageNo-4;i<pageNo+5;i++){  
                    if(i==pageNo){  
                        settings.pageWidget.find("ul").append("<li class='active'><a id='' pageNum='"+i+"' href='javascript:void(0);' title='' class='current'>"+i+"</a></li>");  
                    }else{  
                        settings.pageWidget.find("ul").append("<li><a id='' pageNum='"+i+"' href='javascript:void("+i+");' title='' class=''>"+i+"</a></li>");  
                    }  
                }  
            }  
        }  
        /* --------------- 3.结束：构建分页数字控件 -------------- */  
          
        /* --------------- 4.开始：构建“下一页”和“尾页”控件 ------------- */  
        if(totalPages==pageNo){
            //如果你希望当前页是最后一页的时候，也允许“尾页”和“下一页”控件出现，则可以在这里进行补充  
        	settings.pageWidget.find("ul").append("<li class='disabled'><a id='' pageNum='0' href='javascript:void(0);' title='下一页' class='next'>下一页</a></li>");  
        }else{
            settings.pageWidget.find("ul").append("<li><a id='' pageNum='"+(pageNo+1)+"' href='javascript:void(0);' title='下一页' class='next'>下一页</a></li>");  
            settings.pageWidget.find("ul").append("<li><a id='' pageNum='"+totalPages+"' href='javascript:void(0);' title='尾页' class='last'>尾页</a></li>");  
        } 
        /* --------------- 4.结束：构建“下一页”和“尾页”控件 ------------- */  
          
        settings.pageWidget.find('div').next().append('<span class="btn-group dropup pull-left">');
        /* --------------- 5构建 ------------- */  
        settings.pageWidget.find('span').next().append('<button class="btn dropdown-toggle" data-toggle="dropdown" style="padding:6px 12px !important">'+ pageSize +'<span class="caret"></span></button>');
        settings.pageWidget.find('span').next().append('<ul class="dropdown-menu" style="min-width:50px;z-index:99"></ul>');
        settings.pageWidget.find('span').next().find('ul').append('<li><a toPage="10" class="pro-page" href="javascript:void(0);">10</a></li>');
        settings.pageWidget.find('span').next().find('ul').append('<li><a toPage="20" class="pro-page" href="javascript:void(0);">20</a></li>');
        settings.pageWidget.find('span').next().find('ul').append('<li><a toPage="50" class="pro-page" href="javascript:void(0);">50</a></li>');
        settings.pageWidget.find('span').next().find('ul').append('<li><a toPage="100" class="pro-page" href="javascript:void(0);">100</a></li>');
        /* --------------- 5.结束：构建 ------------- */  
        //还要为控件绑定点击事件
        bindEvent();  
    }  
      
})(jQuery);
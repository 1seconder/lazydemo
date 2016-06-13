function loadQuery(){
	$("#jc_jibenxinxi").show();
	$("#jc_shanquanjinli").hide();
	$("#jc_yezujinli").hide();
	$("#jc_dianhuagenjin").hide();
	$("#jc_duishougenjin").hide();
	fwdetail();
}

function showOption(id,consName){
	$("#"+id).html('');
	$("#"+id).append( '');
	$.each(consName,function(n,v) {  
		$("#"+id).append( '<option value="'+ v.id + '">'+ v.name +'</option>');
	})	
}

function showList(id,consName,columnName){
	$("#"+id).html('');
	$("#"+id).append( '');
	$.each(consName,function(n,v) {  
		if(v.id == columnName){
			$("#"+id).append( '<option value="'+ v.id + '" selected="selected">'+ v.name +'</option>');
		}else{
			$("#"+id).append( '<option value="'+ v.id + '">'+ v.name +'</option>');
		}
	})	
}
function showCheckbox(id,consName,obj, columnName){
	if(obj == null){
		showAll(id,consName, columnName);
	}else {
		showchecked(id,consName, columnName);
	}
}
function showchecked(id,consName,columnName){
//	$("#"+id).html('<label> <input type="checkbox" style="padding-left: 0px;" id="'+ id + '_all" onclick="quanxuan(this)">全选</label> ');
	$.each(consName,function(n,v) {  
		if(v.id == columnName){
			$("#"+id).append( '<label id="'+ v.id +'" > <input type="checkbox" style="padding-left: 0px;" name="radio-2" checked="">'+ v.name +'</label> ');
		}else{
			$("#"+id).append( '<label id="'+ v.id +'"> <input type="checkbox" style="padding-left: 0px;" name="radio-2" >'+ v.name +'</label> ');
		}
	})	
}	

function quanxuan(o){

	if(o.parent().parent().attr("id")  == 'furniture_all'){
		var var1=($(this).prop("checked"));
		if(var1!=false){
			$(":checkbox[name='床']").attr("checked","checked");
			$(":checkbox[name='沙发']").attr("checked","checked");
			$(":checkbox[name='衣柜']").attr("checked","checked");
			$(":checkbox[name='书桌']").attr("checked","checked");
			$(":checkbox[name='餐桌']").attr("checked","checked");
			$(":checkbox[name='椅子']").attr("checked","checked");
			$(":checkbox[name='床垫']").attr("checked","checked");
			$(":checkbox[name='茶几']").attr("checked","checked");
			$("#318").attr("checked","checked");

		}else{
			$(":checkbox[name='床']").removeAttr("checked");
			$(":checkbox[name='沙发']").removeAttr("checked");
			$(":checkbox[name='衣柜']").removeAttr("checked");
			$(":checkbox[name='书桌']").removeAttr("checked");
			$(":checkbox[name='餐桌']").removeAttr("checked");
			$(":checkbox[name='椅子']").removeAttr("checked");
			$(":checkbox[name='床垫']").removeAttr("checked");
			$(":checkbox[name='茶几']").removeAttr("checked");
			$("#318").removeAttr("checked","checked");
		}
	}else if (o.parent().parent().attr("id") == 'appliances_all'){
		var var1=($(this).prop("checked"));
		if(var1!=false){
		$(":checkbox[name='冰箱']").attr("checked","checked");
		$(":checkbox[name='洗衣机']").attr("checked","checked");
		$(":checkbox[name='电磁炉']").attr("checked","checked");
		$(":checkbox[name='消毒柜']").attr("checked","checked");
		$(":checkbox[name='电脑']").attr("checked","checked");
		$(":checkbox[name='空调']").attr("checked","checked");
		$(":checkbox[name='DVD']").attr("checked","checked");
		$(":checkbox[name='电视机']").attr("checked","checked");
		$(":checkbox[name='微波炉']").attr("checked","checked");
		$(":checkbox[name='热水器']").attr("checked","checked");
		$(":checkbox[name='饮水机']").attr("checked","checked");
		$(":checkbox[name='电话']").attr("checked","checked");
		$(":checkbox[name='音响']").attr("checked","checked");
		$("#311").attr("checked","checked");
		

		}else{
			$(":checkbox[name='冰箱']").removeAttr("checked");
			$(":checkbox[name='洗衣机']").removeAttr("checked");
			$(":checkbox[name='电磁炉']").removeAttr("checked");
			$(":checkbox[name='消毒柜']").removeAttr("checked");
			$(":checkbox[name='电脑']").removeAttr("checked");
			$(":checkbox[name='空调']").removeAttr("checked");
			$(":checkbox[name='DVD']").removeAttr("checked");
			$(":checkbox[name='电视机']").removeAttr("checked");
			$(":checkbox[name='微波炉']").removeAttr("checked");
			$(":checkbox[name='热水器']").removeAttr("checked");
			$(":checkbox[name='饮水机']").removeAttr("checked");
			$(":checkbox[name='电话']").removeAttr("checked");
			$(":checkbox[name='音响']").removeAttr("checked");
			$("#311").removeAttr("checked");
		}
	}

}
function showAll(id,consName,columnName){
//	$("#"+id).html('<label> <input type="checkbox" style="padding-left: 0px;" name="radio-2"  onclick="quanxuan(this)">全选</label> ');
	$.each(consName,function(n,v) {  
			$("#"+id).append( '<label id="'+ v.id +'"> <input type="checkbox" style="padding-left: 0px;" name="radio-2" >'+ v.name +'</label> ');
	})	
}	

function getRootPath(){
    var curWwwPath=window.document.location.href;
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    var localhostPath=curWwwPath.substring(0,pos);
    var projectName= pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    return(localhostPath+projectName);
}

function fwdetail(type){
	var par = new Object();
	par.type = 0;
	par.fhs = $("#fanghao").val();;
	var dataJson = JSON.stringify(par);
	$.ajax({
		url: getRootPath()+ "/services/refineService/pageJump/",
		dataType : "json",
		type : "POST",
		data : dataJson ,
		contentType : "application/json;charset=UTF-8",
		async : false,
		success: function(data){
			showList("direction",data.dir,data.dir == null ? data.dir : data.fw.direction);
			showList("purpose",data.yt,data.yt == null ? data.yt : data.fw.purpose);
//			$.each(consName,function(n,v) {  
//				$("#"+id).append( '<label id="'+ v.id +'"> <input type="checkbox" style="padding-left: 0px;" name="radio-2" >'+ v.name +'</label> ');
//		})	
 		}
	})
}


function jjryezhu(type){
	var par = new Object();
	par.type = 2;
	par.fhs = $("#fanghao").val();
	par.keyWord = type;
	var dataJson = JSON.stringify(par);
	$.ajax({
		url: getRootPath()+"/services/refineService/pageJump/",
		dataType : "json",
		type : "POST",
		data : dataJson ,
		contentType : "application/json;charset=UTF-8",
		async : false,
			success: function(data){	
			//showList("consumptionconcept",data.per,data.per == null ? data.per : data.per.consumptionconcept);
<<<<<<< HEAD
			$("#consumptionconcept").empty();
=======
>>>>>>> aa6433be91419cf20278114adc5d4e74917df3a7
 			$("#consumptionconcept").append('<option value="867">生存型消费</option><option value="868">发展型消费</option><option value="869">享受型消费</option>');
 			if(data.per != null && typeof(data.per) !='undefined'){
 				$("#consumptionconcept option[value='"+ data.per.consumptionconcept +"']").attr("selected","selected");
 			}
 		
<<<<<<< HEAD
 			$("#namevalue").empty();
=======
 			
>>>>>>> aa6433be91419cf20278114adc5d4e74917df3a7
			$("#namevalue").append('<option value="1">男士</option><option value="2">女士</option>');
			if(data.per!= null){
				$("#namevalue").val(data.per.gender);
			}
			
			if(data.communicator!=null && typeof(data.communicator) !='undefined'){
				var v2 = new Object();
				if(data.communicator.length>=2){
					$("#linkid").append('<div class="form-group">' + $("#linkid1").html() + '</div>');
					v2 = $("#linkid1").next();
				}
				$.each(data.communicator,function(n,value) {   
	 				if(n == 0){
	 					$("#linkid1").find("input").val(value.Telephone);
	 					$("#linkid1").find("select").val(value.RelationType)
	 				}else{
	 					v2.find("input").val(value.Telephone);
	 					v2.find("select").val(value.RelationType)
	 					$("#linkid").append('<div class="form-group">' + $("#linkid1").html() + '</div>');
	 					v2 = v2.next();
	 					if(typeof(v2) == 'undefined'){
	 						return ;
	 					}
	 				}
	 			})
	 			if(data.communicator.length>=2){v2.remove();}
			}
			
			
			//用途
 			$("#useType").html('');
 			$.each(data.yt,function(n,v) {  
 				if(data.req != null && v.id == data.req.usetype){
 					$("#useType").append( '<option value="'+ v.id + '" selected="selected">'+ v.name +'</option>');
 				}else{
 					$("#useType").append( '<option value="'+ v.id + '">'+ v.name +'</option>');
 				}
 				 
 			})
 			
 			//装修
 			$("#decorationCondition").html('');
 			$.each(data.decor,function(n,v) {  
	 			if(data.req != null && v.id == data.req.decorationcondition){
 					$("#decorationCondition").append( '<option value="'+ v.id + '" selected="selected">'+ v.name +'</option>');
 				}else{
 					$("#decorationCondition").append( '<option value="'+ v.id + '">'+ v.name +'</option>');
 				}
 			})	 
 			
			c = '<label class="radio-inline" value="1"><input type="radio" name="radio-2" value="1" >熟悉商圈小区</label>';
			c+= '<label class="radio-inline" value="2"><input type="radio" name="radio-2" value="2" >多次看房，熟悉商圈小区</label>';
			c+= '<label class="radio-inline" value="3"><input type="radio" name="radio-2" value="3" >不熟悉商圈小区</label>';
			
 			$("#isFamiliarToCommunity").html(c);
 			if(data.cus != null){
 				$("#isFamiliarToCommunity label input:radio[value='" + data.cus.isfamiliartocommunity + "']").attr("checked",true); 
 			}
// 			$.each(data.familar,function(n,v) {  
//	 			if(data.req != null && v.id == data.req.isFamiliarToCommunity){
//	 				$("#isFamiliarToCommunity").append( '<label id="'+ v.id +'"> <input type="checkbox" style="padding-left: 0px;" name="radio-2" checked="">'+ v.name +'</label> ');
// 				}else{
// 					$("#isFamiliarToCommunity").append( '<label id="'+ v.id +'"> <input type="checkbox" style="padding-left: 0px;" name="radio-2" >'+ v.name +'</label> ');
// 				}
// 			})	 
<<<<<<< HEAD
 			$("#furniture").empty();
=======
 			
>>>>>>> aa6433be91419cf20278114adc5d4e74917df3a7
 			//家具
 			showCheckbox("furniture",data.furniture,data.req == null ? data.req : data.req.furniture);
 			
 			if(data.req != null && data.req.furniture != null && typeof(data.req.furniture) != 'undefined'){
 				var o = data.req.furniture.split(",");
 				$.each(o,function(n,v) {   
 		        	  $("#"+v).find("input:checkbox").attr("checked",'true'); 
 				})
 			}
 			
 			///家电
 			$("#appliances").html('');
 			showCheckbox("appliances",data.dianqi,data.req == null ? data.req : data.req.appliances);
 			if(data.req != null && data.req.appliances != null && typeof(data.req.appliances) != 'undefined'){
 				var appli = data.req.appliances.split(",");
 				$.each(appli,function(n,v) {   
 		        	  $("#"+v).find("input:checkbox").attr("checked",'true'); 
 				//if($("#appliances label input:checkbox:checked").parent().attr("id")  == )
 				})
 			}
 			
 			//消费观念
 			
 			
 			//教育程度
 			showList("education",data.jy,data.per == null ? data.per : data.per.education);
 			//国籍
 			showList("nationality",data.nationality,data.per == null ? data.per : data.per.nationality);
 			//工作性质
 			showList("workType",data.workType,data.per == null ? data.per :  data.per.worktype);
 			
 			
 			
 			
 			$("#name").val(data.per.name);
 			$("#mobilephone").val(data.per.mobilephone);
 			$("#homeAddress").val(data.per.homeaddress);
 			$("#lpAddress").val(data.per.lpaddress);
 			$("#juzhuAddress").val(data.per.homeaddress);
 			
 			
 			$("#customerLevel").val(data.req.customerlevel);
 			$("#useType").val(data.req.usetype);
 			$("#decorationCondition").val(data.req.decorationcondition);
 			$("#roomNumberFrom").val(data.req.roomnumberfrom);
 			$("#hallNumberFrom").val(data.req.hallnumberfrom);
 			$("#kitchenNumberFrom").val(data.req.kitchennumberfrom );
 			$("#toiletNumberFrom").val(data.req.toiletnumberfrom);
 			$("#balconyNumberFrom").val(data.req.balconynumberfrom);
 			
 			
 			$("#expectedPriceFrom").val(data.req.expectedpricefrom);
 			$("#expectedPriceTo").val(data.req.expectedpriceto);
 			$("#sizeFrom").val(data.req.hallnumberfrom);
 			$("#sizeTo").val(data.req.sizeto);
 		    $("#floorFrom").val(data.req.floorfrom);
 			$("#floorTo").val(data.req.floorto);
 			$("#buildingAgeFrom").val(data.req.buildingagefrom);
 		    $("#buildingAgeTo").val(data.req.buildingageto );
 		    if(data.cus.delegatetype == 1){
 		    	$("#rentdiv").hide();
 				$("#yadiv").hide();
 				$("#paydiv").hide();
 		    }
 			$("#delegateType").val(data.cus.delegatetype);
 			$("#delegateSource").val(data.req.delegatesourceid);
 			
 			$("#qq").val(data.per.qq );
 			$("#weXin").val(data.per.wexin );
 			$("#email").val(data.per.email);
 			 $("#workPlace").val(data.per.workplace);
 			 $("#education").val(data.per.education);
 			$("#birthday").val(data.per.birthday);
 			$("#consumptionConcept").val(data.per.comsumptionconcept);
 			$("#workPlace").val(data.per.workplace);
 			
 			$("#identityCode").val(data.per.identitycode);
 			 $("#homeAddress").val(data.per.homeaddress);
 			 $("#officeAddress").val(data.per.officeaddress);
 			 $("#nationality").val(data.per.nationality);
 			 $("#ownedHouseNumber").val(data.cus.ownedhousenumber);
 			$("#isUrgently").val(data.req.isurgently);
 			$("#liveInDate").val(data.req.liveindate);
 			$("#isParkingPlace").val(data.req.isparkingplace);
 			$("#deadline").val(data.req.deadline);
 			$("#comment").val(data.req.comment);

 			if(data.req.is_hospital == 1){$("#is_hospital").attr("checked",true);}
 			if(data.req.is_park == 1){$("#is_park").attr("checked",true);}
 			if(data.req.is_bank == 1){$("#is_bank").attr("checked",true);}
 			if(data.req.is_supermarkets == 1){$("#is_supermarkets").attr("checked",true);}
 			if(data.req.is_subway == 1){$("#is_subway").attr("checked",true);}
 			if(data.req.is_school == 1){$("#is_school").attr("checked",true);}
 			if(data.req.is_commercial_street == 1){$("#is_commercial_street").attr("checked",true);}
 			if(data.req.is_other == 1){$("#is_other").attr("checked",true);}

 			$("#isFamiliarToCommunity").val(data.cus.isfamiliartocommunity);
 			
 			//$("#furniture").val(data.req.furniture );
 			//req.appliances = $("#appliances").val();
 			
 			if(data.rent != null){
 				$("#payType").val(data.rent.paytype);
 				$("#livePersonCount").val(data.rent.livepersoncount);
 				$("#mortgage").val(data.rent.mortgage);
 				$("#fee").val(data.rent.fee );
 				$("#rentingRange").val(data.rent.rentingrange);
 				$("#livePersonCount").val(data.rent.livepersoncount);
 			}
 			
 			
 		}
	})
}

function telfollow(type){
	var par = new Object();
	par.type = 3;
	par.fhs = $("#fanghao").val();
	var dataJson = JSON.stringify(par);
	$.ajax({
		url: getRootPath()+"/services/refineService/pageJump/",
		dataType : "json",
		type : "POST",
		data : dataJson ,
		contentType : "application/json;charset=UTF-8",
		async : false,
		success: function(data){
			//$("#relationship").val(data[0].relationship);
			var c ='';
			c += '<option value="850">本人</option> <option value="851">父母</option> <option value="852">授权委托人</option><option value="853">配偶</option>'
				+  '<option value="854">亲戚</option>  <option value="855">朋友</option>';
			$("#relationship").html(c);
			$("#content").html('<option value="1">对方意向不明确</option><option value="2">对方咱没意向</option><option value="3">约定下次见面</option>');
			$("#content").val(data.contenttype);
			$("#phone_tel").val(data.tel);
			$("#relationship").val(data.relationship);
			$("#follw_remark").val(data.remarks);
 		}
	})
}

function competitionfollw(){
	var par = new Object();
	par.type = 4;
	par.fhs = $("#fanghao").val();
	var dataJson = JSON.stringify(par);
	$.ajax({
		url: getRootPath()+"/services/refineService/pageJump/",
		dataType : "json",
		type : "POST",
		data : dataJson ,
		contentType : "application/json;charset=UTF-8",
		async : false,
		success: function(data){
			$("#com_req").val(data.requires);
			$("#com_price").val(data.price);
			$("#com_startdate").val(data.startdate);
			$("#com_enddate").val(data.enddate);
//			$("#company").val(data.company);
			$("#com_remark").val(data.remarks);
			
			$.ajax({
				url: getRootPath()+"/services/refineService/queryCompany",
				dataType : "json",
				type : "GET",
				data : dataJson ,
				contentType : "application/json;charset=UTF-8",
				async : false,
				success: function(d){
					var c ='';
					$.each(d,function(n,v) {  
						if(v.id == data.company){
							c += '<option value="' + v.id +'" selected="selected">'+ v.company+ '</option>'
						}else{
							c += '<option value="' + v.id +'">'+ v.company+ '</option>'
						}
					});
					$("#company").html(c);
				}
			})		
 		}
	})
}



function sqlist(type){
	var par = new Object();
	par.fhs = $("#fanghao").val();
	var jsonData = JSON.stringify(par);
	
	$.ajax({
		url: getRootPath()+"/services/refineService/querySqManager/",
		dataType : "json",
		type : "POST",
		data : jsonData ,
		contentType : "application/json;charset=UTF-8",
		async : false,
		success: function(data){
			var cHtml ='';
			$.each(data, function(i,n){
				cHtml += '<tr><td class="col-lg-1">' + (i+1) + '</td>'
				+ '<td class="middle-align text-center">' +n.name + '</td>'
				+ '<td class="middle-align text-center">'+ n.mobilephone +'</td>'
				+ '<td class="middle-align text-center">'+n.wexin +'</td>'
				+ '<td class="middle-align text-center">'+n.qq +'</td>'
				+ '<td class="middle-align text-center">'+n.email +'</td>'
				+ '<td class="middle-align text-center">'+n.jjrname +'</td>'
				+ '<td class="middle-align text-center">'+n.modifydate +'</td>'
				+ '<td class="middle-align text-center"><a href="javascript:jumpXq('+ n.fhid + ')">详情</a></td>'
				+ '</tr>';
				
			});
			$("#sq_body").html(cHtml);
 		}
	})
}

function jumpXq(fhid){
	window.location.href = getRootPath()+"/services/refineService/mainPage/1/"+fhid;
}

function querySqList(data){
	var cHtml = '';
	$.each(data, function(i,n){
		cHtml += '<tr><td class="col-lg-1">' + (i+1) + '</td>'
		+ '<td class="middle-align text-center">' +n.name + '</td>'
		+ '<td class="middle-align text-center">'+ n.mobilephone +'</td>'
		+ '<td class="middle-align text-center">'+n.wexin +'</td>'
		+ '<td class="middle-align text-center">'+n.qq +'</td>'
		+ '<td class="middle-align text-center">'+n.email +'</td>'
		+ '<td class="middle-align text-center">'+n.jjrname +'</td>'
		+ '<td class="middle-align text-center">'+n.modifydate +'</td>'
		//+ '<td class="middle-align text-center"><a href="javascript:modify2('+ n.lpid + ',\''+n.qy_name+'\',\''+n.sq_name+'\',\''+ n.lp_name +'\')">分派/修改</a></td>'
		+ '</tr>';
	});
	$("#sq_body").html(cHtml);
}


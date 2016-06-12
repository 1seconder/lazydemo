function queryList(){
		var lpid = $("#lpid").val();
	    var jsonb = {};
	    jsonb.lpid=lpid;
	    jsonb.zhuangxiu=$("#zhuangxiu").val();
	    jsonb.biaoqian=$("#biaoqian").val();
	    jsonb.dianzu=$("#dianzu").val();
	    jsonb.jingjiren=$("#jingjiren").val();
	    jsonb.dzid=$("#dz").val();
	    jsonb.dyid=$("#dy").val();
//	    jsonb.mdid=departmentid;
	    jsonb.cityid = cityid;
	    jsonb.statuss = $("#statussid").val();
	    jsonb.panleixing = $("#panleixing").val();
	    var url = basepath+"/services/sellControl/querySCList/";
		$('.onsubing').css("display","block");//弹出提示框
	    $("#macPageWidget").asynPage(url, "#tbodyid", queryList2, true, true,jsonb);
	};
	

	function queryList2(result){
		var imagePath = $("#imagePath").val();
		$('.onsubing').css("display","none");//弹出提示框
//			var lpid = $("#lpid").val();
//		    var url = basepath+"/services/sellControl/querySCList/";
		    
;
		    
//		    $.ajax({
//		   		url:url,
//			    dataType:'json',
//		   		contentType : "application/json; charset=utf-8",
//			    data:	JSON.stringify(jsonb), 
//			    type:"POST",
//				beforeSend: function () {
//			        // 禁用按钮防止重复提交
////			        $(this).attr("disabled", true);
////			        $('.onsubing').css("display","block");//弹出提示框
//			    },success: function(result){
//	 				$("#scTable").html("");
					if(null != result && result !="{}" && JSON.stringify(result).length !=2 && result !="")
					{
						var html = '';
						$.each(result, function(i,data){
							var isencryption = "";
							if(data.saleisencryption != ""){
								isencryption = data.saleisencryption;
							}else if(data.rentisencryption != ""){
								isencryption = data.rentisencryption;
							}
							var detailUrl = basepath+"/services/houseService/queryHouseDetail/"+data.fhid;
							detailUrl = 'javascript:parent.refreshTab(\'精耕详情\',\''+detailUrl+'\')';
							var errorimg = "javascript:this.src='"+basepath+"/assets/images/user-4.png';"
							html += '<tr>';
							html +=' <td class="col-cb middle-align text-center">';
							html +='<input type="checkbox" class="cbr"  id="tablecheckid'+data.fhid+'"/>';
							html +=' </td>';
							html +=' <td class="col-lg-1" >';
							html +='<div style="width: 80px;"><img width="80" height="80" src="'+imagePath + data.imagepath+'" onerror="'+errorimg+'">';
							var number = (data.number=="undefined"||data.number==null ||data.number=="")?("FH"+data.fhid):data.number;
							html +='<br>'+number+'</div>'
							html +=' </td>';
							html +=' <td >';
							if(isencryption==1){
								html += '<b class="xingji xingji-a pull-left ">A盘</b>';
					        } else if(isencryption==2){
					        	html += '<b class="xingji xingji-b pull-left ">B盘</b>';
					        } else if(isencryption==3){
					        	html += '<b class="xingji xingji-c pull-left ">C盘</b>';
					        } else if(isencryption==4){
					        	html += '<b class="xingji xingji-x pull-left ">X盘</b>';
					        }
							html +=' 	<div class="line24"><a href="'+detailUrl+'" class="f18" target="_blank">'+data.title+'</a>'+data.usages+'</div>';
							html +=' 	<div class="line24">'+data.fanghao+'，'+data.fangwu+'</div>';
							html +=' 	<div class="line24"><span>'+data.PropertyAddress=="undefined"||data.PropertyAddress==null?"":data.PropertyAddress+'</span></div>';
							html +=' 	<div>';
//							if(null!=data.keyid && data.keyid>0)html +=' 		<span class="btn btn-danger btn-xs">精装修</span>';
							if(null!=data.keyid && data.keyid >0)html +=' 		<span class="btn btn-blue btn-xs">钥匙</span>';
							if(null!=data.surveyid && data.surveyid >0)html +=' 		<span class="btn btn-success btn-xs">房堪</span>';
							html +=' 	</div>';
							html +=' </td>';
							html +=' <td class="middle-align text-center" >';
							html +=' 	<span class="pr10">'+data.fullname+'</span></br><div class="line24">联系电话：'+((data.tel=='undefined'||data.tel==""||data.tel==null)?"无":data.tel)+'</div>';
							html +='</br><div class="line24">'+data.departmentname+'</div>';
							html +=' </td>';
							html +=' <td class="middle-align text-center">';
//							html +=' 	带看：5<br />跟进：6<br>';
							html +=data.refreshDate=="undefined"||data.refreshDate==null?"":data.refreshDate;
							html +=' </td>';
							html +=' <td class="middle-align text-center">';
							html +=' 	BMS售价：'+data.Price=='undefined'||data.Price=="0"||data.Price==null?0:data.Price;
							var  fwzt = data.fwzt;
							if(fwzt==0){html+= '元/平米<br><span class="btn btn-kongzhi btn-xs">[空置]</span>';}
							else if(fwzt==1){html+= '元/平米<br><span class="btn btn-zaishou btn-xs">[在售]</span>';}
							else if(fwzt ==2){html+= '元<br><span  class="btn btn-zaizu btn-xs">[在租]</span>';}
							else if(fwzt ==3){html+=  '<br><span  class="btn btn-zushou btn-xs" >[租售]</span>';}
							else if(fwzt ==4){html+=  '元<br><span  class="btn btn-baozu btn-xs" >[包租]</span>';}
							else if(fwzt ==5){html+=  '元<br><span  class="btn btn-ruzu btn-xs" >[如租]</span>';}
							else if(fwzt ==6){html+= '元<br><span  class="btn btn-yizu btn-xs" >[已租]</span>';}
							else if(fwzt ==7){html+= '元/平米<br><span  class="btn btn-yishou btn-xs" >[已售]</span>';}
							else if(fwzt ==8){html+= '元<br><span  class="btn btn-daoqi btn-xs" >[到期]</span>';}
							else{html+= '<br><span  class="btn btn-kongzhi btn-xs" >[空置]</span>';}
							
							html +=' </td>';
							html +=' <td class="middle-align text-center" >';
//							html +=' 	<a href="'+detailUrl+'" class="btn btn-danger btn-xs">查看详情</a>';
							//alert(JSON.stringify(data))
							
//							var genjinUrl = basepath+'/services/traceServices/initTrace/fhid/'+(data.fhid=="undefined"?"":data.fhid)+'/houseType/'+(data.housetype=="undefined"?"":data.housetype)+'/housenumber/'+(data.housenumber=="undefined"?"":data.housenumber)+'/saleOrRentId/'+(data.saleorrentid=="undefined"?"":data.saleorrentid)+'/houseSourceId/'+(data.housesourceid=="undefined"?"":data.housesourceid)+'?k=yzjg&p=jg';
//							genjinUrl = 'javascript:parent.refreshTab(\'楼盘跟进\',\''+genjinUrl+'\')';

							html +=' 	<a href="'+detailUrl+'" class="btn btn-danger btn-xs">查看</a>';
//							html +=' 	<a href="'+genjinUrl+'" class="btn btn-danger btn-xs">跟进</a>';
//							html +=' 	<a class="btn btn-danger btn-xs">聚焦</a>';
//							html +=' 	<a class="btn btn-danger btn-xs">关注</a>';
							html +=' </td>';
							html +=' </tr>';
						  });
						$("#tbodyid").html(html);
					}
//			    }
//		    });
	}

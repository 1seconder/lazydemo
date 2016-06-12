<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
		#allmap{width:80%;height:500px;float:left}
		p{margin-left:5px; font-size:14px;}
		#r-result{margin-left:0px;float:right;width:20%}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=jYNU39RZ3k37NUz1QduizaYD"></script>
<title>根据中心点关键字周边搜索</title>
</head>
<body>
<!--二维地图-->
	<div id="mapsou" style="width:923px;height:300px; display:block;">
		<div id="map-di-aa" style="height:30px;line-height:30px;">
			 <p>
				 <a href="javascript:void(0)" style="display: none;" onMouseOver="sea('公交')">公交</a>
				 <a href="javascript:void(0)" class="om" onMouseOver="sea('地铁')">地铁</a>
				 <a href="javascript:void(0)" onMouseOver="sea('新环境')">服务网点</a>
				 <a href="javascript:void(0)" onMouseOver="sea('学校')">学校</a>
				 <a href="javascript:void(0)" onMouseOver="sea('医院')">医院</a>
				 <a href="javascript:void(0)" onMouseOver="sea('银行')">银行</a>
				 <a href="javascript:void(0)" onMouseOver="sea('休闲娱乐')">休闲娱乐</a>
				 <a href="javascript:void(0)" onMouseOver="sea('购物')">购物</a>
				 <a href="javascript:void(0)" onMouseOver="sea('餐饮')">餐饮</a>
				 <a href="javascript:void(0)" onMouseOver="sea('运动健身')">运动健身</a>
			 </p>
		</div>
<!-- 			<div> -->
<!-- 				<input type="text" id = "searchId" oninput = "sea(this.value)"></input> -->
<!-- 				<input type ="button" id = "btn" onclick ="sea($('#searchId'))" value = "button"/> -->
<!-- 			</div> -->
			<div style="width:100%;">
				<div   id="allmap"></div>
				<div id="r-result"></div>
			</div>
	</div>

</body>
</html>
<script type="text/javascript">

// 百度地图API功能
var map = new BMap.Map("allmap");   
var xPoint = parent.window.$('#xPoint').val();
var yPoint = parent.window.$('#yPoint').val();// 创建Map实例
map.centerAndZoom(new BMap.Point(xPoint,yPoint), 11);
var options = {
		renderOptions: {
			map: map,
			panel:"r-result",
			autoViewport: true
		},
		pageCapacity:4
		/* onSearchComplete: function(results) {
			alert('Search Completed');
			//可添加自定义回调函数
		} */
	};
var local = new BMap.LocalSearch(map, options);

function sea(name)
{
	var point = new BMap.Point(xPoint,yPoint);
	local.searchNearby(name, point,2000);
}
  
</script>
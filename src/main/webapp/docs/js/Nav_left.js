$(document).ready(function(){
	$(".col-md-2").hide();
	$(".col-md-10").addClass("col-md-12");
	
	$("#gle").click(function(){
		if($(".col-md-2").is(':visible')){
			$(".col-md-2").hide(1000);
			setTimeout('$(".col-md-10").addClass("col-md-12")',1000);
		} else {
			$(".col-md-2").show(1000);
			$(".col-md-10").removeClass("col-md-12");
		}
	})	
	
	
//	$(window).click(function(){
//		 
//		if($(".navbar-collapse",window.top.document).hasClass('collapse')){
//			return false;
//		}
//		
//			$(".navbar-toggle",window.top.document).trigger('click');
//		
//	});	
});
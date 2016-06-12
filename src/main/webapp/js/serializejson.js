/**
 *<p>基于JQuery的工具类库</p>
 */
(function($){
	
	/**
	 * 将表单数据序列化成JSON对象;
	 */
	$.fn.serializeJson = function() {
	    var result = {};
	    var formValues = this.serializeArray() ;
	    for(var formValue,j=0;j<formValues.length;j++) {
	    	formValue = formValues[j];
	   		var name = formValue.name;
	    	var value = formValue.value;
	    	if (name.indexOf('.') < 0) {
	    		var tempValue = result[name] ;//如果name相同，进行值合并，以逗号分隔值;
	    		result[name] = tempValue ? (tempValue+","+value) : value ;
	    		continue;
	    	} else {
	    		var simpleNames = name.split('.');
	    		var obj = result;// 构建命名空间
	    		for ( var i = 0; i < simpleNames.length - 1; i++) {
	    			var simpleName = simpleNames[i];
	    			if (simpleName.indexOf('[') < 0) {
	    				if (obj[simpleName] == null) {
	    					obj[simpleName] = {};
	    				}
	    				obj = obj[simpleName];
	   				} else { //数组,分隔
	    				var arrNames = simpleName.split('['); 
	    				var arrName = arrNames[0];
	    				var arrIndex = parseInt(arrNames[1]);
	    				if (obj[arrName] == null) {
	    					obj[arrName] = []; // new Array();
	    				}
	    				obj = obj[arrName];
	    				multiChooseArray = result[arrName];
	    				if (obj[arrIndex] == null) {
	   						 obj[arrIndex] = {}; // new Object();
	    				}
	    				obj = obj[arrIndex];
	    			}
	    		}
	 
	    		if(obj[simpleNames[simpleNames.length - 1]] ) {
	   				 var temp = obj[simpleNames[simpleNames.length - 1]];
	    			obj[simpleNames[simpleNames.length - 1]] = temp;
	    		}else {
	    			obj[simpleNames[simpleNames.length - 1]] = value;
	    		}
	    	}
	    }
	    return result;
	} ;
	
	
})(jQuery);
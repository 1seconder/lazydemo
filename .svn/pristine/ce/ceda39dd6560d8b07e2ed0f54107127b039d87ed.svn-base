/**
 * @Project: communityFocus
 * @FilePath: com.newenv.communityFocus.interceptor.XhjLpjgInterceptor.java
 * @author: mingjie.lu
 * @date: 2016年5月13日 下午5:57:44
 */
package com.newenv.communityFocus.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.cxf.interceptor.Fault;
import org.apache.cxf.message.Message;

import com.newenv.communityFocus.configuration.ServiceWhiteListConfiguration;
import com.newenv.cxf.interceptor.ServiceAccessControlInterceptor;

/**
 * @ClassName: com.newenv.communityFocus.interceptor.XhjLpjgInterceptor
 * @Description: XhjLpjgInterceptor
 * @author: mingjie.lu
 * @date: 2016年5月13日 下午5:57:44
 */
public class XhjLpjgInterceptor extends ServiceAccessControlInterceptor {
	
	private ServiceWhiteListConfiguration whiteList;

	public XhjLpjgInterceptor(ServiceWhiteListConfiguration whiteList) {
		this.whiteList = whiteList;
	}

	/*
	 * (非 Javadoc)
	 * 
	 * @Title: handleMessage
	 * 
	 * @Description: handleMessage
	 * 
	 * @param msg
	 * 
	 * @throws Fault
	 * 
	 * @see
	 * com.newenv.cxf.interceptor.ServiceAccessControlInterceptor#handleMessage(
	 * org.apache.cxf.message.Message)
	 */
	@Override
	public void handleMessage(Message msg) throws Fault {
		if (!isWhiteListInteface(((HttpServletRequest)msg.get("HTTP.REQUEST")).getRequestURI())) {
			super.handleMessage(msg);
		}
	}
	
	private boolean isWhiteListInteface(String requestURL){
		boolean result = false;
		for (String intefaceName : whiteList.getWhiteLists()) {
			if (requestURL.contains(intefaceName)) {
				result = true;
				break;
			}
		}
		return result;
	}
}

/**
 * @Project: communityFocus
 * @FilePath: com.newenv.communityFocus.configuration.ServiceWhiteListConfiguration.java
 * @author: mingjie.lu
 * @date: 2016年5月13日 下午6:08:59
 */
package com.newenv.communityFocus.configuration;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.CollectionUtils;

import com.newenv.communityFocus.util.StringUtils;

/**
 * @ClassName: com.newenv.communityFocus.configuration.ServiceWhiteListConfiguration
 * @Description: 接口服务白名单配置
 * @author: mingjie.lu
 * @date: 2016年5月13日 下午6:08:59
 */
@Configuration
@ConfigurationProperties(prefix = "serviceInteface")
public class ServiceWhiteListConfiguration {
	private String whiteList;
	private List<String> whiteLists = new ArrayList<String>();
	
	/**
	 * @param whiteList the whiteList to set
	 */
	public void setWhiteList(String whiteList) {
		this.whiteList = whiteList;
	}
	/**
	 * @return the whiteLists
	 */
	public List<String> getWhiteLists() {
		if (StringUtils.notEmpty(whiteList) && CollectionUtils.isEmpty(whiteLists)) {
			whiteLists = Arrays.asList(whiteList.split(","));
		}
		return whiteLists;
	}

	/**
	 * @param whiteLists the whiteLists to set
	 */
	public void setWhiteLists(List<String> whiteLists) {
		this.whiteLists = whiteLists;
	}

}

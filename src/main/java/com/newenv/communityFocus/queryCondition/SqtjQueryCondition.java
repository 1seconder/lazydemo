/**
 * @Project: communityFocus
 * @FilePath: com.newenv.communityFocus.domain.SqtjQueryCondition.java
 * @Description: 商圈统统查询条件封装
 * @author: mingjie.lu
 * @date: 2016年4月22日 上午9:02:42
 */
package com.newenv.communityFocus.queryCondition;

import java.io.Serializable;

import com.newenv.communityFocus.base.PageInfo;

/**
 * @ClassName: SqtjQueryCondition
 * @Description: 商圈统统查询条件封装
 * @author: mingjie.lu
 * @date: 2016年4月22日 上午9:02:42
 */
public class SqtjQueryCondition implements Serializable {
	/**
	 */
	private static final long serialVersionUID = 7276926487125404973L;
	private PageInfo pageInfo;
	private String dateTime;
	private String stressId;
	private String sqId;
	private String buildingId;
	private String flag;

	/**
	 * @return the pageInfo
	 */
	public PageInfo getPageInfo() {
		return pageInfo;
	}

	/**
	 * @param pageInfo
	 *            the pageInfo to set
	 */
	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	/**
	 * @return the dateTime
	 */
	public String getDateTime() {
		return dateTime;
	}

	/**
	 * @param dateTime the dateTime to set
	 */
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	/**
	 * @return the stressId
	 */
	public String getStressId() {
		return stressId;
	}

	/**
	 * @param stressId the stressId to set
	 */
	public void setStressId(String stressId) {
		this.stressId = stressId;
	}

	/**
	 * @return the sqId
	 */
	public String getSqId() {
		return sqId;
	}

	/**
	 * @param sqId the sqId to set
	 */
	public void setSqId(String sqId) {
		this.sqId = sqId;
	}

	/**
	 * @return the buildingId
	 */
	public String getBuildingId() {
		return buildingId;
	}

	/**
	 * @param buildingId the buildingId to set
	 */
	public void setBuildingId(String buildingId) {
		this.buildingId = buildingId;
	}

	/**
	 * @return the flag
	 */
	public String getFlag() {
		return flag;
	}

	/**
	 * @param flag the flag to set
	 */
	public void setFlag(String flag) {
		this.flag = flag;
	}


}

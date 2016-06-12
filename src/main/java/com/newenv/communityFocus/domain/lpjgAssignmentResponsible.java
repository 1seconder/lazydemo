package com.newenv.communityFocus.domain;

import java.sql.Timestamp;

import org.nutz.dao.entity.annotation.Table;

/**
 * @author wangpengfei
 */
@Table("lpjg_assignment_responsible")
public class lpjgAssignmentResponsible {
	
	/*
	 * 
	 */
	private Integer id;
	/*
	 * 城市id
	 */
	private Integer cityId;
	/*
	 * 楼盘id	
	 */
	private Integer lpId;
	/*
	 * 责任人
	 */
	private Integer userId;
	/*
	 * 创建时间
	 */
	private Timestamp createDate;
	/*
	 * 分派人/录入人
	 */
	private Integer creatorId;
	/*
	 * 是否有效（0：无效  1：有效）
	 */
	private Integer flag;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCityId() {
		return cityId;
	}
	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}
	public Integer getLpId() {
		return lpId;
	}
	public void setLpId(Integer lpId) {
		this.lpId = lpId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	public Integer getCreatorId() {
		return creatorId;
	}
	public void setCreatorId(Integer creatorId) {
		this.creatorId = creatorId;
	}
	public Integer getFlag() {
		return flag;
	}
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	
}

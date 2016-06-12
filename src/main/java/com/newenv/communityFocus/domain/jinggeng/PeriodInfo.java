package com.newenv.communityFocus.domain.jinggeng;


import java.util.Date;

import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

@Table("lpjg_precise_update_record")
public class PeriodInfo {
	
	public static PeriodInfo  getPeriodInfo(){
		PeriodInfo period = new PeriodInfo();
		period.setCreateDate(new java.util.Date());
		period.setStatuss(0);
		period.setFlag(1);
		return period;
	}
	@Id
	private int id ;
	private int mdid ;
	private int bmid ;
	private long fhid ;
	private int creatorId ;
	
	private Date createDate;
	private Date modifyDate ;
	
	private String relationship ;//relationship
	private String messages ;
	private String stage ;
	
	private int statuss ;//0不报警 , 1报警
	
	private int flag ; //0, 无效，1有效
	
	private int updatecount;

	public int getMdid() {
		return mdid;
	}

	public void setMdid(int mdid) {
		this.mdid = mdid;
	}

	public int getBmid() {
		return bmid;
	}

	public void setBmid(int bmid) {
		this.bmid = bmid;
	}

	public long getFhid() {
		return fhid;
	}

	public void setFhid(long fhid) {
		this.fhid = fhid;
	}

	public int getCreatorId() {
		return creatorId;
	}

	public void setCreatorId(int creatorId) {
		this.creatorId = creatorId;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getRelationship() {
		return relationship;
	}

	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}

	public String getMessages() {
		return messages;
	}

	public void setMessages(String messages) {
		this.messages = messages;
	}

	public String getStage() {
		return stage;
	}

	public void setStage(String stage) {
		this.stage = stage;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getStatuss() {
		return statuss;
	}

	public void setStatuss(int statuss) {
		this.statuss = statuss;
	}

	public int getUpdatecount() {
		return updatecount;
	}

	public void setUpdatecount(int updatecount) {
		this.updatecount = updatecount;
	}
	
}

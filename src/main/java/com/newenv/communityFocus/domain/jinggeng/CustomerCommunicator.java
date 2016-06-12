package com.newenv.communityFocus.domain.jinggeng;

import java.util.Date;

import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

@Table("lpjg_communicator")
public class CustomerCommunicator {
	@Id
	private int id;
	/**
	 * 业主id
	 */
	private long personId;
	
	private int relationType ;
	
	
	private String remark;
	
	private Date createDate;
	
	
	private int statuss ;
	
	private String telephone;

	public String getTelephone() {
		return telephone;
	}


	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}


	public long getPersonId() {
		return personId;
	}


	public void setPersonId(long personId) {
		this.personId = personId;
	}


	public int getRelationType() {
		return relationType;
	}


	public void setRelationType(int relationType) {
		this.relationType = relationType;
	}


	public String getRemark() {
		return remark;
	}


	public void setRemark(String remark) {
		this.remark = remark;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public int getStatuss() {
		return statuss;
	}


	public void setStatuss(int statuss) {
		this.statuss = statuss;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}
	
	
	
	
}

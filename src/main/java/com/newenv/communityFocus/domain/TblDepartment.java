package com.newenv.communityFocus.domain;

import java.math.BigDecimal;
import java.util.Date;

import org.nutz.dao.entity.annotation.Table;

/**
 * TblDepartment entity. @author MyEclipse Persistence Tools
 */
@Table("tbl_department")
public class TblDepartment {

	// Fields

	private Integer id;
	private Integer tblOrganizationId;
	private String departmentName;
	private Integer parentId;
	private Date entryTime;
	private Integer flag;
	private Integer cityId;
	private String telephone;
	private String address;
	private Integer regionId;
	private Short updated;
	private String type;
	private Float x;
	private Float y;
	private String departmentFunction;
	private String fax;
	private Date createdTxStamp;
	private Date createdStamp;
	private Date lastUpdatedStamp;
	private Date lastUpdatedTxStamp;
	private BigDecimal cityId_1;


	public TblDepartment() {
		super();
	}

	public TblDepartment(Integer id, String departmentName) {
		super();
		this.id = id;
		this.departmentName = departmentName;
	}

	public TblDepartment(Integer id, Integer tblOrganizationId,
			String departmentName, Integer parentId, Date entryTime,
			Integer flag, Integer cityId, String telephone, String address,
			Integer regionId, Short updated, String type, Float x, Float y,
			String departmentFunction, String fax, Date createdTxStamp,
			Date createdStamp, Date lastUpdatedStamp, Date lastUpdatedTxStamp,
			BigDecimal cityId_1) {
		super();
		this.id = id;
		this.tblOrganizationId = tblOrganizationId;
		this.departmentName = departmentName;
		this.parentId = parentId;
		this.entryTime = entryTime;
		this.flag = flag;
		this.cityId = cityId;
		this.telephone = telephone;
		this.address = address;
		this.regionId = regionId;
		this.updated = updated;
		this.type = type;
		this.x = x;
		this.y = y;
		this.departmentFunction = departmentFunction;
		this.fax = fax;
		this.createdTxStamp = createdTxStamp;
		this.createdStamp = createdStamp;
		this.lastUpdatedStamp = lastUpdatedStamp;
		this.lastUpdatedTxStamp = lastUpdatedTxStamp;
		this.cityId_1 = cityId_1;
	}

	// Property accessors
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTblOrganizationId() {
		return this.tblOrganizationId;
	}

	public void setTblOrganizationId(Integer tblOrganizationId) {
		this.tblOrganizationId = tblOrganizationId;
	}

	public String getDepartmentName() {
		return this.departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public Integer getParentId() {
		return this.parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Date getEntryTime() {
		return this.entryTime;
	}

	public void setEntryTime(Date entryTime) {
		this.entryTime = entryTime;
	}

	public Integer getFlag() {
		return this.flag;
	}

	public void setFlag(Integer flag) {
		this.flag = flag;
	}

	public Integer getCityId() {
		return this.cityId;
	}

	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}

	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getRegionId() {
		return this.regionId;
	}

	public void setRegionId(Integer regionId) {
		this.regionId = regionId;
	}

	public Short getUpdated() {
		return this.updated;
	}

	public void setUpdated(Short updated) {
		this.updated = updated;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Float getX() {
		return this.x;
	}

	public void setX(Float x) {
		this.x = x;
	}

	public Float getY() {
		return this.y;
	}

	public void setY(Float y) {
		this.y = y;
	}

	public String getDepartmentFunction() {
		return this.departmentFunction;
	}

	public void setDepartmentFunction(String departmentFunction) {
		this.departmentFunction = departmentFunction;
	}

	public String getFax() {
		return this.fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public Date getCreatedTxStamp() {
		return this.createdTxStamp;
	}

	public void setCreatedTxStamp(Date createdTxStamp) {
		this.createdTxStamp = createdTxStamp;
	}

	public Date getCreatedStamp() {
		return this.createdStamp;
	}

	public void setCreatedStamp(Date createdStamp) {
		this.createdStamp = createdStamp;
	}

	public Date getLastUpdatedStamp() {
		return this.lastUpdatedStamp;
	}

	public void setLastUpdatedStamp(Date lastUpdatedStamp) {
		this.lastUpdatedStamp = lastUpdatedStamp;
	}

	public Date getLastUpdatedTxStamp() {
		return this.lastUpdatedTxStamp;
	}

	public void setLastUpdatedTxStamp(Date lastUpdatedTxStamp) {
		this.lastUpdatedTxStamp = lastUpdatedTxStamp;
	}

	public BigDecimal getCityId_1() {
		return this.cityId_1;
	}

	public void setCityId_1(BigDecimal cityId_1) {
		this.cityId_1 = cityId_1;
	}

}
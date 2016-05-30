package com.newenv.communityFocus.domain.jinggeng;

import java.util.Date;

import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;


/**
 * 人员信息(lpjg_personinfo)
 */
@Table("lpjg_personinfo")
public class PersonInfo implements java.io.Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    private long id;	
    
    private String name;//姓名
    private String mobilePhone;//手机
    private String officeAddress;//办公地址
    private String homeAddress;//家庭住址
    
    private String number;//编号
    private String identityCode;//身份证
    
    private String qq; //	QQ
    private String weXin;//微信
    
    private Integer cityId;
    private int gender;//性别
    private String email;//电子邮箱

    private String accountsAddress;//户口所在地
    
    private String workPlace;//工作单位
    private String nationality;//国籍
    private Date birthday;//出生日期
    private Integer credentialsType; //证件类型
    
    private Date createDate;//录入时间
    private Integer transport;//交通工具
    private Integer carType;//车型
    
    private String education;//程度
    private Integer buyingMotivation;//置业动机
    
    private int consumptionConcept;//消费理念
    
    private int workType;
    
    private String lpAddress;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public String getOfficeAddress() {
		return officeAddress;
	}

	public void setOfficeAddress(String officeAddress) {
		this.officeAddress = officeAddress;
	}

	public String getHomeAddress() {
		return homeAddress;
	}

	public void setHomeAddress(String homeAddress) {
		this.homeAddress = homeAddress;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getIdentityCode() {
		return identityCode;
	}

	public void setIdentityCode(String identityCode) {
		this.identityCode = identityCode;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getWeXin() {
		return weXin;
	}

	public void setWeXin(String weXin) {
		this.weXin = weXin;
	}

	public Integer getCityId() {
		return cityId;
	}

	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAccountsAddress() {
		return accountsAddress;
	}

	public void setAccountsAddress(String accountsAddress) {
		this.accountsAddress = accountsAddress;
	}

	public String getWorkPlace() {
		return workPlace;
	}

	public void setWorkPlace(String workPlace) {
		this.workPlace = workPlace;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Integer getCredentialsType() {
		return credentialsType;
	}

	public void setCredentialsType(Integer credentialsType) {
		this.credentialsType = credentialsType;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Integer getTransport() {
		return transport;
	}

	public void setTransport(Integer transport) {
		this.transport = transport;
	}

	public Integer getCarType() {
		return carType;
	}

	public void setCarType(Integer carType) {
		this.carType = carType;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public Integer getBuyingMotivation() {
		return buyingMotivation;
	}

	public void setBuyingMotivation(Integer buyingMotivation) {
		this.buyingMotivation = buyingMotivation;
	}


	public int getWorkType() {
		return workType;
	}

	public void setWorkType(int workType) {
		this.workType = workType;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public int getConsumptionConcept() {
		return consumptionConcept;
	}

	public void setConsumptionConcept(int consumptionConcept) {
		this.consumptionConcept = consumptionConcept;
	}

	public String getLpAddress() {
		return lpAddress;
	}

	public void setLpAddress(String lpAddress) {
		this.lpAddress = lpAddress;
	} 

}

package com.newenv.communityFocus.domain;

import java.util.Date;

import org.nutz.dao.entity.annotation.Table;

@Table("xhj_jccity")
public class XhjJccity {

	private int id;

	// 城市ID
	private String cityName;

	// 省份ID
	private Integer provinceid;

	//
	private String number;

	private Float x;

	//
	private Float y;

	private Date createDate;

	private int statuss;

	private String shorthand;// 拼音简写

	private Date cts;//

	private Date cs;//

	private Date lus;//

	private Date luts;//

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public Integer getProvinceid() {
		return provinceid;
	}

	public void setProvinceid(Integer provinceid) {
		this.provinceid = provinceid;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public Float getX() {
		return x;
	}

	public void setX(Float x) {
		this.x = x;
	}

	public Float getY() {
		return y;
	}

	public void setY(Float y) {
		this.y = y;
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

	public String getShorthand() {
		return shorthand;
	}

	public void setShorthand(String shorthand) {
		this.shorthand = shorthand;
	}

	public Date getCts() {
		return cts;
	}

	public void setCts(Date cts) {
		this.cts = cts;
	}

	public Date getCs() {
		return cs;
	}

	public void setCs(Date cs) {
		this.cs = cs;
	}

	public Date getLus() {
		return lus;
	}

	public void setLus(Date lus) {
		this.lus = lus;
	}

	public Date getLuts() {
		return luts;
	}

	public void setLuts(Date luts) {
		this.luts = luts;
	}

	public XhjJccity(int id, String cityName, String number, Float x, Float y, Date createDate, int statuss,
			String shorthand, Date cts, Date cs, Date lus, Date luts) {
		super();
		this.id = id;
		this.cityName = cityName;
		this.number = number;
		this.x = x;
		this.y = y;
		this.createDate = createDate;
		this.statuss = statuss;
		this.shorthand = shorthand;
		this.cts = cts;
		this.cs = cs;
		this.lus = lus;
		this.luts = luts;
	}

	public XhjJccity() {
	}

}

package com.newenv.communityFocus.base;

public enum LogType {
	FENPAI_ZUDUIHU("组队盘,人对户",1),
	FENPAI_ZYP("主营盘",2),
	TYPE_JIECHOUQI("批量精耕-接触期",10);
	
	private String remark;
	private int type;
	
	LogType(String remark , int type){
		this.remark = remark;
		this.type = type;
	}
	

	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	
}

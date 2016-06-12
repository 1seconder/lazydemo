package com.newenv.communityFocus.vo;

/**
 * 
 * @author hui.peng
 *
 */
public class RangePlateStatistic {
	
	public int m_mdSum ; //总门店
	
	public String m_notAssignMd ;//未被指派的门店
	public int m_notAssignMdSum ;//未被指派的门店数
	public int m_lpSum; //总楼盘
	
	public String m_notAssignLp ;//未被指派的楼盘
	public int m_notAssignLpSum ;//未被指派楼盘数
	private String m_operTime;//操作时间
	
	
	public int getM_mdSum() {
		return m_mdSum;
	}
	public void setM_mdSum(int m_mdSum) {
		this.m_mdSum = m_mdSum;
	}
	public String getM_notAssignMd() {
		return m_notAssignMd;
	}
	public void setM_notAssignMd(String m_notAssignMd) {
		this.m_notAssignMd = m_notAssignMd;
	}
	public int getM_notAssignMdSum() {
		return m_notAssignMdSum;
	}
	public void setM_notAssignMdSum(int m_notAssignMdSum) {
		this.m_notAssignMdSum = m_notAssignMdSum;
	}
	public int getM_lpSum() {
		return m_lpSum;
	}
	public void setM_lpSum(int m_lpSum) {
		this.m_lpSum = m_lpSum;
	}
	public String getM_notAssignLp() {
		return m_notAssignLp;
	}
	public void setM_notAssignLp(String m_notAssignLp) {
		this.m_notAssignLp = m_notAssignLp;
	}
	public int getM_notAssignLpSum() {
		return m_notAssignLpSum;
	}
	public void setM_notAssignLpSum(int m_notAssignLpSum) {
		this.m_notAssignLpSum = m_notAssignLpSum;
	}
	public String getM_operTime() {
		return m_operTime;
	}
	public void setM_operTime(String m_operTime) {
		this.m_operTime = m_operTime;
	}
	
	
}

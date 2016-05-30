package com.newenv.communityFocus.base;

import java.io.Serializable;
import java.util.List;

import org.apache.cxf.common.util.StringUtils;

import com.newenv.communityFocus.util.JSONable;


/**
 * @author Helix.Chan
 *
 */
public class PageInfo implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 9006294122945566635L;

	//asc sort order
	public static final String SORT_ORDER_ASC = "ASC";
	
	//Desc sort order
	public static final String SORT_ORDER_DESC = "DESC";
	
	
	private Integer rows;                          //the record quantity in one page
	private Integer page;                          //current page 
	private Integer records;                       //total recode quantity
	 
	private String sord;                           //sort order
	private String sidx;                           //the field to be sorted
	public static final char SIDX_SPILTTER = '.';  //index splitter
	
	private Integer total;                        //total page
	private String nd;                             //random nubmer

	private List<? extends Object> gridModel;
	
	
	/**
	 * @return
	 */
	public Integer getRows() {
		return rows;
	}
	
	
	/**
	 * @param rows
	 */
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	
	/**
	 * @return
	 */
	public Integer getPage() {
		return page;
	}
	
	/**
	 * @param page
	 */
	public void setPage(Integer page) {
		this.page = page;
	}
	
	
	/**
	 * @return
	 */
	public String getSord() {
		return sord;
	}
	
	/**
	 * @param sord
	 */
	public void setSord(String sord) {
		this.sord = sord;
	}
	
	/**
	 * @return
	 */
	public String getSidx() {
		return sidx;
	}
	
	/**
	 * @param sidx
	 */
	public void setSidx(String sidx) {
		this.sidx = sidx;
	}

	/**
	 * @return
	 */
	public Integer getTotal() {
		return total;
	}
	
	/**
	 * @param total
	 */
	public void setTotal(Integer total) {
		this.total = total;
	}

	/**
	 * @return
	 */
	public String getNd() {
		return nd;
	}
	
	/**
	 * @param nd
	 */
	public void setNd(String nd) {
		this.nd = nd;
	}
	
	/**
	 * @return
	 */
	public Integer getRecords() {
		return records;
	}
	
	/**
	 * it will automatically calculate field totoal
	 * @param records
	 */
	public void setRecords(Integer records) {
		this.records = records;
		if (this.rows!=null&&this.records > 0 && this.rows > 0) {
			this.setTotal((int) Math.ceil((double) this.records / (double) this.rows));
		} else {
			this.setTotal(0);
		}
	}
	/**
	 * @return the gridModel
	 */
	public List<? extends Object> getGridModel() {
		return gridModel;
	}
	/**
	 * @param gridModel the gridModel to set
	 */
	public void setGridModel(List<? extends Object> gridModel) {
		this.gridModel = gridModel;
	}
	
	
	/**
	 * get the from position of the page
	 * @return
	 */
	public Integer getFromPosition(){
		int startpage = (this.getPage()-1)>=0?(this.getPage()-1):0;
		int rows      = this.getRows();
		
		return startpage*rows;
	}
	
	/**
	 * remove the head(first phase of sind,xxx.yyy, xxx is header) of SIND
	 * if it don't exited,return the sind
	 * @return
	 */
	public String removeSINDHeader(){
		
		if(StringUtils.isEmpty(this.sidx)){
			return this.sidx;
		}
		
		int indexof = this.sidx.indexOf(SIDX_SPILTTER)+1;
		
		
		if(indexof==-1                    //not existed
		 ||indexof>=this.sidx.length()){ //the splitter is last character
			return this.sidx;
		}
		
		
		return this.sidx.substring(indexof);
	}
	
	@SuppressWarnings("unchecked")
	public String toJSON(){
		StringBuffer json = new StringBuffer("{\"page\":" + this.getPage() + ",\"records\":" + this.getRecords() + ",\"total\":" + this.getTotal() + ",\"datas\":[");
		List<JSONable> objs = (List<JSONable>) this.getGridModel();
		int i=0;
		for(JSONable obj : objs){
			if(i>0)json.append(",");
			json.append(obj.toJSON());
			i++;
		}
		json.append("]}");
		return json.toString();
	}
}

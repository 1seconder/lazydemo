package com.newenv.communityFocus.domain.jinggeng;

import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

/**
 * @author hui.peng
 */
@Table("lpjg_customerrequirementofbuy")
public class CustomerRequirementOfBuy  {
	
	@Id
	private int id ;
	private long customerId;
	
	private int saleType; //fuk 
	
	private int payingType;


	public int getSaleType() {
		return saleType;
	}

	public void setSaleType(int saleType) {
		this.saleType = saleType;
	}

	public int getPayingType() {
		return payingType;
	}

	public void setPayingType(int payingType) {
		this.payingType = payingType;
	}

	public long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(long customerId) {
		this.customerId = customerId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	

}
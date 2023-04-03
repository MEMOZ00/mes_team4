package com.itwillbs.domain;

import java.sql.Date;

public class ReleaseDTO {
	// 출고코드, 출고일자, 적요, 진행상태, 출고수량
	private String rel_schedule_cd;
	private Date rel_date;
	private String remarks;
	private String out_complete;
	private int rel_count;
	
	private String business_cd;
	private String wh_cd;
	private String product_cd;
	
	public String getBusiness_cd() {
		return business_cd;
	}
	public void setBusiness_cd(String business_cd) {
		this.business_cd = business_cd;
	}
	public String getWh_cd() {
		return wh_cd;
	}
	public void setWh_cd(String wh_cd) {
		this.wh_cd = wh_cd;
	}
	public String getProduct_cd() {
		return product_cd;
	}
	public void setProduct_cd(String product_cd) {
		this.product_cd = product_cd;
	}
	
	public String getRel_schedule_cd() {
		return rel_schedule_cd;
	}
	public void setRel_schedule_cd(String rel_schedule_cd) {
		this.rel_schedule_cd = rel_schedule_cd;
	}
	public Date getRel_date() {
		return rel_date;
	}
	public void setRel_date(Date rel_date) {
		this.rel_date = rel_date;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getOut_complete() {
		return out_complete;
	}
	public void setOut_complete(String out_complete) {
		this.out_complete = out_complete;
	}
	public int getRel_count() {
		return rel_count;
	}
	public void setRel_count(int rel_count) {
		this.rel_count = rel_count;
	}
	

}
	
	
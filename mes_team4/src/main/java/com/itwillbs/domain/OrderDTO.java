package com.itwillbs.domain;

import java.sql.Date;

public class OrderDTO {

	private String order_cd;
	private int prodect_cd;
	private int order_count;
	private int product_count = (int) (order_count * 1.1);
	private int consumtion;
	private int consumtion2 = product_count * consumtion;
	private String line_cd;
	private Date deliver_date;
	private Date procom_date;
	private String wh_dv;
	private String wh_dv2;
	private String instruction_cd;
	
	public String getOrder_cd() {
		return order_cd;
	}
	public void setOrder_cd(String order_cd) {
		this.order_cd = order_cd;
	}
	public int getProdect_cd() {
		return prodect_cd;
	}
	public void setProdect_cd(int prodect_cd) {
		this.prodect_cd = prodect_cd;
	}
	public int getOrder_count() {
		return order_count;
	}
	public void setOrder_count(int order_count) {
		this.order_count = order_count;
	}
	public int getProduct_count() {
		return product_count;
	}
	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}
	public int getConsumtion() {
		return consumtion;
	}
	public void setConsumtion(int consumtion) {
		this.consumtion = consumtion;
	}
	public int getConsumtion2() {
		return consumtion2;
	}
	public void setConsumtion2(int consumtion2) {
		this.consumtion2 = consumtion2;
	}
	public String getLine_cd() {
		return line_cd;
	}
	public void setLine_cd(String line_cd) {
		this.line_cd = line_cd;
	}
	public Date getDeliver_date() {
		return deliver_date;
	}
	public void setDeliver_date(Date deliver_date) {
		this.deliver_date = deliver_date;
	}
	public Date getProcom_date() {
		return procom_date;
	}
	public void setProcom_date(Date procom_date) {
		this.procom_date = procom_date;
	}
	public String getWh_dv() {
		return wh_dv;
	}
	public void setWh_dv(String wh_dv) {
		this.wh_dv = wh_dv;
	}
	public String getWh_dv2() {
		return wh_dv2;
	}
	public void setWh_dv2(String wh_dv2) {
		this.wh_dv2 = wh_dv2;
	}
	public String getInstruction_cd() {
		return instruction_cd;
	}
	public void setInstruction_cd(String instruction_cd) {
		this.instruction_cd = instruction_cd;
	}
	
	
	
}

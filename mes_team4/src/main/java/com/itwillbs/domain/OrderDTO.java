package com.itwillbs.domain;

import java.sql.Date;

public class OrderDTO {

	private String order_cd;  // 수주번호
	private int product_cd;   // 품목코드
	private int order_count;  // 수주량
	private int product_count = (int) (order_count * 1.1);  // 생산량
	private int consumtion;  // 원자재소요량
	private int consumtion2 = product_count * consumtion;  // 원자재사용량
	private String line_cd;  // 라인코드
	private Date deliver_date;  // 납품예정일
	private Date procom_date;  // 생산완료일(납품예정일 -3일)
	private String wh_dv;  // 원자재창고
	private String wh_dv2;  // 재고창고
	private String instruction_cd;  // 작업지시번호
	
	public String getOrder_cd() {
		return order_cd;
	}
	public void setOrder_cd(String order_cd) {
		this.order_cd = order_cd;
	}
	public int getProduct_cd() {
		return product_cd;
	}
	public void setProduct_cd(int product_cd) {
		this.product_cd = product_cd;
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

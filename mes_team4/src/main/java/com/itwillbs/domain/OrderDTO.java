package com.itwillbs.domain;

import java.sql.Date;

public class OrderDTO {

	private String order_cd;  // 수주코드
	private int product_cd;   // 품목코드

	private int instruction_qt;  // 지시수량
	private String line_cd;  // 라인코드
	private Date instruction_date;  // 작업지시일자
	private String instruction_state;  // 작업지시상태
	private String instruction_code;  // 작업지시코드
	
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
	public int getInstruction_qt() {
		return instruction_qt;
	}
	public void setInstruction_qt(int instruction_qt) {
		this.instruction_qt = instruction_qt;
	}
	public String getLine_cd() {
		return line_cd;
	}
	public void setLine_cd(String line_cd) {
		this.line_cd = line_cd;
	}
	public Date getInstruction_date() {
		return instruction_date;
	}
	public void setInstruction_date(Date instruction_date) {
		this.instruction_date = instruction_date;
	}
	public String getInstruction_state() {
		return instruction_state;
	}
	public void setInstruction_state(String instruction_state) {
		this.instruction_state = instruction_state;
	}
	public String getInstruction_code() {
		return instruction_code;
	}
	public void setInstruction_code(String instruction_code) {
		this.instruction_code = instruction_code;
	}
	

	
	
}

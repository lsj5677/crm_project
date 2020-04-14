package com.crm.vo;

public class ShoppingVO {
	private String c_shopping_id;
	private String c_user_id;
	private String c_id;
	private String c_name;
	private String c_shopping_deleteyn;
	private String c_shopping_insertdate;
	private String c_shopping_updatedate;
	
	public String getC_shopping_id() {
		return c_shopping_id;
	}
	public void setC_shopping_id(String c_shopping_id) {
		this.c_shopping_id = c_shopping_id;
	}
	public String getC_user_id() {
		return c_user_id;
	}
	public void setC_user_id(String c_user_id) {
		this.c_user_id = c_user_id;
	}
	public String getc_id() {
		return c_id;
	}
	public void setc_id(String c_id) {
		this.c_id = c_id;
	}
	public String getc_name() {
		return c_name;
	}
	public void setc_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_shopping_deleteyn() {
		return c_shopping_deleteyn;
	}
	public void setC_shopping_deleteyn(String c_shopping_deleteyn) {
		this.c_shopping_deleteyn = c_shopping_deleteyn;
	}
	public String getC_shopping_insertdate() {
		return c_shopping_insertdate;
	}
	public void setC_shopping_insertdate(String c_shopping_insertdate) {
		this.c_shopping_insertdate = c_shopping_insertdate;
	}
	public String getC_shopping_updatedate() {
		return c_shopping_updatedate;
	}
	public void setC_shopping_updatedate(String c_shopping_updatedate) {
		this.c_shopping_updatedate = c_shopping_updatedate;
	}
	@Override
	public String toString() {
		return "ShoppingVO [c_shopping_id=" + c_shopping_id + ", c_user_id=" + c_user_id + ", c_id="
				+ c_id + ", c_name=" + c_name + ", c_shopping_deleteyn=" + c_shopping_deleteyn
				+ ", c_shopping_insertdate=" + c_shopping_insertdate + ", c_shopping_updatedate="
				+ c_shopping_updatedate + "]";
	}


}

package com.crm.vo;

public class ProductVO {
	private String c_id;
	private String c_name;
	private String c_price;
	private String c_info;
	private String c_index;
	private String c_size;
	private String c_stock;
	private String c_image;
	private String c_category1;
	private String c_category2;

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_price() {
		return c_price;
	}

	public void setC_price(String c_price) {
		this.c_price = c_price;
	}

	public String getC_info() {
		return c_info;
	}

	public void setC_info(String c_info) {
		this.c_info = c_info;
	}

	public String getC_index() {
		return c_index;
	}

	public void setC_index(String c_index) {
		this.c_index = c_index;
	}

	public String getC_size() {
		return c_size;
	}

	public void setC_size(String c_size) {
		this.c_size = c_size;
	}

	public String getC_stock() {
		return c_stock;
	}

	public void setC_stock(String c_stock) {
		this.c_stock = c_stock;
	}

	public String getC_image() {
		return c_image;
	}

	public void setC_image(String c_image) {
		this.c_image = c_image;
	}

	public String getC_category1() {
		return c_category1;
	}

	public void setC_category1(String c_category1) {
		this.c_category1 = c_category1;
	}

	public String getC_category2() {
		return c_category2;
	}

	public void setC_category2(String c_category2) {
		this.c_category2 = c_category2;
	}

	@Override
	public String toString() {
		return "ProductVO [c_id=" + c_id + ", c_name=" + c_name + ", c_price=" + c_price + ", c_info=" + c_info
				+ ", c_index=" + c_index + ", c_size=" + c_size + ", c_stock=" + c_stock + ", c_image=" + c_image
				+ ", c_category1=" + c_category1 + ", c_category2=" + c_category2 + "]";
	}

}

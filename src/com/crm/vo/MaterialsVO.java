package com.crm.vo;


import com.crm.common.vo.CommonVO;

public class MaterialsVO extends CommonVO{
	private String comment;
    private String filename1;
    private String orgFileName1;
    private String filename2;
    private String orgFileName2;
    private String c_materials_oFile;
	private String c_user_id; //
	private String c_materials_no; //
	private String c_materials_title; //
	private String c_materials_name; //
	private String c_materials_memo; 
	private String c_materials_file; // 
	private String c_materials_pw; // 
	private String c_materials_insertdate; // 
	private String c_materials_updatedate;//
	private String c_materials_deleteyn; // 
	private int c_materials_viewcount; //
	private String chaebunboard2; // 
	public String getC_materials_oFile() {
		return c_materials_oFile;
	}
	public void setC_materials_oFile(String c_materials_oFile) {
		this.c_materials_oFile = c_materials_oFile;
	}
	
	public String getC_user_id() {
		return c_user_id;
	}
	public void setC_user_id(String c_user_id) {
		this.c_user_id = c_user_id;
	}
	public String getC_materials_no() {
		return c_materials_no;
	}
	public void setC_materials_no(String c_materials_no) {
		this.c_materials_no = c_materials_no;
	}
	public String getC_materials_title() {
		return c_materials_title;
	}
	public void setC_materials_title(String c_materials_title) {
		this.c_materials_title = c_materials_title;
	}
	public String getC_materials_name() {
		return c_materials_name;
	}
	public void setC_materials_name(String c_materials_name) {
		this.c_materials_name = c_materials_name;
	}
	public String getC_materials_memo() {
		return c_materials_memo;
	}
	public void setC_materials_memo(String c_materials_memo) {
		this.c_materials_memo = c_materials_memo;
	}
	public String getC_materials_file() {
		return c_materials_file;
	}
	public void setC_materials_file(String c_materials_file) {
		this.c_materials_file = c_materials_file;
	}
	public String getC_materials_pw() {
		return c_materials_pw;
	}
	public void setC_materials_pw(String c_materials_pw) {
		this.c_materials_pw = c_materials_pw;
	}
	public String getC_materials_insertdate() {
		return c_materials_insertdate;
	}
	public void setC_materials_insertdate(String c_materials_insertdate) {
		this.c_materials_insertdate = c_materials_insertdate;
	}
	public String getC_materials_updatedate() {
		return c_materials_updatedate;
	}
	public void setC_materials_updatedate(String c_materials_updatedate) {
		this.c_materials_updatedate = c_materials_updatedate;
	}
	public String getC_materials_deleteyn() {
		return c_materials_deleteyn;
	}
	public void setC_materials_deleteyn(String c_materials_deleteyn) {
		this.c_materials_deleteyn = c_materials_deleteyn;
	}
	public int getC_materials_viewcount() {
		return c_materials_viewcount;
	}
	public void setC_materials_viewcount(int c_materials_viewcount) {
		this.c_materials_viewcount = c_materials_viewcount;
	}
	public String getChaebunboard2() {
		return chaebunboard2;
	}
	public void setChaebunboard2(String chaebunboard) {
		this.chaebunboard2 = chaebunboard;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getFilename1() {
		return filename1;
	}
	public void setFilename1(String filename1) {
		this.filename1 = filename1;
	}
	public String getOrgFileName1() {
		return orgFileName1;
	}
	public void setOrgFileName1(String orgFileName1) {
		this.orgFileName1 = orgFileName1;
	}
	public String getFilename2() {
		return filename2;
	}
	public void setFilename2(String filename2) {
		this.filename2 = filename2;
	}
	public String getOrgFileName2() {
		return orgFileName2;
	}
	public void setOrgFileName2(String orgFileName2) {
		this.orgFileName2 = orgFileName2;
	}
	@Override
	public String toString() {
		return "MaterialsVO [comment=" + comment + ", filename1=" + filename1 + ", orgFileName1=" + orgFileName1
				+ ", filename2=" + filename2 + ", orgFileName2=" + orgFileName2 + ", c_materials_oFile="
				+ c_materials_oFile + ", c_user_id=" + c_user_id + ", c_materials_no=" + c_materials_no
				+ ", c_materials_title=" + c_materials_title + ", c_materials_name=" + c_materials_name
				+ ", c_materials_memo=" + c_materials_memo + ", c_materials_file=" + c_materials_file
				+ ", c_materials_pw=" + c_materials_pw + ", c_materials_insertdate=" + c_materials_insertdate
				+ ", c_materials_updatedate=" + c_materials_updatedate + ", c_materials_deleteyn="
				+ c_materials_deleteyn + ", c_materials_viewcount=" + c_materials_viewcount + ", chaebunboard="
				+ chaebunboard2 + "]";
	}
	
}

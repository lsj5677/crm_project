package com.crm.vo;

public class PerformanceVO {
	
	private String c_User_Id;
	private String c_Performance_Insertdate;
	private String c_Performance_Result;
	private String c_Performance_DeleteYN;
	private String search;
	private String keyword;
	public String getC_User_Id() {
		return c_User_Id;
	}
	public void setC_User_Id(String c_User_Id) {
		this.c_User_Id = c_User_Id;
	}
	public String getC_Performance_Insertdate() {
		return c_Performance_Insertdate;
	}
	public void setC_Performance_Insertdate(String c_Performance_Insertdate) {
		this.c_Performance_Insertdate = c_Performance_Insertdate;
	}
	public String getC_Performance_Result() {
		return c_Performance_Result;
	}
	public void setC_Performance_Result(String c_Performance_Result) {
		this.c_Performance_Result = c_Performance_Result;
	}
	public String getC_Performance_DeleteYN() {
		return c_Performance_DeleteYN;
	}
	public void setC_Performance_DeleteYN(String c_Performance_DeleteYN) {
		this.c_Performance_DeleteYN = c_Performance_DeleteYN;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	@Override
	public String toString() {
		return "PerformanceVO [c_User_Id=" + c_User_Id + ", c_Performance_Insertdate=" + c_Performance_Insertdate
				+ ", c_Performance_Result=" + c_Performance_Result + ", c_Performance_DeleteYN="
				+ c_Performance_DeleteYN + ", search=" + search + ", keyword=" + keyword + "]";
	}
	
	

}

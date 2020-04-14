package com.crm.vo;


public class SurveyVO {
	
	private String c_client_no;
	private String c_client_name;
	private String c_client_email;
	private String c_user_name;
	private String c_getdate;
	private String c_overall;
	private String c_satisf;
	private String c_feedback;
	private String c_recommend;
	private String c_opinion;
	private String c_deleteYN;
	
	public String getC_client_no() {
		return c_client_no;
	}
	public void setC_client_no(String c_client_no) {
		this.c_client_no = c_client_no;
	}
	public String getC_client_name() {
		return c_client_name;
	}
	public void setC_client_name(String c_client_name) {
		this.c_client_name = c_client_name;
	}
	public String getC_client_email() {
		return c_client_email;
	}
	public void setC_client_email(String c_client_email) {
		this.c_client_email = c_client_email;
	}
	public String getC_user_name() {
		return c_user_name;
	}
	public void setC_user_name(String c_user_name) {
		this.c_user_name = c_user_name;
	}
	public String getC_getdate() {
		return c_getdate;
	}
	public void setC_getdate(String c_getdate) {
		this.c_getdate = c_getdate;
	}
	public String getC_overall() {
		return c_overall;
	}
	public void setC_overall(String c_overall) {
		this.c_overall = c_overall;
	}
	public String getC_satisf() {
		return c_satisf;
	}
	public void setC_satisf(String c_satisf) {
		this.c_satisf = c_satisf;
	}
	public String getC_feedback() {
		return c_feedback;
	}
	public void setC_feedback(String c_feedback) {
		this.c_feedback = c_feedback;
	}
	public String getC_recommend() {
		return c_recommend;
	}
	public void setC_recommend(String c_recommend) {
		this.c_recommend = c_recommend;
	}
	public String getC_opinion() {
		return c_opinion;
	}
	public void setC_opinion(String c_opinion) {
		this.c_opinion = c_opinion;
	}
	public String getC_deleteYN() {
		return c_deleteYN;
	}
	public void setC_deleteYN(String c_deleteYN) {
		this.c_deleteYN = c_deleteYN;
	}
	
	@Override
	public String toString() {
		return "SurveyVO [c_client_no=" + c_client_no + ", c_client_name=" + c_client_name + ", c_client_email="
				+ c_client_email + ", c_user_name=" + c_user_name + ", c_getdate=" + c_getdate + ", c_overall="
				+ c_overall + ", c_satisf=" + c_satisf + ", c_feedback=" + c_feedback + ", c_recommend=" + c_recommend
				+ ", c_opinion=" + c_opinion + ", c_deleteYN=" + c_deleteYN + "]";
	}
}

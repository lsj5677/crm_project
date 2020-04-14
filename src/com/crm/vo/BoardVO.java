package com.crm.vo;

import org.springframework.web.multipart.MultipartFile;

import com.crm.common.vo.CommonVO;

public class BoardVO extends CommonVO {
	private String c_user_id; //사용자 아이디
	private String c_board_select; // 선택사항
	private String c_board_no; // 글번호 
	private String c_board_name; // 작성자
	private String c_board_title; // 제목
	private String c_board_content; // 내용
	private String c_board_insertdate; // 작성일
	private String c_board_pw; // 비밀번호
	private MultipartFile file; // 파일
	private String c_board_img; // 이미지 파일
	private int c_board_viewcount; // 조회수
	private String c_board_deleteyn; //삭제여부
	private String c_board_auto_insertdate; //자동 등록일
	private String c_board_auto_deleteyn; // 자동 삭제일 
	private String c_board_alarm; // 알람일 
	private String chaebunboard3; 
	private String c_reply_cnt;
	private String startDate;
	private String endDate;
	
	
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getC_reply_cnt() {
		return c_reply_cnt;
	}
	public void setC_reply_cnt(String c_reply_cnt) {
		this.c_reply_cnt = c_reply_cnt;
	}
	public String getC_user_id() {
		return c_user_id;
	}
	public void setC_user_id(String c_user_id) {
		this.c_user_id = c_user_id;
	}
	public String getC_board_select() {
		return c_board_select;
	}
	public void setC_board_select(String c_board_select) {
		this.c_board_select = c_board_select;
	}
	public String getC_board_no() {
		return c_board_no;
	}
	public void setC_board_no(String c_board_no) {
		this.c_board_no = c_board_no;
	}
	public String getC_board_name() {
		return c_board_name;
	}
	public void setC_board_name(String c_board_name) {
		this.c_board_name = c_board_name;
	}
	public String getC_board_title() {
		return c_board_title;
	}
	public void setC_board_title(String c_board_title) {
		this.c_board_title = c_board_title;
	}
	public String getC_board_content() {
		return c_board_content;
	}
	public void setC_board_content(String c_board_content) {
		this.c_board_content = c_board_content;
	}
	public String getC_board_insertdate() {
		return c_board_insertdate;
	}
	public void setC_board_insertdate(String c_board_insertdate) {
		this.c_board_insertdate = c_board_insertdate;
	}
	public String getC_board_pw() {
		return c_board_pw;
	}
	public void setC_board_pw(String c_board_pw) {
		this.c_board_pw = c_board_pw;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getC_board_img() {
		return c_board_img;
	}
	public void setC_board_img(String c_board_img) {
		this.c_board_img = c_board_img;
	}
	public int getC_board_viewcount() {
		return c_board_viewcount;
	}
	public void setC_board_viewcount(int c_board_viewcount) {
		this.c_board_viewcount = c_board_viewcount;
	}
	public String getC_board_deleteyn() {
		return c_board_deleteyn;
	}
	public void setC_board_deleteyn(String c_board_deleteyn) {
		this.c_board_deleteyn = c_board_deleteyn;
	}
	public String getC_board_auto_insertdate() {
		return c_board_auto_insertdate;
	}
	public void setC_board_auto_insertdate(String c_board_auto_insertdate) {
		this.c_board_auto_insertdate = c_board_auto_insertdate;
	}
	public String getC_board_auto_deleteyn() {
		return c_board_auto_deleteyn;
	}
	public void setC_board_auto_deleteyn(String c_board_auto_deleteyn) {
		this.c_board_auto_deleteyn = c_board_auto_deleteyn;
	}
	public String getC_board_alarm() {
		return c_board_alarm;
	}
	public void setC_board_alarm(String c_board_alarm) {
		this.c_board_alarm = c_board_alarm;
	}
	public String getChaebunboard3() {
		return chaebunboard3;
	}
	public void setChaebunboard3(String chaebunboard3) {
		this.chaebunboard3 = chaebunboard3;
	}
	
}

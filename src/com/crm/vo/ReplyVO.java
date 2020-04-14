package com.crm.vo;

public class ReplyVO {
	private String c_user_id; //����� ���̵�
	private String c_comment_no; //��� ��ȣ
	private String c_board_no; // �Խ��� �۹�ȣ
	private String c_comment_name =""; // �ۼ���
	private String c_comment_content =""; // ����
	private String c_comment_insertdate =""; // �ۼ���
	private String c_comment_pw =""; // ��й�ȣ
	private String c_comment_updatedate; // ������
	private String c_comment_deleteyn; // ������
	private int c_comment_cut;
	
	public int getC_comment_cut() {
		return c_comment_cut;
	}
	public void setC_comment_cut(int c_comment_cut) {
		this.c_comment_cut = c_comment_cut;
	}
	public String getC_user_id() {
		return c_user_id;
	}
	public void setC_user_id(String c_user_id) {
		this.c_user_id = c_user_id;
	}
	public String getC_comment_no() {
		return c_comment_no;
	}
	public void setC_comment_no(String c_comment_no) {
		this.c_comment_no = c_comment_no;
	}
	public String getC_board_no() {
		return c_board_no;
	}
	public void setC_board_no(String c_board_no) {
		this.c_board_no = c_board_no;
	}
	public String getC_comment_name() {
		return c_comment_name;
	}
	public void setC_comment_name(String c_comment_name) {
		this.c_comment_name = c_comment_name;
	}
	public String getC_comment_content() {
		return c_comment_content;
	}
	public void setC_comment_content(String c_comment_content) {
		this.c_comment_content = c_comment_content;
	}
	public String getC_comment_insertdate() {
		return c_comment_insertdate;
	}
	public void setC_comment_insertdate(String c_comment_insertdate) {
		this.c_comment_insertdate = c_comment_insertdate;
	}
	public String getC_comment_pw() {
		return c_comment_pw;
	}
	public void setC_comment_pw(String c_comment_pw) {
		this.c_comment_pw = c_comment_pw;
	}
	public String getC_comment_updatedate() {
		return c_comment_updatedate;
	}
	public void setC_comment_updatedate(String c_comment_updatedate) {
		this.c_comment_updatedate = c_comment_updatedate;
	}
	public String getC_comment_deleteyn() {
		return c_comment_deleteyn;
	}
	public void setC_comment_deleteyn(String c_comment_deleteyn) {
		this.c_comment_deleteyn = c_comment_deleteyn;
	}
	
}


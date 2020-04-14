package com.crm.vo;

public class ClientVO extends PagingVO {
	private String c_Client_No;
	private String c_User_Id;
	private String c_Client_Name;
	private String c_Client_Hp;
	private String c_Client_Email;
	private String c_Client_Birth;
	private String c_Client_Addr;
	private String c_Client_Addr2;
	private String c_Client_Addr3;
	private String c_Client_Insertdate;
	private String c_Client_Updatedate;
	private String c_Client_DeleteYN;
	
	public String getC_Client_No() {
		return c_Client_No;
	}
	public void setC_Client_No(String c_Client_No) {
		this.c_Client_No = c_Client_No;
	}
	public String getC_User_Id() {
		return c_User_Id;
	}
	public void setC_User_Id(String c_User_Id) {
		this.c_User_Id = c_User_Id;
	}
	public String getC_Client_Name() {
		return c_Client_Name;
	}
	public void setC_Client_Name(String c_Client_Name) {
		this.c_Client_Name = c_Client_Name;
	}
	public String getC_Client_Hp() {
		return c_Client_Hp;
	}
	public void setC_Client_Hp(String c_Client_Hp) {
		this.c_Client_Hp = c_Client_Hp;
	}
	public String getC_Client_Email() {
		return c_Client_Email;
	}
	public void setC_Client_Email(String c_Client_Email) {
		this.c_Client_Email = c_Client_Email;
	}
	public String getC_Client_Birth() {
		return c_Client_Birth;
	}
	public void setC_Client_Birth(String c_Client_Birth) {
		this.c_Client_Birth = c_Client_Birth;
	}
	public String getC_Client_Addr() {
		return c_Client_Addr;
	}
	public void setC_Client_Addr(String c_Client_Addr) {
		this.c_Client_Addr = c_Client_Addr;
	}
	public String getC_Client_Addr2() {
		return c_Client_Addr2;
	}
	public void setC_Client_Addr2(String c_Client_Addr2) {
		this.c_Client_Addr2 = c_Client_Addr2;
	}
	public String getC_Client_Addr3() {
		return c_Client_Addr3;
	}
	public void setC_Client_Addr3(String c_Client_Addr3) {
		this.c_Client_Addr3 = c_Client_Addr3;
	}
	public String getC_Client_Insertdate() {
		return c_Client_Insertdate;
	}
	public void setC_Client_Insertdate(String c_Client_Insertdate) {
		this.c_Client_Insertdate = c_Client_Insertdate;
	}
	public String getC_Client_Updatedate() {
		return c_Client_Updatedate;
	}
	public void setC_Client_Updatedate(String c_Client_Updatedate) {
		this.c_Client_Updatedate = c_Client_Updatedate;
	}
	public String getC_Client_DeleteYN() {
		return c_Client_DeleteYN;
	}
	public void setC_Client_DeleteYN(String c_Client_DeleteYN) {
		this.c_Client_DeleteYN = c_Client_DeleteYN;
	}
	@Override
	public String toString() {
		return "ClientVO [c_Client_No=" + c_Client_No + ", c_User_Id=" + c_User_Id + ", c_Client_Name=" + c_Client_Name
				+ ", c_Client_Hp=" + c_Client_Hp + ", c_Client_Email=" + c_Client_Email + ", c_Client_Birth="
				+ c_Client_Birth + ", c_Client_Addr=" + c_Client_Addr + ", c_Client_Addr2=" + c_Client_Addr2
				+ ", c_Client_Addr3=" + c_Client_Addr3 + ", c_Client_Insertdate=" + c_Client_Insertdate
				+ ", c_Client_Updatedate=" + c_Client_Updatedate + ", c_Client_DeleteYN=" + c_Client_DeleteYN + "]";
	}
	
}

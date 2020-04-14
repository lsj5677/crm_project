package com.crm.vo;

public class UserVO extends PagingVO {
	private String c_User_Id;
	private String c_User_Pw;
	private String c_User_Name;
	private String c_User_Department;
	private String c_User_Hp;
	private String c_User_Email;
	private String c_User_Birth;
	private String c_User_Addr;
	private String c_User_Addr2;
	private String c_User_Addr3;
	private String c_User_Level;
	private String c_User_Insertdate;
	private String c_User_Updatedate;
	private String c_User_DeleteYN;
	
	public String getC_User_Id() {
		return c_User_Id;
	}

	public void setC_User_Id(String c_User_Id) {
		this.c_User_Id = c_User_Id;
	}

	public String getC_User_Pw() {
		return c_User_Pw;
	}

	public void setC_User_Pw(String c_User_Pw) {
		this.c_User_Pw = c_User_Pw;
	}

	public String getC_User_Name() {
		return c_User_Name;
	}

	public void setC_User_Name(String c_User_Name) {
		this.c_User_Name = c_User_Name;
	}

	public String getC_User_Department() {
		return c_User_Department;
	}

	public void setC_User_Department(String c_User_Department) {
		this.c_User_Department = c_User_Department;
	}

	public String getC_User_Hp() {
		return c_User_Hp;
	}

	public void setC_User_Hp(String c_User_Hp) {
		this.c_User_Hp = c_User_Hp;
	}

	public String getC_User_Email() {
		return c_User_Email;
	}

	public void setC_User_Email(String c_User_Email) {
		this.c_User_Email = c_User_Email;
	}

	public String getC_User_Birth() {
		return c_User_Birth;
	}

	public void setC_User_Birth(String c_User_Birth) {
		this.c_User_Birth = c_User_Birth;
	}

	public String getC_User_Addr() {
		return c_User_Addr;
	}

	public void setC_User_Addr(String c_User_Addr) {
		this.c_User_Addr = c_User_Addr;
	}

	public String getC_User_Addr2() {
		return c_User_Addr2;
	}

	public void setC_User_Addr2(String c_User_Addr2) {
		this.c_User_Addr2 = c_User_Addr2;
	}

	public String getC_User_Addr3() {
		return c_User_Addr3;
	}

	public void setC_User_Addr3(String c_User_Addr3) {
		this.c_User_Addr3 = c_User_Addr3;
	}

	public String getC_User_Level() {
		return c_User_Level;
	}

	public void setC_User_Level(String c_User_Level) {
		this.c_User_Level = c_User_Level;
	}

	public String getC_User_Insertdate() {
		return c_User_Insertdate;
	}

	public void setC_User_Insertdate(String c_User_Insertdate) {
		this.c_User_Insertdate = c_User_Insertdate;
	}

	public String getC_User_Updatedate() {
		return c_User_Updatedate;
	}

	public void setC_User_Updatedate(String c_User_Updatedate) {
		this.c_User_Updatedate = c_User_Updatedate;
	}

	public String getC_User_DeleteYN() {
		return c_User_DeleteYN;
	}

	public void setC_User_DeleteYN(String c_User_DeleteYN) {
		this.c_User_DeleteYN = c_User_DeleteYN;
	}

	@Override
	public String toString() {
		return "UserVO [c_User_Id=" + c_User_Id + ", c_User_Pw=" + c_User_Pw + ", c_User_Name=" + c_User_Name
				+ ", c_User_Department=" + c_User_Department + ", c_User_Hp=" + c_User_Hp + ", c_User_Email="
				+ c_User_Email + ", c_User_Birth=" + c_User_Birth + ", c_User_Addr=" + c_User_Addr + ", c_User_Addr2="
				+ c_User_Addr2 + ", c_User_Addr3=" + c_User_Addr3 + ", c_User_Level=" + c_User_Level
				+ ", c_User_Insertdate=" + c_User_Insertdate + ", c_User_Updatedate=" + c_User_Updatedate
				+ ", c_User_DeleteYN=" + c_User_DeleteYN + "]";
	}
}

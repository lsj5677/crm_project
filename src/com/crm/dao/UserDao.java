package com.crm.dao;

import java.util.List;

import com.crm.vo.ClientVO;
import com.crm.vo.PagingVO;
import com.crm.vo.UserVO;

public interface UserDao {
	public int userInsertOk(UserVO uvo);
	public int userUpdateOk(UserVO uvo);
	public int userDelete(String c_User_Id);
	public List<UserVO> userList(PagingVO pvo);
	public UserVO userDetail(String id);
	public UserVO userDetailId(String uvo);
	public int userIdCheck(String c_User_Id);
	public List<ClientVO> userClientList(String client);
	public UserVO userLogin(UserVO usrVO);
	public int userCountBoard(PagingVO pvo);
}

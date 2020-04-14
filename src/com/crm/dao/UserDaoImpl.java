package com.crm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.vo.ClientVO;
import com.crm.vo.PagingVO;
import com.crm.vo.UserVO;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private SqlSession session;
	
	//�쉶�썝媛��엯 ok
	@Override
	public int userInsertOk(UserVO userVO) {
		return session.insert("userInsertOk", userVO);
	}
	
	//�뾽�뜲�씠�듃 ok
	@Override
	public int userUpdateOk(UserVO userVO) {
		return session.update("userUpdateOk", userVO);
	}
	
	//�뵜由ы듃
	@Override
	public int userDelete(String c_User_Id) {
		return session.update("userDelete", c_User_Id );
	}

	//由ъ뒪�듃
	@Override
	public List<UserVO> userList(PagingVO pvo) {
		return session.selectList("userList", pvo);
	}

	//�긽�꽭�젙蹂� (�뵒�뤃�듃)
	@Override
	public UserVO userDetail(String user_Id) {
		return (UserVO)session.selectOne("userDetail", user_Id);
	}
	
	//�긽�꽭�젙蹂�(id)
	@Override
	public UserVO userDetailId(String c_User_Id) {
		return (UserVO)session.selectOne("userDetailId", c_User_Id);
	}
	
	//ajax�븘�뵒 泥댄겕
	@Override
	public int userIdCheck(String c_User_Id) {
		return session.selectOne("userIdCheck", c_User_Id);
	}

	@Override
	public List<ClientVO> userClientList(String client) {
		return session.selectList("userClientList", client);
	}

	@Override
	public UserVO userLogin(UserVO userVO) {
		return (UserVO)session.selectOne("userLogin", userVO);
	}


	@Override
	public int userCountBoard(PagingVO pvo) {
		// TODO Auto-generated method stub
		return (int)session.selectOne("userCountBoard",pvo);
	}
	
}// UserDao class

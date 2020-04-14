package com.crm.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crm.vo.ClientVO;
import com.crm.vo.PagingVO;
import com.crm.vo.UserVO;
import com.crm.dao.UserDao;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	Logger logger = Logger.getLogger(UserServiceImpl.class);

	@Autowired
	private UserDao userDao;
	//로그인
	@Override
	public UserVO userLogin(UserVO userVO) {
		logger.info("UserServiceImpl.userLogin >>> start");
		logger.info("UserServiceImpl.userLogin >>> param : UserVO = " + userVO.toString());
		return userDao.userLogin(userVO);
	}// userLogin()
	//사원 등록완료
	@Override
	public boolean userInsertOk(UserVO userVO) {
		logger.info("UserServiceImpl.userInsertOk >>> start");
		logger.info("UserServiceImpl.userInsertOk >>> param : UserVO = " + userVO.toString());
		if(userDao.userInsertOk(userVO) > 0){ return true; }
		return false;
	}// userInsertOk()
	//사원 수정에 보여질 데이터
	@Override
	public UserVO userDetail(String id) {
		logger.info("UserServiceImpl.userDetail >>> start");
		logger.info("UserServiceImpl.userDetail >>> param : id = " + id);
		return userDao.userDetail(id);
	}// userDetail()
	//사원 수정완료
	@Override
	public boolean userUpdateOk(UserVO userVO) {
		logger.info("UserServiceImpl.userUpdateOk >>> start");
		logger.info("UserServiceImpl.userUpdateOk >>> param : UserVO = " + userVO.toString());
		if(userDao.userUpdateOk(userVO) > 0){ return true; }
		return false;
	}// userUpdateOk()
	//사원 퇴사완료
	@Override
	public boolean userDelete(String c_User_Id) {
		logger.info("UserServiceImpl.userDelete >>> start");
		logger.info("UserServiceImpl.userDelete >>> param : c_User_Id = " + c_User_Id);
		if(userDao.userDelete(c_User_Id) > 0){ return true; }
		return false;
	}// userDelete()
	//총개수
	@Override
	public int userCountBoard(PagingVO pvo) {
		// TODO Auto-generated method stub
		logger.info("UserServiceImpl.userCountBoard >>> start");
		logger.info("UserServiceImpl.userCountBoard >>> param : UserVO = " + pvo.toString());
		return userDao.userCountBoard(pvo);
	}
	//사원 리스트
	@Override
	public List<UserVO> userList(PagingVO pvo) {
		logger.info("UserServiceImpl.userList >>> start");
		logger.info("UserServiceImpl.userList >>> param : PagingVO = " + pvo.toString2());
		return userDao.userList(pvo);
	}// userList()
	//사원 리스트 옆에 보여질 상세 페이지 
	@Override
	public UserVO userDetailId(String userVO) {
		logger.info("UserServiceImpl.userDetailId >>> start");
		logger.info("UserServiceImpl.userDetailId >>> param : UserVO = " + userVO.toString());
		return userDao.userDetailId(userVO);
	}// userDetailId()
	//고객 리스트
	@Override
	public List<ClientVO> userClientList(String client) {
		logger.info("UserServiceImpl.userClientList >>> start");
		logger.info("UserServiceImpl.userClientList >>> param : client = " + client);
		return userDao.userClientList(client);
	}// clientList
	//Ajax 사원 아이디 중복체크
	@Override
	public String userIdCheck(String c_User_Id) {
		logger.info("UserServiceImpl.userIdCheck >>> start");
		logger.info("UserServiceImpl.userIdCheck >>> param : c_User_Id = " + c_User_Id);
		if(userDao.userIdCheck(c_User_Id) == 0){ return "true"; }
		return "false";
	}// userIdCheck()
	
}// UserServiceImpl class

package com.crm.service;

import java.util.List;

import com.crm.vo.ClientVO;
import com.crm.vo.PagingVO;
import com.crm.vo.UserVO;

public interface UserService {
	//유저 로그인
	public UserVO userLogin(UserVO userVO);
	//사원 등록완료
	public boolean userInsertOk(UserVO userVO);
	//사원 수정에 쓰일 데이터
	public UserVO userDetail(String c_User_Id);
	//사원 수정완료
	public boolean userUpdateOk(UserVO userVO);
	//사원 퇴사완료
	public boolean userDelete(String c_User_Id);
	//유저 리스트
	public List<UserVO> userList(PagingVO pvo);
	//사원 이름 눌렀을때 리스트 옆에 보여질 상세 페이지
	public UserVO userDetailId(String c_User_Id);
	//총 유저
	public int userCountBoard(PagingVO pvo);
	//고객 리스트
	public List<ClientVO> userClientList(String client);
	//Ajax 아이디 중복 체크
	public String userIdCheck(String c_User_Id);
	

}

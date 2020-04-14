package com.crm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.vo.ClientVO;
import com.crm.vo.PagingVO;

@Repository
public class ClientDaoImpl implements ClientDao {

	@Autowired
	private SqlSession session;

	@Override
	public int clientInsertOk(ClientVO clientVO) {
		return session.insert("clientInsertOk", clientVO);
	}// clientInsertOk()

	// 채번
	@Override
	public String chaebun() {
		return session.selectOne("clientChaebun");
	}// chaebun()
	// 담당 직원 확인
	@Override
	public int clientCheck(String c_User_Id) {
		return session.selectOne("clientCheck", c_User_Id);
	}// clientCheck()

	// 고객 업데이트 폼 위한 고객 번호 조회
	@Override
	public ClientVO clientNo(String c_Client_No) {
		return (ClientVO)session.selectOne("clientNo", c_Client_No);
	}// clientNo()

	@Override
	public int clientUpdateOk(ClientVO clientVO) {
		return session.update("clientUpdateOk", clientVO);
	}// clientUpdateOk()

	// 고객 탈퇴
	@Override
	public int clientDeleteOk(String c_Client_No) {
		return session.update("clientDeleteOk", c_Client_No);
	}// clientDeleteOk()

	@Override
	public int clientCountBoard(PagingVO pvo) {
		// TODO Auto-generated method stub
		return (int)session.selectOne("clientCountBoard", pvo);
	}

	@Override
	public List<ClientVO> clientList(PagingVO pvo) {
		// TODO Auto-generated method stub
		return session.selectList("clientList", pvo);
	}

}// ClientDaoImpl class

package com.crm.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crm.common.Chaebun;
import com.crm.dao.ClientDao;
import com.crm.vo.ClientVO;
import com.crm.vo.PagingVO;

@Service
@Transactional
public class ClientServiceImpl implements ClientService {
	Logger logger = Logger.getLogger(ClientServiceImpl.class);
	
	@Autowired
	private ClientDao clientDao;
	//채번 추가 후 고객 정보 등록
	@Override
	public boolean clientInsertOk(ClientVO clientVO) {
		logger.info("ClientServiceImpl.clientInsertOk >>> start");
		logger.info("ClientServiceImpl.clientInsertOk >>> param : ClientVO = " + clientVO.toString());
		clientVO.setC_Client_No(Chaebun.chaebun(clientDao.chaebun(),"c"));
		logger.info("ClientServiceImpl.clientInsertOk >>> return : ClientVO = " + clientVO.toString());
		if( clientDao.clientInsertOk(clientVO) > 0){ return true; }
		return false;
	}// clientInsertOk()
	//고객 수정에 보여질 데이터 
	@Override
	public ClientVO clientNo(String c_Client_No) {
		logger.info("ClientServiceImpl.clientNo >>> start");
		logger.info("ClientServiceImpl.clientNo >>> param : c_Client_No = " + c_Client_No);
		return clientDao.clientNo(c_Client_No);
	}// clientNo()
	//고객 수정완료
	@Override
	public boolean clientUpdateOk(ClientVO clientVO) {
		logger.info("ClientServiceImpl.clientUpdateOk >>> start");
		logger.info("ClientServiceImpl.clientUpdateOk >>> param : ClientVO = " + clientVO.toString());
		if(clientDao.clientUpdateOk(clientVO) > 0){ return true; }
		return false;
	}// clientUpdateOk()
	//고객 탈퇴완료
	@Override
	public boolean clientDeleteOk(String c_Client_No) {
		logger.info("ClientServiceImpl.clientDeleteOk >>> start");
		logger.info("ClientServiceImpl.clientDeleteOk >>> param : c_Client_No = " + c_Client_No);
		if(clientDao.clientDeleteOk(c_Client_No) > 0){ return true; }
		return false;
	}// clientDeleteOk()
	//총개수
	@Override
	public int clientCountBoard(PagingVO pvo) {
		logger.info("ClientServiceImpl.clientCountBoard >>> start");
		logger.info("ClientServiceImpl.clientCountBoard >>> param : PagingVO = " +pvo.toString2());
		return clientDao.clientCountBoard(pvo);
	}
	//고객 리스트
	@Override
	public List<ClientVO> clientList(PagingVO pvo) {
		logger.info("ClientServiceImpl.clientList >>> start");
		logger.info("ClientServiceImpl.clientList >>> param : PagingVO = " +pvo.toString2());
		return clientDao.clientList(pvo); 
	}
	//Ajax 담당 사원 확인
	@Override
	public String clientCheck(String c_User_Id) {
		logger.info("ClientServiceImpl.clientCheck >>> start");
		logger.info("ClientServiceImpl.clientCheck >>> param : c_User_Id = " + c_User_Id);
		if(clientDao.clientCheck(c_User_Id) == 1){ return "true"; }
		return "false";
	}// clientCheck()

}// ClientServiceImpl class

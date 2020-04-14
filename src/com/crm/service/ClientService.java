package com.crm.service;

import java.util.List;

import com.crm.vo.ClientVO;
import com.crm.vo.PagingVO;

public interface ClientService {
	//고객 등록 완료
	public boolean clientInsertOk(ClientVO cvo);
	//고객 수정에 보여질 데이터 
	public ClientVO clientNo(String c_Client_No);
	//고객 수정완료
	public boolean clientUpdateOk(ClientVO cvo);
	//고객 탈퇴완료
	public boolean clientDeleteOk(String c_Client_No);
	// 게시물 총 갯수
	public int clientCountBoard(PagingVO pvo);
	// 페이징 처리 게시글 조회
	public List<ClientVO> clientList(PagingVO pvo);
	//Ajax 고객 등록시 사원확인
	public String clientCheck(String c_User_Id);
}

package com.crm.dao;

import java.util.List;

import com.crm.vo.ClientVO;
import com.crm.vo.PagingVO;

public interface ClientDao {
	public int clientInsertOk(ClientVO cvo);
	public String chaebun();
	public int clientCheck(String c_User_Id);
	public ClientVO clientNo(String c_Client_No);
	public int clientUpdateOk(ClientVO cvo);
	public int clientDeleteOk(String c_Client_No);
	// 게시물 총 갯수
	public int clientCountBoard(PagingVO pvo);
	// 페이징 처리 게시글 조회
	public List<ClientVO> clientList(PagingVO pvo);

}

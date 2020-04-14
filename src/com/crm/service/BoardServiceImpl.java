package com.crm.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crm.dao.BoardDao;
import com.crm.vo.BoardVO;

@Service
@Transactional
public class BoardServiceImpl implements BoardService{

	Logger logger= Logger.getLogger(BoardServiceImpl.class);
	
	@Autowired
	
	private BoardDao boardDao;
	
	//�۸�� ����
	
	@Override
	
	public List<BoardVO> boardList(BoardVO pvo){
		List<BoardVO>myList =null;
		myList = boardDao.boardList(pvo);
		return myList;
		
	}
	//���ڵ� �� ����
	@Override
	
	public int boardListCnt1(BoardVO pvo){
		return boardDao.boardListCnt1(pvo);
		
		
	}
	//�� �Է� ����
	@Override
	
	public int boardInsert(BoardVO pvo){

		int result = 0;
		result = boardDao.boardInsert(pvo);
		return result;
		
	}
	// �ۻ� ����
	
	@Override
	public BoardVO boardDetail(BoardVO pvo){
		BoardVO detail = null;
		detail = boardDao.boardDetail(pvo);
		return detail;
		
		
	}
	
	//�� ���� ����
	
	@Override
	public int boardUpdate(BoardVO pvo){
		int result = 0;
		result = boardDao.boardUpdate(pvo);
		return result;
		
		
	}
	
	// ��й�ȣ Ȯ�� ����
	
	@Override
	public int pwdConfirm(BoardVO pvo){
		int result = 0;
		result = boardDao.pwdConfirm(pvo);
		return result;
		
		
	}
	
	// �ۻ��� ����
	
	@Override
	public int boardDelete(String c_board_no){
		int result = 0;
		result = boardDao.boardDelete(c_board_no);
		return result;
		
	}
	@Override
	public int updateViewCnt0(BoardVO pvo) {
		int result = 0;
		result = boardDao.updateViewCnt0(pvo);
		return result;

	}
	@Override
		public int chaebunBoard3(){
			
			int chaebun = boardDao.chaebunBoard3();
			return chaebun;
			
		}
	
	@Override
	public List<BoardVO> boardNotice() {
		return boardDao.boardNotice();
	}
	
	}	




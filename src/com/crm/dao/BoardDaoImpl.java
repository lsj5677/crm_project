package com.crm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.vo.BoardVO;

@Repository

public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	private SqlSession session;
	
	//�۸�� ����
	@Override
	public List<BoardVO> boardList(BoardVO pvo) {
		// TODO Auto-generated method stub
		return session.selectList("boardList",pvo);
	}
	// ��ü ���ڵ� �Ǽ� ����
	@Override
	public int boardListCnt1(BoardVO pvo) {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("boardListCnt1",pvo);
	}
	//�ۻ󼼺���
	@Override
	public BoardVO boardDetail(BoardVO pvo) {
		// TODO Auto-generated method stub
		return (BoardVO)session.selectOne("boardDetail",pvo);
	}

	
	
	@Override
	public int boardInsert(BoardVO pvo) {
		// TODO Auto-generated method stub
		return session.insert("boardInsert",pvo);
	}

	
	@Override
	public int pwdConfirm(BoardVO pvo) {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("pwdConfirm",pvo);
	}

	@Override
	public int boardUpdate(BoardVO pvo) {
		// TODO Auto-generated method stub
		return session.update("boardUpdate",pvo);
	}

	@Override
	public int boardDelete(String c_board_no) {
		// TODO Auto-generated method stub
		return session.delete("boardDelete",c_board_no);
	}
	@Override
	public int updateViewCnt0(BoardVO pvo) {
		// TODO Auto-generated method stub
		return session.update("updateViewCnt0",pvo);
	}
	@Override
	public int chaebunBoard3() {
		// TODO Auto-generated method stub
		return (int) session.selectOne("chaebunBoard3");
	}
	// ��ü
	
	@Override
	public List<BoardVO> boardNotice() {
		return session.selectList("boardNotice");
	}
}

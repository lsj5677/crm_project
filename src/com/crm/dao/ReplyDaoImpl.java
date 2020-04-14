package com.crm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.vo.ReplyVO;


@Repository

public class ReplyDaoImpl implements ReplyDao {

	@Autowired
	private SqlSession session;
	
	//�� ��� ����
	@Override
	public List<ReplyVO> replyList(String c_board_no) {
		// TODO Auto-generated method stub
		return session.selectList("replyList",c_board_no);
	}

	@Override
	public int replyInsert(ReplyVO rvo) {
		// TODO Auto-generated method stub
		return session.insert("replyInsert",rvo);
	}

	@Override
	public int replyUpdate(ReplyVO rvo) {
		// TODO Auto-generated method stub
		return session.update("replyUpdate",rvo);
	}

	@Override
	public int replyDelete(String c_comment_no) {
		// TODO Auto-generated method stub
		return session.delete("replyDelete",c_comment_no);
	}
	@Override
	public int chaebunBoard8() {
		// TODO Auto-generated method stub
		return (int) session.selectOne("chaebunBoard8");
	}
	
}

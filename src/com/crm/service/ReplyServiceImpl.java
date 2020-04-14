package com.crm.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crm.controller.ReplyController;
import com.crm.dao.ReplyDao;
import com.crm.vo.ReplyVO;


@Service
@Transactional

public class ReplyServiceImpl implements ReplyService {
	Logger logger = Logger.getLogger(ReplyController.class);
	
	@Autowired
	private ReplyDao replyDao;
	
	
	
	//�� ��� ����
	@Override
	public List<ReplyVO> replyList(String c_board_no) {
		// TODO Auto-generated method stub
		List<ReplyVO> myList= null;
		myList = replyDao.replyList(c_board_no);
		
		return myList;
	}
	// ���Է� ����
	@Override
	public int replyInsert(ReplyVO rvo) {
		// TODO Auto-generated method stub
		int result =0;
		result = replyDao.replyInsert(rvo);
		return result;
	}
	// �� ���� ����
	@Override
	public int replyUpdate(ReplyVO rvo) {
		// TODO Auto-generated method stub
		int result = 0;
		result = replyDao.replyUpdate(rvo);
		return result;
	}
	//�� ���� ����
	@Override
	public int replyDelete(String c_comment_no) {
		// TODO Auto-generated method stub
		int result = 0;
		result = replyDao.replyDelete(c_comment_no);
		return result;
	}
	@Override
	public int chaebunBoard8(){
		
		int chaebun = replyDao.chaebunBoard8();
		return chaebun;
		
	}

}

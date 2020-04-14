package com.crm.dao;

import java.util.List;

import com.crm.vo.ReplyVO;

public interface ReplyDao {

	public List<ReplyVO> replyList(String c_board_no);
	public int replyInsert(ReplyVO rvo);
	public int replyUpdate(ReplyVO rvo);
	public int replyDelete(String c_comment_no);
	public int chaebunBoard8();
	
}

package com.crm.service;

import java.util.List;

import com.crm.vo.ReplyVO;

public interface ReplyService {

		public List<ReplyVO> replyList(String c_board_no);
		public int replyInsert(ReplyVO rvo);
		public int replyUpdate(ReplyVO rvo);
		public int replyDelete(String c_comment_no);
		public int chaebunBoard8();
	

}	

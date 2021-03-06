package com.crm.dao;

import java.util.List;

import com.crm.vo.BoardVO;

public interface BoardDao {

	public List<BoardVO> boardList(BoardVO pvo);
	public int boardListCnt1(BoardVO pvo);
	public int boardInsert(BoardVO pvo);
	public BoardVO boardDetail(BoardVO pvo);
	public int pwdConfirm(BoardVO pvo);
	public int boardUpdate(BoardVO pvo);
	public int updateViewCnt0(BoardVO pvo);
	public int boardDelete(String c_board_no);
	public int chaebunBoard3();
	public List<BoardVO> boardNotice();

}
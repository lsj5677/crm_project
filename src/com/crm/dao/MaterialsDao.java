package com.crm.dao;

import java.util.List;

import com.crm.vo.MaterialsVO;

public interface MaterialsDao {

	public List<MaterialsVO> listBoard(MaterialsVO bvo);

	public int insertBoard(MaterialsVO bvo);

	public String chaebunBoard2();

	public List<MaterialsVO> selectBoard(MaterialsVO param);

	public int updateBoard(MaterialsVO bvo);

	public int deleteBoard(MaterialsVO bvo);

	public int materialsCnt(MaterialsVO pvo);

	public int ViewCnt(MaterialsVO pvo);
}

package com.crm.service;

import java.util.List;


import com.crm.vo.MaterialsVO;



public interface MaterialsService {
	List<MaterialsVO> listBoard(MaterialsVO bvo);
	int insertBoard(MaterialsVO bvo);
	String chaebunBoard2();
	List<MaterialsVO> selectBoard(MaterialsVO param);
	int updateBoard(MaterialsVO bvo);
	int deleteBoard(MaterialsVO bvo);
	public int materialsCnt(MaterialsVO pvo);

	int ViewCnt(MaterialsVO pvo);
}

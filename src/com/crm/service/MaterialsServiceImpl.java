package com.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crm.dao.MaterialsDao;
import com.crm.vo.MaterialsVO;



@Service
@Transactional
public class MaterialsServiceImpl implements MaterialsService{
	@Autowired
	private MaterialsDao materialsDao;
	
	@Override
	public List<MaterialsVO> listBoard(MaterialsVO bvo) {
		// TODO Auto-generated method stub
		List<MaterialsVO> list = materialsDao.listBoard(bvo);
		return list;
	}
	@Override
	public int insertBoard(MaterialsVO bvo) {
		// TODO Auto-generated method stub
		return materialsDao.insertBoard(bvo);
	}
	@Override
	public String chaebunBoard2() {
		// TODO Auto-generated method stub
		String list = materialsDao.chaebunBoard2();
		return list;
	}
	@Override
	public List<MaterialsVO> selectBoard(MaterialsVO param) {
		// TODO Auto-generated method stub
		List<MaterialsVO> list = materialsDao.selectBoard(param);
		return list;
	}
	@Override
	public int updateBoard(MaterialsVO bvo) {
		// TODO Auto-generated method stub
		return materialsDao.updateBoard(bvo);
	}
	@Override
	public int deleteBoard(MaterialsVO bvo) {
		// TODO Auto-generated method stub
		return materialsDao.deleteBoard(bvo);
	}
	@Override
	public int materialsCnt(MaterialsVO pvo) {
		// TODO Auto-generated method stub
		return materialsDao.materialsCnt(pvo);
	}
	@Override
	public int ViewCnt(MaterialsVO pvo) {
		int result = 0;
		result = materialsDao.ViewCnt(pvo);
		return result;

	}
}
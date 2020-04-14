package com.crm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.vo.MaterialsVO;

@Repository
public class MaterialsDaoImpl implements MaterialsDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<MaterialsVO> listBoard(MaterialsVO bvo) {
		// TODO Auto-generated method stub
		return session.selectList("listBoard",bvo);
	}

	@Override
	public int insertBoard(MaterialsVO bvo) {
		// TODO Auto-generated method stub
		return session.insert("insertBoard",bvo);
	}

	@Override
	public String chaebunBoard2() {
		// TODO Auto-generated method stub
		return session.selectOne("chaebunBoard2");
	}

	@Override
	public List<MaterialsVO>selectBoard(MaterialsVO param) {
		// TODO Auto-generated method stub
		return session.selectList("selectBoard",param);
	}

	@Override
	public int updateBoard(MaterialsVO bvo) {
		// TODO Auto-generated method stub
		return session.update("updateBoard",bvo);
	}

	@Override
	public int deleteBoard(MaterialsVO bvo) {
		// TODO Auto-generated method stub
		return session.delete("deleteBoard",bvo);
	}

	@Override
	public int materialsCnt(MaterialsVO bvo) {
		// TODO Auto-generated method stub
		return session.selectOne("materialsCnt",bvo);
	}

	@Override
	public int ViewCnt(MaterialsVO pvo) {
		// TODO Auto-generated method stub
		return session.update("ViewCnt",pvo);
	}

}

package com.crm.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.vo.TsalesVO;

@Repository
public class TsalesDaoImpl implements TsalesDao {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<TsalesVO> tsalesList() {
//	public TsalesVO tsalesList() {
		return session.selectList("tsalesList");
	}
	

	@Override
	public TsalesVO tsalesSearch(String year) {
		// TODO Auto-generated method stub
		return (TsalesVO)session.selectOne("tsalesSearch", year);
	}


	@Override
	public int tsalesInsert(TsalesVO tvo) {
		return session.insert("tsalesInsert", tvo);
	}

	@Override
	public int tsalesUpdate(TsalesVO tvo) {
		return session.update("tsalesUpdate");
	}
}

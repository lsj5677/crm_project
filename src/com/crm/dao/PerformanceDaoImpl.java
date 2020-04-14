package com.crm.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.vo.PerformanceVO;


@Repository("pfd")
public class PerformanceDaoImpl implements PerformanceDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public int userCheck(String c_User_Id) {
		// TODO Auto-generated method stub
		return session.selectOne("userCheck" , c_User_Id);
	}

	@Override
	public int performanceInsertOk(PerformanceVO pvo) {
		// TODO Auto-generated method stub
		return session.insert("performanceInsertOk", pvo);
	}

	@Override
	public List<PerformanceVO> performanceList(PerformanceVO pvo) {
		// TODO Auto-generated method stub
		return session.selectList("performanceList" , pvo);
	}

	@Override
	public List<PerformanceVO> performanceUpdateForm(PerformanceVO pvo) {
		// TODO Auto-generated method stub
		return session.selectList("performanceUpdateForm" , pvo);
	}

	@Override
	public int performanceUpdateOk(PerformanceVO pvo) {
		// TODO Auto-generated method stub
		return session.update("performanceUpdateOk", pvo);
	}

	@Override
	public int performanceDelete(PerformanceVO pvo) {
		// TODO Auto-generated method stub
		return session.update("performanceDelete", pvo);
	}

	@Override
	public PerformanceVO performanceResultMonth(String day) {
		// TODO Auto-generated method stub
		return (PerformanceVO)session.selectOne("performanceResultMonth", day);
	}
	
	@Override
	public PerformanceVO performanceResult(HashMap map) {
		// TODO Auto-generated method stub
		return (PerformanceVO)session.selectOne("performanceResult", map);
	}

	@Override
	public PerformanceVO performanceSessionMonth(HashMap map) {
		// TODO Auto-generated method stub
		return (PerformanceVO)session.selectOne("performanceSessionMonth", map);
	}

	
}

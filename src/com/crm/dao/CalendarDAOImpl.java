package com.crm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.vo.CalendarVO;

@Repository
public class CalendarDAOImpl implements CalendarDAO{

	@Autowired
	private SqlSession session;
	
	@Override
	public int addEvent(CalendarVO calVO) {
		return session.insert("addEvent", calVO);
	}// addEvent()

	@Override
	public List<CalendarVO> getAllEvents(CalendarVO calVO) {
		return session.selectList("getAllEvents", calVO);
	}// getAllEvents()

	@Override
	public List<CalendarVO> getTodayEvents(CalendarVO calVO) {
		return session.selectList("getTodayEvents", calVO);
	}// getTodayEvents()
	
	

	
	
}// CalendarDAOImpl class

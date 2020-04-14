package com.crm.dao;

import java.util.List;

import com.crm.vo.CalendarVO;

public interface CalendarDAO {

	public int addEvent(CalendarVO calVO);
	public List<CalendarVO> getAllEvents(CalendarVO calVO);
	public List<CalendarVO> getTodayEvents(CalendarVO calVO);

	
}
